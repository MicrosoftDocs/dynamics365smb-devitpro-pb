---
title: "Walkthrough: Designing a Report from Multiple Tables"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 60f0c302-d4b9-410b-b44c-0a6ca0a9e123
caps.latest.revision: 21
manager: edupont
---
# Walkthrough: Designing a Report from Multiple Tables
A report object is composed of a report dataset and a visual layout. You design a report by first defining the dataset and then designing the visual layout. You design the dataset for reports in Microsoft Dynamics NAV Report Dataset Designer and design the layout in Visual Studio Report Designer. After you design a report, you can make it available to applications that are running on the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. A report can be designed from one table or multiple tables. This walkthrough demonstrates how to design a report from multiple tables.  

## About This Walkthrough  
 This walkthrough shows you how to design a report by using Report Dataset Designer and Visual Studio Report Designer.  

 This walkthrough illustrates the following tasks:  

-   Defining the dataset for multiple tables.  

-   Defining properties for the data items.  

-   Adding fields to a data item.  

-   Adding labels to a report.  

-   Design a client report definition \(RDLC\) report layout in Visual Studio 2012.  

-   Setting filters to hide empty rows and fields in a report.  

-   Building and running a report.  

### Prerequisites  
 To complete this walkthrough, you will need:  

-   [!INCLUDE[navnowlong](includes/navnowlong_md.md)] installed with a developer license.  

-   The [!INCLUDE[demolong](includes/demolong_md.md)] installed.  

-   Microsoft Visual Studio installed. For more information about which version of Microsoft Visual Studio you need, see [System Requirements for Microsoft Dynamics NAV](System-Requirements-for-Microsoft-Dynamics-NAV.md). This walkthrough assumes that Microsoft Visual Studio 2012 or Microsoft Visual Studio 2013 is used.  

## Story  
 Viktor is a developer who is working for [!INCLUDE[demoname](includes/demoname_md.md)] Viktor has been asked by his manager to create a report that shows data from the Customer \(18\), Cust. Ledger Entry \(21\), Detailed Cust. Ledger Entry \(379\), and the Sales Header \(36\) tables. The report should meet the following requirements:  

-   The report should display customer information at the top of the report.  

-   For each customer, the report should show a list of ledger entries.  

-   For each ledger entry, the report should show a list of detailed ledger entries under the ledger entries.  

-   The report should display basic sales document headers information for the selected customer.  

-   Each section of the data for each customer should begin on a new page.  

-   The **Amount** field from the **Cust. Ledger Entry** table should be totaled and displayed for each customer.  

-   If there are no records to display, the report should not display that data sections. For example, if there are no sales documents for a customer, the sale header section should be skipped.  

-   Amount fields must not display zero values.  

-   The orientation of the report should be landscape.  

     The following illustration shows an example of the second page of the report.  

     ![Completed report.](media/MicrosoftDynamicsNAV_MultiDataSetReport.jpg "MicrosoftDynamicsNAV\_MultiDataSetReport")  

## Defining the Dataset  
 In this task, Viktor will create the dataset that will display customers and their transaction details. The datasets for the data model will come from four tables. Viktor will create a data item for each for table.  

#### To define the dataset  

1.  In the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)], on the main menu, choose **Tools**, and then choose **Object Designer**.  

2.  In Object Designer, choose **Report**, and then choose **New** to open Report Dataset Designer.  

3.  In Report Dataset Designer, select the first row, in the **Data Type** field verify that **DataItem** is selected. In the **Data Source** field, choose the up arrow, select the **Customer** table \(18\), and then choose the **OK** button.  

4.  On the next row, in the **Data Type** field, choose **DataItem**, in the **Data Source** field choose the **AssistEdit** button, select **Cust. Ledger Entry** \(21\) table from the **Table List** window, and then choose the **OK** button. This row is automatically indented under the first row. This means that for each customer record, all the records in the Customer Ledger Entries table will be displayed.  

5.  On the next row, in the **Data Type** field, choose **DataItem**, in the **Data Source** field, choose the **AssistEdit** button, select the **Detailed Cust. Ledg. Entry** \(379\) table, and then choose the **OK** button. Note that this row is automatically indented under the second row.  

6.  On the next row, in the **Data Type** field, select **DataItem**, in the **Data Source** field, choose the **AssistEdit** button, select the **Sales Header** \(36\) table, and then choose the **OK** button.  

7.  Use the left arrow to indent the row two times to the left so that the row is at the same level as **Cust. Ledger Entry** \(21\) data item.  

     The following illustration shows an example of the Report Dataset Designer after you have added the data items.  

     ![The DataItems in Object Designer.](media/MicrosoftDynamicsNAV_DataItems.jpg "MicrosoftDynamicsNAV\_DataItems")  

