---
title: "Permission Set Extension Object"
description: "Description of the permission set extension object in AL for Business Central."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 11/30/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Permission Set Extension Object

The permission set object in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] describes which objects an administrator or a partner has assigned to a user. The permission set extension object describes which *additional* assignments an administrator or a partner has assigned to a user meaning that an extension cannot remove permissions from an existing permission set.

For information about which permissions can be assigned to objects, see [Permissions on Database Objects](devenv-permissions-on-database-objects.md).

## Snippet support

Typing the shortcut `tpermissionsetextension` will create the basic layout for a permission set extension object when using the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] in Visual Studio Code.

[!INCLUDE[intelli_shortcut](includes/intelli_shortcut.md)]

## Permission set example

The following permission set extension example extends the `Sales Person` [permission set](devenv-permissionset-object.md#permission-set-example) by adding direct insert and delete permissions to the `Currency` table data.

```AL
permissionsetextension 50140 "Extended Sales Doc" extends "Sales Person"
{​
    Assignable = true;​
    Caption = 'Extended Sales Doc';​

    Permissions =​
        tabledata Currency = ID;
}
```

## See Also

[Developing Extensions](devenv-dev-overview.md)  
[AL Development Environment](devenv-reference-overview.md)  
[Entitlements and Permission Set Overview](devenv-entitlements-and-permissionsets-overview.md)  
[Permission Set Object](devenv-permissionset-object.md)  
[Permissions on Database Objects](devenv-permissions-on-database-objects.md)