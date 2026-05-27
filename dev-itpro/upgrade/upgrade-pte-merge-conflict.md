---
title: Upgrading Per-Tenant Extensions that conflicts with other extensions
description: This article describes how to upgrade a Per-Tenant Extension that contains table or a table field that conflicts with another extension in Dynamics 365 Business Central.
ms.date: 02/27/2026
ms.topic: how-to
ms.author: solsen
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---

# Upgrading per-tenant extensions that conflict with other extensions

In AL, all top-level objects are declared in the same global namespace. The extensions installed in an environment can't have the same top-level object declared multiple times or controls, fields, or data items with the same name defined multiple times in the same logical object. This means that a table extension, for example, can't add a field with the same name as a field in the extended table. This article shows how to upgrade an extension, which declares a table or a field that conflicts with a table or a field declared by another extension.

## Two objects with the same name

If **Extension A** defines the following table

```al
table 10 MyTable {}
```

And **Extension B** defines the table below

```al
table 20 MyTable {}
```

**Extension A** and **Extension B** can't be installed in the same environment because the two tables have the same name. An error is raised when the installation of the second extension is attempted and the installation fails.

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
tableextension 20 MyTableExt extends MyTable
{
	field(10; MyField; Boolean){}
}
```

Then **Extension B** fails to compile because the field in the table extension has the same name as the field in the base table. Publishing **Extension B** fails with a compilation error.

In general, it's recommended using affixes for your object and element names to prevent this type of conflicts. Learn more in [Prefix and suffix for naming in extensions](../compliance/apptest-prefix-suffix.md).

## Example

To make the issue more concrete, the following example illustrates how this problem can manifest itself and how to resolve it. In a [!INCLUDE[prod_short](../includes/prod_short.md)] environment running on [!INCLUDE[prod_short](../includes/prod_short.md)] 2020 release wave 1, update 16.5 (version 16.5), a per-tenant extension, named **MyExtension** by **Contoso** version 1.0.0.0 contains the following table extension:

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

The table extension adds the field **Shipping Agent Service Code** to the **Sales Cr.Memo Header** table defined in the **Base Application** extension by Microsoft.

In [!INCLUDE[prod_short](../includes/prod_short.md)] 2020 release wave 2 (version 17.0), Microsoft enhances the table **Sales Cr.Memo Header** by adding the following field:

```al
field(5794; "Shipping Agent Service Code"; Code[10]) {}
```

The service then attempts to upgrade the environment from version 16.5 to version 17.0 of the product. During the upgrade process, the per-tenant extension is recompiled against the latest version of the **Base Application**. The compilation fails with an error message similar to:  

*"A member of type Field with name "Shipping Agent Service Code" is already defined in Table "Sales Cr.Memo Header" by the extension "Base Application by Microsoft (17.0.0.0)"*. 

The service now dismisses the upgrade of the environment and an email is sent to the administrator registered in the **Tenant Administration Center** containing the above error message.

The first reaction might be to modify the per-tenant extension, remove the conflicting field, and then try to upload version 1.1.0.0 to the service. This, however, fails with an error message similar to:  

*"Per-tenant extension "MyExtension" version 1.0.0.0 by "Contoso" failed to synchronize the database schema."*.

This error message is raised because the system doesn't allow implicitly removing or renaming schema elements such as tables and table fields. To upgrade the environment, it's necessary to forcefully remove the conflicting field by following these steps:

1. Create a sandbox  
    Because the following steps can lead to data-loss, it's recommended that the steps are first performed in a sandbox environment created as a *copy* from the production environment. Learn more in [Create a new environment](../administration/tenant-admin-center-environments.md#create-a-new-environment).
2. Export data using RapidStart  
    Start by backing up the data contained in the tables or table extensions declared by the extension using RapidStart. Use other mechanisms to back up the data, but the main point is to backup data to an external storage system.
3. Uninstall the extension  
    Uninstall the extension and select the option to delete the extension's data and schema. Using this option deletes the tables and fields contributed by the table extension and the environment deletes any trace of the extension.
4. Remove the field from the extension  
    Create version 2.0.0.0 of the extension that doesn't contain the field, which conflicts with the one from the "Base Application". Deploy this version of the extension to the environment.
5. Import the data  
    Import the data that has been backed up from the rapid start package or the external storage system used in step 2.
6. Upgrade the environment  
    At this point, the conflict is resolved and you should be able to update the environment. Schedule an update for the sandbox and ensure it's successfully updated. If upgrade fails, troubleshoot the issue.

Once the sandbox environment has been successfully updated to the next release, steps 2-6 on the production environment must be replicated. Before doing so, ensure that the customer won't be impacted by the changes, and clearly communicate a maintenance window in which the work will be performed.

## Clashes between a PTE and a Marketplace app

A common scenario is when a per-tenant extension (PTE) was built to fill a gap in functionality that is now covered by a Marketplace app. In this case, objects or fields defined in the PTE might conflict with the corresponding objects or fields introduced by the Marketplace app, preventing the Marketplace app from being installed.

The recommended resolution is to uninstall the PTE with the **Delete data** option, which removes the extension's schema from the database entirely. After the schema is cleared, the Marketplace app can be installed without conflicts.

> [!WARNING]
> Uninstalling an extension with the **Delete data** option permanently deletes all data stored in tables and table extensions that the extension contributes. Back up any data you need to retain before you proceed.

To resolve the conflict, follow these steps:

1. **Back up your data**  
   Export any data stored in the tables or table extensions defined by the PTE. You can use RapidStart, Configuration Packages, or any other mechanism to export the data to an external storage system.

2. **Uninstall the PTE with the Delete data option**  
   In [!INCLUDE[prod_short](../includes/prod_short.md)], open the **Extension Management** page, select the PTE, and choose **Uninstall**. In the uninstall dialog, enable the **Delete extension data** option before confirming. This removes all tables, fields, and other schema objects contributed by the extension and clears any trace of it from the database.

   Alternatively, you can uninstall the extension using the [Business Central Administration Center API](../administration/administration-center-api_app_management.md).

3. **Install the Marketplace app**  
   Once the PTE schema has been removed, install the Marketplace app from [Microsoft Marketplace](https://marketplace.microsoft.com). The app can now be installed without conflicts.

4. **Restore your data**  
   Import any data you backed up in step 1 into the fields now owned by the Marketplace app. Verify that field lengths, data types, and formats are compatible before importing.

5. **Validate the environment**  
   Test functionality to confirm the Marketplace app is working correctly and that the restored data is accurate.

## Related information

[Upgrading Marketplace apps in production](../developer/devenv-upgrade-appsource-app-in-prod.md)  
[Environments that can't get updated](../administration/tenant-admin-center-update-management.md#environments-that-cant-get-updated)
