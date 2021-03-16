---
title: "Implementation Tips for Gestures"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.author: solsen
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

 

# Implementation Tips for Gestures
Swipe gestures on the phone are easy to implement and are defined through actions on the page. You can map an action to a swipe gesture by setting the value of the new **Gesture** property to **LeftSwipe** or **RightSwipe** on a specific action.

Swipe gestures are available on pages of type List or ListPart, including embedded pages. For example, you can implement gestures on the Sales Lines subpage on a Sales Invoice.

The action must be visible and enabled, and the **Scope** property on the action must be set to **Repeater**. While you can vary the visibility of actions at runtime, it is not possible to vary gestures based on the currently-selected record.

The **CaptionML** property value of the action is shown in the Phone client as the user swipes.
The behavior of swipe gestures in the Phone client will vary depending on the number of actions that have been mapped to gestures.

If only one action has been mapped to **LeftSwipe** or **RightSwipe**, the user can rapidly flick the record in that direction to activate the action. If more than one action is mapped the **LeftSwipe** or **RightSwipe**, the user can swipe to reveal the available actions and then tap to activate one of them. A maximum of 3 actions can mapped in each direction. In some cases, introducing swipe gestures on a list may conflict with similar swipe gestures on the page, such as navigating across parts in the Role Center. If list gestures have been implemented on a ListPart that shows in the Role Center, [!INCLUDE[d365fin_md](includes/d365fin_md.md)] will automatically disable swipe navigation in the Role Center and favor the list gestures.

## When and how to use swipe gestures in the user interface
In particular on smartphone devices, the swipe gesture comes very naturally to most people, using the thumb to swipe left or right on the screen while holding the device in one hand. As part of developing list pages, certain actions can be assigned swipe gesture activation making the actions available for users via swiping either left or right when seeing records (as bricks) in a list.

Before assigning gesture activation to actions, take a moment to consider which actions should be available on swipe, and further which should be left swipe and right swipe, respectively. 
+ First off, make sure gesture activation is always a shortcut for users, and that they same actions that are available on swipe is also available to the user that instead taps and get up a details page. For example, if swipe-left in a customer list activates an action to create a new sales invoice, this action should also be available in the customer card page that opens up, if a user decides to tap the customer brick in the list, instead of swiping on it.
+ Next consideration, after deciding if an action is important enough to be assigned gesture activation, is about whether an action is made available on either left or right swipe. Generally, right swipe should be used for actions that starts or progresses the most important task from the user's point of view. For example, in the customer list, creating a new invoice may be considered the most important task, and if so, this action could be available on right swipe. Conversely, left swipe activation should be used for important secondary actions, for example, an action that reverses the effect of the right swipe action, or one that starts an alternative important task. In the customer list case, it could be that starting a new credit memo (which conceptually reverses an invoice action) is available on left swipe. For lists in which the user can delete records, a 'Delete' action can be made available on left swipe. 'Delete' should never be a right swipe action.
 
In general, having a single action available on swipe-right that starts or progresses the most important task is recommended, and - optionally - a single action is made available on left swipe. In special cases, multiple actions can be made available on either right or left swipe. In this case, the user's first swipe will reveal the available actions, and a second tap gesture is then needed to activate one of the actions. When using multiple actions on swipe, organize actions in their order of importance, sequenced in reading order, most important first.

## See Also

[Gesture Property](properties/devenv-gesture-property.md) 
<!-- 
[Developing for the Microsoft [!INCLUDE[d365fin_md](../includes/d365fin_md.md)] Mobile App](Developing-for-the-Microsoft-Dynamics-NAV-Mobile-App.md)  
[Adding Actions to Pages](Adding-Actions-to-Pages.md) -->
