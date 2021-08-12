---
title: "How to: Define Promoted Action Categories Captions for the Ribbon"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: d8cd18ba-702c-47aa-a52e-260799937fe2
caps.latest.revision: 18
manager: edupont
---
# How to: Define Promoted Action Categories Captions for the Ribbon
*Promoted actions* are actions that are displayed in the ribbon of the [!INCLUDE[rtc](includes/rtc_md.md)]. You can organize promoted actions into different categories, where each category is indicated by a caption in the ribbon. You define up to 10 categories for a page. The following figure illustrates a page that has promoted actions under the following categories:  
  
-   **New**  
  
-   **Manage**  
  
-   **Process**  
  
-   **Report**  
  
 The following illustration shows the Ribbon with promoted actions under categories.  
  
 ![Action Pane with four categories.](media/NAV_RTC_ActionPane_CustomCategories.png "NAV\_RTC\_ActionPane\_CustomCategories")  
  
 You assign a promoted action to a category by setting the **PromotedCategory** property of the action. You can choose among the following categories:  
  
-   New  
  
-   Process  
  
-   Report  
  
-   Category4  
  
-   Category5  
  
-   Category6  
  
-   Category7  
  
-   Category8  
  
-   Category9  
  
-   Category10  
  
 By default, these category names correspond to the captions that are displayed for the category on the page in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. You will typically want to change these captions, especially the Category4 through Category10 captions.  
  
 You change category captions on a page-by-page basis and for each [!INCLUDE[nav_windows](includes/nav_windows_md.md)] language.  
  
### To define promoted action category captions  
  
1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], on the **Tools** menu, choose **Object Designer**.  
  
2.  In Object Designer, choose **Page**, select the page, and then choose **Design**.  
  
3.  In Page Designer, select a blank row, and then in the **View** menu, choose **Properties**.  
  
4.  In the **Page - Properties** window, locate the **PromotedActionsCategoriesML** property, choose the **Value** field, and then choose the **AssistButton** to open the **Multilanguage Editor**.  
  
5.  In the **Multilanguage Editor**, set the **Language** field to the language version of the categories that you want to define.  
  
6.  In the **Value** field for the language, type the category captions as follows:  
  
     *New\_caption*,*Process\_caption*,*Reports\_caption*,*Category4\_caption*,*Category5\_caption*,*Category6\_caption*,*Category7\_caption*,*Category8\_caption*,*Category9\_caption*,*Category10\_caption*  
  
     Substitute the italic text with the text that you want for each caption. Separate each caption with a comma. The position of the caption in the list determines its corresponding category setting in the **PromotedCategory** property for actions, as shown in the following table:  
  
    |**PromotedActionsCategoriesML** caption position|**PromotedCategory** property value|  
    |------------------------------------------------------|-----------------------------------------|  
    |First|New|  
    |Second|Process|  
    |Third|Reports|  
    |Fourth|Category4|  
    |Fifth|Category5|  
    |Sixth|Category6|  
    |Seventh|Category7|  
    |Eighth|Category8|  
    |Ninth|Category9|  
    |Tenth|Category10|  
  
     For example, to define the captions for the figure at the beginning of this topic, you enter the following text:  
  
     **New,Manage,Process,Report**  
  
     Then, to assign a promoted action to the caption **Tasks**, in the Action Designer, set the **PromotedCategory** property value for the action to **Process**.  
  
    > [!NOTE]  
    >  You only need to define captions for the number of categories that you want to use on a page. You do not need to define captions for all 10 categrories.  
  
7.  Close the page properties and save the page.  
  
## See Also  
 [How to: Promote Actions on Pages](How-to--Promote-Actions-on-Pages.md)   
 [Actions Overview](Actions-Overview.md)   
 [How to: Add Actions to a Page](How-to--Add-Actions-to-a-Page.md)   
 [How to: Set an Icon on an Action](How-to--Set-an-Icon-on-an-Action.md)