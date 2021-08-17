---
title: "Walkthrough: Creating a Document Page"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 7c4bade0-53f7-4612-b76f-53f5d73d26d1
caps.latest.revision: 45
manager: edupont
---
# Walkthrough: Creating a Document Page
In [!INCLUDE[navnowlong](includes/navnowlong_md.md)], a document page consists of two separate pages, with one page nested inside the other page.  
  
 You can create a document page if you have two tables that are linked. For example, page 42, **Sales Order**, has two source tables: **Sales Header** and **Sales Lines**. These two tables are linked in a one-to-many relationship and are source tables for the **Sales Order** page.  
  
 The sales order document page consists of a series of FastTabs that display customer, invoicing, shipping, and other relevant information. The source table for this information is table 36, **Sales Header**. The lines that show items that are associated with each customer are based on table 37, **Sales Lines**.  
  
 The following illustration shows a document page.  
  
 ![Sales order.](media/NAV_SalesOrderPage.jpg "NAV\_SalesOrderPage")  
  
 In this walkthrough, you will create a sales order document page. This page will contain useful secondary information, such as customer statistics, in FactBoxes to the right of the main content area. The FactBox is updated every time that you select a line.  
  
## About This Walkthrough  
 This walkthrough provides an overview of how to create a sales order document page with Page Designer.  
  
 The walkthrough illustrates the following tasks:  
  
-   Creating a document page  
  
-   Adding controls to display fields from the **Sales Header** table  
  
-   Adding a Part Control to display sales lines.  
  
-   Adding a FactBox that is linked to sales lines.  
  
-   Running the page.  
  
## Story  
 Simon is a partner working for [!INCLUDE[demoname](includes/demoname_md.md)]. Susan, the order processor, asks Simon to create a sales order page that can display each of her orders and any associated lines. This page is essential to Susan’s daily work, because she uses sales orders to create and track all her customer orders from the creation of the first quote to when the order is shipped. Simon knows that this page must be based on two related source tables and that he must create a page by using the document page type.  
  
### Prerequisites  
 The following prerequisites are required for this walkthrough:  
  
-   [!INCLUDE[navnowlong](includes/navnowlong_md.md)] installed with a developer license.  
  
## Creating a Document Page  
 First, Simon creates a new document page that is based on table 36, **Sales Header**.  
  
> [!NOTE]  
>  In this walkthrough, you learn about the properties and controls of a document page, and you will create document page from a blank page. If you are using [!INCLUDE[navnowlong](includes/navnowlong_md.md)], Object Designer includes a wizard that you can use to create a document page that will set up many properties and controls for you. For more information about the wizard, see [How to: Create a Page](How-to--Create-a-Page.md).  
  
#### To create a document page  
  
1.  In the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)], on the **Tools** menu, choose **Object Designer**.  
  
2.  In **Object Designer**, choose **Page**, and then choose the **New** button. The **New Page** dialog box appears.  
  
3.  In the **Table** text box, select the table 36, **Sales Header**, and then choose the **OK** button.  
  
4.  Select **Create blank page**, and then choose the **OK** button.  
  
     The new page appears in Page Designer.  
  
5.  In the **Name** field of the first row, which has the type **Container** and the subtype **ContentArea**, enter **Susan's Sales Order Page**.  
  
6.  Select a blank row, and on the **View** menu, choose **Properties**.  
  
7.  Locate the **PageType** property, and then set the **Value** field to the page type **Document**.  
  
8.  Close the **Properties** window.  
  
9. In the next row in Page Designer, in the **Name** field, enter **General**.  
  
10. Set the **Type** property to **Group** and the **SubType** property to **Group**.  
  
11. On the **File** menu, choose **Save**. Name your new page **Susan's Sales Order Page**. Set the **ID** field to **50006** and choose the **OK** button.  
  
## Adding a Control to Display Fields from the Sales Header Table  
 Simon now wants to add fields to his document page. He creates a group named **General** and adds fields from the **Sales Header** table. He knows that the main content area on a document page displays fields as FastTabs in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)].  
  
#### To add a control to display fields from the Sales Header table  
  
1.  In **Page Designer**, select the next empty row below the **General** group and set the **Type** property to **Field**.  
  
2.  Select the row, and on the **View** menu, choose **Field Menu**. The **Field Menu** displays all the fields that are available in the **Sales Header** table.  
  
3.  Press the Ctrl key and select the following rows:  
  
    -   **Sell-to Customer No.**  
  
    -   **No.**  
  
    -   **Sell-to Customer Name**  
  
    -   **Sell-to Address**  
  
    -   **Sell-to Address 2**  
  
    -   **Sell-to City**  
  
    -   **Sell-to Contact**  
  
4.  Choose the **OK** button, and then choose **Yes** in the dialog box to add the fields to your page.  
  
    > [!NOTE]  
    >  If the **OK** and **Cancel** buttons are unavailable, see [Page Designer Troubleshooting](Page-Designer-Troubleshooting.md) for more information.  
  
5.  On the **File** menu, choose **Save**.  
  
