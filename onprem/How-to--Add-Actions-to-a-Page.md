---
title: Add Actions to a Page
description: Create and display actions in the ribbon of all pages and group them together under Actions, Navigate, Reports tabs and preview it in the Windows Client.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 0a562f54-76df-4058-880b-8cdb4bab52f2
caps.latest.revision: 34
---
# How to Add Actions to a Page in Dynamics NAV
This topic shows how to create new actions, how to add actions to a page, and how to preview them in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. In [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)], actions can be displayed in the ribbon of all pages and grouped together under the following actions tabs:  
  
-   Actions  
  
-   Navigate  
  
-   Reports  
  
 Before putting an action on a page you should think about the business processes that the action supports. For example, on page 42, the Sales Orders list page, the Actions button contains actions for all tasks related to processing sales orders. Creating these actions can make it easier for the order processor to perform her daily tasks, such as posting sales orders and creating new customer orders.  
  
 For more information, see [Actions Overview](Actions-Overview.md).  
  
## Adding Actions to a Page  
 To create a new action you must use Action Designer. Action Designer is a tool in Page Designer that enables you to add actions to the menu bar.  
  
#### To add an action to a page  
  
1.  Open the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], and then in the **Tools** menu, choose **Object Designer**.  
  
2.  In **Object Designer**, select a page, and then choose **Design** to open **Page Designer**.  
  
3.  To open **Action Designer**, in the **View** menu, choose **Page Actions**.  
  
    > [!NOTE]  
    >  Actions can only be linked to a page, or to a group control that has a subtype of CueGroup. Actions cannot be linked to fields, containers, or parts on a page. For information about adding actions to a CueGroup control, see [Walkthrough: Creating a Cue Based on a FlowField](Walkthrough--Creating-a-Cue-Based-on-a-FlowField.md).  
  
4.  In **Action Designer**, select the first blank row, type a **Name**, and then type a **Caption** for your action.  
  
     The caption appears on the action on page in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)].  
  
5.  In the **Type** field, select one of the following **Types**:  
  
    -   ActionContainer  
  
    -   Separator  
  
    -   ActionGroup  
  
    -   Action  
  
     For example, if you want to create a container for your actions, select **ActionContainer**.  
  
6.  In the **SubType** field, select one of the following **SubTypes**:  
  
    -   NewDocumentItems  
  
         Actions that are included under this control are displayed in the **New Document** group on the **Actions** tab.  
  
    -   ActionItems  
  
         Actions that are included under this control are displayed on the **Actions** tab.  
  
    -   RelatedInformation  
  
         Actions that are included under this control are displayed on the **Navigate** tab.  
  
    -   Reports  
  
         Actions that are included under this control are displayed on the **Reports** tab.  
  
    -   HomeItems  
  
         Actions that are included under this control appear in the navigation pane under the **Home** button. This can only be used on **RoleCenter** page types. For more information, see [Setting Up the Home Button and Home Items](Setting-Up-the-Home-Button-and-Home-Items.md).  
  
    -   ActivityButtons  
  
         This control defines an item in the navigation pane. This can only be used on **RoleCenter** page types. For more information, see [Creating Activity Buttons for the Navigation Pane](Creating-Activity-Buttons-for-the-Navigation-Pane.md).  
  
     For example, if you want to put your action in the Actions menu, select **ActionItems**.  
  
7.  Choose in the second row, set action **Type** to **Action**. Your action is indented automatically under the **ActionContainer**. Choose the third row, and then choose the second row again. The **Name** field in this row is filled in automatically.  
  
     You can use the right and left arrow buttons in **Action Designer** to adjust indentation, and use the up and down arrow buttons to move an action in the hierarchy.  
  
    > [!NOTE]  
    >  If you insert a new row to add a new action to the list, indentation is not automatic, so always check the indentation on your actions. If it is not correct you will get an error when you compile.  
  
8.  With your action selected, choose **View**, and then choose **Properties**. Set the **RunObject** property to create an action that opens another page, for example, page **42**, **Sales Orders**.  
  
    > [!NOTE]  
    >  In Action Designer, actions can be assigned to a page by setting the RunObject property, or by adding a C/AL trigger to a code unit.  
  
9. Set the **Caption** and **CaptionML** properties to make the action visible in the **Actions** menu.  
  
10. Save and compile the page.  
  
11. To preview an action in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], in Object Designer, select the page and choose **Run**. For more information about running a page, see [How to: Run a Page](How-to--Run-a-Page.md).  
  
> [!NOTE]  
>  If the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] is already open, you will not see changes to HomeItems or ActivityButtons until to you close and restart it.  
  
> [!CAUTION]  
>  If you change an object, for example, an action to an action container, you must also change the ID of the action. The ID serves as a reference, and must reflect the object.  
  
## See Also  
 [Walkthrough: Adding Actions to a Customer List Page](Walkthrough--Adding-Actions-to-a-Customer-List-Page.md)   
 [Actions Overview](Actions-Overview.md)
