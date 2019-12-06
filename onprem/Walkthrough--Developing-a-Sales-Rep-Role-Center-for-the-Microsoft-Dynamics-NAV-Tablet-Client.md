---
title: "Walkthrough: Developing a Sales Rep Role Center for the Microsoft Dynamics NAV Tablet Client"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 026caaad-6cfe-4486-af0a-35450c24e799
caps.latest.revision: 25
manager: edupont
---
# Walkthrough: Developing a Sales Rep Role Center for the Microsoft Dynamics NAV Tablet Client
In this walkthrough, you will learn how to create a new Role Center for the [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)]. Developing for the [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] occurs in the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)] and is not much different from developing for one of the other [!INCLUDE[navnow](includes/navnow_md.md)] clients. This walkthrough will concentrate on how to build a Role Center for a sales representative, which links to already existing page objects, but combined in a way so that it works well on the tablet.  

## About This Walkthrough  
 This walkthrough illustrates the following tasks:  

-   Creating a Role Center page.  

-   Adding existing pages to the Role Center.  

-   Adding actions to pages from the Role Center.  

-   Testing the Role Center page.  

## Prerequisites  
 To complete this walkthrough, you will need:  

-   [!INCLUDE[navnow](includes/navnow_md.md)] installed with a developer license.  

-   [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)].  

-   [!INCLUDE[demolong](includes/demolong_md.md)].  

-   A supported browser. For more information, see [System Requirements for Microsoft Dynamics NAV](System-Requirements-for-Microsoft-Dynamics-NAV.md).  

## Story  
 Simon is a partner developer working for CRONUS International Ltd. Nancy is a Sales Representative at Contoso Consulting. Simon has to build a new Role Center to support Nancy in her job. When at work, Nancy spends part of her time on the road with only her tablet available on customer visits. Nancy needs access to KPIs on the front page. She needs easy access to filter for the customers who she will visit. When at the customer site, she creates sales quotes. Simon wants to build a Role Center that can be used on a tablet and he wants to reuse as much code and as many page objects as possible.  

## Creating a Role Center Page  
 Simon starts by creating a new Role Center page using Page Designer. He starts by creating a new Role Center page, and then he will add relevant pages to the Role Center.  

### To create a Role Center Page  

1.  In the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)], on the **Tools** menu, choose **Object Designer**.  

2.  In **Object Designer**, choose **Page**, and then choose **New**. The **New Page** window opens.  

3.  Choose **Create a page using a wizard**, choose **RoleCenter**, and then choose the **OK** button.  

4.  On the first line, in the **Name** field, type **RoleCenterContainer**.  

5.  On the **File** menu, choose **Save**. Set **Name** to **Sales Rep Role Center**, and set **ID** to **50006**. Choose the **OK** button.  

## Adding Pages to the Role Center  
 Simon wants to add already existing pages to help Nancy access activities, customers, and charts to the Role Center that he just created.  

#### To add pages to the role center  

1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], choose **Object Designer**, and then choose the Role Center you created in the previous steps.  

2.  In **Page Designer**, on the first empty line, set the **Type** field to **Group**.  

3.  On the next line, set the **Type** field to **Part**, and set the **SubType** to **Page**.  

4.  On the **View** menu, choose **Properties**.  

5.  In the **PagePartID** property, use the **Page List** window to choose the **Mini Activities** page \(1310\).  

6.  In the same way add a new line of the **SubTypePage**, which points to the **My Customers** \(9150\) page in the **PagePartID** property.  

7.  On the next line, set the **Type** field to **Group**.  

8.  Then, on the next line, set the **Type** field to **Part**, and set the **SubType** to **Page**.  

9. In the **PagePartID** property, use the **Page List** window to choose the **Mini Generic Chart** page \(1390\).  

10. Add another new line of the **SubTypePage**, which points to the **Mini Trial Balance** \(1393\) page in the **PagePartID** property.  

11. Close **Page Designer**, and choose **Yes** to save and compile the **Sales Rep Role Center** page.  

