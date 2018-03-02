---
title: Page Design and Structure Overview
description: The Pages are the main way to display and organize the data on the Windows Client and Web Client, which offers a Windows like visual experience.
ms.custom: na
ms.date: 10/23/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 0ba68a20-d83a-4e4c-9938-dac7fa8f5461
caps.latest.revision: 35
manager: edupont
---
# Walkthrough: Pages in Microsoft Dynamics NAV
In [!INCLUDE[navnow](includes/navnow_md.md)], pages are the main way to display and organize data. Pages display in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] and [!INCLUDE[nav_web](includes/nav_web_md.md)], which offer users a visual experience closely aligned to Microsoft Office and Windows. [!INCLUDE[nav_windows](includes/nav_windows_md.md)] and [!INCLUDE[nav_web](includes/nav_web_md.md)] are [!INCLUDE[rtc](includes/rtc_md.md)]s where every user has a Role Center page, tailored to their individual needs and tasks they perform. Other types of pages, such as List pages might display lists of customers or sales orders, while others such as Document pages, focus on user tasks. Each page has its own set of controls that should only be used with that page type. For example, Cues are only used on Role Center pages, FastTabs are used on Card and Document pages, and Fixed Layout controls are used on Worksheet pages.  
  
## The Page Object  
 In [!INCLUDE[navnow](includes/navnow_md.md)], a page is basically an XML object composed of controls, properties, actions, triggers, and code. You create page objects in Page Designer and save them in Object Designer in the same way as you save other [!INCLUDE[navnow](includes/navnow_md.md)] objects.  
  
 In Page Designer, you can start by creating a blank page or choose from over 10 page types. Pages can be linked to a source table, unless you want to create a Role Center or a blank page not based on a page type data from a table.  
  
 In the Page Designer window, you group controls in a hierarchy that reflects the XML structure of the page. To help you to create the correct XML layout, page designer provides you with several new properties called Types and SubTypes. These properties enable you to create controls, specify their position on the page, and how they are grouped. You set types and subtypes using the drop-down menus in Page Designer.  
  
 The following table shows Page Designer Types and SubTypes.  
  
|Type|SubType|  
|----------|-------------|  
|Container|ContentArea<br /><br /> FactBoxArea<br /><br /> RoleCenterArea|  
|Group|Group<br /><br /> Repeater<br /><br /> CueGroup<br /><br /> FixedLayout|  
|Field|No SubType available for this Type|  
|Part|No SubType available for this Type|  
  
 When you add controls, each row is automatically indented, although every time you add a row you can adjust indentation manually with right and left indentation controls. If you indent an element in your page incorrectly, you will get an error message when you try to save and compile the page.  
  
 Use the Properties window to set your properties on a page. Properties work in the same way for pages as they do for other [!INCLUDE[navnow](includes/navnow_md.md)] objects, although there are several new and changed properties in pages. For more information, see [Page Properties](Page-Properties.md).  
  
 Use C/AL Globals in Object Designer to define C/AL triggers and functions on a page.  
  
## Types of Pages  
 The following page types are available:  
  
-   Card  
  
-   List  
  
-   Role Center  
  
-   Card Part  
  
-   List Part  
  
-   Document  
  
-   Worksheet  
  
-   Confirmation Dialog  
  
-   List Plus  
  
-   Navigate Page \(Wizard\)  
  
-   Standard Dialog  
  
 For more information about page types, see [Touring the RoleTailored Client Pages](Touring-the-RoleTailored-Client-Pages.md).  
  
## Designing Pages  
 In [!INCLUDE[navnow](includes/navnow_md.md)], when you design and create pages you use the Page Designer, which is part of the Object Designer in.  
  
 When you design new pages you should start by looking at the wide variety of roles, tasks, and activities in your organization. These tasks and activities should be reflected in the pages that you create, and the navigation that you add to a page. There are several different page types which you can use to help you in this process. Each page type behaves like a container or template on which you can add controls and navigation elements called actions.  
  
 Window size and the positioning are controlled automatically, depending on the display device used. The controls that you use on a page are determined by the page type that you select.  
  
 Pages are metadata driven making them very flexible. They can be delivered on a wider variety of display targets which makes them more scalable. Pages have been designed to optimize performance and new enhanced controls mean that there are fewer triggers on pages than there were on forms.  
  
 You can change the behavior of pages by making changes to the properties sheet, just as you did with forms. For example you save and compile pages just like forms. You can access Properties, C/AL code, the C/AL Symbol Menu, C/AL Globals, and the Field Menu by using the same shortcuts or by using the View menu, as you did in forms.  
  
 In Object Designer, all existing page objects, and any new ones that you create are listed under the Pages button. To create a new page, you must first open the New Page dialog box and then select a page type. We recommend that you always select a page type instead of creating a blank page when you design a page.  
  
## Page Controls  
 You can add the following page controls to a page depending on the page type you have chosen:  
  
-   FactBox  
  
-   FastTab  
  
-   Cue  
  
-   HomePart  
  
-   ChartPart  
  
-   PagePart  
  
-   SystemPart  
  
-   Ribbon  
  
-   Filter Pane  
  
 For more information about controls, see [Touring the RoleTailored Client Pages](Touring-the-RoleTailored-Client-Pages.md).  
  
## Adding Navigation to Pages  
 All pages contain menu items and navigation controls called Actions.  
  
 In [!INCLUDE[navnow](includes/navnow_md.md)] there are three categories of Actions:  
  
-   Action Items  
  
-   Related Information  
  
-   Reports  
  
 Role Center pages have their own navigation pane and the following actions:  
  
-   Activity Buttons  
  
-   Home Items  
  
 You can access Action Designer from Page Designer. When you want to add actions to a page, open Page Designer, choose the last available row at the bottom of the page, choose View, and then choose Actions to open Action Designer. You use the Action Designer in the same way as you use Page Designer. You add new actions as rows in the Action Designer window, and set Action Types and SubTypes using the drop-down menus. Each action also has its own set of properties available in the Properties window.  
  
 For more information about actions, see [Actions Overview](Actions-Overview.md).  
  
## Best Practices for Designing Pages  
 We recommend that you simplify the user experience by reducing what users see by default. You can promote the information that the users most frequently need to see and hide the less important information. For example:  
  
-   Place common tasks in the ribbon  
  
-   Organize information pages under FastTabs and, by default, hide the FastTabs that are infrequently visited.  
  
-   Use one to three FactBoxes on a page to provide supplementary information and a place for adding notes.  
  
## See Also  
 [Touring the RoleTailored Client Pages](Touring-the-RoleTailored-Client-Pages.md)   
 [Actions Overview](Actions-Overview.md)  
 [Developing Extensions Using the New Development Environment - Preview](developer/devenv-dev-overview.md)