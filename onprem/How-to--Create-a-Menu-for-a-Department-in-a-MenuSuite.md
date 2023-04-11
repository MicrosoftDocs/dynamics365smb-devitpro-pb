---
title: Create Menu for a Department in MenuSuite
description: Dynamics NAV provides a basic MenuSuite that you can modify or create a new one from the basic one by designing it in Navigation Pane Designer.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 040befa6-1f60-4879-85ea-acabdc923d7c
caps.latest.revision: 10
---
# Creating a Menu for a Department in a MenuSuite 
[!INCLUDE[navnowlong](includes/navnowlong_md.md)] provides a basic MenuSuite that you can modify, or you can create a new MenuSuite from the basic MenuSuite. You modify a MenuSuite by designing it in Navigation Pane Designer. In Navigation Pane Designer, you can modify an existing menu for a department or create a new menu. Creating a new menu creates a new department in the MenuSuite. This procedure describes how to create a menu for a department in a MenuSuite. For more information about how to modify a department menu, see [How to: Modify a Department Menu in a MenuSuite](How-to--Modify-a-Department-Menu-in-a-MenuSuite.md). For information about how to modify a menu item in a MenuSuite, see [How to: Modify Menu Items in a MenuSuite](How-to--Modify-Menu-Items-in-a-MenuSuite.md).  
  
### To create a Menu for a department  
  
1.  In the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)], choose **Tools** and then choose **Object Designer**.  
  
2.  In Object Designer, choose **MenuSuite**.  
  
3.  Select the MenuSuite that you want to add the department menu to, and then choose **Design** to open Navigation Pane Designer.  
  
4.  In Navigation Pane Designer, select the department tabs section, and from the shortcut menu, choose **Create Menu**.  
  
5.  In the **Create Menu** window, in the **Caption** text box, enter a name for the menu.  
  
6.  You can enter a value for **CaptionML** so that the menus are displayed in multiple languages. For information about how to enter a value for **CaptionML**, see [How to: Enter Text in the Multilanguage Editor](How-to--Enter-Text-in-the-Multilanguage-Editor.md).  
  
    > [!NOTE]  
    >  By default, the language setting on your computer is used for **CaptionML**. However, you can change the language setting in the **Multilanguage Editor** window.  
  
7.  In the **Bitmap** text box, enter the number of the bitmap you want to display on the department menu and then choose the **OK** button. Valid bitmap numbers are 0-15.  
  
8.  In Navigation Pane Designer, from the shortcut menu, choose **Close Navigation Pane Designer**.  
  
9. In the **Save Changes** dialog box, make sure **Compile** is selected and then choose **Yes** to save the MenuSuite.  
  
     After you have created a menu for a new department, add menu items to make the department menu functional. For information about how to add menu items to the department menu, see [How to: Modify Menu Items in a MenuSuite](How-to--Modify-Menu-Items-in-a-MenuSuite.md).  
  
## See Also  
 [Designing MenuSuites](Designing-MenuSuites.md)   
 [MenuSuites](MenuSuites.md)
