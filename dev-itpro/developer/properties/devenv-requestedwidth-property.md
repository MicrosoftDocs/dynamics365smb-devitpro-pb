---
title: "RequestedWidth Property"
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
# RequestedWidth Property
> **Version**: _Available from runtime version 1.0._

RequestedWidth specifies the initial width of the control add-in.

## Applies to
-   Control Add In


[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Value Type 
  
- Integer 

## Property Values

The default value is 100 pixels.

## Remarks 

This setting is optional. You can use it when the visual content of the add-in is optimal at a specific size. If space is available on the page, the requested width will be applied. If the add-in must compete for space with other content on the page, such as a second add-in, then the RequestedWidth value is ignored and the add-in will shrink or stretch to the minimum or maximum width.

The value of RequestedWidth is ignored if the add-in is the only content on a card page.

## Example

```AL
RequestedWidth = 600;
HorizontalShrink = true;
MinimumWidth = 100; 
```

## See Also

[Control Add-In Object](../devenv-control-addin-object.md)  