---
title: Designing the User Interface in Business Central
description: Learn how to design Business Central user interfaces with role centers, pages, actions, views, queries, profiles, and discoverability features.
author: kennieNP
ms.date: 11/05/2026
ms.topic: concept-article
ms.author: kepontop
ms.reviewer: jswymer
---

# Designing the user interface

Choose page types and components that help users complete their tasks in [!INCLUDE[prod_short](includes/prod_short.md)]. Use page properties and layout options to build a clear, efficient user interface. The main components include:

- Role centers are tailored to business roles. They provide quick access to relevant information, tasks, and reports.
- Pages display data and let users work with it. For example, list pages show collections of records, and card pages show details for one record. Page fields let users enter or view values.
- Actions let users perform tasks such as creating, editing, deleting, or posting records.
- Views define filters, sorting, and layouts for data on list pages.
- Queries let users analyze data for reporting tasks.
- Profiles define role centers and page customizations for different business roles. Permission sets, not profiles, control access to objects and data.

[!INCLUDE[prod_short](includes/prod_short.md)] also provides discoverability features:

- **Tell Me** helps users find pages, actions, and reports by entering keywords.
- **Role Explorer** helps users explore pages and reports for their current role and other roles configured to appear there.

This overview explains the components and links to guidance for designing them in AL.

## Role centers for business roles

The role center is the user's entry point and home page. You can develop role centers for different profiles, such as business owners, department leads, and information workers.

Design a role center around the user's daily work. Give users quick access to relevant information and pages for completing their tasks.

The following illustration shows the navigation and content areas. Their exact appearance can vary by version and configuration.

:::image type="content" source="media/rolecenter-overview-no-references.png" alt-text="Illustration of the navigation and content areas of a Business Central role center." lightbox="media/rolecenter-overview-no-references.png":::

Learn more in [Designing role centers](devenv-designing-role-centers.md).


## Pages and page types

A *page type* determines how the client presents a page and its data. Two main patterns are *entity-oriented* pages, such as `Card` pages, and *collection-oriented* pages, such as `List` pages.

|`Card`, `Document`, and `ListPlus`|`List` and `Worksheet`|
|---------|---------------|
|:::image type="content" source="media/page-layout-entity-actions.png" alt-text="Diagram showing actions that apply to the current entity on a card or document page.":::|:::image type="content" source="media/page-layout-collection-actions.png" alt-text="Diagram showing actions that apply to selected records on a collection-oriented page.":::|
|Entity-oriented pages have actions at the top and in the action bar that affect the entity or context identified by the page title.|Collection-oriented pages have actions in the action bar and row menus that affect the selected records.|

Learn more in [Pages overview](devenv-pages-overview.md) and [Page types and layouts](devenv-page-types-and-layouts.md).


## Actions on pages

In [!INCLUDE[prod_short](includes/prod_short.md)], actions are displayed at the top of each page, referred to as the action bar. The actions can be displayed in different menus on the action bar to enable users to quickly locate the actions they want to use.

The following illustration identifies promoted menus and the action bar. Action placement can differ by version and client.

:::image type="content" source="media/action-overview.png" alt-text="Annotated Business Central action bar identifying promoted action menus and other page actions." lightbox="media/action-overview.png":::

Learn more in [Actions overview](devenv-actions-overview.md).

## Views on list pages

Views in [!INCLUDE[prod_short](includes/prod_short.md)] are used on list pages to define a different view of the data on a given page. A view offers:

- Filtering on multiple table fields on the source table defined for the page.
- Sorting on multiple table fields in one direction, either ascending or descending.
- Column layout changes, such as showing, hiding, or moving columns. A view can share the page layout or use its own layout.

Learn more in [Designing views](devenv-views.md).


## Queries for data analysis

Starting in version 23, you can view and analyze query data directly in the client in analysis mode. The data is analyzed in real time and respects your data permissions. You can make normal queries discoverable in **Tell Me** and under **Reports and Analysis** in **Role Explorer** by setting `UsageCategory`. Availability depends on permissions and configuration.

:::image type="content" source="/dynamics365/business-central/media/data-analysis-gl-entries.png" alt-text="Example of how to do data analysis on the G/L entries page." lightbox="/dynamics365/business-central/media/data-analysis-gl-entries.png":::

Learn more in [Query object](devenv-query-object.md) and [Analyze data on lists and queries](/dynamics365/business-central/analysis-mode?toc=/dynamics365/business-central/dev-itpro/toc.json).


## Profiles and role customization

A *profile* associates a role center and page customizations with a business role. Users sign in with a selected role and can change their **Role** on the **My Settings** page. Profiles tailor the experience but don't grant permissions.

Learn more in [Designing profiles](devenv-design-profiles.md) and [Customizing for user roles](devenv-role-customization.md).


## Discoverability features for pages

Before you make a page available, consider its *discoverability*:

- How will users discover that the page exists?
- How will they find it when needed?
- How will they learn to use it?

Use features such as **Tell Me**, actions on role centers and pages, **Role Explorer**, teaching tips, and context-specific help.

The following illustration shows how Tell Me groups search results. The available results and categories depend on configuration and version.

:::image type="content" source="media/tellmeApril19.png" alt-text="Tell Me search results grouped into current-page actions, pages, reports, and documentation." lightbox="media/tellmeApril19.png":::

Learn more in [Page discoverability overview](devenv-page-discoverability.md).

## Develop once, render on multiple client types

[!INCLUDE[prod_short](includes/prod_short.md)] extensions use the same AL page definitions across web, desktop, tablet, and phone clients. The clients adapt layouts to screen size and device type. Design for the capabilities and constraints of the target clients, and test important tasks on those clients.

Keep phone and tablet scenarios simple and usable. These clients suit lighter tasks, such as checking daily work or stock availability while traveling. Salespeople and service technicians can use them to get an overview away from the office. Learn more in [Developing for the Dynamics 365 Business Central mobile app](devenv-introducing-business-central-mobile-app.md).

To install clients for testing, see:

- [Getting Business Central on your mobile device](/dynamics365/business-central/install-mobile-app?toc=/dynamics365/business-central/dev-itpro/toc.json).
- [Get Business Central desktop app](/dynamics365/business-central/install-desktop-app?toc=/dynamics365/business-central/dev-itpro/toc.json).

## Related information

[Designing role centers](devenv-designing-role-centers.md)  
[Pages overview](devenv-pages-overview.md)  
[Page types and layouts](devenv-page-types-and-layouts.md)  
[Actions overview](devenv-actions-overview.md)  
[Query object](devenv-query-object.md)  
[Analyze data on lists and queries](/dynamics365/business-central/analysis-mode?toc=/dynamics365/business-central/dev-itpro/toc.json)  
[Designing views](devenv-views.md)  
[Designing profiles](devenv-design-profiles.md)  
[Customizing for user roles](devenv-role-customization.md)  
[Page discoverability overview](devenv-page-discoverability.md)  
[Developing for the Dynamics 365 Business Central mobile app](devenv-introducing-business-central-mobile-app.md)  
[Getting Business Central on your mobile device](/dynamics365/business-central/install-mobile-app?toc=/dynamics365/business-central/dev-itpro/toc.json)  
[Get Business Central desktop app](/dynamics365/business-central/install-desktop-app?toc=/dynamics365/business-central/dev-itpro/toc.json)  
