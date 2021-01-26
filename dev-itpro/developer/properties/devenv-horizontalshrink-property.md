---
title: "HorizontalShrink Property"
ms.author: solsen
ms.custom: na
ms.date: 01/26/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# HorizontalShrink Property
> **Version**: _Available or changed with runtime version 1.0._

HorizontalShrink specifies that the control add-in can be made smaller horizontally. This setting is optional.

## Applies to
-   Control Add In

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

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
 