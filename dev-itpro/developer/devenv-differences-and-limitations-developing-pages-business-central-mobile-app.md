---
title: Differences and Limitations for Mobile App Page Development
description: Learn about the differences and limitations to consider when you develop pages for the Business Central mobile app on tablets and phones.
ms.date: 08/24/2026
ms.reviewer: jswymer
ms.topic: concept-article
author: SusanneWindfeldPedersen
ms.author: solsen
---

# Differences and limitations when developing pages for the Business Central mobile app

Developing for the [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] and [!INCLUDE[nav_phone](includes/nav_phone_md.md)] is similar to developing for the [!INCLUDE[webclient](includes/webclient.md)]. However, there are some natural limitations on tablets and phones, such as not having a physical keyboard and mouse, as well as a smaller screen.

## Differences and limitations overview

The following table describes some of the most common differences and limitations that you might experience when developing for [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] and [!INCLUDE[nav_phone](includes/nav_phone_md.md)].  

|Concept|On tablet|On phone|Example|Recommendation or remarks|  
|-------------|---------------|--------------|-------------|--------------------|  
|Activity groups|Only the **Home** activity group is shown.|Only the **Home** activity group is shown.|**Home** and **Posted Documents** on the `Sales Order Processor` Role Center.|Design pages to expose the workflows needed by the user. For example, configure the profile to show the important list pages under the **Home** activity group. Alternatively, consider designing a new Role Center if the activities for the activity group vary greatly from the activities in other activity groups.|  
|Selecting multiple records in lists|Not available.|Not available.|`Ctrl+A` or `Ctrl+Click` on rows in a list using [!INCLUDE[webclient](includes/webclient.md)].|Avoid scenarios requiring selecting multiple rows on a list. Also, try to minimize actions on lists.|  
|Actions in the action bar|Only Promoted actions are shown.|Only Promoted actions are shown.|On the `Small Business` Role Center.|Use the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] to promote actions. Alternatively, configure the profile and add actions to the Home tab.|  
|FactBoxes|Not shown on List pages or Worksheet pages.|Not shown on List pages or Worksheet pages.|`Customer` list on the `Small Business` Role Center.|Make sure the same information is visible on the corresponding card page of the given record.|  
|Advanced filters|No column-specific filtering is available.|No column-specific filtering is available.|On the `Customer` list page.|Send data to Excel and do the complex filtering there.|  
|Tell Me|Not available yet.|Not available yet.|On [!INCLUDE[webclient](includes/webclient.md)].|Design pages to expose the workflows that the user needs, for example, through list places, tiles, or actions.|  
|Role Explorer|Not available yet.|Not available yet.|On [!INCLUDE[webclient](includes/webclient.md)].|Design pages to expose the workflows that the user needs, for example, through list places, tiles, or actions.|  
|Fields in FastTabs|Fields in FastTabs on list pages aren't shown. Only the repeater control is shown in the content area of the page.|Not available.||Design List pages to avoid having important columns on the far right of the column list. Assume you have no control over how many columns are displayed and consider that only the first few columns are made visible.|  
|Select from full list|Not available on lookups. Users aren't able to run actions on a lookup page, and they can't access the full set of records.|Not available on lookups. Users aren't able to run actions on a lookup page, and they can't access the full set of records.|On the `Item Card` when selecting the **Base Units of Measure**.|Make sure the appropriate columns are visible on the lookup. The user is still able to filter, scroll, and search through the lookup.|  
|Search across list columns|Partly supported. Search doesn't include FlowFields.|Partly supported. Search doesn't include FlowFields.|On the `Customer` list page.||  
|Lookups|Available.|Available, with the difference that advanced and simple lookups behave similarly on the phone. The lookup doesn't bring up the card, FactBoxes, or any field groups.|See examples on the `Customer Card` page.||  
|Matrix controls|Not available.|Not available.|See example in `G/L Budget`.||  
|File download|Available. Can't download multiple files at the same time.|Available. Can't download multiple files at the same time.|`Trial Balance` report with the **Print to Excel** check box.||  
|Worksheet pages|Available.|Not available; an error message is displayed.|`Sales Price` Worksheet or `Cash Flow` Worksheet.|Run this type of page from the [!INCLUDE[webclient](includes/webclient.md)], or [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)].|  
|Lists|Available.|Available, with the difference that these are displayed in a brick layout with many differences and limitations. Learn more in [Displaying data as tiles](devenv-lists-as-tiles.md).|Customers or Sales Orders pages.||  
|Indentation in repeater controls|Available.|Not available. The repeater control is rendered as a regular flat brick layout.|Chart of Accounts and Contacts list pages.||  
|Scope of actions|Available.|Available, but there are some behavioral differences regarding the [Scope property](properties/devenv-scope-action-property.md). Learn more in [Defining action scope for Business Central pages](devenv-defining-action-scope-for-pages.md).|||  
|Automatic input focus on first editable field of a page|Not available. |Not available.|`Customer Card` page.<br /><br />In the web client, focus is automatically on the first editable field, such as the `Name` field, so you can change the value right away.<br /><br />In the tablet or phone client, this field isn't in focus. Instead, you must select the field first to make changes.| The reason for this behavior is to prevent the in-app keyboard from initially displaying and occupying screen space.|

## Related information

[Displaying data as tiles](devenv-lists-as-tiles.md)   
[Implementing the camera in AL](devenv-implement-camera-al.md)     
[Implementing the location in AL](devenv-implement-location-al.md)  
[Role center behaviors](devenv-role-center-behaviors.md)   
[Defining action scope for Business Central pages](devenv-defining-action-scope-for-pages.md)