## Defining Properties for the Data Items  
 Now that the data set is defined, Viktor will define the properties of data items.  

#### To define properties for the data items  

1.  Select the **Customer** data item, and then on the **View** menu, choose **Properties**.  

2.  In the **Properties** window, locate the [DataItemTableView Property](DataItemTableView-Property.md), and then choose the **AssistEdit** button in the **Value** field to open the **Table View** window.  

3.  In the **Key** field, choose the up arrow, select **No.** from the **Customer-Key List** window, choose the **OK** button, and then in the **Table View** window, choose the **OK** button.  

4.  Locate the [ReqFilterFields Property](ReqFilterFields-Property.md), choose the **AssistEdit** from the **Value** field to open the **Fields List** window.  

5.  In the **Field List** window, choose the up arrow, choose **No.** from the **Customer - Fields List** window, choose the **OK** button, and then choose the **OK** button in the **Field List** window.  

6.  Locate the [PrintOnlyIfDetail Property](PrintOnlyIfDetail-Property.md) and set the **Value** field to **Yes**.  

     The following illustration shows the properties window for the **Customer** data item.  

     ![Customer Data Item properties.](media/MicrosoftDynamicsNAV_CustomerProperties.jpg "MicrosoftDynamicsNAV\_CustomerProperties")  

7.  In Report Dataset Designer, select the **Cust. Ledger Entry** data item.  

8.  In the **Properties** window, locate the [DataItemTableView Property](DataItemTableView-Property.md), and then choose the **AssistEdit** button in the **Value** field to open the **Table View** window.  

9. In the **Key** field, choose the up arrow, select **Entry No.** from the **Cust. Ledger Entry Key List** window, choose the **OK** button, and then in the **Table View** window, choose the **OK** button.  

10. Locate the [DataItemLink Property \(Reports\)](DataItemLink-Property--Reports-.md) and choose the **AssistEdit** button to open the **DataItem Link** window.  

11. In the first row, in the **Field** column, choose the up arrow. In the **Cust. Ledger Entry-Field List** window, select **Customer No.**, and then choose the **OK** button.  

12. In the **Reference Field** column, select the up arrow. In the **Customer – Field List** window, select **No.**, choose the **OK** button, and then choose the **OK** button in the **DataItemLink** window.  

     The following illustration shows the **Properties** window for the **Cust. Ledger Entry** data item.  

     ![Cust.Ledger Entry Properties.](media/MicrosoftDynamicsNAV_CustLEntryProperties.jpg "MicrosoftDynamicsNAV\_CustLEntryProperties")  

13. Select the **Detailed Cust. Ledg. Entry** data item.  

14. In the **Properties** window, locate the [DataItemTableView Property](DataItemTableView-Property.md), choose the **AssistEdit** button in the **Value** field to open the **Table View** window.  

15. In the **Key** field, choose the up arrow, select **Entry No.** from the **Detailed Cust. Ledger Entry Key List** window, and then choose the **OK** button. In the **Table View** window, choose the **OK** button.  

16. Locate the [DataItemLink Property \(Reports\)](DataItemLink-Property--Reports-.md) and choose the **AssistEdit** button to open the **DataItem Link** window.  

17. In the **Field** column, choose the up arrow. In the **Detailed Cust. Ledg. Entry-Field List** window, select **Cust. Ledger Entry No.**, and then choose the **OK** button.  

18. In the **Reference Field** column, select the up arrow, in the **Cust. Ledger Entry-Field List** window, select **Entry No.**, and then choose the **OK** button.  

19. In the second row, in the **Field** column, select the up arrow. In the **Detailed Cust. Ledg. Entry-Field List** window, select **Customer No.**, and then choose the **OK** button.  

20. In the **Reference Field** column, select the up arrow. In the **Cust. Ledger Entry-Field List** window, select **Customer No.**, choose the **OK** button, and then choose the **OK** button.  

     The following illustration shows the **Properties** window for the **Detailed Cust. Ledg. Entry** data item.  

     ![Detailed Cust. Ledger Entry Properties.](media/MicrosoftDynamicsNAV_DetailedLedger.jpg "MicrosoftDynamicsNAV\_DetailedLedger")  

21. Select the **Sales Header** data item.  

22. Locate the [DataItemTableView Property](DataItemTableView-Property.md) and choose the **AssistEdit** button to open the **Table View** window.  

23. In the **Key** field, choose the up arrow, select **Document Type,No.** from the **Sale Header - Key List** window, and then choose the **OK** button. In the **Table View** window, choose the **OK** button.  

