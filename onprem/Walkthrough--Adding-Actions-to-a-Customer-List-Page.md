---
title: "Walkthrough: Adding Actions to a Customer List Page"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 01fb2663-089f-4c1b-9a47-98de81140426
caps.latest.revision: 24
manager: edupont
---
# Walkthrough: Adding Actions to a Customer List Page
In this walkthrough, you will learn how to add a new item to an **Action** tab and then display that item as an icon on the ribbon. The ribbon is located at the top of most pages and is used to provide users with easy access to common or important actions. Action tab items are referred to as *actions*. Actions that are displayed on the ribbon are referred to as *promoted actions*.  
  
## About this Walkthrough  
 This walkthrough provides an overview of how to create and run a simple list page in [!INCLUDE[navnow](includes/navnow_md.md)], and demonstrates how to:  
  
-   Add an action to the customer list page to create a new sales order.  
  
-   Display the Sales Order action on the **Actions** tab.  
  
-   Promote the Sales Order action so it is displayed in the ribbon.  
  
-   Modify the Sales Order action so it creates a new sales order for the customer currently selected in the customer list.  
  
### Prerequisites  
 This walkthrough builds on the steps described in [Walkthrough: Creating a Customer List in Page Designer](Walkthrough--Creating-a-Customer-List-in-Page-Designer.md). If you have not created a customer list page, you must create it before you continue this walkthrough.  
  
## Story  
 Simon shows the customer list page that he created to Kevin, the Sales Manager at CRONUS International Ltd. who contracted him to create this page. Kevin likes how the customer list looks, but he would like Simon to add a menu item on the **Actions** tab to create a new sales order for the currently selected customer.  
  
## Adding an Action to the Customer List  
 Simon looks at the customer list that he created earlier and adds a new action to the page to create a sales order.  
  
#### To add an action to the customer list page  
  
1.  In the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)], choose **Tools**, and then choose **Object Designer**.  
  
2.  In Object Designer, choose **Page**, select page 5000 **Kevin's Customer List**, and then choose **Design**.  
  
     The **Kevin's Customer List** page opens in Page Designer.  
  
3.  Select the first empty line on the page, which is located immediately below the **\<Phone No.>** field.  
  
4.  With focus on Page Designer, in the **View** menu, choose **Page Actions**.  
  
     Action Designer opens. For this walkthrough, Action Designer will be used to set actions on the page.  
  
5.  In Action Designer, in the **Name** column in the first row, type **CustomerListActions**.  
  
     The relevant ActionContainers for a list page are:  
  
    -   NewDocumentItems  
  
    -   ActionItems  
  
    -   RelatedInformation  
  
    -   Reports  
  
    -   HomeItems  
  
    -   ActivityButtons  
  
     For more information about the different types of actions, see [Actions Overview](Actions-Overview.md).  
  
6.  Set the **SubType** column to **ActionItems**.  
  
     Actions with a **SubType** of **ActionItems** are displayed on the **General** action group in the ribbon.  
  
7.  In the **Caption** column in the second row, type **Sales Order**.  
  
8.  Set the **Type** to **Action**.  
  
9. This action is indented one level below the **ActionContainer** to indicate that it is contained by **ActionContainer**.  
  
10. On the **View** menu, select Properties.  
  
11. Set the **RunObject** property to **Page Sales Order**.  
  
12. Save the page.  
  
13. To run the page, in Page Designer, select the page 5000 **Kevin's Customer List**, and then choose the **Run** button.  
  
     The Sales Order action now displays in the **Actions** tab.  
  
## Promoting an Action  
 When Simon opens the page, he realizes that he would like to promote the Sales Order action so that it displays on the ribbon in the **New** group. Promoted actions are displayed as icons within the ribbon located at the top of the page.  
  
#### To promote an action  
  
1.  With the first empty line selected in Page Designer, open Action Designer.  
  
2.  Select the Sales Order action and, on the **View** menu, choose **Properties**.  
  
3.  Set the **Image** property to **Document**.  
  
4.  Set the **Promoted** property to **Yes**.  
  
5.  Set **PromotedCategory** property to **New**.  
  
6.  Set **PromotedIsBig** property to **Yes**.  
  
7.  Set the **Caption** property to **Sales Order**.  
  
8.  Save the page.  
  
9. In Object Designer, choose the **Run** button to run the page.  
  
     The Sales Order command is now displayed in the ribbon, as shown in the following screen shot.  
  
     ![Kevin's Customer List page.](media/MicrosoftDynamicsNAVKevinsCustomerList.jpg "MicrosoftDynamicsNAVKevinsCustomerList")  
  
## Linking an Action with a Specific Item in a List  
 Simon verifies that the Sales Order action now displays in the ribbon. However, when he selects the Sales Order action, the Sales Order card opens and displays the first sales order in the database. Simon remembers that Kevin asked him to have the Sales Order action open a new sales order for the currently selected customer, instead. Simon opens the customer list page and starts making this change.  
  
#### To add an action  
  
1.  In Action Designer, select the Sales Order action from the **View** menu, and then choose **Properties** to view the **Properties** window.  
  
2.  Set the **RunPageMode** property to **Create**.  
  
     The default value for this property is **Edit**. By setting this property to a value of **Create**, a sales order page will open in create mode, enabling the end user to create a new sales order.  
  
3.  Set the **RunPageLink** property value to **Sell-to Customer No.=FIELD\(No.\)** using the following steps:  
  
    1.  In the **RunPageLink** property value, choose the Assist-Edit button \(ellipsis\).  
  
         The **Table Filter** window appears.  
  
    2.  In the **Field** cell, choose the AssistButton button, choose **Sell-to Customer No.**, and then choose **OK**.  
  
    3.  In the **Type** cell, choose the drop-down list box and then select **FIELD**.  
  
    4.  In the **Value** cell, choose the AssistButton button, thenselect **No.**, and then choose **OK**.  
  
    5.  Choose the **OK** button.  
  
         The customer number in the customer list is now linked to the Sell-to Customer number in the sales order. This means that when the Sales Order action is chosen, a new sales order will be created for the customer that is currently selected in the customer list.  
  
4.  Save the page.  
  
5.  In **Object Designer**, choose the **Run** button to run the page.  
  
     To test the new functionality, select a customer from the list and then choose the Sales Order action. A new sales order appears.  
  
6.  Press the Tab key twice, or choose any field on the page for customer information to populate the fields.  
  
## Next Steps  
 Next, Simon will add a FactBox to the customer list page. Simon will use this FactBox to display additional information about the currently selected customer in the list.  
  
## See Also  
 [Walkthrough: Adding a FactBox to the Customer List Page](Walkthrough--Adding-a-FactBox-to-the-Customer-List-Page.md)   
 [Walkthrough: Creating a Customer List in Page Designer](Walkthrough--Creating-a-Customer-List-in-Page-Designer.md)