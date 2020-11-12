---
title: "MaximumWidth Property"
ms.author: solsen
ms.custom: na
ms.date: 11/12/2020
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
# MaximumWidth Property
> **Version**: _Available from runtime version 1.0._

Specifies the maximum width that the control add-in can be stretched to. This setting only applies if the HorizontalStretch setting is specified.

## Applies to
-   Control Add In

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
# Value Type 
  
- Integer 

## Property Values

The default is the integer’s maximum value. If [HorizontalStretch](devenv-horizontalstretch-property.md) is **true** but MaximumWidth is not set, the control add-in can expand indefinitely.

## Dependent Property

This setting only applies if [HorizontalStretch](devenv-horizontalstretch-property.md) is set to **true**.

## Remarks

Use this property when the visual content of the add-in is no longer usable or no longer visually appealing beyond a certain size.
  
## Example 

```AL
RequestedWidth = 600;
HorizontalStretch = true;
MaximumWidth = 800;
```

## See Also

[Control Add-In Object](../devenv-control-addin-object.md)   
 