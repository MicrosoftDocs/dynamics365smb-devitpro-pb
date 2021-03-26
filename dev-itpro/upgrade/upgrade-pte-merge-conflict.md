---
title: Upgrading Per-Tenant Extensions that conflicts with other extensions
description: This article describes how to upgrade a Per-Tenant Extension that contains table or a table field that conflicts with another extension in Dynamics 365 Business Central.
ms.custom: na
ms.date: 03/25/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.author: solsen
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# Upgrading Per-Tenant Extensions that Conflicts with Other Extensions

In AL, all top-level objects are declared in the same global namespace. The extensions installed in an environment cannot have the same top-level object declared multiple times or controls, fields, or dataitems with the same name defined multiple times in the same logical object. For example, this means that a table extension cannot add a field with the same name as a field in the extended table. This topic shows how to upgrade an extension which declares a table or a field that conflicts with a table or a field declared by another extension.

## Two objects with the same name

If **Extension A** defines the following table

```al
table 10 MyTable {}
```

And **Extension B** defines the table below

```al
table 20 MyTable {}
```

Extensions A and B cannot be installed in the same environment because the two tables have the same name. An error will be raised when the installation of the second extension is attempted and the installation will fail.

## Two objects with the same field name

If **Extension A** defines the following table and field

```al
table 10 MyTable 
{
	field(1; MyField; Integer){}
}
```

And **Extension B** defines the table and field below

```al
tableextension 20 MyTableExt 
{
	field(10; MyField; Boolean){}
}
```

Then **Extension B** will fail to compile because the field in the table extension has the same name as the field in the base table. Publishing **Extension B** will fail with a compilation error.

In general, we recommend using affixes for your object and element names to prevent this type of conflicts. For more information, see [Prefix and suffix for naming in extensions](../compliance/apptest-prefix-suffix.md).

To make the issue more concrete, we will use the following example to illustrate how this problem can manifest itself and how to resolve it:

Let us assume we have a Business Central environment running on Business Central Wave 1 2020, Update 16.5 (version 16.5). In our environment, we have a per-tenant extension, named "MyExtension" by "Contoso" version 1.0.0.0 containing the following table extension

```al
tableextension 50100 SalesCreditMemoHeaderExt extends  "Sales Cr.Memo Header"
{
	Fields
	{
		Field(50100; "Shipping Agent Service Code"; Code[10])
		{
		}
	}
}
```

Which adds the field "Shipping Agent Service Code" to the "Sales Cr.Memo Header" defined in the "Base Application" extension by Microsoft.

In Business Central Wave 2 2020 (version 17.0), Microsoft enhances the table "Sales Cr.Memo Header" by adding the following field

```al
field(5794; "Shipping Agent Service Code"; Code[10]) {}
```

The service will attempt to upgrade our environment from version 16.5 to version 17.0 of the product. During the upgrade process, our per-tenant extension will be recompiled against the latest version of the "Base Application".
The compilation will fail with an error message similar to "A member of type Field with name "Shipping Agent Service Code" is already defined in Table "Sales Cr.Memo Header" by the extension "Base Application by Microsoft (17.0.0.0)". 

The service will dismiss the upgrade of our environment and an e-mail will be sent to the administrator registered in the Tenant Administration Center containing the above error message.

Our first reaction is to modify the per-tenant extension, remove the conflicting field, and try to upload version 1.1.0.0 to the service. This will fail with an error message similar to "Per-tenant extension "MyExtension" version 1.0.0.0 by "Contoso" failed to synchronize the database schema."

This error message is raised because the the system does not allow implicitly removing/renaming schema elements such as tables, table fields. To upgrade our environment, we must forcefully remove the conflicting field.

1. Create a sandbox.  
    As the following steps can lead to data-loss, we recommend that the steps are first performed in a sandbox environment created as a copy from the production environment. See https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/administration/tenant-admin-center-environments#create-a-sandbox-environment 
2. Export data using RapidStart.  
    We will start by backing up the data contained in the tables or table extensions declared by our extension using RapidStart. You can use other mechanisms to backup the data, but the main point is to backup data to an external storage system.
3. Uninstall the extension.  
    Uninstall the extension and select the option to delete the extension's data and schema. Using this option will delete the tables and fields contributed by the table extension and the environment will delete any trace of the extension.
4. Remove the field from the extension.  
    Create version 2.0.0.0 of the extension that does not contain the field which conflicts with the one from the "Base Application". Deploy this version of the extension to the environment..
5. Import the data.  
    Import the data that has been backed up from the rapid start package or the external storage system you have used in point 2. 
6. Upgrade the environment.  
    At this point, the conflict has been resolved and you should be able to update the environment. Schedule an update for the sandbox and ensure it is successfully updated. If upgrade fails, troubleshoot the issue.

Once our sandbox environment has been successfully updated to the next release, we will replicate steps 2-6 on our production environment. Before we do so, we will ensure that our customer will not be impacted by our changes and we will clearly communicate a maintenance window in which the work will be performed.

## See Also
