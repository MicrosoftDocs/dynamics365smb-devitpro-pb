---
title: "MinimumWidth Property"
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

# MinimumWidth Property

Specifies the minimum size in pixels to which the control add-in can dynamically decrease its width.

## Applies to

- Control add-in objects
  
## Value Type 
  
- Integer 

## Property Values

The default is 0. If [HorizontalShrink](devenv-horizontalshrink-property.md) is **true** but MinimumWidth is 0, the control add-in can shrink to nothing.

## Dependent Property

This setting only applies if [HorizontalShrink](devenv-horizontalshrink-property.md) is set to **true**.

## Remarks 

Use this property when the visual content of the add-in is no longer usable below a certain size.

## Example 

```AL
RequestedWidth = 600;
HorizontalShrink = true;
MinimumWidth = 100;
```

## See Also

[Control Add-In Object](../devenv-control-addin-object.md)   