24. Locate the [DataItemLink Property \(Reports\)](DataItemLink-Property--Reports-.md), choose the **AssistEdit** button to open the **DataItem Link** window.  

25. In the **Field** column, select the up arrow. In the **Sales Header-Field List** window, select **Sell-to-Customer No.**, and then choose the **OK** button.  

26. In the **Reference Field** column, select the up arrow, in the **Customer-Field List** window, select **No.**, choose **OK** and then choose the **OK** button.  

     The following illustration shows the **Properties** window for the **Sales Header** data item.  

     ![Sales Header Properties window.](media/MicrosoftDynamicsNAV_SalesHeaderProperties.jpg "MicrosoftDynamicsNAV\_SalesHeaderProperties")  

27. Close the **Properties** window.  

## Adding Fields to the Data Items  
 Viktor will now add the fields to the data items. For each table, he will add the fields that he wants to display on the report.  

#### To add fields to the data items  

1.  In Report Dataset designer, select the **Customer** data item, on the **View** menu, choose **Field Menu**.  

2.  In the **Field Menu** window, select the following fields, and then choose the **OK** button. The following table shows the fields in Report Dataset Designer.  

    |Field to select|Name|  
    |---------------------|----------|  
    |No.|No\_Customer|  
    |Name|Name\_Customer|  
    |Address|Address\_Customer|  
    |Phone No.|PhoneNo\_Customer|  
    |E-Mail|EMail\_Customer|  

    > [!NOTE]  
    >  You can hold down the Ctrl key to select multiple fields.  

3.  Choose the **OK** button and then choose **Yes** at the prompt.  

     The following illustration shows the **Customer** data item with its fields in Object Designer.  

     ![Object Designer with customer fields.](media/MicrosoftDynamicsNAV_CustomerFields.jpg "MicrosoftDynamicsNAV\_CustomerFields")  

4.  Select the **Cust. Ledger Entry** data item and repeat steps 1 through 3 to add the fields. The following table shows the fields in Report Dataset Designer.  

    |Field to select|Name|  
    |---------------------|----------|  
    |Entry No.|EntryNo\_CustLedgerEntry|  
    |Customer No.|CustomerNo\_CustLedgerEntry|  
    |Posting Date|PostingDate\_CustLedgerEntry|  
    |Document Type|DocumentType\_CustLedgerEntry|  
    |Document No.|DocumentNo\_CustLedgerEntry|  
    |Description|Description\_CustLedgerEntry|  
    |Currency Code|CurrencyCode\_CustLedgerEntry|  
    |Amount|Amount\_CustLedgerEntry|  
    |Original Amt \(LCY\)|OriginalAmtLCY\_CustLedgerEntry|  
    |Remaining Amt. \(LCY\)|RemainingAmtLCY\_CustLedgEntry|  

5.  Select the **Detailed Cust. Ledger Entry** data item and repeat steps 1 through 3 to add the fields. The following table shows the fields in Report Dataset Designer.  

    |Field to select|Name|  
    |---------------------|----------|  
    |Entry No.|EntryNo\_DetailedCustLedgEntry|  
    |Entry Type|EntryType\_DetailedCustLedgEntry|  
    |Posting Date|PostingDate\_DetailedCustLedgEntry|  
    |Document Type|DocumentType\_DetailedCustLedgEntry|  
    |Document No.|DocumentNo\_DetailedCustLedgEntry|  
    |Amount \(LCY\)|AmountLCY\_DetailedCustLedgEntry|  
    |Transaction No.|TransactionNo\_DetailedCustLedgEntry|  
    |Journal Batch Name|JournalBatchName\_DetailedCustLedgEntry|  
    |Debit Amount \(LCY\)|DebitAmountLCY\_DetailedCustLedgEntry|  
    |Credit Amount \(LCY\)|CreditAmountLCY\_DetailedCustLedgEntry|  

6.  Select the **Sales Header** data item and repeat steps 1 through 3 to add the fields. The following table shows the fields in Report Dataset Designer.  

    |Field to select|Name|  
    |---------------------|----------|  
    |Document Type|DocumentType\_SalesHeader|  
    |No.|No\_SalesHeader|  
    |Posting Date|PostingDate\_SalesHeader|  
    |Prices Including VAT|PricesIncludingVAT\_SalesHeader|  
    |Amount|Amount\_SalesHeader|  

7.  Select the first field under the **Customer** data item. On the **View** menu, choose **Properties** and then set the [IncludeCaption Property](IncludeCaption-Property.md) of each field to **Yes**.  

8.  Repeat step 7 to set the [IncludeCaption Property](IncludeCaption-Property.md) of each field under each **DataItem** to **Yes**. Alternatively, you select the **Include Caption** check box for all the fields. This check box is located in the right corner in Report Dataset Designer.  

