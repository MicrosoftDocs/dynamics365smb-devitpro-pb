---
title: "MaximumWidth Property"
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

 

# MaximumWidth Property

Specifies the maximum size in pixels to which the control add-in can dynamically increase its width.

## Applies to 
- Control add-in objects 
  
## Value Type 
  
-   Integer 

## Property Values
The default is the integer’s maximum value. If [HorizontalStretch](devenv-horizontalstretch-property.md) is **true** but MaximumWidth is not set, the control add-in can expand indefinitely.

## Dependent Property
This setting only applies if [HorizontalStretch](devenv-horizontalstretch-property.md) is set to **true**.

## Remarks
Use this property when the visual content of the add-in is no longer usable or no longer visually appealing beyond a certain size.
  
## Code Example 
```
RequestedWidth = 600;
HorizontalStretch = true;
MaximumWidth = 800;
```

## See Also  
[Control Add-In Object](../devenv-control-addin-object.md)   
 