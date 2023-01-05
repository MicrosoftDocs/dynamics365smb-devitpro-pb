---
title: "Compiler Error AL0305"
description: "The length of the application object identifier '{0}' cannot exceed {1} characters."
ms.author: solsen
ms.custom: na
ms.date: 06/10/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Compiler Error AL0305

[!INCLUDE[banner_preview](../includes/banner_preview.md)]

The length of the application object identifier '{0}' cannot exceed {1} characters.

## Description
The length of an application object identifier cannot exceed 30 characters.  

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This diagnostic will be triggered, for example, if you create a permissionset with a name longer than 30 characters, with the `Assignable` property set to `false`. For permissionsets specifically, the diagnostic will also be triggered, if a permissionset with the `Assignable` property set to `true` exceeds 20 characters.

```al
permissionset 50111 NameExceeds30CharactersByFivePlusSome
{
    Assignable = false;
    Permissions = 
        table Customer = X;
}
```

```al
permissionset 50112 NameExceeds20Characters
{
    Assignable = false;
    Permissions = 
        table Customer = X;
}
```

## See Also  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  