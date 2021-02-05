---
title: "Permission Set Object"
description: "Description of the permission set object in AL for Business Central    ."
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

# Permission Set Object

The permission set object in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] describes which objects an administrator or a partner has assigned to a user. Permission sets are included in an [Entitlement Object](devenv-entitlement-object.md) that constitutes the set of permissions that a customer is entitled to use.

## Snippet support

Typing the shortcut `tpermissionset` will create the basic layout for a permission set object when using the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] in Visual Studio Code.

[!INCLUDE[intelli_shortcut](includes/intelli_shortcut.md)]

## Permission set example

```al
permissionset 50134 "Sales Person"
{
    Assignable = true;
    Caption = 'Sales Person';

    Permissions = 
        tabledata Customer = RIMD,
        tabledata "Payment Terms" = RMD,
        tabledata Currency = RM,
        tabledata "Sales Header" = RIM,
        tabledata "Sales Line" = RIMD;
}

```

```al
permissionset 50130 MyPermissionSet 
{ 
    Assignable = true;
    Caption = 'My PermissionSet';
    IncludedPermissionSets = SomeSet; 

    Permissions = 
        codeunitSomeCode = x, 
        tabledata Customer = rim,
        tabledata Vendor = RIm,
        codeunitAccSchedManagement= X; 
} 
```

## See Also

[Developing Extensions](devenv-dev-overview.md)  
[AL Development Environment](devenv-reference-overview.md)  
[Permission Set Extension Object](devenv-permissionset-ext-object.md)