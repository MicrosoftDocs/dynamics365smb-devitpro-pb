---
title: Add FastTabs to Customer Card Page
description: FastTabs replace tabs and enable you to place data in groups on card or task pages. Learn how to add a FastTab control to a customer card page.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: b7bbaee2-e83e-46d3-95e1-ddef7e317ae8
caps.latest.revision: 20
---
# How to Add FastTabs to a Customer Card Page in Dynamics NAV
In this topic you learn how to add a FastTab control to a customer card page. FastTabs replace tabs and enable you to place data in groups on card or task pages. If a group is expanded you see all the fields in a group. If it is collapsed you just see the summary line. The summary line is the header that displays a name for the group, such as 'Communication' and can include promoted fields such as 'E-mail'. Promoting fields to the summary line enables you to present key information to the user, even if the control is collapsed.  
  
 Organizing data using FastTabs helps users to find key information quickly, while at the same time giving an overview of areas that otherwise would remain hidden. For example, the customer card page displays customer information in the following categories: General, Communication, Invoicing, Payments, Shipping, and Foreign Trade. Each category is a separate group that can be expanded or collapsed, making it easier for users to focus on one area at a time. On task pages, a FastTab typically represents a single step in a task.  
  
## Adding a FastTab Control to a Card Page  
  
#### To add a FastTab control to a card page  
  
1.  Open **Object Designer**, choose **Page**. Select a card page that you have created from the list of available pages, and then choose **Design**.  
  
     For more information about how to create card pages, see [Walkthrough: Creating a Customer Card Page in Page Designer](Walkthrough--Creating-a-Customer-Card-Page-in-Page-Designer.md).  
  
2.  In **Page Designer**, choose the first available row in your blank card page. Type a name for your control in the **Name** field. Choose the **Caption** field and the other fields are completed automatically. By default, **Type** is set to **Container** and **SubType** is set to **ContentArea**. Keep the default values.  
  
3.  In the second row, type a name for your group in the **Name** field. Set **Type** to **Group** and **SubType** to **Group**.  
  
4.  In the third row, set **Type** to **Field**.  
  
5.  On the **View** menu, choose **Field Menu**.  
  
     In the **Field Menu** window, select fields from the Customer table. Select multiple fields by holding down the CTRL key, while you choose the following fields:  
  
    -   No.  
  
    -   Name  
  
    -   Address  
  
    -   City  
  
    -   Phone No.  
  
     When you have completed this procedure, these fields will be displayed in your FastTab control.  
  
     If the **OK** and **Cancel** buttons are unavailable, see [Page Designer Troubleshooting](Page-Designer-Troubleshooting.md) for more information.  
  
    > [!NOTE]  
    >  You can only select fields from the Field Menu if your page has a source table. Remember to select a source table in the **New Page** dialog when you create your page.  
  
6.  Choose **OK**. A message box appears with the following message: "Do you want to add the fields that are selected in the field menu?" Choose **Yes**.  
  
7.  Choose on the **View** menu, choose **Properties**. In the **Properties** window, type a name in **Caption**. The **CaptionML** field is completed automatically.  
  
8.  Close the **Page Designer** window and save your changes. If you created a new page, select a page ID number in the 50000 range, type a name for your page, and then choose **OK**.  
  
     Repeat the same procedure to add more FastTab groups to your page.  
  
## See Also  
 [Walkthrough: Creating a Customer Card Page in Page Designer](Walkthrough--Creating-a-Customer-Card-Page-in-Page-Designer.md)   
 [Page Designer Troubleshooting](Page-Designer-Troubleshooting.md)
