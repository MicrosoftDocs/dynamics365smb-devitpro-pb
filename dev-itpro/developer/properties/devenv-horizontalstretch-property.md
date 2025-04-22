---
title: "HorizontalStretch property"
description: "HorizontalStretch specifies that the control add-in can be made larger horizontally."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# HorizontalStretch Property
> **Version**: _Available or changed with runtime version 1.0._

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

## Related information

[Control Add-In Object](../devenv-control-addin-object.md)   
 