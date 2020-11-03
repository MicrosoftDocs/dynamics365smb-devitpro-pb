---
title: "HorizontalStretch Property"
ms.author: solsen
ms.custom: na
ms.date: 10/29/2020
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
# HorizontalStretch Property
HorizontalStretch specifies that the control add-in can be made larger horizontally. This setting is optional.

## Applies to
-   Control Add In

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Property Values

**True** if the control add-in is allowed to stretch horizontally. The default value is **false**.

## Remarks

HorizontalStretch is typically used together with the [MaximumWidth](devenv-maximumwidth-property.md) property. If HorizontalStretch is **true** but [MaximumWidth](devenv-maximumwidth-property.md) is not set, the control add-in can stretch indefinitely.

## Example

```AL
RequestedWidth = 600;
HorizontalStretch = true;
MaximumWidth = 800;
```

## See Also

[Control Add-In Object](../devenv-control-addin-object.md)   
 