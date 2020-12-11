---
title: "Permission Set Extension Object"
description: "Description of the permission set extension object in AL for Business Central    ."
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

The permission set extension object in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] allows you to add 

## Snippet support

Typing the shortcut `tpermissionsetextension` will create the basic layout for a permission set extension object when using the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] in Visual Studio Code.

[!INCLUDE[intelli_shortcut](includes/intelli_shortcut.md)]

## Permission set example

The following permission set example ...

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
[Permission Set Object](devenv-permissionset-object.md)