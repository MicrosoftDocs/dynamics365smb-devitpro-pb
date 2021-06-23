---
title: "VerticalShrink Property"
description: "VerticalShrink specifies that the control add-in can be made smaller vertically. This setting is optional."
ms.author: solsen
ms.custom: na
ms.date: 06/23/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# VerticalShrink Property
> **Version**: _Available or changed with runtime version 1.0._

VerticalShrink specifies that the control add-in can be made smaller vertically. This setting is optional.

## Applies to
-   Control Add In

[//]: # (IMPORTANT: END>DO_NOT_EDIT)


> [!NOTE]  
> Use this property when the visual content of the add-in is designed to remain usable when height is restricted.

> [!NOTE]  
> VerticalShrink is only supported when the control add-in is displayed on a CardPart on Role Center pages or when it is the only content displayed on a Card page.
  
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
 