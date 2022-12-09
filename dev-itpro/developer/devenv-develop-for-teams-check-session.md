---
title: Get session and environment information relevant to Teams development 
description: Learn about AL code for getting session information that you cn use to influence runtime behavior of a Business Central card or tab in Teams.
author: jswymer
ms.author: jswymer
ms.reviewer: jswymer
ms.service: dynamics365-business-central
ms.topic: how-to
ms.date: 11/23/2022
ms.custom: bap-template
---

# Get relevant session and environment details for Teams integration

This article describes some AL code for getting session and environment information, which you can use to change the behavior of Business Central card or tab in Teams.

## Check whether the current session runs in Teams

You can adapt page objects to display specific content or behave differently when they're run in the context of Teams, in a card details window or tab.

The [CurrentClientType method](methods-auto/session/session-currentclienttype-method.md) will return the value `Teams` when the user session runs in a card details window or in a tab. For example, you can use this method to set the visibility of actions that are useful in the context of collaboration.

```AL
if CurrentClientType = ClientType::Teams then  
  ...  
```

## Check whether the current session runs with a Microsoft 365 license

When people access Business Central data in Microsoft Teams using only their Microsoft 365 license, the Business Central platform automatically prevents writing of data. It also simplifies the user experience by removing the action bar, FactBox pane, and other UI elements. You can adapt page objects to display specific content or behaviors when this category of user accesses the page in the card details window or in a tab. For example, you could use this information to hide specific columns on the page or provide more in-app guidance.

To determine whether the current user is accessing Business Central using only a Microsoft 365 license, the following code snippet can be used:

```AL
// checks whether the current user has only the Microsoft 365 Plan 
procedure IsM365PlanUserOnly(): Boolean 
var 
    PlanIds: Codeunit "Plan Ids"; 
    UsersInPlans: Query "Users In Plans"; 
    IsM365PlanUser: Boolean; 
    DoesUserHaveOtherPlans: Boolean; 
begin 
    UsersInPlans.SetFilter(User_Security_ID, UserSecurityId()); 
    if not UsersInPlans.Open() then 
        exit(false); 
    while UsersInPlans.Read() do 
        if (UsersInPlans.Plan_ID = PlanIds.GetMicrosoft365PlanId()) then 
            IsM365PlanUser := true 
        else 
            DoesUserHaveOtherPlans := true; 
    exit(IsM365PlanUser and (not DoesUserHaveOtherPlans)); 
end; 
```

## Check whether access with Microsoft 365 licenses is enabled 

To help Business Central users easily share and collaborate on business data with their coworkers, administrators can enable access with Microsoft 365 licenses on each environment. When enabled, users in an organization who have a Microsoft 365 license, but no Business Central license, can read (not write) Business Central data that's shared with them in Microsoft Teams.

To determine whether administrators have enabled this capability on the current environment, the following code snipped can be used:

```AL
procedure IsM365CollaborationEnabled(): Boolean 
begin 
    if CanQueryGraph() then 
        exit(GraphQuery.IsM365CollaborationEnabled()); 
    exit(false); 
end; 
```

## See also

[Developing for Microsoft Teams Integration Overview](devenv-develop-for-teams.md)  
[Extend Teams Cards](devenv-develop-for-teams-cards.md)  
[Add Business Central Tabs](devenv-develop-for-teams-tabs.md)  
[Add and Remove Recommended Content](devenv-develop-for-teams-tab-content.md)  
