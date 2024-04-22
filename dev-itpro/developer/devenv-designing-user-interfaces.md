---
title: Designing User Interfaces
description: "Provides an overview of the components available when designing a user interface in Business Central"
author: kennieNP
ms.date: 22/04/2024
ms.topic: conceptual
ms.author: kepontop
---

# Designing User Interfaces

**!!! Maybe Jacob W writes more/better intro here !!!**

The user interface for [!INCLUDE[prod_short](includes/prod_short.md)] consists of many types of components, such as 

* *Role Centers*. These serve as personalized dashboards tailored to specific user roles. They provide quick access to relevant information, tasks, and reports.
* Pages*. Business Central’s interface is organized into pages. These can be list pages, displaying records in a tabular format, or card pages, showing detailed information for a single record. Pages display fields, which represent data elements within records. Users input or view data in these fields.
* Actions*. Users can perform actions such as creating, editing, deleting, or posting records. These actions are available through buttons on the pages.
* *Views*. Views allow users to filter and sort data on pages. They define how records are displayed.
* *Queries*. Users can analyze data from queries to perform reporting tasks.
* Profiles*. Profiles control access rights and permissions for different users or user groups.

Apart from the components mentioned above, [!INCLUDE[prod_short](includes/prod_short.md)] also comes with Discoverability features:
* *Tell Me*. A search feature that helps users find specific pages, actions, or reports by typing keywords.
* *Role Explorer*. Provides an overview of available roles and their associated tasks.

As a developer, mastering the different user interface components enhances efficiency and productivity for the users of your [!INCLUDE[prod_short](includes/prod_short.md)] apps/extensions. This overview article explains each topic on a high level and provides links for learning more.


## Role Centers

The Role Center is the user's entry point and home page for [!INCLUDE[prod_short](includes/prod_short.md)]. You can develop several different Role Centers, where each Role Center is customized to the profile of the intended users. For example, you could have Role Centers that target the different levels within an organization, such business owners, department leads, and information workers. 

Role Centers are based on a user-centric design model. You should design a Role Center to give users quick access to the information that is most important to them in their daily work. Like, displaying information that is pertinent to their role in the company and enabling them to easily navigate to relevant pages for viewing data and doing tasks.

:::image type="content" source="media/rolecenter-overview-no-references.png" alt-text="Shows the overall structure of a role center in Business Central" lightbox="media/rolecenter-overview-no-references.png":::

For more information, see [Designing role centers](devenv-designing-role-centers.md).


## Pages and actions

Understanding how [!INCLUDE[prod_short](includes/prod_short.md)] displays a page dependent on its *page type* is important to be able to create a good user experience. There are also several page properties and variations of the page structures that can help create an intuitive and efficient user interface. A fundamental characteristic of a page type is how it relates to the data presented on the page. Two principal ways exist: *entity*-oriented (typical for the `Card` page type) and *collection*-oriented (typical for the `List` page type.) 

![Collection page actions](media/page-layout-collection-actions.png "Collection pages and their actions")

For more information, see [Pages overview](devenv-pages-overview.md) and [Page Types and Layouts](devenv-page-types-and-layouts.md).


In [!INCLUDE[prod_short](includes/prod_short.md)], actions are displayed at the top of each page, referred to as the action bar. The actions can be displayed in different menus on the action bar to enable users to quickly locate the actions they want to use.

![image text.](media/action-overview.png) 

For more information, see [Actions overview](devenv-actions-overview.md).


## Views

Views in [!INCLUDE[prod_short](includes/prod_short.md)] are used on list pages to define a different view of the data on a given page. A view offers:

- Filtering on multiple table fields on the source table defined for the page.
- Sorting of the data on multiple table fields, but only in one direction; either *ascending* or *descending*.
- Layout changes, modifying page columns, moving them, etc. 

For more information, see [Designing views](devenv-views.md)


## Queries

Available from version 23, users can view and analyze query data directly from the [!INCLUDE[prod_short](includes/prod_short.md)] client in analysis mode. The data is analyzed in real time and respects the data security that has been set up for the users. Just like for pages, you can can make queries discoverable for users in Tell Me search and in the role explorer under Report and Analysis. 

:::image type="content" source="/dynamics365/business-central/media/data-analysis-gl-entries.png" alt-text="Example of how to do data analysis on the G/L entries page." lightbox="/dynamics365/business-central/media/data-analysis-gl-entries.png":::

For more information, see [Query Object](devenv-query-object.md) and [Analyze data on lists and queries](/dynamics365/business-central/analysis-mode?toc=/dynamics365/business-central/dev-itpro/toc.json).


## Profiles

A profile is the mechanism that makes a Role Center page and its associated pages and reports available to users in the client. It enables you to build an individual experience for users based on their role in the company by customizing the pages that they use to perform the daily tasks. In the client, profiles are referred to as **Roles**. When users sign in to [!INCLUDE[prod_short](includes/prod_short.md)], they are doing so under a specific role. Users can switch the role from the **My Settings** page. 

For more information, see [Designing profiles](devenv-design-profiles.md).


## Discoverability features 

After you develop a page and before you make it available for users, you must consider *discoverability* for the page, meaning:

- How users can discover that the page exists?
- Ensure that users can find it.
- Ensure that users know how to use it. 

[!INCLUDE[prod_short](includes/prod_short.md)] comes with various features that you can use to make that happen, such as **Tell me** search, actions on role centers and pages, Role explorer, teaching tips, and context-specific help. 

![TellMe.](media/tellmeApril19.png)

For more information, see [Page discoverability overview](devenv-page-discoverability.md).


## See Also

[Customizing for user roles](devenv-role-customization.md)  
[Designing role centers](devenv-designing-role-centers.md)  
[Pages overview](devenv-pages-overview.md)   
[Page Types and Layouts](devenv-page-types-and-layouts.md)  
[Arranging fields on a FastTab](devenv-arranging-fields-on-fasttab.md)   
[Actions overview](devenv-actions-overview.md)   

[Query Object](devenv-query-object.md)   
[Analyze data on lists and queries](/dynamics365/business-central/analysis-mode?toc=/dynamics365/business-central/dev-itpro/toc.json)  
[Designing views](devenv-views.md)   
[Designing profiles](devenv-design-profiles.md)
[Page discoverability overview](devenv-page-discoverability.md)   
