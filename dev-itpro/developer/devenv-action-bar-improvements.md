---
title: "Action Bar Improvements"
description: "Introducing the action bar for Dynamics 365 Business Central"
author: jacobwj
ms.author: solsen
ms.reviewer: 
ms.service: "dynamics365-business-central"
ms.topic: conceptual
ms.date: 11/03/2022
ms.custom: na
---

# Action Bar Improvements

<!-- For customers upgraded to Business Central, Wave 2, 2022 -->

With Business Central 2022 release wave 2, We’ve organized the action bar menus to keep related actions together and avoid the same action being available in multiple menus. This helps reduce clutter and confusion, especially for users new to Business Central. 

The use of a Navigate menu has been reduced, and, where applicable, its contents merged with the entity menu. The entity menu is the one bearing the name of the entity displayed on a page. Going forward, the Navigate menu will only hold links to pages that aren't directly related to the current record yet useful to quickly navigate to when at a given place. 

Certain actions have been given a more prominent placement in the action bar. This reduces the number of selects to reach often-used actions and makes relevant actions more discoverable. 

Split buttons are well-known from other Microsoft products as a combination of a button and a menu and are introduced in Business Central 2022 release wave 2 in certain places. This type of control gives you quick one-click reach to the first action in a menu via the left button part and access to other related actions via the right dropdown part. 

The ways that users can customize menus to suit their purpose and preference are improved with the new action bar. That means earlier limitations to which and where actions could be moved no longer apply, which greatly empowers users in personalizing pages and in configuring profiles. 

The improvements listed above are available to current Business Central users as soon as they get the upgrade to Wave 2, 2022. 

## Optionally available to all customers upgraded to Business Central, Wave 2, 2022 

In addition to the improvements that are visible to all customers after upgrading to Business Central Wave 2, 2022, the release contains more optimizations of how the action bar supports users in their work. 

These extra optimizations are available to all upgraded customers, but not enabled right away with the upgrade. To activate the optimizations for a customer who upgraded to Business Central Wave 2, 2022, the admin enables the **Modern Action Bar** feature in the **Feature Management** page.  

With the **Modern Action Bar** feature enabled, the following further improvements take effect for all users in a Business Central environment: 

With document, card, worksheet, and listplus pages, the action bar is now presented in the pinned state when opened for the first time. This helps discovering relevant actions in the action bar and provides one-click reach to actions, without first pinning the action bar yourself. 

With document pages that have a Lines subpage, or any other page having a subpage, the subpage’s actions are now visible right away, without requiring that you select “More options.” 

On document, card, worksheet, and listplus pages, the Process tab is renamed to Home, which better aligns with the ribbon terminology that users see in other Microsoft products. 

On document pages that have **Post** and **Release** actions, these are now presented as split buttons in the **Home** tab. This provides better discoverability and one-click access to these often-used actions. 

On several other pages, certain actions have been grouped into split buttons when the actions are strongly connected by the effect they have. For example, a new split button is created for the actions **Correct**, **Cancel**, and **Create** corrective credit memo. This provides one-click access to Correct, which is the most often used among the three. 

## For customers signing up to Business Central after October 1 

Customers who sign up and start using Business Central Wave 2, 2022, after October 1 will get the benefit of all the action bar improvements described here, including those optimizations that are optional for upgrading customers. 

Every customer using Business Central, Wave 2, 2022, whether after an upgrade or as a new customer, can choose to disable the Modern Action Bar feature. This is an option that can be used if an extension incompatibility is discovered, or if the user interface changes require time to introduce to users. 

## See also

[Actions in AL](developer/devenv-actions-overview.md)
[Adding Actions to a Page](developer/devenv-adding-actions-to-a-page.md)
[Actions in the User Interface](developer/devenv-actions-user-interface.md)
[How to Promote Actions](developer/devenv-promoted-actions.md)
[Organizing Promoted Actions](developer/devenv-organizing-promoted-actions.md)
[Common Promoted Action Groups](developer/devenv-common-promoted-action-groups.md)
[Action Bar Improvements](developer/devenv-action-bar-improvements.md)
[Behavioral Changes for Promoted Actions](developer/devenv-promoted-actions-behavioral-changes.md)