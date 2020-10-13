---
title: "VerticalShrink Property"
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

# VerticalShrink Property

Specifies whether the control add-in can dynamically decrease its height. This setting is optional. 

> [!NOTE]  
> Use this property when the visual content of the add-in is designed to remain usable when height is restricted.

## Applies to

VerticalShrink is only supported when the control add-in is displayed on a CardPart on Role Center pages or when it is the only content displayed on a Card page.
  
## Property Values 
 
**True** if the control add-in is allowed to shrink vertically. The default value is **false**. 

## Remarks

VerticalShrink is typically used together with the [MinimumHeight](devenv-minimumheight-property.md) property. If VerticalShrink is **true** but [MinimumHeight](devenv-minimumheight-property.md) is not set, the control add-in can shrink to nothing.
When the add-in shrinks in size, the visual content must remain visible and accessible to users. To provide the best experience, consider implementing a responsive design that can adapt to reduced space and vertical scrollbars.

  
## Example

```AL
RequestedHeight = 300;
VerticalShrink = true;
MinimumHeight = 150;
```

## See Also

[Control Add-In Object](../devenv-control-addin-object.md)   
 