## Adding Labels to the Report  
 Viktor will now add labels to the report. The label in Report Dataset Designer stores the label values for the report data set.  

#### To add labels to the report  

1.  On the **View** menu, choose **Labels** to open **Report Label Designer**.  

2.  In the first row, in the **Name** field, enter **Sales\_Document\_Caption**, and then in the **Caption** field, enter **Sales Documents**.  

3.  In the second row, in the **Name** field, enter **Total\_Caption** in the **Caption** field, and then enter **Total**. Close Report Label Designer.  

     These labels will be used later as captions in the report.  

     Viktor will save the report and run it to view how his report looks like at this point.  

4.  From the **File** menu, choose **Save** to open the **Save As** window.  

5.  In the **ID** field, enter **50001** . In the **Name** field, enter **Report for Multiple Tables**, Make sure that **Compile** is selected, and then choose the **OK** button.  

6.  In Object Designer, select **Report for Multiple Tables** \(50001\), and then choose the **Run** button to run the report.  

     The following illustration shows an example of the request page that is displayed when the report is run.  

     ![Request page.](media/MicrosoftDynamicsNAV_RequestPage.jpg "MicrosoftDynamicsNAV\_RequestPage")  

     If you choose the **Preview** button on the request page, the report will display a blank page because a layout for the report is not designed yet.  

## Designing the Visual RDLC Layout for the Report  
 Next, Viktor will design a RDLC layout for the report by using Visual Studio Report Designer. He will set properties for the report and the report elements, format the report, and then add the data to the report.  

#### To design the RDLC layout for the report  

1.  Choose anywhere inside the Report Dataset Designer. On the **View** menu, choose **Layout** to open the RDLC report in Microsoft Visual Studio. The body of the report is displayed in Visual Studio.  

2.  Right-click anywhere outside the report \(in the shaded area\) and then choose **Add Page Header**.  

3.  Right-click anywhere outside the report \(in the shaded area\), and then choose **Report Properties**.  

4.  In the **Report Properties** window, choose the **Page Setup** tab. Iin the **Paper size** section, under **Orientation**, choose the **Landscape**, and then choose the **OK** button.  

5.  On the **View** menu, choose **Toolbox** to open the **Toolbox** pane. Select the **List** control, and then choose the body of the report to add the **List** control to the report. This control will contain and group all the data.  

6.  Move the **List control** to the top of the report body and resize it to cover the whole report body.  

7.  Right-click the middle of the **List** controls, and then choose **Rectangle Properties**.  

8.  In the **Rectangle Properties** window, choose the **Fill** tab, in the **Fill Color** list color pallet, select **Cornflower Blue** from the color pallet, and then choose the **OK** button. You can choose any color.  

    > [!NOTE]  
    >  Changing the color of report elements helps you identify elements on the report preview. You can set different color properties for table header, detail rows, text boxes, and so on.  

     Viktor will set the properties of the **List** control to hold the dataset, group the data by Customer No. and set up how the groups should be displayed.  

#### To set the list control properties  

1.  Select the **List** control, right-click the shaded border to the left of the **List** control, and then choose **Tablix Properties**.  

2.  In the **Tablix Properties** window, on the **General** tab, under **Dataset name**, select **DataSet\_Result** from the drop-down list, and then choose the **OK** button.  

3.  Select the **List** control, right-click the shaded border to the left of the list control, choose **Row Group**, and then **Group Properties**.  

4.  In the **Group Properties** window, on the **General** tab, under **Group expressions:**, choose the **Add** button, and then select **\[No\_Customer\]** from the **Group on:** drop-down list. This groups all the data in the List control by customer number.  

5.  On the **Page Breaks** tab, select **Between each instance of a group**, and then choose the **OK** button.  

     Viktor is now ready to add the customer data. The table will display one customer at a time, therefore Viktor must put all the fields into table header rows. The table data and footer rows will be disabled.  

#### To add customer data  

1.  From the **Toolbox** pane, drag a **Table** control into the **List** control and resize the table to about the half the width of the list control. This table will contain the customer data.  

     The following illustration shows the list control and the table.  

     ![The list control on the report.](media/MicrosoftDynamicsNAV_ListControl.jpg "MicrosoftDynamicsNAV\_ListControl")  

     Note that the table contains two table rows, a header row \(first row\), and a data row \(second row\). The three parallel lines in the left border of the second row identify the data row.  

2.  Select any table row, right-click the shaded border, and then choose **Tablix Properties** to open the **Tablix Properties** window.  

3.  On the **General** tab, verify that the **Dataset name** field is set to **DataSet\_Result**, and then choose the **OK** button.  

     The table has three columns. Viktor will add a fourth column to the table to hold all the customer data.  

