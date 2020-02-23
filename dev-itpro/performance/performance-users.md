---
title: "Performance Tips for Business Users"
ms.custom: na
ms.date: 02/23/2020
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: mikebcMSFT
---

# Performance Tips for Business Users
This section describes how you can work with end-users to improve the performance each individual experiences with Business Central.


## Choosing a desktop browser
Business Central supports multiple browsers that each offer a variety of features and capabilities. The browser plays a significant role in the responsiveness and fluidity of the user interface.
- Avoid older browsers such as Internet Explorer, and switch to one of our recommended modern browsers, such as the new Microsoft Edge. See the list of supported, recommended browsers for Business Central online and for Business Central on premises.
- Keep your browser always updated to the latest version.


## Choosing a network connection
If a choice of networks is avaliable, consider connecting to a secure network that has lower latency. In general, the user interface performs better when latency is low.


## Keep powered up
Newer browsers and operating systems are generally better at handling resources such as memory, network and storage. Some devices will automatically limit resources available to the browser when running on battery power. Consider keeping laptops and similar devices plugged in to a power source for best performance.


## Freeing up device resources
Business Central caches non-sensitive data 
See our privacy policy.


## Making pages load faster
Busines Central has numerous mechanisms that make the user interface more responsive and help pages load faster. For example:
 - List pages load records in small batches while the user scrolls through the list, allowing it to scale to very large tables.
 - The overall structure of a page (but not business data) is cached on the client device after a page is accessed the first time.

The time taken to load any page is also affected by the number of controls on the page. Users can improve performance on complex pages using these methods: 
- By collapsing secondary content that may be needed only occasionally. For example, when a FastTab on a card paeg is collapsed, Business Central saves time from attempting to display all the content within that FastTab.
- By hiding secondary content entirely from the page. For example, hiding Role Center parts or columns that are not used by the user, department or organization will also improve the time needed to load the page. Learm more about [Personalizing Your Workspace](/dynamics365/business-central/ui-personalization-user)

Note: These suggestions only affect the time taken to display the content. All data and operations related to this content are still processed.


## Speed and agility of data entry

Raw speed is not the only factor that determines whether users have a pleasant and performant experience. Business Central provides numerous features that increase efficiency when exploring, navigating and entering data.
- [Keyboard Shortcuts](/dynamics365/business-central/keyboard-shortcuts)
- Focus mode
- Quick Entry
- Tell Me what you want to do
- Optimize your workspace for data entry
- Entering or editing using Microsoft Excel


## Attaching pictures and other files

High quality images or large documents can take time to process or download from Business Central.
To avoid having to download files repeatedly simply to preview them, consider storing files on external storage that allows previewing of pictures and documents, such as SharePoint Online. You can then create a link from a record in Business Central to that file.
Learn how to [Manage Attachments, Links, and Notes on Cards and Documents](/dynamics365/business-central/ui-how-add-link-to-record)

## Searching and filtering records

Search in lists searches all columns in a table. To avoid resource starvation on broad data searches, a search might be subject to a timeout in which case the user will see a *"Searching for rows is taking too long. Try to search or filter using different criteria."* message. 

Users experiencing slow search in lists should consider using a column filter instead.
Learn about filtering: <TBD>  


## See Also

[Performance Overview](performance-overview.md)  
[Configuring the application for performance](performance-application.md)  
[Performance Topics For Developers](performance-developer.md)  
[Performance Online](performance-online.md)  
[Performance of On-Premises Installations](performance-onprem.md)  
[How to Work with a Performance Problem](performance-work-perf-problem.md)  
