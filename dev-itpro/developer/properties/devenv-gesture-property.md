---
title: "Gesture Property"
description: "Specifies a gesture that runs the action on a device with a touch interface, such as the phone client."
ms.author: solsen
ms.custom: na
ms.date: 12/08/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Gesture Property
> **Version**: _Available or changed with runtime version 1.0._

Specifies a gesture that runs the action on a device with a touch interface, such as the phone client.

## Applies to
-   Page Action

## Property Value

|Value|CompatibilityInfo|Description|
|-----------|-----------|---------------------------------------|
|**None**|Available or changed with runtime version 1.0.|No gesture for the action.|
|**LeftSwipe**|Available or changed with runtime version 1.0.|Swipe in from the right edge of the touch interface.|
|**RightSwipe**|Available or changed with runtime version 1.0.|Swipe in from the left edge of the touch interface.|
|**ContextMenu**|Available or changed with runtime version 1.0.|The action has a context menu.|

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