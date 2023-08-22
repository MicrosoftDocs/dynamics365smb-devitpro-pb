---
title: "How to: Set an Icon on an Action"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: b734b64f-a935-4d10-8041-60b7be048147
caps.latest.revision: 17
---
# How to: Set an Icon on an Action
The [!INCLUDE[nav_windows](includes/nav_windows_md.md)] includes images that you can use on actions in command bar menus and promoted actions on the ribbon.  
  
 You add images to page actions with Action Designer. To add an image to an action, you must provide the name of the image. To view all the available action images, see [Microsoft Dynamics NAV 2013 Icon Collection](https://go.microsoft.com/fwlink/?LinkID=394623).  
  
 By default, the size of images is 16 pixels high by 16 pixels wide. For promoted actions, you can choose to display larger images that are 32 pixels high and 32 pixels wide.  
  
> [!NOTE]  
>  For information on using images on activity buttons in the navigation pane of the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], see [How to: Set an Icon on an Activity Button](How-to--Set-an-Icon-on-an-Activity-Button.md).  
  
### To add an image on an action  
  
1.  To open Object Designer, in the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], on the **Tools** menu, choose **Object Designer**.  
  
2.  To open Page Designer, in Object Designer, choose **Page**, select the page, and then choose the **Design** button.  
  
3.  On the **View** menu, choose **Page Actions**.  
  
4.  In Action Designer, select the action for which you want the image.  
  
5.  On the **View** menu, choose **Properties**.  
  
6.  In the **Properties** window, in the **Value** column of the **Image** property, choose the **AssistEdit** button  
  
7.  In the Image List window, select the image that you want to use for the action, and then choose the **OK** button.  
  
     To view the available images, see [Action Icon Library](Action-Icon-Library.md).  
  
8.  In the **Properties** window, if the action is promoted to the ribbon and you want the image to display a large icon, then set the **PromotedIsBig** property to **Yes**.  
  
9. Close the **Properties** window, and then save the page.  
  
## See Also  
 [Action Icon Library](Action-Icon-Library.md)   
 [Adding Actions to Pages](Adding-Actions-to-Pages.md)   
 [How to: Add Actions to a Page](How-to--Add-Actions-to-a-Page.md)   
 [How to: Promote Actions on Pages](How-to--Promote-Actions-on-Pages.md)
