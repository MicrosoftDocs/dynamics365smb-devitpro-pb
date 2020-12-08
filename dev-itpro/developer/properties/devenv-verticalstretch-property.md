---
title: "VerticalStretch Property"
ms.author: solsen
ms.custom: na
ms.date: 11/24/2020
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
# VerticalStretch Property
> **Version**: _Available from runtime version 1.0._

VerticalStretch specifies that the control add-in can be made larger vertically. This setting is optional.

## Applies to
-   Control Add In


[//]: # (IMPORTANT: END>DO_NOT_EDIT)


> [!NOTE]  
> Use this property when the visual content of the add-in is designed to remain usable when height is increased.

> [!NOTE]  
> VerticalStretch is only supported when the control add-in is displayed in a CardPart on Role Center pages, or when it is the only content displayed in a Card page.

## Property Values

**True** if the control add-in is allowed to stretch vertically. The default value is **false**.

## Remarks

VerticalStretch is typically used together with the [MaximumHeight](devenv-maximumheight-property.md) property. If VerticalStretch is **true** but [MaximumHeight](devenv-maximumheight-property.md) is not set, the control add-in can stretch indefinitely. 


## Example

```AL
RequestedHeight = 300;
VerticalStretch = true;
MaximumHeight = 500;
```

## See Also

[Control Add-In Object](../devenv-control-addin-object.md)   