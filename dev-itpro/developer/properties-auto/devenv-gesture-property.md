---
title: "Gesture Property"
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
# Gesture Property
> **Version**: _Available from runtime version 1.0._

Specifies a gesture that runs the action on a device with a touch interface, such as the phone client.

## Applies to
-   Page Action

## Property Value

|Value|Description|
|-----------|---------------------------------------|
|**None**|No gesture for the action.|
|**LeftSwipe**|Swipe in from the right edge of the touch interface.|
|**RightSwipe**|Swipe in from the left edge of the touch interface.|
|**ContextMenu**|The action has a context menu.|
[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Syntax

```AL
Gesture = None;
```

## Remarks

You typically use the Gesture property on list type pages for executing an action on items in a repeater control.

## See Also

[Implementation Tips for Gestures](../devenv-implementation-tips-gestures-property.md)  
[Introducing the Dynamics 365 Business Central Mobile App](../devenv-introducing-business-central-mobile-app.md)   