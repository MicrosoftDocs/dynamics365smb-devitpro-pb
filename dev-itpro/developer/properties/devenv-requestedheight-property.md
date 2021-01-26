---
title: "RequestedHeight Property"
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
# RequestedHeight Property
> **Version**: _Available or changed with runtime version 1.0._

RequestedHeight specifies the initial height of the control add-in.

## Applies to
-   Control Add In

[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Value Type 

- Integer 

## Property Values

The default value is 100 pixels.

## Remarks 

This setting is optional. You can use it when the visual content of the add-in is optimal at a specific size. If space is available on the page, the requested height will be applied. If the add-in must compete for space with other content on the page, such as a second add-in, then the RequestedHeight value is ignored and the add-in will shrink or stretch to the minimum or maximum height.
The value of RequestedHeight is ignored if the add-in is the only content on a card page.

## Example

```AL
RequestedHeight = 300;
VerticalShrink = true;
MinimumHeight = 150;
```

## See Also

[Control Add-In Object](../devenv-control-addin-object.md)  