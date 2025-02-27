---
title: "Gesture property"
description: "Specifies a gesture that runs the action on a device with a touch interface, such as the phone client."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Gesture Property
> **Version**: _Available or changed with runtime version 1.0._

Specifies a gesture that runs the action on a device with a touch interface, such as the phone client.

## Applies to
-   Page Action
-   Page File Upload Action

## Property value

|Value|Available or changed with|Description|
|-----------|-----------|---------------------------------------|
|**None**|runtime version 1.0|No gesture for the action.|
|**LeftSwipe**|runtime version 1.0|Swipe in from the right edge of the touch interface.|
|**RightSwipe**|runtime version 1.0|Swipe in from the left edge of the touch interface.|
|**ContextMenu**|runtime version 1.0|The action has a context menu.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Syntax

```AL
Gesture = None;
```

## Remarks

You typically use the Gesture property on list type pages for executing an action on items in a repeater control.

## Related information

[Implementation Tips for Gestures](../devenv-implementation-tips-gestures-property.md)  
[Introducing the Dynamics 365 Business Central Mobile App](../devenv-introducing-business-central-mobile-app.md)   