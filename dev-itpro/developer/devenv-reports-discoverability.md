---
title: Report discoverability
description: Introducing how to make Business Central reports discoverable by users.
author: KennieNP
ms.custom: na
ms.date: 12/05/2023
ms.reviewer: solsen
ms.topic: conceptual
ms.author: kepontop
---

# Report discoverability

After you develop a report and before you make it available for users, you must consider *discoverability* for the report, meaning:

- How users can discover that the report exists?
- Ensure that users can find it.
- Ensure that users know how to use it. 

[!INCLUDE[prod_short](includes/prod_short.md)] comes with various features that you can use to make that happen, such as **Tell me** search, actions on role centers and pages, Report/Role explorer, teaching tips, and context-specific help. 

In this article, you can learn how to use all of them to maximize the user experience for your reports.

## Adding reports to Tell me

The [!INCLUDE[prod_short](includes/prod_short.md)] client includes the **Tell me** feature that lets users find objects by entering search terms. When you have added a report in your app/extension, you most likely want it to be discoverable to users in **Tell me**. 

In AL, you make a report searchable from **Tell me** by setting the [UsageCategory property](properties/devenv-usagecategory-property.md) in code. The **UsageCategory** setting makes the report searchable, and the value chosen for the setting further sub categorizes the item.

For more information, see [Adding reports to Tell Me](devenv-al-menusuite-functionality.md).

## Adding reports to role centers

Role centers in [!INCLUDE[prod_short](includes/prod_short.md)] have a navigation area that appears at the top of the window, and contains multiple sections that enable users to quickly navigate and perform actions. These actions display the most important or most often used tasks and operations required by users and typically contain links to pages, reports, and codeunits. For reports, you can add them under the Reporting area.

For more information, see [Adding links to the navigation menu on the role center](devenv-adding-menus-to-navigation-pane.md).

## Adding reports to the Report/Role explorer

When pages and reports are added to role centers, they also become available in the Report/Role explorer overviews.

For more information about the Report/Role explorer, see [Finding Reports with the Role Explorer](/dynamics365/business-central/ui-role-explorer).

## Adding reports to pages

All pages in [!INCLUDE[prod_short](includes/prod_short.md)] allow you to add actions that run a report. Before putting an report action on a page, you should think about the business processes that the report supports. Creating these actions can make it easier for the user to perform their daily tasks, such as getting a sales order overview or analyzing the inventory.  

To read more about how to add reports as actions on pages in versions prior to version 2022 release wave 2, see [Adding actions to a page](devenv-adding-actions-to-a-page.md).

With [!INCLUDE [prod_short](includes/prod_short.md)] 2022 release wave 2, the way that you promote actions on pages or page extensions has changed. Promoting actions is defined in a specific section of the page definition and contains a reference to the action. For more information, see [Promoted Actions](devenv-promoted-actions.md).


## Adding teaching tips to your reports

With teaching tips, you can help explain logic that's relevant to the report therefore allowing users to get on with a reporting task right away without blocking them. After users dismiss a teaching tip, they can choose or hover over the report title in the request page. This action will reopen the teaching tip.

For more information, see [Adding teaching tips to your reports](devenv-request-pages-for-reports.md#adding-teaching-tips-to-your-reports)

## Adding help links to your reports

A key pillar of helping users help themselves is to give them access to help for the particular part of [!INCLUDE [prod_short](../developer/includes/prod_short.md)] that they're working in. This also applies for reports. 

Starting with [!INCLUDE [prod_short](../developer/includes/prod_short.md)] 2023 release wave 1 (version 22), you can set the *ContextSensitiveHelpPage* property on report request pages, which will in turn show the report help link in the Help pane.

For more information, see [Adding help links to your reports](devenv-request-pages-for-reports.md#adding-help-links-to-your-reports)

## See also

[Adding reports to Tell Me](devenv-al-menusuite-functionality.md)   
[Adding links to the navigation menu on the role center](devenv-adding-menus-to-navigation-pane.md)   
[Adding actions to a page (prior to version 2022 release wave 2)](devenv-adding-actions-to-a-page.md)   
[Promoted Actions (version 2022 release wave 2 and later)](devenv-promoted-actions.md)   
[Adding teaching tips to your reports](devenv-request-pages-for-reports.md#adding-teaching-tips-to-your-reports)   
[Adding help links to your reports](devenv-request-pages-for-reports.md#adding-help-links-to-your-reports)  
[Reports overview](devenv-reports.md)  
[Report design overview](devenv-report-design-overview.md)  

