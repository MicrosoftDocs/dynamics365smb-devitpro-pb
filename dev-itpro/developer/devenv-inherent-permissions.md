---
title: "Inherent Permissions"
description: "Description of how inherent permissions work and the InherentPermissions attribute in AL for Business Central."
author: jswymer
ms.custom: na
ms.date: 02/27/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.author: jswymer
---

# Inherent Permissions

With inherent permissions, developers can now grant permissions to a method or event while code executes. As soon as the code execution is completed, permissions are revoked. Inherent permissions simplify the overall management and maintenance work of permission sets. With it, a specific AL method or event can get the elevated permissions necessary to finish the task at hand without getting permission errors. And it helps tighten overall security by limiting long-term user permissions and giving permissions to the code process instead.

Let’s say a salesperson wants to make a report that includes certain critical pieces of information. In the background, a method will run a query to fetch the information from the table holding classified data. With inherent permissions, instead of managing permissions for that salesperson, a developer can add the permission permanently into the specific code path. This method will be granted permissions for the given object, which in this case is a table. Now, whenever an authorized person runs this method, the needed permissions are in place to complete the request.

>[!TIP]
> It's better to use the inherent permissions for small dedicated procedures or system tasks that don't risk data exposure to users.

## Syntax

```AL
[InherentPermissions(PermissionObjectType: PermissionObjectType, ObjectId: Integer, Permissions: Text [, InherentPermissionsScope: InherentPermissionsScope])]
```

To learn more about the syntax of the `InherentPermissions` attribute, see [InherentPermissions Attribute](../developer/attributes/devenv-inherentpermissions-attribute.md).

## Example

The following is an example of how an inherent permission might look for your app.

```AL
[InherentPermissions(PermissionObjectType::TableData, Database::<MyTable>, 'r', InherentPermissionsScope::Both)]

```

Referring to the example explained above, let's say the report needs to show which location has more sales for the quarter. As it's not ideal to grant access to all data belonging to customers, *read* permission is granted to the method instead. It will only fetch the customer's location and leave other details (such as name, address, and so on) private.

## Inherent Entitlements

The inherent permissions and inherent entitlements together, grant more flexibility to the developers that they can assign permissions to their methods, events, and objects. Developers can define inherent entitlements for their objects like codeunit, table, page, and so on. In this way, the developers equip all users to have enough access that they can carry out essential tasks without any halt. And regardless of what access their present license or entitlement grant them. To learn more about inherent entitlements, see [InherentEntitlements Property](../developer/properties/devenv-inherententitlements-property.md).

>[!NOTE]
> Specifying `InherentPermissionsScope` is optional and the default is *Both* that includes permissions and entitlements. To read about different types of scope, see [InherentPermissionsScope Option](../developer/methods-auto/inherentpermissionsscope/inherentpermissionsscope-option.md).

## When to use inherent permissions

Inherent permissions let you reduce the number of objects that you need to control, which makes it easier to manage permissions and helps avoid permission errors.

> [!NOTE]
> After you apply inherent permissions, security administrators can no longer control the permission.

When you're deciding whether to use inherent permissions, consider whether you need to manage Read, Insert, Modify, Delete, and Execute permissions for the object. The following are examples of when you can or shouldn't use indirect permissions.

Does the object run on or contain customer or business data? For example:

* Yes. The **General Ledger** module does contain important business data. Don't apply inherent permissions to the module because you should control permissions for it.
* No. The **Math** module in the System Application doesn't contain or run on any business data. You can apply inherent permissions to the module because you don't need to manage permissions for it.

Is the object only run through another object that you can control permissions for? The following are some examples of when you can grant inherent permissions.

* We grand indirect Read on the method scope for the General Ledger table when people sign in, because it's only used to get the work date.
* Install and Upgrade codeunits where you can grant inherent Execute permissions.
* Buffer tables where you can typically grant indirect Read, Insert, Modify, Delete, and Execute permissions and entitlements because they're only use to hold data in memory.

## See also

[Entitlements and Permission Sets Overview](../developer/devenv-entitlements-and-permissionsets-overview.md)  
[Permission Set Object](../developer/devenv-permissionset-object.md)
