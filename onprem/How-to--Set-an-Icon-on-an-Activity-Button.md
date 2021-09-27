---
title: "How to: Set an Icon on an Activity Button"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 7f78321e-0493-4ac2-8bd1-500c4bf53efb
caps.latest.revision: 19
manager: edupont
---
# How to: Set an Icon on an Activity Button
The [!INCLUDE[nav_windows](includes/nav_windows_md.md)] includes images that you can use on activity buttons in the navigation pane. Images are displayed on the left side of activity buttons, as shown in the following navigation pane example.  
  
 ![Navigation pane clip that shows Activity buttons.](media/NAV_ADG_NavigationPane_ActivityButtons.jpg "NAV\_ADG\_NavigationPane\_ActivityButtons")  
  
> [!NOTE]  
>  You cannot set up an image on the page links of an activity button. All page links in the navigation pane use a default image that cannot be changed.  
  
 You set up activity buttons the page that is used as the Role Center. To complete this procedure, you must have the name or ID of the Role Center page.  
  
### To set up image on an activity button  
  
1.  To open Object Designer, in the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], on the **Tools** menu, choose **Object Designer**.  
  
2.  To open Page Designer, in Object Designer, choose **Page**, select the Role Center page, and then choose the **Design** button.  
  
3.  On the **View** menu, choose **Page Actions**.  
  
4.  In **Action Designer**, locate the action that has the **Type** set to **ActionContainer** and the **SubType** set to **ActivityButtons**.  
  
     This defines the activity button container.  
  
5.  Select the **ActionGroup** row for the activity button on which you want the image. Activity buttons are defined by the actions that have the **Type** set to **ActionGroup**.  
  
6.  On the **View** menu, choose **Properties**.  
  
7.  In the **Properties** window, in the **Value** column of the **Image** property, choose the **AssistEdit** button.  
  
8.  In the **Image List** window, select the image that you want to use for the activity button, and then choose the **OK** button.  
  
9. Close the Properties window, and save the page.  
  
> [!NOTE]  
>  If the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] is currently open, you will not see your changes until you close and restart.  
  
## See Also  
 [How to: Create an Activity Button and Page Links in the Navigation Pane](How-to--Create-an-Activity-Button-and-Page-Links-in-the-Navigation-Pane.md)