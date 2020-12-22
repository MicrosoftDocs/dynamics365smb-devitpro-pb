---
title: Performance Tips for Business Users
description: Various tips and tricks to improve speed and agility of working with Business Central.
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: mikebcMSFT
ms.author: mikebc
---

# Performance Tips for Business Users

This section describes how you can work with end-users to improve the performance that each individual experiences with [!INCLUDE[prod_short](../developer/includes/prod_short.md)].

## Choosing a desktop browser

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] supports multiple browsers. Each browser offers a variety of features and capabilities. The browser plays a significant role in the responsiveness and fluidity of the user interface.

- Where possible, avoid older browsers such as Internet Explorer and Edge Legacy. Modern browsers generally offer better performance. See the list of supported and recommended browsers for [Business Central online](https://go.microsoft.com/fwlink/?linkid=2110804) and [Business Central on-premises](https://go.microsoft.com/fwlink/?linkid=2110719).

  <!-- If other legacy applications require you to remain on Internet Explorer, consider using [Edge in Internet Explorer mode](https://www.microsoft.com/edge/business). For more information, see [Microsoft Edge documentation](/deployedge/edge-ie-mode).-->
  > [!IMPORTANT] 
  > [!INCLUDE[prod_short](../developer/includes/prod_short.md)] will end support for Internet Explorer and Edge Legacy in April 2021. Consider switching to a modern browser, such as the [new Microsoft Edge](https://www.microsoft.com/edge/), before support ends.

- Always keep your browser updated to the latest version, which may include the latest performance enhancements.
- Some [!INCLUDE[prod_short](../developer/includes/prod_short.md)] performance features and optimizations, such as page caching, are only available for modern browsers.

### Browsers and page caching

The overall structure of a page (but not business data) is cached on the client device when a page is accessed the first time. The next time that same page is accessed, the layout of the page will be immediately displayed, while the latest data is fetched from the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] service. To take full advantage of page caching, [!INCLUDE[prod_short](../developer/includes/prod_short.md)] requires a modern browser with access to the browser's storage mechanisms.

|Browser|Page caching availability|
|--------|---------|
|New Edge|Available|
|Chrome|Available|
|Safari|Partly available. In some cases, users won't benefit from page caching across sessions. |
|FireFox|Partly available. In some cases, users won't benefit from page caching across sessions. |
|Edge Legacy|Unavailable|
|Internet Explorer|Unavailable|

> [!IMPORTANT]  
> Browsers that run in private or guest mode typically discard browser storage when the browser window is closed. This discards cached data and users won't be able to take advantage of page caching the next time they sign into [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. Users relying on private or guest browsing to work across multiple identities and organizations are advised to use browser profiles instead.
>
> Any browser policies or settings that restrict access to local storage or the browser's IndexedDB may prevent [!INCLUDE[prod_short](../developer/includes/prod_short.md)] from applying performance optimizations.

## Choosing a network connection

If a choice of networks is available, consider connecting to a secure network that has lower latency. In general, the user interface performs better when latency is low.

## Keep powered up

Newer browsers and operating systems are generally better at handling resources such as memory, network, and storage. Some devices will automatically limit resources available to the browser when running on battery power. Consider keeping laptops and similar devices plugged in to a power source for best performance.


## Making pages load faster
[!INCLUDE[prod_short](../developer/includes/prod_short.md)] has numerous mechanisms that make the user interface more responsive and help pages load faster. For example:
 - List pages load records in small batches while the user scrolls through the list, allowing it to scale to very large tables.
 - The overall structure of a page (but not business data) is cached on the client device after a page is accessed the first time.
 - The time taken to load any page is also affected by the number of controls shown on the page. Users can improve performance on complex pages using these methods: 
   - By *collapsing* secondary content that may be needed only occasionally. For example, when the FactBox pane on a page is collapsed, [!INCLUDE[prod_short](../developer/includes/prod_short.md)] saves time from attempting to process and display all the related facts.
   - By *hiding* secondary content entirely from the page. For example, hiding Role Center parts or columns that are not used by the user, department, or organization will also improve the time needed to load the page. Learn more about [Personalizing Your Workspace](/dynamics365/business-central/ui-personalization-user).

## Agility of navigating and entering data

Raw speed is not the only factor that determines whether users have a pleasant and performant experience. [!INCLUDE[prod_short](../developer/includes/prod_short.md)] provides numerous features that increase efficiency when exploring, navigating and entering data:

- [Keyboard Shortcuts](/dynamics365/business-central/keyboard-shortcuts)  
- [Focusing on lists](/dynamics365/business-central/ui-enter-data#Focus)  
- [Quick Entry](/dynamics365/business-central/ui-enter-data#QuickEntry)  
- [Finding Pages and information with Tell Me](/dynamics365/business-central/ui-search)  
- [Finding Pages and Reports with the Role Explorer](/dynamics365/business-central/ui-role-explorer)  
- [Optimize your workspace for data entry](/dynamics365/business-central/ui-personalization-user)  
- [Entering or editing using Microsoft Excel](/dynamics365/business-central/across-work-with-excel)  

## Attaching pictures and other files

High quality images or large documents can take time to process or download from [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. Consider the following that may improve performance when working with files:

- Reduce the size or quality of any images or photos that you upload. Some addon apps for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] that capture images from your device may also include settings for image quality.
- To avoid having to download files repeatedly simply to preview them, consider storing files on external storage that allows previewing of pictures and documents, such as SharePoint Online. You can then create a link from a record in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] to that file. Generally reducing the number of images and documents stored in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] also lightens the load of routine database maintenance tasks.  
Learn how to [Manage Attachments, Links, and Notes on Cards and Documents](/dynamics365/business-central/ui-how-add-link-to-record).  

## Searching and filtering records

Search in lists searches all columns in a table. To avoid resource starvation on broad data searches, a search might be subject to a timeout in which case the user will see a *"Searching for rows is taking too long. Try to search or filter using different criteria."* message. 

Users experiencing slow search in lists should consider using a column filter instead. Learn about [Searching and Filtering](/dynamics365/business-central/ui-search-filter-faq).  

## See Also

[Performance Overview](performance-overview.md)  
[Configuring the application for performance](performance-application.md)  
[Performance Topics For Developers](performance-developer.md)  
[Performance Online](performance-online.md)  
[Performance of On-Premises Installations](performance-onprem.md)  
[How to Work with a Performance Problem](performance-work-perf-problem.md)  