6.  In the **Save** dialog box, make sure **Compiled** is selected, and then choose the **OK** button.  
  
## Adding a Part Control to Display Sales Lines  
 Simon's next task is to add a nested control to display lines from the **Sales Lines** table and the **Sales Order Subform** page. To do this, he must add a Part control to his page and link both objects by using the **Properties** window.  
  
#### To add a part control to display sales lines  
  
1.  In **Page Designer**, select the next empty row below the **General** group and set the **Type** property to **Part**.  
  
2.  In the **Name** field, enter **Sales Lines**. Place the cursor anywhere outside this field, and **Caption** will be filled in automatically.  
  
3.  Select the **Sales Lines** row, and on the **View** menu, choose **Properties**.  
  
     You will set the following properties to configure a link to the **Sales Lines** table and page 46, **Sales Order Subform**:  
  
    -   **PagePartID**  
  
    -   **SubPageLink**  
  
4.  Locate the **PagePartID** property, in the **Properties** window, and use the drop-down arrow next to this property to display the page list.  
  
5.  In the **Page List** window, select page 46, **Sales Order Subform**, and then choose the **OK** button.  
  
6.  Locate the **SubPageLink** property and select the drop-down arrow to open the **Table Filter** window.  
  
7.  In the first row, choose **Field** to open the **Sales Line - Field List** window. This window lets you to set a table filter on the **Sales Lines** table.  
  
8.  Select **Document No.** and then choose the **OK** button.  
  
9. In the **Type** drop-down list box, choose **FIELD**.  
  
10. In the **Value** field, select **No.**, and then choose the **OK** button.  
  
11. In the **Table Filter** window, choose the **OK** button to add this filter value to the **SubPageLink** property.  
  
12. Use the left and right arrows to indent **Sales Lines** so that it matches the **General** group element.  
  
## Adding a FactBox That Is Linked to Lines  
 Simon has already created two FactBoxes for his **Sales Order** page. He now wants to link the **Sales Line** FactBox to the **Sales Lines** table on his document page. To do this, he must change the **ProviderID** property on his FactBox part after he has added it to the page.  
  
#### To add a FactBox that is linked to lines  
  
1.  In **Page Designer**, select the next empty row.  
  
2.  Set the **Type** field to **Container**, and then set the **SubType** field to **FactBoxArea**. Accept the default values for the **Name** and **Caption** fields.  
  
3.  In the next row, enter **SalesLineFactBox** in the **Name** field, and then set the **Type** field to **Part**.  
  
4.  On the **View** menu, choose **Properties**.  
  
5.  In the **Properties** window, select the **PagePartID** property, and then choose the field. Select page **9087**, **Sales Lines FactBox**, from the **Page List** window, and then choose the **OK** button.  
  
6.  To create a link between the FactBox and **Sales Lines**, you must first find the **ID** property of the **Sales Lines** row. To do this, select the **Sales Lines** row, and view the **Properties** window. In this example, the **ID** property of the **Sales Lines** row is **10**.  
  
7.  Select the **SalesLineFactBox** and set the **ProviderID** property to **10**.  
  
    > [!NOTE]  
    >  The **ID** property of the **Sales Lines** row can vary, so check this carefully.  
  
8.  In the **SubPageLink** property, enter the following table filter.  
  
     `Document Type=FIELD(Document Type),Document No.=FIELD(Document No.),Line No.=FIELD(Line No.)`  
  
9. Close the **Properties** window.  
  
10. Check the indentation on your FactBox. Indentation of your FactBox container should match the first element in the page so that there is no indentation. Your **SalesLineFactBox** part should be indented by one space below the **FactBox** container.  
  
     The illustration shows a Page Designer.  
  
     ![](media/NAV_DocumentPageElements.png "NAV\_DocumentPageElements")  
  
11. Close Page Designer, and then choose **Yes** to save your page.  
  
## Running the Page  
 Test your new document page in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)].  
  
#### To run the page  
  
1.  In Object Designer, select **Susan’s Sales Order Page** \(50006\) and then choose the **Run** button.  
  
2.  Alternatively, you can run the page by using the task bar. On the taskbar, choose **Start**, and then choose the **Run** button.  
  
3.  Enter the following command to display your page:  
  
     **DynamicsNav:////runpage?page=\<pageid>**. In this case **pageid** is 50006  
  
     The [!INCLUDE[nav_windows](includes/nav_windows_md.md)] opens and displays the new document page.  
  
## Next Steps  
 Simon now wants to add actions to Susan's document page and promote some of these actions to the ribbon. For more information, see [How to: Promote Actions on Pages](How-to--Promote-Actions-on-Pages.md).  
  
## See Also  
 [Pages Overview](Pages-Overview.md)   
 [How to: Add Actions to a Page](How-to--Add-Actions-to-a-Page.md)   
 [How to: Promote Actions on Pages](How-to--Promote-Actions-on-Pages.md)   
 [How to: Create a Page](How-to--Create-a-Page.md)   
 [Touring the RoleTailored Client Pages](Touring-the-RoleTailored-Client-Pages.md)   
 [How to: Run a Page](How-to--Run-a-Page.md)