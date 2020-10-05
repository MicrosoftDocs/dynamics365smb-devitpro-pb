---
title: "HorizontalStretch Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: dd671414-a7c3-44bd-a860-a8bda61c7913
caps.latest.revision: 15
author: SusanneWindfeldPedersen
---

 

# HorizontalStretch Property

Specifies whether the control add-in can dynamically increase its width. This setting is optional.

> [!NOTE]
> Use this property when the visual content of the add-in is designed to remain usable when width is increased. 

## Applies to 
- Control add-in objects

## Property Values
True if the control add-in is allowed to stretch horizontally. The default value is false.

## Remarks
HorizontalStretch is typically used together with the [MaximumWidth](devenv-maximumwidth-property.md) property. If HorizontalStretch is **true** but [MaximumWidth](devenv-maximumwidth-property.md) is not set, the control add-in can stretch indefinitely.

## Code Example
```
RequestedWidth = 600;
HorizontalStretch = true;
MaximumWidth = 800;

```
## See Also  
[Control Add-In Object](../devenv-control-addin-object.md)   
 