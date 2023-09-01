---
title: "Walkthrough: Creating a Role Center"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 3cf074ae-86a3-419f-ae85-ceddc8544002
caps.latest.revision: 32
---
# Walkthrough: Creating a Role Center
In this walkthrough, you will learn how to create a new Role Center for the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] or [!INCLUDE[nav_web](includes/nav_web_md.md)]. In [!INCLUDE[navnowlong](includes/navnowlong_md.md)], a Role Center is a type of page on which you can place different parts. Each part is a container in which you can host other pages or predefined parts, such as an Outlook part or parts for adding tasks, notifications, or notes.  
  
> [!IMPORTANT]  
>  Only system parts, card parts, and list parts are supported page types for the Role Center.  
  
> [!IMPORTANT]  
>  While removing cues is possible when customizing the Role Center, activity items cannot be removed.  
  
## About This Walkthrough  
 This walkthrough illustrates the following tasks:  
  
-   Creating a Role Center page.  
  
-   Creating a CardPart page that displays a visual representation of work queues.  
  
-   Adding actions to the CardPart page.  
  
-   Adding the CardPart page to the Role Center page.  
  
-   Adding the MyNotes system part to the Role Center page.  
  
### Prerequisites  
 To complete this walkthrough, you will need:  
  
-   [!INCLUDE[navnowlong](includes/navnowlong_md.md)] installed with a developer license.  
  
-   [!INCLUDE[demolong](includes/demolong_md.md)].  
  
## Story  
 Simon is a partner working for CRONUS International Ltd. Susan, the Order Processor at CRONUS, has asked Simon to create a new Role Center that will show Susan's work queue, give easy access to common actions like creating a new sales order, and will also display a list of current notifications.  
  
## Creating a Role Center Page  
 Simon creates a new Role Center using Page Designer. Simon knows that because Role Centers can contain several different parts, they are not tied to a specific source table. As a result, when creating the Role Center page, Simon does not select a table in the **New Page** window.  
  
#### To create a Role Center page  
  
1.  In the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)], on the **Tools** menu, choose **Object Designer**.  
  
2.  In Object Designer, choose **Page**, and then choose **New**. The **New Page** window opens.  
  
3.  Choose **Create blank page**, and then choose the **OK** button.  
  
     The new page opens in Page Designer.  
  
4.  On the first row, in the **Name** field, type **RoleCenterContainer**.   
    The **Type** column is preset to **Container** and the **Subtype** column is preset to **ContentArea**.  
  
5.  Select a blank row, and on the **View** menu, choose **Properties**.  
  
6.  In the **Properties** window, in the **PageType** property, set the **Value** field to **RoleCenter**.  
  
7.  Close the **Properties** window.  
  
8.  On the **File** menu, choose **Save**. Set **Name** to **Sales Order Proc. Role Center**, and set **ID** to **50005**. Choose the **OK** button.  
  
## Creating a Sales Order Processor Queue Page  
 Simon needs to create a page that provides a visual indicator of the work Susan has to do each day. Simon wants to host this page in a part on Susan's Role Center so the page needs to be created before adding it to the Role Center page. Simon has already created a table that contains the required fields, so the next step is to create the page. To create a queue, Simon must use the **CardPart** page type.  
  
#### To create a Sales Order Processor Queue page  
  
1.  In Object Designer, choose **Page**, and then choose **New**.  
  
2.  In the **Table** text box, choose the up button, select table 9053, **Sales Cue**, and then choose the **OK** button.  
  
3.  Choose **Create blank page**, and then choose **OK**.  
  
     The new page opens in Page Designer.  
  
4.  On the first row, in the **Caption** column, type **SalesOrderContainer**.   
    The **Type** column is preset to **Container** and the **Subtype** column is preset to **ContentArea**.  
  
5.  Select a blank row, and on the **View** menu, choose **Properties**.  
  
6.  In the **PageType** property, set the **Value** field to **CardPart**.  
  
