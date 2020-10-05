---
title: "VerticalStretch Property"
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

 

# VerticalStretch Property

Specifies whether the control add-in can dynamically increase its height. This setting is optional.

> [!NOTE]
> Use this property when the visual content of the add-in is designed to remain usable when height is increased.

## Applies to
VerticalStretch is only supported when the control add-in is displayed in a CardPart on Role Center pages, or when it is the only content displayed in a Card page.

## Property Values
**True** if the control add-in is allowed to stretch vertically. The default value is **false**.

## Remarks
VerticalStretch is typically used together with the [MaximumHeight](devenv-maximumheight-property.md) property. If VerticalStretch is **true** but [MaximumHeight](devenv-maximumheight-property.md) is not set, the control add-in can stretch indefinitely. 


## Code Example
```
RequestedHeight = 300;
VerticalStretch = true;
MaximumHeight = 500;
```


## See Also  
[Control Add-In Object](../devenv-control-addin-object.md)   
 