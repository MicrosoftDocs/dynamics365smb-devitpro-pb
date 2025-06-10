---
title: Permission Set Extension Object
description: Description of the permission set extension object in AL for Business Central.
author: SusanneWindfeldPedersen
ms.date: 06/02/2025
ms.topic: concept-article
ms.author: solsen
ms.reviewer: solsen
---

# Permission set extension object

[!INCLUDE [2021_releasewave1](../includes/2021_releasewave1.md)]

The permission set extension object in [!INCLUDE[prod_short](includes/prod_short.md)] adds permissions to an existing permission set defined in AL. A permission set extension object *can't remove* permissions from an existing permission set; it can only *add* permissions. If you, for example, add an extension to [!INCLUDE[prod_short](includes/prod_short.md)], you can use permission set extension objects to grant permissions to the objects in your extension. This means that the admin of [!INCLUDE[prod_short](includes/prod_short.md)] doesn't have to assign extra permission sets to the users, because that automatically happens when the extension is installed, and the permissions go away if the extension is uninstalled.

Learn more about which permissions can be assigned to objects in [Permissions on database objects](devenv-permissions-on-database-objects.md).

## Designing with cautiousness

If a permission set is extended through AL, that extension makes *additive* changes to the permission set. This means that an extension can provide *elevated privileges* to an otherwise limited set of permissions. Building permission sets that can be extended must be done carefully with this in mind.

A best practice when creating an application with permission set extensions is to ensure that they only add permissions for objects, which are part of the application. This is because an administrator might not realize, or expect, that installing a new application might also grant elevated privileges. This design pattern minimizes the possibility of the permission set extension impacting any functionality beyond the intended application. This keeps the permission changes predictable and targeted.

## Snippet support

Typing the shortcut `tpermissionsetextension` creates the basic layout for a permission set extension object when using the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] in Visual Studio Code.

[!INCLUDE[intelli_shortcut](includes/intelli_shortcut.md)]

## Permission set example

The following permission set extension example extends the `Sales Person` [permission set](devenv-permissionset-object.md#permission-set-example) by adding direct insert and delete permissions to the `Currency` table data.

```AL
permissionsetextension 50140 "Extended Sales Doc" extends "Sales Person"
{​
    Permissions =​ tabledata Currency = ID;
}
```

## Related information

[Developing extensions](devenv-dev-overview.md)  
[AL development environment](devenv-reference-overview.md)  
[Entitlements and permission set overview](devenv-entitlements-and-permissionsets-overview.md)  
[Permission set object](devenv-permissionset-object.md)  
[Permissions on database objects](devenv-permissions-on-database-objects.md)  
[Assignable property](properties/devenv-assignable-property.md)  
[Permissions property](properties/devenv-permissions-property.md)
