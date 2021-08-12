---
title: "Walkthrough: Creating a Cue Based on a Normal Field and a Query"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 383e5940-ab42-446a-a0d4-00c7726cd6be
caps.latest.revision: 10
manager: edupont
---
# Walkthrough: Creating a Cue Based on a Normal Field and a Query
This walkthrough demonstrates how to create a Cue that is based on a normal field that derives data from a [!INCLUDE[navnow](includes/navnow_md.md)] query object. The following figure illustrates the Sales This Month Cue that is added by this walkthrough.  

 ![Example of a Cue showing sales this month.](media/NAV_Cues_SalesThisMonth_Example.png "NAV\_Cues\_SalesThisMonth\_Example")  

> [!NOTE]  
>  This walkthrough is a continuation of [Walkthrough: Creating a Cue Based on a FlowField](Walkthrough--Creating-a-Cue-Based-on-a-FlowField.md).  

## About This Walkthrough  
 This walkthrough illustrates the following tasks:  

-   Creating a query object for calculating Cue data.  

-   Adding a field for a new Cue in an existing table, and adding C/AL code to the field to get the data from the query object.  

-   Adding a new Cue to an existing page for displaying the Cue in the [!INCLUDE[navnow](includes/navnow_md.md)] client.  

-   Formatting the data in the Cue.  

### Roles  
 This walkthrough demonstrates tasks that are performed by the following user roles:  

-   Microsoft .NET developer  

-   [!INCLUDE[navnow](includes/navnow_md.md)] developer and IT professional  

### Prerequisites  
 To complete this walkthrough, you need:  

-   Cue table **50001 Sales Invoice Cue** and page **50001 Sales Invoice Cue** page from [Walkthrough: Creating a Cue Based on a FlowField](Walkthrough--Creating-a-Cue-Based-on-a-FlowField.md).  

     This walkthrough uses these objects which you can create by using the instructions in the Walkthrough: Creating a Cue on a Role Center topic. The actual IDs and names of these objects might be different.  

-   [!INCLUDE[navnowlong](includes/navnowlong_md.md)] with a developer license.  

-   The [!INCLUDE[demolong](includes/demolong_md.md)]. This walkthrough uses the following objects:  

    -   Table 21, Cust. Ledger Entry  

    -   Page 25, Customer Ledger Entries  

## Story  
 Viktor is a software developer who is working for [!INCLUDE[demoname](includes/demoname_md.md)] He has been asked to add a Cue to the Role Centers of sales order processors that shows the total sales for the month. To accomplish this, Viktor will create a Cue that is based on a query object that extracts the total sales for the month from table **21 Cust. Ledger Entry**. The company already has a table \(**50001 Sales Invoice Cue**\) and page \(**50001 Sales Invoice Cue**\) that are used to display open sales invoices on the **Order Processor** Role Center. Viktor will add the new Cue to these objects.  

## Creating a Query for Calculating the Cue Data  
 First, Viktor creates a query object to calculate the number of open sales invoices from table 21 **Cust. Ledger Entry**.  

#### To create a query for calculating the Cue data  

1.  In the [!INCLUDE[navnowlong](includes/navnowlong_md.md)] Development Environment, on the **Tools** menu, choose **Object Designer**, choose **Query**, and then choose **New**.  

2.  In Query Designer, on the first line, set **Type** column to **DataItem**, and then set the **Data Source** column to **Cust. Ledger Entry** \(table ID 21\).  

3.  Under the **DataItem**, add a **Filter** control for the **Document Type** field and a **Filter** control for **Posting Date** field of the **Cust. Ledger Entry** table. Then, add a **Column** control for **Sales \(LYC\)** field that uses a **Totals** method type to return a sum from the table. The Query Designer will look similar to the following table.  

    |Type|Data Source|Name|Method Type|Method|  
    |----------|-----------------|----------|-----------------|------------|  
    |**DataItem**|**Cust. Ledger Entry**|**\<Cust. Ledger Entry>**|||  
    |Filter|Document Type|\<Document Type>|||  
    |Filter|Posting Date|\<Posting Date >|||  
    |Column|Sales \(LYC\)|\<Sum\_Sales\_LCY>|Totals|Sum||  

4.  Save the query as follows:  

    1.  On the **File** menu, choose **Save**.  

    2.  In the **Save As** window, in the **ID** field, enter an ID for the query object, such as **50001**. The ID must be in a valid range for your solution.  

    3.  In the **Name** field, enter **Cust. Ledg. Entry Sales Query**.  

         Select the **Compiled** check box, and then choose the **OK** button.  

##  <a name="CreateTableFieldForCue"></a> Adding the Table Field for the Cue Data  
 Viktor will add a normal field to the table **50001 Sales Invoice Cue** for holding the Cue data. He will add a global function that returns the total amount of sales invoices for the current month from the query object that he created in the previous procedure.  

#### To add a field for the Cue data  

1.  In the [!INCLUDE[navnowlong](includes/navnowlong_md.md)] Development Environment, open table **50001 Sales Invoice Cue** from Object Designer.  

2.  Add a new field for the Cue. In the **Field Name**, enter **Sales This Month** and set the **Data type** to **Decimal**.  

     This defines the **Cue** data field.  

    > [!NOTE]  
    >  By default, fields are normal fields as defined by the field's [FieldClass Property](FieldClass-Property.md).  

#### To add C/AL code to the table calculate the Cue data  

1.  On the **View** menu, choose **C/AL code** to open the C/AL code for the table.  

