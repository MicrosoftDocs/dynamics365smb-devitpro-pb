---
title: Add Action Submenus to Pages
description: Place the action submenus on pages under the main action tabs including Actions, Navigate, Report tabs in the Windows Client for Microsoft Dynamics NAV.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: e757a8ef-8299-4229-aa44-059341100e0d
caps.latest.revision: 19
---
# How to Add Action Submenus to Pages in Dynamics NAV
Action submenus can be placed on pages in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], under any of the three main action tabs:  
  
-   Actions  
  
-   Navigate  
  
-   Reports  
  
 Create an actions submenu if you have too many actions to fit under a single actions menu. Action submenus help you to break down the numerous tasks related to a business process, into smaller, related groups.  
  
 For example, on page 21 Customers, in the Navigate tab, there are two submenus with submenu actions.  
  
|Tab|Submenu|Submenu actions|  
|---------|-------------|---------------------|  
|Navigate|Dimensions|-   Dimensions-Single<br />-   Dimensions-Multiple|  
||Issued Documents|-   Issued Reminders<br />-   Issued Finance Charge Memo Discounts|  
  
 The preceding table shows a small selection of submenu actions from the Customers page. You can see that by grouping related activities together, it is possible to reduce the length of individual action menus, and make it easier for employees to find the actions they want to perform.  
  
## Creating an Action Submenu  
 Use Action Designer to create action submenus and individual actions to place under these menus.  
  
 You create action submenus as an Action Group type in Action Designer. Each Action Group can have any number of child elements placed below it in the hierarchy. Each row in Action Designer is indented. It is this indentation that determines the level of the action in the navigation.  
  
#### To create an action submenu  
  
1.  Open the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], choose **Tools**, and then choose **Object Designer**.  
  
2.  In **Object Designer**, select a page, and then choose **Design** to open **Page Designer**. For example, select page **22**, the **Customers** list page. You can create a submenu on a new or existing page.  
  
3.  To open **Action Designer**, on the **View** menu, choose **Page Actions**.  
  
4.  In **Action Designer**, you can see all the existing actions for the page. Use the shortcut menu on any row, and then choose **New** to create a new row for your action submenu.  
  
5.  Type a **Name** for your submenu item, and then choose **Caption**. The other fields are filled in automatically.  
  
6.  Select **ActionGroup** from the **Type** drop-down. If you select **ActionGroup**, the **SubType** field remains blank.  
  
     You have now created an Action submenu.  
  
7.  To add an action to your action submenu, create a new row below the **ActionGroup** you just created. Give your action a name, and set **Type** to **Action** in the drop-down.  
  
8.  Use the right and left indentation arrows to indent your new action one space below **ActionGroup**.  
  
     For more information, see [How to: Add Actions to a Page](How-to--Add-Actions-to-a-Page.md).  
  
9. Save and compile the page.  
  
10. To preview your action submenu, in Page Designer, choose the **Preview** button.  
  
## See Also  
 [Actions Overview](Actions-Overview.md)   
 [How to: Add Actions to a Page](How-to--Add-Actions-to-a-Page.md)
