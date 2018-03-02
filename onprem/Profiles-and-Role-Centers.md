---
title: Profiles and Role Centers
description: Profiles are collections of the Microsoft Dynamics NAV users who share the same Role Center, a Page on which you can place different parts. 
author: edupont04
ms.custom: na
ms.date: 10/23/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
manager: edupont
---
# Profiles and Role Centers in Dynamics NAV
Profiles are collections of [!INCLUDE[navnow](includes/navnow_md.md)] users who share the same Role Center. A Role Center is a type of page on which you can place different parts. Each part is a container in which you can host other pages or pre\-defined system parts, such as an Outlook part or parts for adding tasks, notifications, or notes.  

 The user interface of Role Centers and all other pages can be customized in two different ways:  

-   Configuration, performed by the administrator  

-   Personalization, performed by users  

## Configuration
The administrator configures the user interface for multiple users by customizing the user interface for a profile that the users are assigned to. To perform this work, you must be an administrator with the SUPER permission set. In addition, profiles must be set up and the appropriate users assigned to them. You perform this UI customization in the **Customize** window after you have opened the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] in configuration mode. Your work in the **Customize** window is the same work that users perform when they personalize their own view of [!INCLUDE[navnow](includes/navnow_md.md)]. Typical customizations include which actions to include on the ribbon, how fields are placed on FastTabs or in FactBoxes, and which menu items to include in the navigation pane.  

Before you begin to customize user interfaces, you can specify on the [!INCLUDE[nav_server](includes/nav_server_md.md)] that UI elements that users do not have permissions for are removed from their user interface, including from the lists of UI elements in the **Customize** window.

> [!TIP]  
>  To see the effect of the initial UI customization that is provided with the **UI Elements Removal** option, you can log on as a test user with the permission set of the profile you are configuring. The reason is that you as the administrator have the SUPER permission set, and you can therefore not see and test the resulting user interface during your own logon.

## Personalization
As a user, you can customize the layout of the user interface to best suit your personal preferences. You perform this UI personalization in your personal version of the product, defined by your user logon.  

You can record multiple customizations of the same page based on different access points to the page. For example, the **Sales Orders** window can be customized to look different when it is opened from the **Customer Card** window than when it is opened from the **Sales Order Processor** Role Center. The point from which you access the page to be customized is recorded in that specific page customization. Accordingly, there may be multiple page\-customization records in the database, as you can see in the **Delete User Personalization** window.  

In addition to UI customization that you perform in the **Customize** window, you can make basic changes of your view of the UI. You can adjust the size and position of any window, expand the width of columns and increase the height of column headers, and change the sorting of data in columns. You also perform a type of personalization, when you select default options on dialog boxes that you are presented with when [!INCLUDE[navnow](includes/navnow_md.md)] receives external files or must run automation objects. You can cancel such basic UI changes and default settings for handling files and automation objects with different functions than those for canceling UI customizations.  

## See Also  
[Managing Users](Managing-Users.md)  
[Managing User Groups](managing-user-groups.md)  
[Security Overview](Security-Overview.md)  
