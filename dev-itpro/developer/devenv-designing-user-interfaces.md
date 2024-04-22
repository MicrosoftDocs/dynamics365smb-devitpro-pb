---
title: Designing User Interfaces
description: "Provides an overview of the components available when designing a user interface in Business Central"
author: kennieNP
ms.date: 22/04/2024
ms.topic: conceptual
ms.author: kepontop
---

# Designing User Interfaces

**Jacob W writes an intro here**

The user interface for [!INCLUDE[prod_short](includes/prod_short.md)] consists of many types of components, such as 

- *Role Centers*. These serve as personalized dashboards tailored to specific user roles. They provide quick access to relevant information, tasks, and reports.
* Pages*. Business Central’s interface is organized into pages. These can be list pages, displaying records in a tabular format, or card pages, showing detailed information for a single record. Pages display fields, which represent data elements within records. Users input or view data in these fields.
* Actions*. Users can perform actions such as creating, editing, deleting, or posting records. These actions are available through buttons on the pages.
* *Views*. Views allow users to filter and sort data on pages. They define how records are displayed.
* *Queries*. Users can analyze data from queries to perform reporting tasks.
* Profiles*. Profiles control access rights and permissions for different users or user groups.

Apart from the components mentioned above, [!INCLUDE[prod_short](includes/prod_short.md)] also comes with Discoverability features:
* *Tell Me*. A search feature that helps users find specific pages, actions, or reports by typing keywords.
* *Role Explorer*. Provides an overview of available roles and their associated tasks.

As a developer, mastering the different user interface components enhances efficiency and productivity for the users of your [!INCLUDE[prod_short](includes/prod_short.md)] apps/extensions.


## Role Centers

The Role Center is the user's entry point and home page for [!INCLUDE[prod_short](includes/prod_short.md)]. You can develop several different Role Centers, where each Role Center is customized to the profile of the intended users. For example, you could have Role Centers that target the different levels within an organization, such business owners, department leads, and information workers. 

Role Centers are based on a user-centric design model. You should design a Role Center to give users quick access to the information that is most important to them in their daily work. Like, displaying information that is pertinent to their role in the company and enabling them to easily navigate to relevant pages for viewing data and doing tasks.

:::image type="content" source="media/rolecenter-overview-no-references.png" alt-text="Shows the overall structure of a role center in Business Central" lightbox="media/rolecenter-overview-no-references.png":::


## Pages, actions, fields



## Views


## Queries

## Profiles



## See Also

[Customizing for user roles](devenv-role-customization.md)  
[Designing role centers](devenv-designing-role-centers.md)  
[Pages overview](devenv-pages-overview.md)   
[Page Types and Layouts](devenv-page-types-and-layouts.md)  
[Arranging fields on a FastTab](devenv-arranging-fields-on-fasttab.md)   
[Actions overview](devenv-actions-overview.md)   
[Designing views](devenv-views.md)   
##### [Designing profiles](developer/devenv-design-profiles.md)

[Add pages and reports to Tell me](devenv-al-menusuite-functionality.md)   
