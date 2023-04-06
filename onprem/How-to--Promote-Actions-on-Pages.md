---
title: "How to: Promote Actions on Pages"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: dbea328b-8093-4ce6-ba89-71e79b647370
caps.latest.revision: 23
---
# How to: Promote Actions on Pages
Actions that appear in the **Home** tab of the ribbon are called *promoted actions*. Promoted actions are copies of existing actions that are defined in the other tabs, such as **Actions**, **Navigate**, and **Reports**. Promoted actions provide quick access to common tasks, because a page always opens on the Home tab so users do not have to look through other tabs to find them. For example, on the **Customer Card** page, you can promote an action to create a new sales order to help the salespeople do their work, because creating sales orders is one of their most important daily tasks.  
  
 When promoting actions, you have the following options:  
  
-   Organize promoted actions under different categories. For example, the categories can be **New**, **Tasks**, **Reports**, and **Discounts**. The order of actions under a category is determined by its order in the Action Designer.  You define the caption for each category. For more information on defining the promoted categories, see [How to: Define Promoted Action Categories Captions for the Ribbon](How-to--Define-Promoted-Action-Categories-Captions-for-the-Ribbon.md).  
  
-   Set up an image that displays with the action. If you do not set up an image yourself, then a default image is used. For more information about promoted action images, see [How to: Set an Icon on an Action](How-to--Set-an-Icon-on-an-Action.md).  
  
-   Specify that the promoted action only appears on the **Home** tab, not on the tab where it is defined.  
  
 If there are no promoted actions, then the **Home** tab is hidden.  
  
> [!IMPORTANT]  
>  In the Dynamics NAV Universal App, only promoted actions are displayed. For more information, see [Differences and Limitations When Developing Pages for the Microsoft Dynamics NAV Universal App](Differences-and-Limitations-When-Developing-Pages-for-the-Microsoft-Dynamics-NAV-Universal-App.md).  
  
## Adding a Promoted Action to a Page  
  
#### To add a promoted action to a page  
  
1.  In the Development Environment, on the **Tools** menu, choose **Object Designer**.  
  
2.  In Object Designer, select a page that already has actions, and then choose **Design** to open the page in **Page Designer**. For example, select page 22, which is the **Customer List** page.  
  
3.  To open Action Designer, in the **View** menu, choose **Page Actions**.  
  
4.  In Action Designer, select the action to promote.  
  
5.  In the **View** menu, choose **Properties**.  
  
6.  In the **Properties** window, set the **Promoted** property value to **Yes**.  
  
7.  To display the action on the **Home** tab only, set the **Promoted** property value to **Yes**.  
  
8.  Set the **PromotedCategory** property to the category under which you want the promoted action to appear.  
  
     Unless you define your own caption, the category name that you select will be used as the category's captions on the page. For more information, see [How to: Define Promoted Action Categories Captions for the Ribbon](How-to--Define-Promoted-Action-Categories-Captions-for-the-Ribbon.md).  
  
9. To assign an image to the action, set the **Image** property to the name of the image. For a list of images, see [Action Icon Library](Action-Icon-Library.md).  
  
    > [!NOTE]  
    >  To associate a larger icon with your action, set the **PromotedIsBig** property.  
  
10. Close the **Properties** window and exit **Page Designer**.  
  
11. Save and compile the page.  
  
12. To preview your promoted action, in **Object Designer**, select the page, and then choose **Run**.  
  
###  <a name="CategoryLocation"></a> Promoted Action Category Location in the Ribbon  
 The locations of promoted action categories in the ribbon are determined by their first instance in Action Designer. Starting from top of Action Designer and working down, the category of the first promoted action encountered is located on the far left of the ribbon; the next category encountered is located to the right of the first category, and so on.  
  
### Customizing the Ribbon  
 When customizing the ribbon from the **Customize Ribbon** window, some actions may not have the sizing button labeled **Default Icon Size** available. The **Default Icon Size** button has the options of displaying an action icon as default size, small, or large. The label of the button changes when small or large is selected. In some cases the action can be a promoted action with the property **PromotedIsBig** set to **Yes** in the Development Environment. If you set an action to **PromotedIsBig**, this overrules the choices in the **Customize Ribbon** window.  
  
## See Also  
 [Actions Overview](Actions-Overview.md)   
 [How to: Add Actions to a Page](How-to--Add-Actions-to-a-Page.md)   
 [How to: Define Promoted Action Categories Captions for the Ribbon](How-to--Define-Promoted-Action-Categories-Captions-for-the-Ribbon.md)