7.  Close the **Properties** window.  
  
8.  In the second row, in the **Caption** column, enter **For Release**, and then set **Type** to **Group** and **SubType** to **CueGroup**.  
  
9. Choose the next empty line, and on the **View** menu, choose **Field Menu**.  
  
     The **Field Menu** window opens, displaying the list of available fields from the **SalesCue** table \(Table 9053\).  
  
10. Select the following fields:  
  
    -   **Sales Quotes - Open**  
  
    -   **Sales Orders - Open**  
  
    > [!TIP]  
    >  You can select multiple fields by holding down the Ctrl key.  
  
11. Choose the **OK** button.  
  
     A message box appears with the following message: "Do you want to add the fields that are selected in the field menu?"  
  
12. Choose **Yes**.  
  
13. On the next empty line, in the **Caption** column, enter **Sales Orders Released Not Shipped**, then set **Type** to **Group** and **SubType** to **CueGroup**.  
  
14. Select the next empty line and, on the **View** menu, choose **Field Menu**.  
  
15. Select the following fields:  
  
    -   **Ready to Ship**  
  
    -   **Delayed**  
  
    -   **Partially Shipped**  
  
16. Choose **OK** and confirm the selection.  
  
17. On the next empty line, in the **Caption** column, enter **Returns**, then set **Type** to **Group** and set **SubType** to **CueGroup**. Choose the left arrow to negative indent this line one level.  
  
18. Select the next empty line and, on the **View** menu, choose **Field Menu**.  
  
19. Select the following fields:  
  
    -   **Sales Return Orders - All**  
  
    -   **Sales Credit Memos - All**  
  
20. Choose **OK** and confirm the selection.  
  
21. On the **File** menu, choose **Save**, name your new page **Sales Order Processor Queue** and set the **ID** to **50006**. Choose the **OK** button.  
  
22. In Object Designer, select the page, and then choose **Run.**  
  
     The [!INCLUDE[rtc](includes/rtc_md.md)] opens and displays the new page.  
  
## Adding Actions to the Sales Order Queue Page  
 Simon now needs to add actions to the **Sales Order Processor Queue** page. Simon knows that the **CardPart** page type is special and actions on individual groups within the page can be included. These actions will then be displayed immediately adjacent to the queues on the page. Simon also adds code to the OnOpenPage\(\) method to ensure that the work queues update to reflect Susan's current work when the Role Center opens.  
  
#### To add actions to the Sales Order Processor Queue page  
  
1.  In Object Designer, select page 50006, **Sales Order Processor Queue**, and choose **Design**.  
  
2.  In Page Designer, choose the **For Release** group line, and on the **View** menu, choose **Control Actions**.  
  
     The Action Designer opens.  
  
3.  In Action Designer, on the first row, in the **Caption** column, enter **New Sales Quote**, and set the **Type** column to **Action**.  
  
4.  With the first row selected, on the **View** menu, choose **Properties**.  
  
5.  Set the following properties.  
  
    |Property|Value|  
    |--------------|-----------|  
    |**RunPageMode**|**Create**|  
    |**Image**|**Quote**|  
    |**RunObject**|**Page Sales Quote**|  
  
6.  Close the **Properties** window.  
  
7.  In Action Designer, on the second row, in the **Caption** column, enter **New Sales Order**, and then set the **Type** column to **Action**.  
  
8.  With the second row selected, open the **Properties** window.  
  
9. Set the following properties.  
  
    |Property|Value|  
    |--------------|-----------|  
    |**RunPageMode**|**Create**|  
    |**RunObject**|**Page Sales Order**|  
  
10. Close the **Properties** window.  
  
11. In Page Designer, choose the **Sales Orders Released Not Shipped** group line, and on the **View** menu, choose **Control Actions**.  
  
12. In Action Designer, in the first row, in the **Caption** column, enter **Navigate**, and set the **Type** column to **Action**.  
  
13. With the first row selected, open the **Properties** window.  
  