4.  Right-click the middle column header, choose **Insert Column**, and then select **Right** to insert the fourth column into the table.  

5.  Select the second table row \(the data row\), right-click the row, choose **Delete Rows** to delete the data row, and then choose the **OK** button in the **Delete Rows** window to delete the row and its associated groups.  

6.  Select the remaining table row, right-click the shaded border on the left, choose **Insert Row**, and then choose **Below** to insert another table header row.  

7.  Repeat step 6 to insert a third table header row. There should now be three header rows in the table.  

8.  Right-click the first cell \(row 1, column 1\) in the table, and then choose **Expression** to open the **Expression** window.  

9. In the **Category** column, select **Parameters**, in the **Item** column, verify that **All** is selected, and then in the **Values** column, double-click **No\_CustomerCaption**. Verify that the **Set expression for: Value** box contains the following value: `=Parameters!No_CustomerCaption.Value`. This cell will display the customer No. caption in the report.  

10. Modify the expression to `=First(Parameters!No_CustomerCaption.Value)`. Choose the **OK** button.  

    > [!NOTE]  
    >  All caption fields must begin with `=First` so that the first value for the caption fields in the data set is retrieved and used as caption. If the First function is not used, the report will return the current value for a field. The current value however may be incorrect. For example, the current value could be empty.  

11. Right-click the second cell \(row 1, column 2\) in the table, and then choose **Expression** to open the **Expression** window.  

12. In the **Category** column, select **Field\(DataSet\_Result\)**, in the **Item** column verify that **All** is selected, and then in the **Values** column double-click **No\_Customer**. Verify that the **Set expression for: Value** box contains the following value `=Fields!No_Customer.Value`. Choose the **OK** button. This cell will display the Customer No..  

13. Repeat steps 8 through 12 to the enter captions and values in the following cells.  

    > [!NOTE]  
    >  Columns 1 and 3 will contain the captions and columns 2 and 4 will contain the values.  

    |Row|Column|Caption|Value|  
    |---------|------------|-------------|-----------|  
    |2|1|Name\_CustomerCaption|None|  
    |2|2|None|Name\_Customer|  
    |1|3|Addreess\_CustomerCaption|None|  
    |1|4|None|Address\_Customer|  
    |2|3|PhoneNo\_CustomerCaption|None|  
    |2|4|None|PhoneNo\_Customer|  
    |3|3|Email\_CustomerCaption|None|  
    |3|4|None|Email\_Customer|  

14. Select all table rows \(not the whole table\), and then on the **View** menu, choose **Properties Window** to open the **Properties** window in Visual Studio.  

15. In the **Properties** window, under **Fill**, set the **BackgroundColor** property to **Plum**. You can choose any color.  

     The layout that Viktor has designed to this point resembles the following illustration.  

     ![The layout containing the customer data.](media/MicrosoftDynamicsNAV_CustomerData.jpg "MicrosoftDynamicsNAV\_CustomerData")  

16. On the **Build** menu, choose **Build Web site** to build the project. Inspect the **Output** pane and make sure that there are no build errors. Close Visual Studio.  

    > [!NOTE]  
    >  It is a good practice to build the project periodically during the report design to make sure that there are no build errors.  

     Viktor will run the report and preview what he has done to this point.  

17. In [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)], in Report Dataset Designer, select a data item. In the dialog box that appears that indicates that the layout of the report is changed by another application, choose the **Yes** button.  

18. On the **File** menu, choose **Save**. In the **Save** window, verify that **Compile** is selected, and then choose the **OK** button.  

19. In Object Designer, select your report \(50001\) and then choose the **Run** button.  

20. In the request page that is displayed, choose the **Preview** button to view the report. The first customer is displayed on the first page. If you page through the report, each customer is displayed on a separate page.  

 Viktor will now add the data for the customer ledger entries and detailed ledger entries. The entries will be put in a different table.  

#### To add the data for ledger entry and detailed ledger entry  

1.  Select Report Dataset Designer. On the **View** menu, choose **Layout** to open the RDLC report in Microsoft Visual Studio.  

2.  From the **Toolbox**, drag a table control into the list control. Put the table under the table that contains the customer data.  

    > [!NOTE]  
    >  You may have to resize the report body and the list controls to make them larger.  

3.  Select the table, right-click the shaded border, choose **Tablix Properties**. On the **General** tab, verify that the **Dataset name** field is set to **DataSet\_Result**, and then choose the **OK** button.  

4.  Select the table data row, choose **Insert Row** and then choose **Outside Group – Below**. This adds another data row to the table. You now have one header row and two data rows.  

5.  Delete the first row \(header row\) in the table and then insert columns in the table so that the total number of columns is eleven.  

