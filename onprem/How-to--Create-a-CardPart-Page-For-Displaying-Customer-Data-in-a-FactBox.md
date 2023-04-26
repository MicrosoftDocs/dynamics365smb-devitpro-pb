---
title: Display Customer Data in FactBox 
description: The FactBox types are page part, system part and chart part that displays additional information to the user which can be used with different page types. 
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 3b6588d1-c1ea-4239-a002-8acba0dfa12b
caps.latest.revision: 19
---
# Create CardPart Page to Display Customer Data in FactBox
A FactBox displays additional information to the user in a pane located on the right of the main page display area.  
  
 There are three types of FactBoxes:  
  
-   Page part  
  
-   System part  
  
-   Chart part  
  
 For example, on the customer list page you can see four FactBoxes: Customer Sales History - Sell-to Customer, Customer Statistics - Bill-to Customer, Links, and Notes. The first two are page parts based on existing pages. Links and Notes are system parts that are predefined. Other available system parts are Outlook, MyNotes, and Record Links.  
  
 FactBoxes can be used with the following page types:  
  
-   Card  
  
-   List  
  
-   Document  
  
-   Worksheet  
  
-   List Plus  
  
-   Navigate  
  
 If users do not want to see information displayed in a FactBox, they can collapse the control or hide it. FactBoxes can be hidden or customized to show more or fewer fields, using the customize dialogs.  
  
 A FactBox is also a page, so you must first create it in Page Designer, allocate it a source table, and then link it to a page where you want it to appear.  
  
 A business user, such as the order processor, can benefit from having additional FactBoxes on a page. For example, when the order processor uses page 22, the Customer list page, it would be useful to see information such as Outstanding Orders when different customers are selected in the list. You can do this by creating a Customer Orders FactBox that only displays specific fields from the Customer table related to outstanding customer orders.  
  
## Creating a FactBox to Display Outstanding Customer Orders  
  
#### To create a FactBox to display outstanding customer orders  
  
1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], on the **Tools** menu, choose **Object Designer**.  
  
2.  In Object Designer, choose **Page**, and then choose the **New** button. The **New Page** dialog box appears.  
  
3.  Choose **Create page using wizard**, and then choose **CardPart** from the list.  
  
4.  To associate the page with the **Customer** table, in the **Table** text box, choose the **AssistButton**, select table **18**, and then choose the **OK** button.  
  
5.  Choose the **OK** button to continue the wizard.  
  
6.  On the **Card Part Page Wizard** dialog box, use the arrow keys to move the following fields from **Available Fields** list to the **Field Order** list:  
  
    -   Outstanding Orders \(LCY\)  
  
    -   Shipped Not Invoiced \(LCY\)  
  
7.  Choose the **Finish** button.  
  
     The new page appears in Page Designer.  
  
8.  Save the page. On the **File** menu, choose **Save As**. The **Save As** dialog box appears.  
  
9. Under **ID**, enter the page ID.  
  
10. Under **Name**, enter **Customer Orders Fact Box**.  
  
11. Choose the **OK** button. Your page is saved.  
  
12. To run your page, in Object Designer, select the page, and then choose the **Run** button. The [!INCLUDE[nav_windows](includes/nav_windows_md.md)] opens and displays your new FactBox page.  
  
## See Also  
 [Walkthrough: Adding a FactBox to the Customer List Page](Walkthrough--Adding-a-FactBox-to-the-Customer-List-Page.md)   
 [Page Designer Troubleshooting](Page-Designer-Troubleshooting.md)
