---
title: Designing Role Centers
description: "Provides and overview of Role Center design"
author: jswymer
ms.custom: na
ms.date: 01/19/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.author: jswymer
---

[!INCLUDE[newdev_dev_preview](includes/newdev_dev_preview.md)]

# Designing Role Centers
The Role Center is the users entry point and home page for [!INCLUDE[d365fin_md](includes/d365fin_md.md)]. You can develop several Role Centers, where each Role Center is customized to the users' profile. For example, you could have a Rolce Center for sales order processors, business managers, administrators and more. A Role Center should be designed to give users quick access to the information that is most important to them in their daily work.

## Overview
A Role Center is defined by page that has the [PageType property](properties/devenv-pagetype-property) set to `RoleCenter`. The Role Center page is divided into two main areas: navigation area and page parts area. The following figure illustrates the general layout and elements of a Role Center page.

![Role Center overview](media/rolecenter-overview.png "Role Center overview")

## Navigation area
The navigation area appears at the top of the Role Center page, and provides links to other objects, such as pages, reports, and codenits, and more. You define the navigation area by adding actions to the Role Center page. The navigation area is subdivided into smaller areas, based on the `area()` control. The following table describes the elements in the navigation area:

|    |Area|Description|More information|
|----|-------|-----------|----------------|
|1|Top-level menu|This area is defined by an `area(sections)` control. Each top-level item in the menu is defined by a `group` control under the `area(sections)` control, and the submenu items are defined by `action` controls under the `group` control.|The top-level menu should provide access to most important enitity lists based on the major areas of business.|
|2|Second level menu |These items are defined by an `area(embedding)` control. Each item is defined by a `action` control that targets a specific object. |You should use these items to open the entity lists most used by the users, regardless of the business area. |
|3|Action menu|The action menu area is defined by three different `area`controls: `area(creation)`, `area(processing)`, and  `area(reporting)`. </br> </br> Actions in the `area(creation)` control will appear first in the action menu, and will have plus icon. </br></br> Actions in an an `area(processing)` control will appear after the `area(creation)` items. The actions can be groups are:</br> </br> Actions in the `area(reporting)` control, display last in the action menu, and appear with defult report icon. |The action menau area is desgined for specific tasks and operations. se actions should target card type pages that enable users to create new entities, such as customers, invoices, and sales orders.|

### Behavior

## Page part area
The page part area specifies the content that appears on the Role Center. The page part area consists of one or more parts that are defined by an :


|    |Element|Description|More information|
|----|-------|-----------|----------------|
|4|Headline|Displays a series of automatically changing headlines to provide users with up-to-date information and insight into the business and daily work. Specified by a `HeadlinePart` page type, this for displaying headlines. |[Creating Role Center Headlines](devenv-create-role-center-headline.md)||
|5|Wide cues | A set of cues for displaying large numbers, like monetary values.|[Designing Cues](devenv-cues-action-tiles.md#CueDesign)|
|6|Normal cues |Provides a visual representation of aggregated business data, such as the number of open sales invoices or the total sales for the month. |[Designing Cues](devenv-cues-action-tiles.md#CueDesign)|
|7|Action tiles |Action tiles act as links that perform a task or operation, like opening another page, starting a video, targeting an another resource or URL, or running code.|[Action Tiles](devenv-cues-action-tiles.md#ActionTiles)|
|8|Chart|A graphical representation of business data controlled by a the Business Chart control add-in on a page. ||
|9|CardPart page|A `CardPart` page type that displays fields in a gridlayout.||



## See Also
[AL Development Environment](devenv-reference-overview.md)  
[Page Extension Object](devenv-page-ext-object.md)  
[Actions Overview](devenv-actions-overview.md)  
[Adding Pages and Reports to Search](devenv-al-menusuite-functionality.md)  