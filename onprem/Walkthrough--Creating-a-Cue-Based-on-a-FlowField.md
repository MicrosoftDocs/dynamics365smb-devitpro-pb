---
title: "Walkthrough: Creating a Cue Based on a FlowField"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 6fb765df-55e3-45eb-a4a3-cb3fb5bb8abc
caps.latest.revision: 32
manager: edupont
---
# Walkthrough: Creating a Cue Based on a FlowField
This walkthrough demonstrates how to add a Cue on the [!INCLUDE[rtc](includes/rtc_md.md)]. A Cue provides a way to graphically show the number of entities in a table and view the entities in a filtered list. For example, the Cue can show the total number of open invoices, sales orders, or credit memos. As shown in the following illustration, a Cue is an icon that depicts a stack of papers on the page, where the height of the stack indicates the approximate number of entities in an underlying table. A number value on each Cue gives the precise number of entities. The Cue provides a shortcut link to a filtered list page for displaying the entities. You can add actions to a Cue to open related tasks that a user of the Role Center will typically perform.  

 ![Shows a Cue in the RoleTailored client.](media/NAVRTCCueExample.png "NAVRTCCueExample")  

## About This Walkthrough  
 This walkthrough illustrates the following tasks:  

-   [Creating the Table Field for Cue Data](#CreateTableFieldForCue)  

-   [Creating a Cue on a Card Page for the Role Center](#CueCardPage)  

-   [Adding an Action to the Cue](#AddingActionToCue)  

-   [Adding the Cue CardPart Page on the Role Center Page](#AddingCuePartToRoleCenter)  

### Roles  
 This walkthrough demonstrates tasks that are performed by the following user roles:  

-   Microsoft .NET developer  

-   [!INCLUDE[navnow](includes/navnow_md.md)] developer and IT professional  

### Prerequisites  
 To complete this walkthrough, you need:  

-   [!INCLUDE[navnowlong](includes/navnowlong_md.md)] with a developer license.  

-   All [!INCLUDE[navnowlong](includes/navnowlong_md.md)] requirements met. For more information, see [System Requirements for Microsoft Dynamics NAV](System-Requirements-for-Microsoft-Dynamics-NAV.md).  

-   The [!INCLUDE[demolong](includes/demolong_md.md)]. The walkthrough uses the following objects:  

    -   Table 36, Sales Header  

    -   Page 9006, Order Processer Role Center  

    -   Page 9301, Sales Invoice List  

    -   Page 43, Sales Invoice  

## Story  
 Viktor is a software developer who is working for [!INCLUDE[demoname](includes/demoname_md.md)] He has been asked to add a Cue to the Role Centers of sales order processors. The Cue will show how many open sales invoices they have. To accomplish this, Viktor will create a Cue that extracts the number of open sales invoices from the **Sales Header** table. He will place the Cue in a part on the **Order Processor Role Center** page. He will also add an action that allows users to create a new sales invoice from a link on the Cue. The Cue will look similar to the illustration earlier in this document.  

##  <a name="CreateTableFieldForCue"></a> Creating the Table Field for Cue Data  
 To calculate the number of open sales invoices, Viktor creates a table that includes a **FlowField** that extracts data from the **Sales Header** table and calculates how many opens sales invoices exist. Because a table must have at least one data field, and a **FlowField** is based on a calculation and not considered an actual data field, Viktor adds a dummy primary key field that does not yield any data. For more information about **FlowFields**, see [FlowFields](FlowFields.md).  

#### To create a table for the Cue data field and set the primary key  

1.  In the [!INCLUDE[navnowlong](includes/navnowlong_md.md)] Development Environment, on the **Tools** menu, choose **Object Designer**.  

2.  Choose **Table**, and then choose **New**.  

3.  In the first empty row, in the **Field Name** column, enter **Primary Key** and set the **Data type** to **Code**.  

4.  To set the primary key, select an empty row, and then on the **View** menu, choose **Keys**.  

5.  In the **Keys** window, select the first line, and then in the **Key** column, select the **AssistEdit** button.  

6.  In the **Field List** window, select the first row, and then choose the up arrow.  

7.  Select the **Primary Key** field, and then choose **OK** until you return to the **Keys** window.  

8.  Close the **Keys** window to return to Table Designer.  

#### To add the Cue data field as a FlowField with filters  

1.  In Table Designer, in the next empty row, in **Field Name**, enter **Sales Invoices - Open** and set the **Data type** to **Integer**.  

     This defines the **Cue** data field.  

2.  Select the **Sales Invoices - Open** field row, and then on the **View** menu, choose **Properties**.  

3.  In the **Properties** window, set the **FieldClass** property to **FlowField**.  

4.  In the **CalcFormula** property, choose the **AssistEdit** button to open the **Calculation Formula** window.  

5.  In the **Calculation Formula** window, set the **Method** field to **Count** and the **Table** field to **Sales Header**.  

6.  In the **Table Filter** field, choose the **AssistEdit** button to open the **Table Filter** window.  

7.  In the first line of the **Table Filter** window, choose the up arrow.  

8.  In the **Sales Header - Field List** window, select **Document Type**, and then choose **OK** to return to the **Table Filter** window.  

9. In the **Document Type** row, set the **Type** column to **FILTER** and enter **Invoice** in the **Value** column. This filters the **Sales Header** table on sales invoices.  

10. On the next empty row, and in the **Field** column, choose the up arrow.  

11. In the **Sales Header - Field List** window, select **Status**, and then choose the **OK** button to return to the **Table Filter** window  

12. In the **Status** row, set the **Type** column to **FILTER** and enter **Open** in the **Value** column. This filters the **Sales Header** table on open sales invoices.  

     The **Table Filters** window will look similar to the following illustration.  

     ![Shows the table filter setup for a Cue.](media/NAVRTCCueTableFilterExample.PNG "NAVRTCCueTableFilterExample")  

    > [!IMPORTANT]  
    >  You cannot define a table filter that filters explicitly on a date because you will get an error when you try to open the Cue group in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. For example, you cannot define a field that has the **Type** set to **CONST** or **FILTER** and the **Value** set to 21/03/2011. If you do, when you try to open the Cue group from the page in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], you get an error that states that ‘2011-03-21’ is not a valid date.  

13. Choose the **OK** button until you return to the **Properties** window, and then close the **Properties** window to return to Table Designer.  

#### To save the table  

1.  On the **File** menu, choose **Save**.  

2.  In the **ID** field, enter a number that will serve as a unique table identifier. For example, you can enter **50001**.  

    > [!NOTE]  
    >  There are restrictions about which numbers you can use. Contact your Microsoft Certified Partner for information.  

3.  In the **Name** field, enter **Sales Invoice Cue**.  

4.  Select the **Compiled** check box.  

5.  Choose the **OK** button.  

##  <a name="CueCardPage"></a> Creating a Cue on a Card Page for the Role Center  
 To display the Sales Invoices - Open Cue on the Role Center, Viktor creates a CardPart page type that has a **CueGroup** control that includes the **Sales Invoices – Open** field of the **Sales Cue** table. Viktor also needs to initialize the data field on the Cue with a record, so he adds code to the OnOpenPage trigger of the CardPart page type.  

> [!IMPORTANT]  
>  The **CaptionClass** property on a field in a **CueGroup** is not supported.  

> [!WARNING]  
>  While removing cues is possible when customizing the Role Center, activity items cannot be removed.  

#### To create the CardPart page for the Sales Invoice Cue  

1.  In the [!INCLUDE[navnow](includes/navnow_md.md)] development environment, on the **Tools** menu, choose **Object Designer**.  

2.  In Object Designer, choose **Page**, and then choose **New**. The **New Page** window opens.  

3.  In the **Table** text box, choose the up arrow to open the **Table List** window.  

4.  Select the **Sales Cue** table that you created in the previous procedure, and then choose the **OK** button.  

5.  Choose **Create blank page**, and then choose **OK**.  

     The new page opens in Page Designer.  

6.  In the **Caption** field of the first row, which has the **Type** set to **Container** and the **Subtype** set to **ContentArea**, enter **SalesCueContainer**.  

7.  Select a blank row, and then on the **View** menu, choose **Properties**.  

8.  Locate the **PageType** property, and then set the field to **CardPart**.  

9. Close the **Properties** window to return to Page Designer.  

#### To add the Sales Cue on the CardPart page  

1.  In the row following the **ContentArea** row, set **Type** to **Group** and set **SubType** to **CueGroup**.  

     In the **Caption** column, enter **Sales Invoices**. The **Caption** value defines the heading for the Cue that appears on the Role Center.  

2.  On the next row, set the **Type** column to **Field**.  

3.  With the row selected, on the **View** menu, choose **Field Menu**.  

     The **Field Menu** window opens and displays the list of available fields from the **Sales Invoice Cue** table.  

4.  Select the **Sales Invoices – Open** field, and then choose the **OK** button.  

     In the **Caption** column, enter **Open**. The **Caption** value defines the text that appears below the Cue.  

     Page Designer should look similar to the following illustration.  

     ![Shows Page Designer setup for a Cue.](media/NAVRTCCuePageDesignerExample.png "NAVRTCCuePageDesignerExample")  

5.  To create a link from the Cue to the **Sales Invoice List** page for displaying the open invoices, select the **Sales Invoices - Open** field row, and then on the **View** menu, choose **Properties**.  

6.  In the **Properties** window, set the **DrillDownPageID** property to **Sales Invoice List** \(9301\) and choose the **OK** button.  

7.  Close the **Properties** window.  

8.  To initialize the Cue with a record when the page opens, you must add code to the page's OnOpenPage trigger. In Page Designer, select an empty row, and then on the **View** menu, choose **C/AL Code**.  

9. In the **C/AL Editor**, add the following code in the OnOpenPage trigger:  

    ```  
    RESET;  
    IF NOT GET THEN BEGIN  
      INIT;  
      INSERT;  
    END;  
    ```  

10. Close the **C/AL Editor**.  

#### To save the Sales Invoice Cue CardPart page  

1.  On the **File** menu, choose **Save**.  

2.  In the **ID** field, enter a number that will serve as a unique page identifier. For example, you can enter **50001** for the **ID**.  

    > [!NOTE]  
    >  There are restrictions about which numbers you can use. Contact your Microsoft Certified Partner for information.  

3.  In the **Name** field, enter **Sales Invoice Cue**.  

4.  Select the **Compiled** check box.  

5.  Choose the **OK** button.  

6.  In Object Designer, select the page 50001, **Sales Cue**, and choose **Run** to view the page.  

7.  The [!INCLUDE[nav_windows](includes/nav_windows_md.md)] opens and displays the new page.  

##  <a name="AddingActionToCue"></a> Adding an Action to the Cue  
 Viktor wants to add a link on the Cue that allows the user to create a new sales invoice. To accomplish this, he creates an action on the **CueGroup** control that targets the **Sales Invoice** page.  

#### To add actions to the Sales Order Cue page  

1.  In Object Designer, select the **Sales Cue** page, and choose the **Design** button.  

     Select the row that contains the **CueGroup** control **Sales** that contains the **Sales Invoices - Open** Cue field.  

2.  On the **View** menu, choose **Control Actions**.  

3.  In the first row of Cue Group Action Designer, in the **Caption** column, enter **New Sales Invoice** and set the **Type** column to **Action**.  

4.  With the first row selected, on the **View** menu, choose **Properties.**  

5.  In the **Properties** window, set the values for the following properties:  

    -   Set the **RunPageMode** property to **Create**.  

    -   Set the **RunObject** property to page 43, **Page Sales Invoice**.  

6.  Close the **Properties** window, and then close Action Designer.  

7.  Save the page.  

##  <a name="AddingCuePartToRoleCenter"></a> Adding the Cue CardPart Page on the Role Center Page  
 To display the Sales Invoice Cue on the Role Center, Viktor must add the **Sales Invoice Cue** CardPart page to the **Role Center** page for sales order processors. To do this, he adds a part to the **Order Processor Role Center** page that targets the new **Sales Invoice Cue** page.  

#### To add the Sales Cue part page to the Role Center page  

1.  In Object Designer, choose **Page** to display the list of pages.  

2.  Locate page 9006, Order Processor Role Center, and then choose **Design**.  

3.  In Page Designer, locate the **Group** control in which you want to include the **Sales Cue** page. For example, you can place the **Sales Cue** page above the **\<Connect Online>** part.  

4.  In Page Designer, select the **\<Connect Online>** part row, and on the shortcut menu, choose **New** to insert a new row in the group. This will place the **Sales Cue** part above the **\<Connect Online>** part.  

5.  In the new row, set the **Type** column to **Part**.  

6.  On the **View** menu, choose **Properties**.  

7.  Set the **PartType** property to **Page**.  

8.  In the **PagePartID** property, set the **Value** column to page 50009, Sales Invoice Cue.  

     The **Sales Cue** page is the **CardPart** page that you created earlier in this walkthrough.  

9. Choose the **OK** button, and close the **Properties** window.  

10. On the **File** menu, choose **Save** to save the page.  

11. In Object Designer, with the **Order Processor Role Center** page selected, choose **Run**. Notice that the **Sales Invoice Cue** part is displayed in the **Role Center - Order Processor Role Center** column and above the **Connect Online** part.  

## See Also  
 [Touring the RoleTailored Client Pages](Touring-the-RoleTailored-Client-Pages.md)   
 [Pages Overview](Pages-Overview.md)   
 [Tables](Tables.md)   
 [Walkthrough: Creating a Role Center](Walkthrough--Creating-a-Role-Center.md)
