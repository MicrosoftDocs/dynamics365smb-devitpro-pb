---
title: "HorizontalShrink Property"
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

# HorizontalShrink Property

Specifies whether the control add-in can dynamically decrease its width. This setting is optional.

> [!NOTE]
> Use this property when the visual content of the add-in is designed to remain usable when width is restricted.

## Applies to

- Control add-in objects

## Property Values

**True** if the control add-in is allowed to shrink horizontally. The default value is **false**.

## Remarks

HorizontalShrink is typically used together with the [MinimumWidth](devenv-minimumwidth-property.md) property. If HorizontalShrink is **true** but [MinimumWidth](devenv-minimumwidth-property.md) is not set, the control add-in can shrink to nothing.
When the add-in shrinks in size, the visual content must remain visible and accessible to users. To provide the best experience, consider implementing a responsive design that can adapt to reduced space and horizontal scrollbars.

## Example

```AL
RequestedWidth = 600;
HorizontalShrink = true;
MinimumWidth = 100;
```  

## See Also

[Control Add-In Object](../devenv-control-addin-object.md)   
 