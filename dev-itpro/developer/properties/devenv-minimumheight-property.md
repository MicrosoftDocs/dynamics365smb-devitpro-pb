---
title: "MinimumHeight Property"
description: "Specifies the minimum height that the control add-in can be shrunk to."
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
# MinimumHeight Property
> **Version**: _Available or changed with runtime version 1.0._

Specifies the minimum height that the control add-in can be shrunk to. This setting only applies if the VerticalShrink setting is specified.

## Applies to
-   Control Add In

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Value Type 
  
- Integer 

## Property Values 

The default is 0. If [VerticalShrink](devenv-verticalshrink-property.md) is **true** but MinimumHeight is 0, the control add-in can shrink to nothing.

## Dependent Property

This setting only applies if [VerticalShrink](devenv-verticalshrink-property.md) is set to **true**.

## Example 

```AL
RequestedHeight = 300;
VerticalShrink = true;
MinimumHeight = 150;
```

## See Also  

[Control Add-In Object](../devenv-control-addin-object.md)   
 