## Adding Actions to the Role Center  
 With the pages in place on the content area of the Role Center, Simon now adds actions that link to other pages, which Nancy uses in her daily work on the tablet. He adds the Sales Quote as an action item available from the action pane in the **New** group, the Customer and Item lists as Home items, which, on [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] will display in the navigation pane.  

#### To add actions to the role center  

1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], choose **Object Designer**, and then choose the Role Center you created in the previous steps.  

2.  On the **View** menu, choose **Page Actions**.  

3.  In the **Type** field, choose **ActionContainer**.  

4.  In the **SubType** field, choose **ActionItems**.  

5.  On the next new line, in the **Type** field, choose **ActionGroup** and in the **Caption** property, enter **New**.  

6.  On the next line, in the **Type** field, choose **Action**.  

7.  In the **Name** property, enter **Page Mini Sales Quote**.  

8.  In the **RunObject** property, choose **Page Mini Sales Quote** \(1324\).  

9. In the **RunPageMode** property, choose **Create**.  

10. In the **Image** property, choose the **Quote** image.  

11. In the **Promoted** property, choose **Yes**.  

12. The following table shows all of the actions you should have, including the one that you created during steps 1 through 11. Create the next actions following steps 6 through 11.  

    |Type|SubType|Name|Properties|  
    |----------|-------------|----------|----------------|  
    |ActionContainer|ActionItems|\(default\)|\(default\)|  
    |ActionGroup|none|\(default\)|\* Set **Caption** to **New**|  
    |Action|none|\<Page Mini Sales Quote>|\* Set **RunPageMode** to **Create**<br /><br /> \* Set **Image** to **Quote**<br /><br /> \* Set **RunObject** to **Page Mini Sales Quote \(1324\)**<br /><br /> \* Set **Promoted** to **Yes**|  
    |ActionContainer|HomeItems|\(default\)|\(default\)|  
    |Action|none|Page Mini Customer List|\* Set **Caption** to **Customers**<br /><br /> \* Set **PromotedCategory** to **New**<br /><br /> \* Set **RunObject** to **Page Mini Customer List \(1301\)**<br /><br /> \* Set **Promoted** to **Yes**|  
    |Action|none|Page Mini Item List|\* Set **Caption** to **Items**<br /><br /> \* Set **PromotedCategory** to **New**<br /><br /> \* Set **RunObject** to **Page Mini Item List \(1303\)**<br /><br /> \* Set **Promoted** to **Yes**|  

13. Check the indentation of your page elements and adjust if it is required.  

14. Close **Action Designer** and then save and compile the **Sales Rep Role Center** page.  

 Simon now wants to test the Sales Rep Role Center that he created, and for testing purposes he uses a browser window. He enters a URL that specifically opens the page 50006 from tablet.aspx. His URL now resembles this: *https://MyNAVWeb:8080/[!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)]/tablet.aspx?page=50006*. For more information, see [How to: Open the Microsoft Dynamics NAV Tablet or Phone Client from a Browser](How-to--Open-the-Microsoft-Dynamics-NAV-Tablet-or-Phone-Client-from-a-Browser.md).  

## Next Steps  
 Nancy now has a Role Center that gives her access to most of the information that she needs when she is on the road. The next step for Simon is to refine the Sales Rep Role Center by adding more functionality, for example, the ability to retrieve more lists or making sure that Nancy can smoothly continue to work when she is back at the office on her desktop computer.  

## See Also  
 [Developing for the Microsoft Dynamics NAV Universal App](Developing-for-the-Microsoft-Dynamics-NAV-Universal-App.md)   
 [Designing for Different Screen Sizes on Tablet and Phone](Designing-for-Different-Screen-Sizes-on-Tablet-and-Phone.md)   
 [Differences and Limitations When Developing Pages for the Microsoft Dynamics NAV Universal App](Differences-and-Limitations-When-Developing-Pages-for-the-Microsoft-Dynamics-NAV-Universal-App.md)
