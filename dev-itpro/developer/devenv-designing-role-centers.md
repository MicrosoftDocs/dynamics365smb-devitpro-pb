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
ms.service: "dynamics365-business-central"
ms.author: jswymer
---

[!INCLUDE[newdev_dev_preview](includes/newdev_dev_preview.md)]

# Designing Role Centers
The strength of [!INCLUDE[d365fin_md](includes/d365fin_md.md)] is its role-tailored experience that helps users focus on the work that is important to them. The Role Center is an integral part of the role-tailored experience. And as a developer, role-tailoring should be the foundation for your Role Center design. 

## About the Role Center
The Role Center is the user's entry point and home page for [!INCLUDE[d365fin_md](includes/d365fin_md.md)]. You can develop several different Role Centers, where each Role Center is customized to the profile of the intended users. For example, you could have Role Centers that target the different levels within an organization , such business owners, department leads, and information workers. 

Role Centers are based on a user-centric design model. You should design a Role Center to give users quick access to the information that is most important to them in their daily work - displaying information that is pertinent to their role in the company and enabling them to easily navigate to relavant pages for viewing data and performing tasks.

In the client, users who work across multiple roles can easily switch Role Centers to shift their focus to different tasks. Users can also personalize your Role Center design by rearranging or hiding content.

## Role Center structure
A Role Center is defined by page that has the [PageType property](properties/devenv-pagetype-property.md) set to `RoleCenter`. The Role Center page is divided into two main areas: navigation/actions area and content area. The following figure illustrates the general layout and elements of a Role Center page.

![Role Center overview](media/rolecenter-overview-V2.png "Role Center overview")

## Navigation and Actions area
The navigation and actions area appears at the top of the Role Center page, and provides links to other objects, such as pages, reports, and codeunits, and more. You define the navigation area by adding actions to the Role Center page code, under the `actions` control. The navigation area is subdivided into smaller areas by using different `area()` controls as described in the following table:


|    |Area|Description|Usage Guidelines|
|----|-------|-----------|----------------|
|1|Top-level navigation|The top-level navigation consists of one or more root items that expand to display a submenu of links to other pages. The pages targeted by the submenus will open in the content area of the Role Center. <br /><br />This area is defined by an `area(sections)` control in the page code.|The top-level navigation should provide access to relavant enitity lists for the role's business sections, ordered according to importance. For example, typical lists for sales order processor could be customers, sales orders, quotes, and invoices. |
|2|Second-level navigation|The second-level area displays a flat list of links to other pages. The pages targeted by the links will open in the content area of the Role Center.<br /><br />This area is defined by an `area(embedding)` control.|You should use these items to link to the user’s most useful entity lists, ordered according to the business process sequence. Try to limit the number of second-level items, and consider placing items in the top-level navigation instead if the number gets too large. |
|3|Actions|The actions area provides links to pages, reports, and codeunits. The links can be displayed on the root-level, or grouped in a submenu. The objects targeted by these links will open in a separate window from Role Center page.<br /><br />The actions are defined by three different `area()` controls: <ul><li>Actions in the `area(creation)` control will appear first in the action area, and will display with a plus (+) icon.</li><li>Actions in an an `area(processing)` control will appear after the `area(creation)` items. These items can be grouped into submenus by using a `group` control.</li><li>Actions in the `area(reporting)` control target report object only and will appear last in the action area, and display with the default report icon. |The action area is designed for running the most important or typical tasks and operations required by the user. Actions will typically target card type pages that enable users to create new entities, such as customers, invoices, and sales orders, or target reports. Place the most important action at the root-level, and group closely related action in a second-level, or submenu.|

For more information about navigation, see [Adding to Navigation](devenv-adding-menus-to-navigation-pane.md). 


### Behavioral points of interest
-   The order of the `area()` controls in the page code is not important. However, the order of the individual actions an group is important because they will appear in the order in which they appear in page code.  
-   In page code, if the first part in the content area is a Headline part, then in the client, the action area will be automatically positioned either to the right of the Headline part or after the Headline part, depending on the browser window size. Otherwise, the action area will appear at the bottom of the navigation area, and extend the width of the workspace. 

