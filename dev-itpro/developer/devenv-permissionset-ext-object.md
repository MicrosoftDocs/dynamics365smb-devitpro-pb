---
title: "Permission Set Extension Object"
description: "Description of the permission set extension object in AL for Business Central."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Permission Set Extension Object

[!INCLUDE [2021_releasewave1](../includes/2021_releasewave1.md)]

The permission set extension object in [!INCLUDE[prod_short](includes/prod_short.md)] adds permissions to an existing permission set defined in AL. A permission set extension object *cannot remove* permissions from an existing permission set, it can only *add* permissions. If you, for example, add an extension to [!INCLUDE[prod_short](includes/prod_short.md)], you can use permission set extension objects to grant permissions to the objects in your extension. This means that the admin of [!INCLUDE[prod_short](includes/prod_short.md)] does not have to assign additional permission sets to the users, because that automatically happens when the extension is installed, and the permissions go away if the extension is uninstalled.

For information about which permissions can be assigned to objects, see [Permissions on Database Objects](devenv-permissions-on-database-objects.md).

## Designing with cautiousness

If a permission set is extended through AL, that extension will make *additive* changes to the permission set. This means that an extension can provide *elevated privileges* to an otherwise limited set of permissions. Building permission sets that can be extended must be done carefully with this in mind.

## Snippet support

Typing the shortcut `tpermissionsetextension` will create the basic layout for a permission set extension object when using the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] in Visual Studio Code.

[!INCLUDE[intelli_shortcut](includes/intelli_shortcut.md)]

## Permission set example

The following permission set extension example extends the `Sales Person` [permission set](devenv-permissionset-object.md#permission-set-example) by adding direct insert and delete permissions to the `Currency` table data.

```AL
permissionsetextension 50140 "Extended Sales Doc" extends "Sales Person"
{​
    Permissions =​ tabledata Currency = ID;
}
```

## See Also

[Developing Extensions](devenv-dev-overview.md)  
[AL Development Environment](devenv-reference-overview.md)  
[Entitlements and Permission Set Overview](devenv-entitlements-and-permissionsets-overview.md)  
[Permission Set Object](devenv-permissionset-object.md)  
[Permissions on Database Objects](devenv-permissions-on-database-objects.md)  
[Assignable Property](properties/devenv-assignable-property.md)  
[Permissions Property](properties/devenv-permissions-property.md)