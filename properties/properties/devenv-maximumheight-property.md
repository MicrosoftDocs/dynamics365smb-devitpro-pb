---
title: "MaximumHeight Property"
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

 

# MaximumHeight Property

Specifies the maximum size in pixels to which the control add-in can dynamically increase its height.

## Applies to

- Control add-in objects
  
## Value Type 
  
- Integer 

## Property Values

The default is the integer’s maximum value. If [VerticalStretch](devenv-verticalstretch-property.md) is **true** but MaximumHeight is not set, the control add-in can expand indefinitely.

## Dependent Property

This setting only applies if [VerticalStretch](devenv-verticalstretch-property.md) is set to **true**.

## Remarks

Use this property when the visual content of the add-in is no longer usable or no longer visually appealing beyond a certain size.

## Example

```AL
RequestedHeight = 300;
VerticalStretch = true;
MaximumHeight = 500;
```


## See Also

[Control Add-In Object](../devenv-control-addin-object.md)   
 