6.  Choose the first data row, right-click the shaded border to the left, choose **Add Group**, and then choose **Parent Group**.  

7.  In the **Tablix group** window, select **Group by**, select **EntryNo\_CustLedgerEntry** from the drop-down list. Select **Add group header**, and then choose the **OK** button.  

8.  Right-click the first row, choose **Insert Row**, and then choose **Inside Group – Above**. This header will hold the captions for the Customer Ledger entries.  

9. Right-click the cell in the row1, column 2, and then choose **Expression** to open the **Expression** window.  

10. In the **Category** column, select **Parameters** and then in the **Values** column double-click **EntryNo\_CustLedgerEntryCaption**. Note that the **Set expression for: Value** box contains the following value: `=Parameters!EntryNo_CustLedgerEntryCaption.Value`  

11. Modify the expression to the following value: `=First(Parameters!EntryNo_CustLedgerEntryCaption.Value)`.  

12. Repeat steps 9 through 11 to add captions for the table cells in the rest of the first row as shown in the following table.  

    |Column|Caption expression|  
    |------------|------------------------|  
    |3|CustomerNo\_CustLedgerEntryCaption|  
    |4|PostingDate\_CustLedgerEntryCaption|  
    |5|DocumentType\_CustLedgerEntryCaption|  
    |6|DocumentNo\_CustLedgerEntryCaption|  
    |7|Description\_CustLedgerEntryCaption|  
    |8|Skip this cell. You will use this cell later.|  
    |9|CurrencyCode\_CustLedgerEntryCaption|  
    |10|Amount\_CustLedgerEntryCaption|  
    |11|OriginalAmtLCY\_CustLedgerEntryCaption|  
    |12|RemainingAmtLCY\_CustLedgerEntryCaption|  

13. Right-click the left-most grouping cell \(the cell that contains the **EntryNo\_CustLedgerEntry** field\) in the table, select **Text Box Properties**, in the Text Box Properties window, select the **Visibility** tab, under the **Change display options**, select the Hide option.  

14. Select the first row in the table, in the **Properties** pane, under **Fill**, set the **BackgroundColor** property to **Dim Grey**.  

15. Right-click the cell in the row2, column 2, and then choose **Expression** to open the **Expression** window.  

16. In the **Category** column, select **Fields \(DataSet\_Result\)**, in the **Values** column, double-click **EntryNo\_CustLedgerEntry**, and then choose the **OK** button. Note that the **Set expression for: Value** box contains the following value: `=Fields!EntryNo_CustLedgerEntry.Value`  

17. Repeat steps 15 and 16 for row 3 to add fields from the ledger entry dataset. Put the fields under the corresponding captions.  

18. Select the row that you just filled and set the **BackgroundColor** property to **Silver**.  

19. Build the project, inspect the **Output** pane, and make sure that there are no build errors.  

20. Select the second table row, right-click the shaded border to the left, choose **Insert Row**, and then choose **Below**. The table should now have three group rows, one group data row, and one table footer row. This row will store the captions of **Detailed Cust. Ledg. Entry**  data item.  

21. Add the captions and fields for the **Detailed Cust. Ledger Entry table** as shown in the following table.  

    |Third row \(Caption\)|Forth row \(Fields\)|  
    |---------------------------|--------------------------|  
    |EntryNo\_DetailedCustLedgEntryCaption|EntryNo\_DetailedCustLedgEntry.Value|  
    |EntryType\_DetailedCustLedgEntryCaption|EntryType\_DetailedCustLedgEntry.Value|  
    |PostingDate\_DetailedCustLedgEntryCaption.|PostingDate\_DetailedCustLedgEntr.Value|  
    |DocumentType\_DetailedCustLedgEntryCaption|DocumentType\_DetailedCustLedgEntry.Value|  
    |DocumentNo\_DetailedCustLedgEntryCaption|DocumentNo\_DetailedCustLedgEnt.Value|  
    |TransactionNo\_DetailedCustLedgEntryCaption|TransactionNo\_DetailedCustLedgEntry.Value|  
    |JournalBatchName\_DetailedCustLedgEntryCaption|JournalBatchName\_DetailedCustLedgEntry.Value|  
    |AmountLCY\_DetailedCustLedgEntryCaption|AmountLCY\_DetailedCustLedgEntr.Value|  
    |DebitAmountLCY\_DetailedCustLedgEntryCaption|DebitAmountLCY\_DetailedCustLedgEntry.Value|  
    |CreditAmountLCY\_DetailedCustLedgEntryCaption|CreditAmountLCY\_DetailedCustLedgEntry.Value|  

