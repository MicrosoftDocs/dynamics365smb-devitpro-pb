---
title: "MinimumWidth Property"
ms.author: solsen
ms.custom: na
ms.date: 01/26/2021
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
# MinimumWidth Property
> **Version**: _Available or changed with runtime version 1.0._

Specifies the minimum width that the control add-in can be shrunk to. This setting only applies if the HorizontalShrink setting is specified.

## Applies to
-   Control Add In

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

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
