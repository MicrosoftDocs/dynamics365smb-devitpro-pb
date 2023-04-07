---
title: "How to: Modify Menu Items in a MenuSuite"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 75036bbe-8bb0-455e-ac76-2ab3ed61b617
caps.latest.revision: 26
---
# How to: Modify Menu Items in a MenuSuite
[!INCLUDE[navnowlong](includes/navnowlong_md.md)] provides a basic MenuSuite that you can modify, or you can create a new MenuSuite from the basic MenuSuite. You modify an existing MenuSuite by designing it in Navigation Pane Designer. You can modify the shortcut menus, which typically represent a department area or the menu items that are in the department menus. This procedure describes how to modify menu items in a MenuSuite. For more information about how to modify a department menu, see [How to: Modify a Department Menu in a MenuSuite](How-to--Modify-a-Department-Menu-in-a-MenuSuite.md). For information about how to create a new MenuSuite, see [Walkthrough: Creating MenuSuites for the Microsoft Dynamics NAV Windows Client](Walkthrough--Creating-MenuSuites-for-the-Microsoft-Dynamics-NAV-Windows-Client.md).  
  
### To modify menu items in a MenuSuite  
  
1.  In the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)], choose **Tools** and then choose **Object Designer** to open the Object Designer window.  
  
2.  In Object Designer, choose **MenuSuite**.  
  
3.  Choose the MenuSuite that you want to modify, and then choose **Design** to open Navigation Pane Designer.  
  
4.  In Navigation Pane Designer, choose the department that contains the menu items that you want to modify.  
  
     The department tabs are located at the bottom half of Navigation Pane Designer. The design level and the name of the department you selected are shown in the header section of **Navigation Pane Designer**. The menus for each department are displayed in the top half of Navigation Pane Designer, under the header section of Navigation Pane Designer.  
  
5.  Select the menu item or group that you want to modify, and from the shortcut menu, choose an action from the list.  
  
     You can modify a menu by creating new items, inserting existing items, creating new groups, deleting or renaming items or groups.  
  
    > [!NOTE]  
    >  For information about how to insert items, see [How to: Insert Items in a MenuSuite](How-to--Insert-Items-in-a-MenuSuite.md).  
  
6.  If you are creating a new menu item, do the following:  
  
    1.  Right-click the folder that you want to create new item in and then choose **Create Item** to open the **Create Item** window.  
  
    2.  From the **Object Type** drop-down list box, select the object type that you want to create the menu item for.  
  
    3.  In the **Object ID** box, choose the **AssistButton** and choose an object from the \<Object> List window.  
  
    4.  In the **Caption** text box, enter a caption for the menu item, and then accept the default for **CaptionML**.  
  
    5.  In the **Department** list box, select the sub menu in the department where you want the menu item to appear in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] and then choose **OK**.  
  
7.  Right-click **Navigation Pane Designer**, and then choose **Close Navigation Pane Designer**.  
  
8.  In the **Save Changes** dialog box, make sure **Compile** is selected and then choose **Yes** to save the MenuSuite.  
  
## See Also  
 [Designing MenuSuites](Designing-MenuSuites.md)