22. Shrink the column that contains the **Customer No.** field of the Cust. Ledger Entry to about half of its size.  

23. Right-click the column header that contains the **Customer No.** field, choose **Insert Column**, and then choose **Right**.  

24. Select the cell that contains the **Customer No.** caption and the empty cell that you just created, and then choose **Merge Cells** to merge the two cells.  

25. Repeat step 24 to merge the cell that contains the value of the **Customer No.** field and the empty cell that you created.  

26. Assign the expression from the **EntryType** caption and field cells of the Detailed Cust. Ledg. Entry to the empty cell that you created to the right. You may have to have to cut the expressions and paste them into the empty cells.  

27. Repeat 26 to move the **EntryNo** caption and field one cell to the right. This makes sure that the EntryNo and the EntryType data is located directly under the CustomerNo cell.  

     The following illustration shows EntryNo and the EntryType cells directly under the CustomerNo cell  

     ![Merged cells.](media/MicrosoftDynamicsNAV_MergedCells.jpg "MicrosoftDynamicsNAV\_MergedCells")  

28. Repeat steps through 27 to put the **Transaction No.** and **Journal Batch Name** captions and fields under the Description data. This creates a blank cell under the CurrencyCode field.  

29. Select the third row and set the **BackgroundColor** property to **Yellow** and then set the **BackgroundColor** property of the fourth row to **Khaki**.  

     Viktor will now hide all empty cells and add the totals to the footer row. To hide empty cells Viktor will add a filter that selects rows that have \[EntryNo\] value that are greater than zero.  

#### To hide empty cells and add totals  

1.  Select the first row, right-click the shaded border to the left of the row, choose **Row Group**, and then choose **Group Properties**.  

2.  In the **Group Properties** window, select the **Filters** tab, and then choose the **Add** button.  

3.  Set **Expression** to **\[EntryNo\_CustLedgerEntry\]**, change **Text** to **Integer**, set **Operator** to **>**, set **Value** to **0**, and then choose the **OK** button.  

     The filter that is set applies to the other rows in the table.  

4.  In the **Group Properties** window, under the **Filters** tab, verify that the **Expression** box contains \[EntryNo\_CustLedgerEntry\].  

     Viktor will now add the total of the amount field to the footer row of the table, format the cells and hide the total cell if customer ledger entry is not available.  

5.  In the last row of the table, right-click the empty cell under the **Amount \(LCY\)** field, and then choose **Expression**.  

6.  In the **Category** column, select **Fields \(DataSet\_Result\)**, in the **Values** column double-click **Amount\_CustLedgerEntry**, and then change the expression in the **Set expression for: Value** box to the following value: `=Sum(Fields!Amount_CustLedgerEntry.Value)`. Choose the **OK** button.  

7.  In the **Properties** window, locate the **Format** property, choose the drop-down arrow and select **Expression**.  

8.  In the **Expression** window, enter the following formatting expression in **Set expression for: Value** box: `=Fields!Amount_CustLedgerEntryFormat.Value`. Choose the **OK** button.  

    > [!NOTE]  
    >  Alternatively, you set this value by double-clicking **Amount\_CustLedgerEntryFormat** in the **Values** field of **Fields\(DataSet\)** category.  

9. Select the two empty cells to the left of the total cell, right-click the cells, and then choose **Merge Cells**.  

10. Right-click the merged cell, choose **Expression**, choose the **Parameters** category, and then set the caption to **Total\_Caption**  

11. Set the **BackgroundColor** property of the cells that contain the total and total caption to **Red**.  

     If you run the report now, the total amount cell will be displayed even if there are no ledger entries. Viktor will add an expression to hide the footer row when there are no ledger entries.  

12. Select the last row, in the **Properties** window, locate the **Hidden** property, choose the drop-down arrow, and then choose **Expression**.  

13. In the **Expression** window, in the **Set expression for: Hidden** box, enter the following expression to hide the row: `=Fields!EntryNo_CustLedgerEntry.Value = 0`. Choose the **OK** button. This hides the row if there are no entry values.  

14. Right-click the left-most cell in the last table row, select **Text Box Properties**, select the **Visibility** tab, under **Change display options**, select the **Hide** option, and then choose the **OK** button.  

     The next step is to add the data from the **Sales Header** table.  

#### To add the sales header data  

1.  From the **Toolbox**, drag a **Table** control to the **List** control, and then put the table control under the table that contains the **Cust. Ledger Entry** table  

2.  Right-click a column and add columns to create five columns for the table.  

3.  Delete the first header row from the table.  

4.  Right-click the data row, choose **Tablix Properties**, verify that the **DataSet name** is set to **DataSet\_Result**, and then choose the **OK** button.  

