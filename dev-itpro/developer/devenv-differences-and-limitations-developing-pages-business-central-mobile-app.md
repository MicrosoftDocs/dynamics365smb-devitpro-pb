---
title: "Differences and Limitations When Developing Pages for Mobile App"
description: Describes differences and limitations when developing pages for the Dynamics 365 Business Central Mobile App for tablets and phones.
ms.custom: na
ms.date: 10/29/2020
ms.reviewer: solsen
ms.suite: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: blrobl
ms.author: t-blrobl
---
# Differences and Limitations When Developing Pages for the Business Central Mobile App
Developing for the [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] and [!INCLUDE[nav_phone](includes/nav_phone_md.md)] is similar to developing for the [!INCLUDE[webclient](includes/webclient.md)]. However, there some natural limitations on tablets and phones, such as not having a physical keyboard and mouse, as well as a smaller screen.

## Differences and limitations overview  
The following table describes some of the most common differences and limitations that you might experience when developing for [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] and [!INCLUDE[nav_phone](includes/nav_phone_md.md)].  

|Concept|On Tablet|On Phone|Example|Recommendation/Remarks|  
|-------------|---------------|--------------|-------------|--------------------|  
|Activity groups|Only the **Home** activity group is shown.|Only the **Home** activity group is shown.|**Home** and **Posted Documents** on the `Sales Order Processor` Role Center.|Design pages to expose the workflows needed by the user. For example, configure the profile to show the important list pages under the **Home** activity group. Alternatively, consider designing a new Role Center if the activities for the activity group greatly vary from activities in other activity group.|  
|Selecting multiple records in lists|Not available.|Not available.|`Ctrl+A` or `Ctrl+Click` on rows in a list using [!INCLUDE[webclient](includes/webclient.md)].|Avoid scenarios requiring selecting multiple rows on a list. Also, try to minimize actions on lists.|  
|Actions in the action bar|Only Promoted actions are shown.|Only Promoted actions are shown.|On the `Small Business` Role Center.|Use the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] to promote actions. Alternatively, configure the profile and add actions to the Home tab.|  
|FactBoxes|Not shown on List pages or Worksheet pages.|Not shown on List pages or Worksheet pages.|`Customer` list on the `Small Business` Role Center.|Make sure the same information is visible on the corresponding card page of the given record.|  
|Advanced filters|No column-specific filtering is available.|No column-specific filtering is available.|On the `Customer` list page.|Send data to Excel and do the complex filtering there.|  
|Tell Me|Not available yet.|Not available yet.|On [!INCLUDE[webclient](includes/webclient.md)].|Design pages to expose the workflows needed by the user. For example via list places, tiles or actions.|  
|Role Explorer|Not available yet.|Not available yet.|On [!INCLUDE[webclient](includes/webclient.md)].|Design pages to expose the workflows needed by the user. For example via list places, tiles or actions.|  
|Fields in FastTabs|Fields in FastTabs on list pages are not shown. Only the repeater control is shown in the content area of the page.|Not available.||Design List pages to avoid having important columns on the far right of the column list. Assume you have no control over how many columns are displayed and consider that only the first few columns will be made visible.|  
|Select from full list|Not available on lookups. Users are not able to run actions on a lookup page, and they cannot access the full set of records.|Not available on lookups. Users are not able to run actions on a lookup page, and they cannot access the full set of records.|On the `Item Card` when selecting the **Base Units of Measure**.|Make sure the appropriate columns are visible on the lookup. The user is still able to filter, scroll, and search through the lookup.|  
|Search across list columns|Partly supported. Search will not include FlowFields.|Partly supported. Search will not include FlowFields.|On the `Customer` list page.||  
|Lookups|Available.|Available, with the difference that advanced and simple lookups behave similarly on the phone. The lookup will not bring up the card, show FactBoxes, or any field groups.|See examples on the `Customer Card` page.||  
|Matrix controls|Not available.|Not available.|See example in `G/L Budget`.||  
|File download|Available. Cannot download multiple files at the same time.|Available. Cannot download multiple files at the same time.|`Trial Balance` report in the **Print to Excel** check box.||  
|Worksheet pages|Available.|Not available; an error message is displayed.|`Sales Price` Worksheet or `Cash Flow` Worksheet.|Run this type of page from the [!INCLUDE[webclient](includes/webclient.md)], or [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)].|  
|Lists|Available.|Available, with the difference that these are displayed in a brick layout with a number of differences and limitations. For an overview, see [Displaying Data as Tiles](devenv-lists-as-tiles.md).|Customers or Sales Orders pages.||  
|Indentation in repeater controls|Available.|Not available. The repeater control will be rendered as a regular flat brick layout.|Chart of Accounts and Contacts List pages.||  
|Scope of actions|Available.|Available, but there are some behavioral differences regarding the [Scope Property](properties/devenv-scope-action-property.md). Also, see [Defining Action Scope for Business Central Pages](devenv-defining-action-scope-for-pages.md). |||  
|Automatic input focus on first editable field of a page|Not available. |Not available.|`Customer Card` page.<BR /><BR />In the Web client, focus will automatically be on the first editable field (such as the `Name` field), enabling you to change the value right away.<BR /><BR />In the Tablet or Phone client, this field will not be in focus; instead, you will have to manually select the field first in order to make changes.| The reason for this behavior is to prevent the in-app keyboard from initially displaying and occupying screen space.|   

## See Also  
 [Displaying Data as Tiles](devenv-lists-as-tiles.md)   
 [Implementing the Camera in AL](devenv-implement-camera-al.md)     
 [Implementing the Location in AL](devenv-implement-location-al.md)  
 [Role Center Behaviors](devenv-role-center-behaviors.md)   
 [Defining Action Scope for Business Central Pages](devenv-defining-action-scope-for-pages.md)
