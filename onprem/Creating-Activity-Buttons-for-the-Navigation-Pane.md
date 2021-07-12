---
title: "Creating Activity Buttons for the Navigation Pane"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: b5eca4a6-e6d8-4ae1-9879-ad5d9983134a
caps.latest.revision: 16
manager: edupont
---
# Creating Activity Buttons for the Navigation Pane
An *activity button* is a navigation pane button that displays links to additional list pages in the RoleTailored client. The **Home** and **Departments** activity buttons are default activity buttons on Role Centers. You can also create activity buttons to organize links to related pages and make it quicker for users to locate pages and minimize scrolling in the navigation pane.  
  
 The following illustration shows a navigation pane that has the default activity buttons and two additional activity buttons: **Posted Documents** and **Bank**. The **Posted Documents** button is selected and shows actions that link to pages that are associated with posted documents.  
  
 ![Navigation pane clip that shows Activity buttons.](media/NAV_ADG_NavigationPane_ActivityButtons.jpg "NAV\_ADG\_NavigationPane\_ActivityButtons")  
  
 When you create an activity button, you can apply one of the default images that are available for activity buttons. For more information, see [How to: Set an Icon on an Activity Button](How-to--Set-an-Icon-on-an-Activity-Button.md).  
  
> [!NOTE]  
>  You cannot set up an image on the page links of an activity button. All page links in the navigation pane use a default image that cannot be changed.  
  
## Setting up Activity Buttons and Page Links in the Navigation Pane  
 You use Action Designer to set up activity buttons on Role Center pages. The following illustration shows the Action Designer setup for the **Posted Documents** button.  
  
 ![Action Designer that shows Activity Button setup.](media/NAV_ADG_Classic_ActionDesigner_Activity.png "NAV\_ADG\_Classic\_ActionDesigner\_Activity")  
  
 The following guidelines apply when working with activity buttons:  
  
-   Activity buttons are only valid on pages that have the type **RoleCenter**. For more information, see [Walkthrough: Creating a Role Center](Walkthrough--Creating-a-Role-Center.md).  
  
-   All activity buttons are set up under a single action of the type **ActionContainer** and the subtype **ActivityButtons**. The container's location with respect to other action containers is not significant. Activity buttons are always displayed after the **Home** button in the navigation pane.  
  
-   An activity button is defined by an action of the type **ActionGroup** that is indented once from the **ActivityButtons** row. The order of the activity buttons in the Action Designer determines the default order in the navigation pane.  
  
-   Links to individual pages are defined by actions of the type **Action** that are indented once from the **ActionGroup** row. The order of the actions in the Action Designer determines the default order in the navigation pane.  
  
## See Also  
 [How to: Create an Activity Button and Page Links in the Navigation Pane](How-to--Create-an-Activity-Button-and-Page-Links-in-the-Navigation-Pane.md)   
 [How to: Set an Icon on an Activity Button](How-to--Set-an-Icon-on-an-Activity-Button.md)   
 [Setting Up the Home Button and Home Items](Setting-Up-the-Home-Button-and-Home-Items.md)   
 [Walkthrough: Creating a Role Center](Walkthrough--Creating-a-Role-Center.md)