5.  Right-click the data row, choose **Add Group**, and then choose **Parent Group** to open the **Tablix group** window.  

6.  Select the **Group by:** option and then choose the **fx** button to open the **Expression** window.  

7.  In the **Category** column, select **Parameters**, and then in the **Values**, column double-click **Sales\_Document\_Caption**. Verify that the **Set expression for: Value** box contains the following value: `=Parameters!Sales_Document_Caption.Value`. Choose the **OK** button.  

8.  In the **Tablix group** window, select **Add group header**, and then choose the **OK** button.  

9. Right-click the first row in the table, choose **Insert Row**, and then choose **Inside Group – Above**.  

10. Reduce the size of the first column, and then in the **Properties** window, under **Visibility**, set the **Hidden** property to **True**. This hides the first column.  

11. In the first table row, merge all the cells except the first grouping cell.  

12. Right-click the merged cell, and then choose **Expression**.  

13. In the **Category** column, select **Parameters**, and then in the **Values** column double-click **Sales\_Document\_Caption**. Verify that the **Set expression for: Value** box contains the following value: `=Parameters!Sales_Document_Caption.Value`. Choose the **OK** button.  

14. Modify the expression to `=First(Parameters!Sales_Document_Caption.Value)`.  

15. Right-click the cell in row2, column 2, and then choose **Expression** to open the **Expression** window.  

16. In the **Category** column, select **Parameters**, and then in the **Values** column double-click **DocumentType\_SalesHeader**. Verify that the **Set expression for: Value** box contains the following value: `Parameters!DocumentType_SalesHeaderCaption.Value`  

17. Modify the expression to the following value: `=First(Parameters!DocumentType_SalesHeaderCaption.Value)`. Choose the **OK** button.  

18. Right-click the cell that is under the caption that you just created, choose **Expression**. In the **Category** column, select **Fields \(DataSet\_Result\)**, and then in the **Values** column double-click **DocumentType\_SalesHeader**. Choose the **OK** button. Verify that the **Set expression for: Value** box contains the following value: `=Fields!DocumentType_SalesHeader.Value`  

19. Repeat steps 15 through 18 and add the following captions and the corresponding fields.  

    |Caption|Corresponding field|  
    |-------------|-------------------------|  
    |No\_SalesHeaderCaption|No\_SalesHeader|  
    |PostingDate\_SalesHeaderCaption|PostingDate\_SalesHeader|  
    |PricesIncludingVAT\_SalesHeaderCaption|PricesIncludingVAT\_SalesHeader|  
    |Amount\_SalesHeaderCaption|Amount\_SalesHeader|  

20. Select the first two rows and in the **Properties** window, set the **BackgroundColor** property to **Lime**.  

21. Select the data row \(last row\), in the **Properties** window, set the **BackgroundColor** property to **Turquoise**.  

     Viktor will now set a filter that hides empty rows.  

#### To set a filter hide empty row  

1.  Select any row from this table, right-click the shaded border to the left of the table, and then choose **Tablix Properties**.  

2.  Choose the **Filters** tab and then choose the **Add** button.  

3.  In the **Expression** list box, select **No\_SalesHeader**, set **Operator** to **>**, set **Value** to **0**, and then choose the **OK** button.  

4.  Save the report.  

## Building and Running the Report  
 Before you run the report, you must build and correct all build errors and then run the run report in Object Designer.  

#### To build and run the report  

1.  In the main menu, choose **Build**, and then choose **Build Web Site** to build the project. Inspect the **Output** pane and make sure that there are no build errors and then close Visual Studio.  

2.  In [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], in Report Dataset Designer, select a data item, and then in the dialog box that appears that indicates that the layout of the report is changed by another application, choose the **Yes** button.  

3.  On the **File** menu, choose **Save**. In the **Save** window, make sure that **Compile** is selected, and then choose the **OK** button.  

4.  In Object Designer, select the report \(50001\), and then choose the **Run** button to run the report.  

5.  On the request page, choose the **Preview** button to view the report.  

6.  Use the paging buttons at the top of the report to move to the next customer.  

## Next Steps  
 Viktor can add advanced features to the report. He can add features such as displaying the company name and logo on every page on the report. He might also want to add features that enable users to apply filters on the request page. For more information, see [Walkthrough: Adding Company Information, Custom Filters, and Formatting to a Report](Walkthrough--Adding-Company-Information--Custom-Filters--and-Formatting-to-a-Report.md).  

## See Also  
 [Walkthrough: Adding Company Information, Custom Filters, and Formatting to a Report](Walkthrough--Adding-Company-Information--Custom-Filters--and-Formatting-to-a-Report.md)   
 [Report Design Walkthroughs](Report-Design-Walkthroughs.md)
