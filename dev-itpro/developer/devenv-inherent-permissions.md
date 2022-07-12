---
title: "Inherent Permissions"
description: "Description of the inherent permissions and InherentPermissions attribute in AL for Business Central    ."
author: Javariya
ms.custom: na
ms.date: 07/12/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual article
ms.author: a-jaaamir
---

# Inherent Permissions

The inherent permissions let the developers grant permissions to a method or event while the code executes. As soon as the code execution is completed, the permissions are revoked.  Inherent permissions simplify the overall management and maintenance work of permission sets. This feature gives the convenience to a specific AL method or event to get the elevated permissions to finish the task at hand without getting the permission errors. It also helps in tightening the overall security by limiting the permissions given directly to the users for long term, it gives the permissions to the code process instead.

For example, a sales person wants to make a report that needs to have some critical pieces of information. Behind the scenes, a method will run a query to fetch that information from a table, which holds the sensitive data. Thus, instead of managing the permissions for that sales person, a developer can add the permission in this specific code path. This method will be granted permissions for the given object, in this case, the table. Now, whenever an authorized person does the action that executes this method, it has the needed permissions to complete the request.

>[!NOTE]
> For now, the `InherentPermissions` attribute is available for on premises version of [!INCLUDE[prod_short](../developer/includes/prod_short.md)] only. It'll be added to the cloud version in due time. 

>[!TIP]
> It's better to use Inherent permissions for small dedicated procedures or system tasks which don't risk the data exposure to the users. 

## Syntax

```AL
[InherentPermissions(PermissionObjectType: PermissionObjectType, ObjectId: Integer, Permissions: Text [, InherentPermissionsScope: InherentPermissionsScope])]
```

To know details about the syntax of `InherentPermissions` attribute, see [InherentPermissions Attribute](../developer/attributes/devenv-inherentpermissions-attribute.md).

## Example

Lets look at the code example for `InherentPermissions` attribute. 

```AL
[InherentPermissions
(PermissionObjectType:Table, Database:"Customers", 'r’)]

Procedure GetCustomersLocation(): CustomerLocation

```

Referring to the example explained above, lets say that the report needs to show which location has more sales for the quarter. As it's not ideal to grant access to all the data belonging to customers, we granted a *read* permission to the method instead. It will only fetch the customer's location and leave the rest of the details private, for example, name, address, or email.

>[!NOTE]
> It's optional to specify the `InherentPermissionsScope`. To read about different types of scope, see [InherentPermissionsScope System Option](../developer/methods-auto/inherentpermissionsscope/inherentpermissionsscope-option.md)

## See also

[Entitlements and Permission Sets Overview](../developer/devenv-entitlements-and-permissionsets-overview.md)  
[Permission Set Object](../developer/devenv-permissionset-object.md)
