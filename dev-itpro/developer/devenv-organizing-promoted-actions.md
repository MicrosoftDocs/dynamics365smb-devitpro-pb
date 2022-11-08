---
title: "Organizing Promoted Actions"
description: "Guidelines for which actions to promote in the action bar for Dynamics 365 Business Central"
author: jacobwj
ms.author: solsen
ms.reviewer: 
ms.service: "dynamics365-business-central"
ms.topic: conceptual
ms.date: 11/03/2022
ms.custom: na
---

# Organizing Promoted Actions

The following article gives guidance on which actions you should promote, how to organize the actions, and where to place the promoted actions.

## Which actions should be promoted in a page? 

To promote an action in a page, place an `actionref` for it in the promoted area in the page object. The recommendation is to only promote actions that are frequently used by the users of the page and actions that are an expected part of a common action group on the page. 

Give prominence via promotion only to actions that you expect many users need for their work and avoid promoting actions that have little or no tracked usage. When there's only a few users that need a certain action, it's better to let them personalize that action to a prominent place they prefer rather than promoting the action for everyone, which will distract the many users who don’t need it. 

You can configure and new define user roles (profiles) when you want to coordinate promoted actions across pages to suit a certain set of users needing a certain set of actions. For more information, see [Customizing the User Interface for User Roles](devenv-role-customization.md).


## Promote actions dependent on page type 

For a business entity, for example, a Customer, there's no virtue in promoting the exact same set of actions on the customer list and the customer card page, even when the same set of actions is available on both pages. On the contrary, doing so may not align with the patterns of use and it risks cluttering the action bar with actions that too few users need. 

Instead, on list pages, use action promotion to give priority to: 

- Actions that allow users to process multiple selected rows at a time 
- Actions that give access to more details about the chosen record 
- Actions that users find relevant even as they might not see all fields about the record 

Actions that users are most likely to use after creating or updating a record using the card page need only be promoted in the card page, and not in the list. For example, it's more useful to promote the action “Request Approval” in card and document pages than in list pages, since most users will check or update information in the card or document before requesting approval of it. 

## How should promoted actions be organized? 

Once you’ve decided on the set of actions to promote in a page, it's time to organize the chosen set into a proper sequence and grouping. This must be done in a way where users easily discover the actions they need when they need them. 

Before starting to create new groups for actions in a page, consider the total set of promoted actions in the page. If there are five or fewer promoted actions, it's often preferable to avoid creating new groups, and instead keep the actions together, and not in separate groups. 

> [!NOTE]  
> If a page only has actions promoted to the Process/Home group, then the [!INCLUDE [prod_short](includes/prod_short.md)] web client will show the actions as if they're not placed in a group. This is known as unpacking of the Home/Process group.

Within each group of actions, choose a sequence of actions that respect their relative importance. Start with actions that a user is likely to use first, or often, when opening a page. Common action groups are the exception to this recommendation, as they must instead have a consistent sequence of actions across the pages where they appear. 

Use subgroups within a group when the total number of actions in a group is more than 7.

## Guideline for placing promoted actions

| The promoted action... | Variations | Recommendations |
|---------------------|------------|-----------------|
|Updates or creates data or info (possibly via an intermediate dialog page) and with clear feedback that the action took place.<br> Examples: Post, Suggest lines, Indent| A) The action is an expected part of a common action group on the page, for example **Post**. |Promote the action to its expected common action group. For example, promote the Post action to the common action group named “Posting.” |
|-| B) The action is particular to the page, and not an expected part of a common action group. | Action should be promoted to Home/Process. |
| Opens a relevant or related page (not a dialog) and that has no apparent side effects. <br> Examples: Statistics, Dimensions | A) The page that opens has information that is specific to the current record/row in the page. | Action should be placed in the common entity action group, which is the one bearing the name of the main entity of the page, for example, Customer. |
|-| B) The page that opens has the same information regardless of current record/row in the page. | Action should be placed in the common Navigate action group. |
| Is an action that runs a report, either directly or via an intermediate dialog page (request page). | (no variation) | Place report actions in the common action group Reports. |

## See also

[Actions in AL](developer/devenv-actions-overview.md)
[Adding Actions to a Page](developer/devenv-adding-actions-to-a-page.md)
[Actions in the User Interface](developer/devenv-actions-user-interface.md)
[How to Promote Actions](developer/devenv-promoted-actions.md)
[Common Promoted Action Groups](developer/devenv-common-promoted-action-groups.md)
[Action Bar Improvements](developer/devenv-action-bar-improvements.md)
[Behavioral Changes for Promoted Actions](developer/devenv-promoted-actions-behavioral-changes.md)
[Pages with Action Bar Improvements](developer/devenv-pages-action-bar-improvements.md)