14. Set the following properties.  
  
    |Property|Value|  
    |--------------|-----------|  
    |**Image**|**Navigate**|  
    |**RunObject**|**Page Navigate**|  
  
15. Close the **Properties** window.  
  
16. In Page Designer, choose the **Returns** group line, and on the **View** menu, choose **Control Actions**.  
  
17. In Action Designer, on the first row, in the **Caption** column, enter **New Sales Return Order**, and set the **Type** column to **Action**.  
  
18. With the first row selected, open the **Properties** window.  
  
19. Set the following properties.  
  
    |Property|Value|  
    |--------------|-----------|  
    |**RunPageMode**|**Create**|  
    |**RunObject**|**Page Sales Return Order**|  
  
20. Close the **Properties** window.  
  
21. In Action Designer, in the second row in the **Caption** column, enter **New Sales Credit Memo**, and then set the **Type** column to **Action**.  
  
22. With the second row selected, open the **Properties** window.  
  
23. Set the following properties.  
  
    |Property|Value|  
    |--------------|-----------|  
    |**RunPageMode**|**Create**|  
    |**RunObject**|**Page Sales Credit Memo**|  
  
24. Close the **Properties** window.  
  
25. In Page Designer, select the first empty line, and on the **View** menu, choose **C/AL code**.  
  
26. Enter the following code in the OnOpenPage\(\) method:  
  
    ```  
    RESET;  
    IF NOT GET THEN BEGIN  
      INIT;  
      INSERT;  
    END;  
  
    SETRANGE("Date Filter",0D,WORKDATE - 1);  
    SETFILTER("Date Filter2",'>=%1',WORKDATE);  
    ```  
  
27. Save the page.  
  
28. Close the **C/AL Editor** and then close Page Designer.  
  
29. In Object Designer, choose **Run** to view the page.  
  
## Adding Parts to the Role Center Page  
 Simon now needs to add the new sales order queue page to Susan's new Role Center. Multiple groups can be created with multiple parts on the Role Center, but Simon will have to create one group that contains two parts, the **Sales Order Processer Queue** page and a notifications page.  
  
#### To add parts to the Role Center page  
  
1.  In Object Designer, select page 50005, **Sales Order Proc, Role Center**, and choose **Design**.  
  
2.  On the first row, in the **Name** column, enter **SalesOrderRoleCenterContainer**, and set the **SubType** column to **RoleCenterArea**. This replaces the value in the field.  
  
3.  In the **Name** column in the second row, enter **PartOneGroup**, set **Type** to **Group** and then set **SubType** to **Group**.  
  
4.  In the **Type** column in the third row, set **Type** to **Part**.  
  
5.  On the **View** menu, choose **Properties**.  
  
6.  In the **PagePartID** property, set the **Value** column to **50006 Sales Order Processor Queue** .  
  
7.  In the Page Designer for page 50005, in the fourth row, set the **Type** column to **Part**.  
  
8.  On the **View** menu, choose **Properties**.  
  
9. Set the following properties.  
  
    |Property|Value|  
    |--------------|-----------|  
    |**PartType**|**System**|  
    |**SystemPartID**|**MyNotes**|  
  
10. Close the **Properties** window.  
  
11. Save the page.  
  
12. In Object Designer, choose **Run** to view the page.  
  
## Next Steps  
 Simon's next steps are to add the **My Customers** and **My Items** parts to the page. For more information, see [How to: Create a CardPart Page For Displaying Customer Data in a FactBox](How-to--Create-a-CardPart-Page-For-Displaying-Customer-Data-in-a-FactBox.md).  
  
## See Also  
 [Page Designer Walkthroughs](Page-Designer-Walkthroughs.md)   
 [How to: Create a Page](How-to--Create-a-Page.md)   
 [Touring the RoleTailored Client Pages](Touring-the-RoleTailored-Client-Pages.md)   
 [How to: Run a Page](How-to--Run-a-Page.md)
