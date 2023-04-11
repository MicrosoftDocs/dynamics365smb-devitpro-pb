---
title: MenuSuites Overview
description: MenuSuite contain menus to navigate and perform actions on the Departments page in the Windows client which provides a basic modifiable MenuSuite.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: c585e018-3c96-4422-8503-87a23ca59ed3
caps.latest.revision: 18
---
# Getting Started with MenuSuites in Dynamics NAV
MenuSuites contain menus that enable users to navigate and perform actions in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. MenuSuites display menus on the Departments page in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. [!INCLUDE[navnow](includes/navnow_md.md)] provides a basic MenuSuite that can be modified. You can also create your own MenusSuites. You create MenuSuites in Object Designer and modify them in Navigation Pane Designer. For information about Navigation Pane Designer, see [Navigation Pane Designer](uiref/-$-S_2401-Navigation-Pane-Designer-$-.md).  

> [!NOTE]  
>  MenuSuites are not supported by [!INCLUDE[nav_web](includes/nav_web_md.md)]. They are used only to build the Department page in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)].  

 A MenuSuite has the following characteristics:  

-   Consists of a set of menus.  

-   Contains a menu node that can be either a menu group or a menu item.  

-   Has a GUID \(Globally Unique Identifier\).  

-   Contains a collection of menu nodes in a menu group.  

-   A menu item is the lowest level in the tree. When you select a menu item, its associated object such as a report, a batch job, or a codeunit, is run.  

## MenuSuite Topics  
 The following table lists topics that provide information about MenuSuites.  

|To|See|  
|--------|---------|  
|Learn about how to design MenuSuites.|[Designing MenuSuites](Designing-MenuSuites.md)|  
|Learn about how to create a new MenuSuite.|[Walkthrough: Creating MenuSuites for the Microsoft Dynamics NAV Windows Client](Walkthrough--Creating-MenuSuites-for-the-Microsoft-Dynamics-NAV-Windows-Client.md)|  
|Learn about how create a menu for a department.|[How to: Create a Menu for a Department in a MenuSuite](How-to--Create-a-Menu-for-a-Department-in-a-MenuSuite.md)|  
|Learn about how to make changes to a menu that opens a department.|[How to: Modify a Department Menu in a MenuSuite](How-to--Modify-a-Department-Menu-in-a-MenuSuite.md)|  
|Learn about how to make changes to menu items.|[How to: Modify Menu Items in a MenuSuite](How-to--Modify-Menu-Items-in-a-MenuSuite.md)|  

## See Also  
 [Designing MenuSuites](Designing-MenuSuites.md)
