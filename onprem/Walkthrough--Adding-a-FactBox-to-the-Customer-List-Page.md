---
title: "Walkthrough: Adding a FactBox to the Customer List Page"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 0f088e64-b1bb-4b17-8617-2b1b6ccfa000
caps.latest.revision: 23
---
# Walkthrough: Adding a FactBox to the Customer List Page
In this walkthrough, you will learn how to add a FactBox to the customer list page and use it to display credit information about the selected customer. A FactBox is an area on the page that allows you to display another page that displays targeted, related information about a selection in the main page. A FactBox can only include CardPart and ListPart page types.  
  
## About this Walkthrough  
 This walkthrough provides an overview of how to add a FactBox to another page in [!INCLUDE[navnow](includes/navnow_md.md)], and demonstrates how to:  
  
-   Create a CardPart page that includes several fields for display in a FactBox.  
  
-   Add the FactBox to the Customer List page.  
  
-   Add the CardPart page to the FactBox of the Customer List page.  
  
-   Associate the selection in the customer list with the information displayed in CardPart page in the FactBox.  
  
### Prerequisites  
 This walkthrough builds on the steps described in [Walkthrough: Creating a Customer List in Page Designer](Walkthrough--Creating-a-Customer-List-in-Page-Designer.md) and [Walkthrough: Adding Actions to a Customer List Page](Walkthrough--Adding-Actions-to-a-Customer-List-Page.md).  
  
## Story  
 Kevin reviews the Customer List page that Simon has created and has one last request. Kevin decides to display the credit limit and other relevant information for each customer when selected.  
  
## Creating a CardPart Page to Display in the FactBox  
 Simon knows that a FactBox can be used to display the type of information Kevin is asking for on the customer list page. Simon creates a new CardPart page based on the card part page type. Simon then associates the page with the **Customer** table and then adds the **Credit Limit \(LCY\)**, **Payment Terms Code**, and **Blocked** fields to the CardPart page.  
  
> [!NOTE]  
>  In this walkthrough, to learn about the properties and controls of a FactBox, you will create a CardPart page from a blank page. Object Designer also includes a wizard that you can use to create a CardPart page that sets up many properties and controls for you. For more information about the wizard, see [How to: Create a Page](How-to--Create-a-Page.md).  
  
#### To create a CardPart page to display credit information  
  
1.  In the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)], on the **Tools** menu, choose **Object Designer**.  
  
2.  In Object Designer, choose **Page**, and then choose **New**. The **New Page** window opens.  
  
3.  In the **Table** text box, choose the up arrow, select table 18, **Customer**, and then choose the **OK** button.  
  
4.  Choose **Create blank page**, and then choose the **OK** button.  
  
     The new page opens in Page Designer.  
  
5.  On the **View** menu, choose **Properties**.  
  
6.  In the **PageType** property, set the **Value** field to **CardPart**.  
  
7.  Close the **Properties** window.  
  
8.  On the first row, in the **Name** field, type **CustomerListFactBoxContainer**.   
    The **Type** is preset to **Container** and the **Subtype** is preset to **ContentArea**.  
  
9. Select the second row. On the **View** menu, choose **Field Menu**.  
  
10. Select multiple fields by holding down the Ctrl key while you choose the following fields:  
  
    -   Credit Limit \(LCY\)  
  
    -   Payment Terms Code  
  
    -   Blocked  
  
11. Choose the **OK** button.  
  
     A message box appears with the following message: "Do you want to add the fields that are selected in the field menu?"  
  
12. Choose **Yes**.  
  
13. Press Ctrl+S to save the FactBox page. The **Save As** dialog box opens.  
  
14. In the **ID** field, type **50001**, and in the **Name** field, type **Kevin's Customer List FactBox**. Choose **OK**.  
  
15. In Object Designer, select the page you just created and choose **Run** to run the page.  
  
     The [!INCLUDE[nav_windows](includes/nav_windows_md.md)] opens and displays the new FactBox page.  
  
## Adding a FactBox to the Customer List Page  
 Simon is now ready to add the FactBox to the customer list page created in [Walkthrough: Creating a Customer List in Page Designer](Walkthrough--Creating-a-Customer-List-in-Page-Designer.md). To do this, Simon first needs to open the Customer List page in Page Designer and then add the FactBox to the bottom of the Customer List page.  
  
#### To add a FactBox to the customer list page  
  
1.  In Object Designer, choose **Page**, select page 50000, **Kevin's Customer List**, and then choose **Design**.  
  
     The **Kevin's Customer List** page opens in Page Designer.  
  
2.  Select the first empty line on the page.  
  
3.  In the **Name** column, type **FactBoxArea**. Set **Type** to **Container** and set **SubType** to **FactBoxArea**.  
  
4.  Select the **FactBoxArea** line and choose the left arrow twice to negative indent this row until it is at the same level as the **CustomerListContainer**.  
  
## Adding a CardPart Page to the FactBox on the Customer List Page  
 Simon is now ready to add the CardPart page to the FactBox on the Customer List page.  
  
#### To add a CardPart to the Factbox on the customer list page  
  
1.  On the next empty row in Page Designer after the **FactBoxArea** control, set the **Type** to **Part** and the **SubType** to **Page**.  
  
2.  Select the row, and on the **View** menu, choose **Properties**.  
  
3.  In the **Properties** windows, in the **Value** column of the **PagePartID** property, choose the up arrow.  
  
4.  In the **Page List** window, select **Kevin's Customer List FactBox**\(50001\) page, and then choose the **OK** button.  
  
## Associating the CardPart Page in the FactBox with the Customer List Page  
 Simon wants the information displayed in the CardPart page to change based on the customer that is selected in the customer list. To accomplish this, Simon will associate the **No.** field of the CardPart page with the **No.** field of the Customer List page.  
  
#### To associate the CardPart page in the Factbox with the customer list page  
  
1.  In the **Properties** window of the FactBox, in the **Value** field of the **SubPageLink** property, choose the **AssistEdit** button.  
  
2.  In the **Table Filter** window, in the **Field** column of a row, choose the up arrow.  
  
     The **Field List** window opens to display all the fields in the **Customer** table of the **CardPard** page in the FactBox.  
  
3.  Select the **No.** field, and then choose the **OK** button to return to the **Table Filter** window.  
  
4.  In the **Table Filter** window, set the **Type** column to **FIELD**.  
  
5.  In the **Value**  column, choose the **AssistEdit** button.  
  
     The **Field List** window opens to display all the fields in the table of the customer page.  
  
6.  Select the **No.** field, and then choose **OK** to return to the **Table Filter** window.  
  
7.  Save the page and run the page to verify that the FactBox is displayed.  
  
## See Also  
 [Walkthrough: Creating a Customer List in Page Designer](Walkthrough--Creating-a-Customer-List-in-Page-Designer.md)   
 [Walkthrough: Adding Actions to a Customer List Page](Walkthrough--Adding-Actions-to-a-Customer-List-Page.md)   
 [How to: Create a Page](How-to--Create-a-Page.md)   
 [Touring the RoleTailored Client Pages](Touring-the-RoleTailored-Client-Pages.md)   
 [How to: Run a Page](How-to--Run-a-Page.md)
