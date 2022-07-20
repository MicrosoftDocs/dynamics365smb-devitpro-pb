---
title: "Inherent Permissions"
description: "Description of how inherent permissions work and the InherentPermissions attribute in AL for Business Central."
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

Inherent permissions enable developers to grant permissions to a method or event while the code executes. As soon as the code execution is completed, permissions are revoked. Inherent permissions simplify the overall management and maintenance work of permission sets. It enables a specific AL method or event to obtain elevated permissions to finish a task without getting permission errors. And it helps tighten overall security by limiting long-term user permissions and giving permissions to the code process instead.

For example, a salesperson wants to make a report using some critical pieces of information. Behind the scenes, a query runs to fetch the information from the table holding the sensitive data. So instead of managing permissions for that salesperson, a developer can add the permission into this specific code path. This method will be granted permissions for the given object, which in this case is the table. Now, whenever an authorized person does the action that executes this method, it has the needed permissions to complete the request.

>[!NOTE]
> For now, the `InherentPermissions` attribute is available for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] on-premises only. It'll be added to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online in a later version. 

>[!TIP]
> It's better to use the inherent permissions attribute for small dedicated procedures or system tasks that don't risk data exposure to users. 

## Syntax

```AL
[InherentPermissions(PermissionObjectType: PermissionObjectType, ObjectId: Integer, Permissions: Text [, InherentPermissionsScope: InherentPermissionsScope])]
```

To see details about the syntax of the `InherentPermissions` attribute, see [InherentPermissions Attribute](../developer/attributes/devenv-inherentpermissions-attribute.md).

## Example

Let's look at a code example for the `InherentPermissions` attribute. 

```AL
[InherentPermissions
(PermissionObjectType:Table, Database:"Customers", 'r’)]

Procedure GetCustomersLocation(): CustomerLocation

```

Referring to the example explained above, let's say the report needs to show which location has more sales for the quarter. As it's not ideal to grant access to all data belonging to customers, *read* permission is granted to the method instead. It will only fetch the customer's location and leave other details (such as name, address, and so on) private.

>[!NOTE]
> Specifying `InherentPermissionsScope` is optional. To read about different types of scope, see [InherentPermissionsScope System Option](../developer/methods-auto/inherentpermissionsscope/inherentpermissionsscope-option.md).

## See also

[Entitlements and Permission Sets Overview](../developer/devenv-entitlements-and-permissionsets-overview.md)  
[Permission Set Object](../developer/devenv-permissionset-object.md)
