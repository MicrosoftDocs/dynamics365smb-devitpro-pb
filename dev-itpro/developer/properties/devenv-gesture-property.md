---
title: "Gesture Property"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.author: solsen
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# Gesture Property
Specifies a gesture that runs the action on a device with a touch interface, such as the phone client.

## Applies to
*  Page Action controls

## Property values
The property has the following values:

|  Value  |  Description  |
|---------|---------------|
|**None** |No gesture for the action.|
|**LeftSwipe**|Swipe in from the right edge of the touch interface.  |
|**RightSwipe**|Swipe in from the left edge of the touch interface.  |

## Syntax
```
Gesture = None;
```

## Remarks
You typically use the Gesture property on list type pages for executing an action on items in a repeater control.

In Action Designer, you can use the **Gesture** column to view the Gesture property value for all page actions. If the **Gesture** column is not visible, then on the **View** menu, choose **Show Column**, and then select **Gesture**.  

## See Also
[Implementation Tips for Gestures](devenv-implementation-tips-gestures-property.md)  
[Introducing the Dynamics 365 Business Central Mobile App](../devenv-introducing-business-central-mobile-app.md)   
<!-- [Adding Actions to Pages](../devenv-Adding-Actions-to-Pages.md) -->