2.  Add a global function that is called **CalcSalesThisMonthAmount** as follows:  

    1.  On the **View** menu, choose **C/AL Globals**.  

    2.  On the **Functions** tab, in the **Name** column, enter **CalcSalesThisMonthAmount**.  

         By default, all functions are set to local functions as specified by the [Local Property](Local-Property.md), so you must change the function to be global as described in the following steps.  

    3.  Select the new function, and then in the **Tools** menu, select **Properties**.  

    4.  Set the **Local** property to **No**.  

3.  In the **C/AL Globals** window, select the new function, and then choose **Locals**.  

     The C/AL Locals window appears. From her you will add a return value and variables.  

4.  On the **Return Value** tab, set **Name** field to **Amount** and the **Return Type** field to **Decimal**.  

5.  On the **Variables** tab, add two variables as shown in the following table:  

    |Name|DataType|Subtype|  
    |----------|--------------|-------------|  
    |CustLedgerEntry|Record|Cust. Ledger Entry|  
    |CustLedgEntrySales|Query|Cust. Ledg. Entry Sales|  

6.  In C/AL code, add the following code on the **CalcSalesThisMonthAmount** function:  

    ```  

    CustLedgEntrySales.SETRANGE(Document_Type,CustLedgerEntry."Document Type"::Invoice);  
    CustLedgEntrySales.SETRANGE(Posting_Date,CALCDATE('<-CM>',WORKDATE),WORKDATE);  
    CustLedgEntrySales.OPEN;  

    IF CustLedgEntrySales.READ THEN  
      Amount := CustLedgEntrySales.Sum_Sales_LCY;  
    ```  

#### To save the table  

1.  On the **File** menu, choose **Save**.  

2.  Select the **Compiled** check box.  

3.  Choose the **OK** button.  

##  <a name="CueCardPage"></a> Adding the Cue to the Role Center Page  
 To display the Sales This Month Cue on the Role Center, Viktor adds a new field for the Cue to the existing page **50001 Sales Invoice Cue**.  

#### To add the Sales This Month Cue to a page  

1.  In Object Designer, open the page **50001 Sales Invoice Cue**.  

     To add a Cue, you add **Field** control under a **CueGroup** control. For this walkthrough, you will add the new Cue under the existing **CueGroup** control for Sales Invoices, after the **Sales Invoices - Open** field.  

2.  In a blank row under the existing **CueGroup** control, set the **Type** to **Field**, and then set the **SourceExpr** column to the **"Sales This Month"** field as follows.  

    1.  Select the row, and then on the **View** menu, choose **Field Menu**.  

         The **Field Menu** window opens and displays the list of available fields from the **Sales Invoice Cue** table.  

    2.  Select the **Sales This Month** field, and then choose the **OK** button.  

         In the **Caption** field, enter **Sales This Month**. The **Caption** value defines the text that appears below the Cue.  

         Page Designer should look similar to the following illustration.  

         ![Page Designer showing cues.](media/NAV_PageDesigner_SalesThisMonthCue_Clip.png "NAV\_PageDesigner\_SalesThisMonthCue\_Clip")  

3.  Open the C/AL code for the page, and then add the following code to the [OnAfterGetRecord Trigger](OnAfterGetRecord-Trigger.md) to assign the **Sales This month** field to the *CalcSalesThisMonthAmount* function of table **50001 Sales Invoice Cue**:  

    ```  
    "Sales This Month" := CalcSalesThisMonthAmount;  
    ```  

4.  To set up a link \(drill down\) from the Cue to page **25 Customer Ledger Entries**, do the following:  

    1.  Select the **Sales This Month** field row, and then on the **View** menu, choose **Properties**.  

    2.  In the **Properties** window, set the **DrillDownPageID** property to **Customer Ledger Entries** \(ID 25\) and choose the **OK** button.  

    3.  Close the **Properties** window.  

5.  Save and compile the page.  

 The Cue is now available on the page. To view the page, in Object Designer, select the page 50001 Sales Invoice Cue, and the choose **Run**.  

### Formatting the Cue Data  
 Viktor wants to display the amount in the Cue so that it is preceded with "kr", which indicates Danish Krone is the currency. Additionally, he does not want to display any decimal places. To achieve this, he sets the [AutoFormatType Property](AutoFormatType-Property.md) and [AutoFormatExpr Property](AutoFormatExpr-Property.md) of the Cue field on the page.  

##### To change the data format  

1.  In Page Designer, to open the properties for the Cue field, select the field, and then on the **View** menu, choose **Properties**.  

2.  In the **Properties** window, set the **AutoFormatType** property to **10**.  

     This enables you to create a custom data format.  

3.  Set the **AutoFormatExpr** property to the following text.  

    ```  
    'kr <precision,0:0><standard format,0>'  
    ```  

     `<precision,0:0>` specifies not to display any decimals places.  

     `<standard format,0>` specifies to format the data according to standard format 0.  

     For more information about the precision and standard formats, see [Formatting the Data in a Field](Formatting-the-Data-in-a-Field.md)  

4.  Close the **Properties** windows, and then save and compile the page.  

## See Also  
 [Creating and Customizing Cues](Creating-and-Customizing-Cues.md)   
 [Setting Up Colored Indicators on Cues](Setting-Up-Colored-Indicators-on-Cues.md)   
 [Touring the RoleTailored Client Pages](Touring-the-RoleTailored-Client-Pages.md)   
 [Pages Overview](Pages-Overview.md)   
 [Tables](Tables.md)   
 [Walkthrough: Creating a Role Center](Walkthrough--Creating-a-Role-Center.md)   
 [Queries](Queries.md)
