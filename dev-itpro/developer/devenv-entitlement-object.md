---
title: "Entitlement Object"
description: "Description of the entitlement object in AL for Business Central."
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

# Entitlement Object

The entitlement object in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] describes <!--which objects an administrator or a partner has assigned to a user. -->

## Snippet support

Typing the shortcut `t?` will create the basic layout for an entitlement object when using the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] in Visual Studio Code.

[!INCLUDE[intelli_shortcut](includes/intelli_shortcut.md)]

## Entitlement example

The following entitlement example ...

```al
entitlement MyEntitlement
{
    LicenseType = Role;
    Roletype = Delegate;
    Entitlements = 
        "MyPermission ""Set", 
        OtherSet;
}

```
<!--
```AL
permissionset 50130 MyPermissionSet 
{ 
    Access = Internal; 
    ObsoleteState = No; 
    IncludedPermissionSets = SomeSet; 

    Permissions = 
        codeunitSomeCode = x, 
        tabledata Customer = rim,
        tabledata Vendor = RIm,
        codeunitAccSchedManagement= X; 
} 
```
-->

## See Also

[Developing Extensions](devenv-dev-overview.md)  
[AL Development Environment](devenv-reference-overview.md)  
[Permission Set Extension Object](devenv-permissionset-ext-object.md)