## Content area
The content area consists of one or more parts that display content from underlying pages. Unlike the navigation and actions area that is completely defined in the Role Center page code, the content area consists of self-contained, independent page part type objects that can be used across Role Centers and in other pages. You add the parts are by including a `part` control in the `layout` control of the page code.

The following table described some of the most common parts for Role Centers, as illustrated in the previous figure.

|    |Element|Description|More information|
|----|-------|-----------|----------------|
|4|Headline|Displays a series of automatically changing headlines that provide users with up-to-date information and insight into the business and daily work. This is created by a `HeadlinePart` page type. |[Creating Role Center Headlines](devenv-create-role-center-headline.md)||
|5|Wide cues | A set of cues for displaying large numbers, like monetary values. This is created by using a `cuegroup` control on a `CardPart` page type, where the [Layout property](properties/devenv-layout-property.md) is set to `wide`. |[Wide Cues](devenv-cues-action-tiles.md#CueWideLayout)|
|6|Normal cues |Provides a visual representation of aggregated business data, such as the number of open sales invoices or the total sales for the month. These are created by using a `cuegroup` control on a `CardPart` page type. |[Creating Cues](devenv-cues-action-tiles.md#CreateCue)|
|7|Action tiles |Tiles that link to tasks or operations, like opening another page, starting a video, targeting another resource or URL, or running code. These are created by using a `cuegroup` control on a `CardPart` page type|[Action Tiles](devenv-cues-action-tiles.md#ActionTiles)|
|8|Chart|A graphical and interactive representation of your business data that sourced from a custom business chart control add-in or an  embedded Power BI report.||
|9|CardPart or ListPart page|Displays data fields in form or tabular layout.|[Page Object](devenv-page-object.md)|
|10|Control add-in|Displays custom content by using HTML-based control add-ins|[Control Add-in Object](devenv-control-addin-object.md)|


### Behavioral points of interest
- In general, the parts will appear in the client according to the order in which they are defined in the Role Center page code -  automatically rearranging horizontally and vertically to fill the available workspace.
- However, in the [!INCLUDE[d365fin_web_md](includes/d365fin_web_md.md)], page parts that contain cues (`cuegroup` controls) are  automatically grouped under a common **Activities** section, no matter where they are placed in the code. All other page parts are grouped under the **Business Assistance** section. Within **Activities** and **Business Assistance** sections, the parts will arrange according to the order in which they are defined in the page code.

## Development tips for overall page design
-   Do not apply grouping to parts in the content area because prevents parts from flowing to fill the available space. This gives the best experience to users with different screen resolutions or those on mobile devices.
-   To achieve the best readability and discoverability, for most Role Centers, you should place Headlines first, followed by Cues, then the remaining parts.
-   You cannot add custom logic directly to a Role Center page code. Code is limited to defining navigation, actions, and parts.
-   Role Centers can be highly specialized, in the fact that all navigation, actions, and content is optional. For example, you could have a single part that fills the entire workspace.
 
## Designing for all form factors
-   Role Center pages are also the primary entry point on mobile devices. The same content is displayed [!INCLUDE[d365fin_web_md](includes/d365fin_web_md.md)], but is presented in a different way to suit how users hold and interact with their mobile device.
-   You can preview how your Role Center will look on mobile devices directly in Designer.
-   Some limitations on mobile devices are:
    -   Tablets will display a limited number of cues
    -   Phones will display a limited number of content parts.
    -   Role Center pages will not display when embedded in Outlook or SharePoint.
 

## See Also
[AL Development Environment](devenv-reference-overview.md)  
[Page Extension Object](devenv-page-ext-object.md)  
[Actions Overview](devenv-actions-overview.md)  
[Adding Pages and Reports to Search](devenv-al-menusuite-functionality.md)  