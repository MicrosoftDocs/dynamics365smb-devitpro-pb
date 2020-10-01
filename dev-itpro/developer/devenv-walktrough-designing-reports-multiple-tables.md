---
title: "Walkthrough: Designing a Report from Multiple Tables"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# Walkthrough: Designing a Report from Multiple Tables
A report object is composed of a report dataset and a visual layout. You design a report by first defining the dataset and then designing the visual layout. You define the dataset for reports directly in AL code. You design the layout in Visual Studio Report Designer or Microsoft SQL Server Reporting Services Report Builder for a RDL layout and in Microsoft Word for a Word layout. After you design a report, you can make it available to applications that are running on the [!INCLUDE[webclient](includes/webclient.md)]. A report can be designed from one table or multiple tables. This walkthrough demonstrates how to design a report from multiple tables.  

## About This Walkthrough  
This walkthrough shows you how to design a report from the [!INCLUDE[d365_dev_long_md](includes/d365_dev_long_md.md)] and using Visual Studio Report Designer for designing an RDL layout.  

 This walkthrough illustrates the following tasks:  

- Defining the dataset for multiple tables.  
- Adding fields to a data item.  
- Defining properties for the data items.  
- Adding labels to a report.  
- Design a client report definition (RDL) report layout in Visual Studio 2019.  
- Setting filters to hide empty rows and fields in a report.  
- Building and running a report.  

## Story  
Viktor is a developer who is working for [!INCLUDE[demoname](includes/demoname_md.md)] Viktor has been asked by his manager to create a report that shows data from the `Customer` (ID 18), `Cust. Ledger Entry` (ID 21), `Detailed Cust. Ledger Entry` (ID 379), and the `Sales Header` (ID 36) tables. The report should meet the following requirements:  

- The report must display customer information at the top of the report.  

- For each customer, the report must show a list of ledger entries.  

- For each ledger entry, the report must show a list of detailed ledger entries under the ledger entries.  

- The report must display basic sales document headers information for the selected customer.  

- Each section of the data for each customer must begin on a new page.  

- The `Amount` field from the `Cust. Ledger Entry` table should be totaled and displayed for each customer.  

- If there are no records to display, the report must not display that data sections. For example, if there are no sales documents for a customer, the sale header section must be skipped.  

- Amount fields must not display zero values.  

- The orientation of the report should be landscape.  

The following illustration shows an example of the second page of the report.  

![Completed report](media/MicrosoftDynamicsNAV_MultiDataSetReport.jpg "MicrosoftDynamicsNAV\_MultiDataSetReport")  

## Defining the Dataset
Viktor starts by creating an empty report object by using the AL Language extension in Visual Studio Code. You can use the shortcut `treport` to create the basic layout for a report object.

He sets the [DefaultLayout Property](properties/devenv-defaultlayout-property.md) to **RDLC** to specify that he will use an RDL layout for the report and the [RDLCLayout Property](properties/devenv-rdlclayout-property.md) to `'MyRDLReport.rdl'`, the name of the rdl file he will use for the layout.

Viktor will now design the dataset to display customers and their transaction details. This is defined within the `dataset` part of the report object. 

### Adding Data Items and columns
 
The datasets for the data model will come from four tables: `Customer`, `Cust. Ledger Entry`, `Detailed Cust. Ledger Entry`, and `Sales Header`. Viktor will create a data item for each table with the `dataitem` control. Moreover, for each table, he will add the fields that he wants to display on the report. Each field is given by a `column` control, defined inside the corresponding data item.

The hierarchy of the `dataitem` and `column` controls is important because it will determine the sequence in which data items are linked, which in turn will control the results. Working from top-to-bottom, you start by adding the `dataitem` control for first table that you want in the dataset, then add column controls for each table field that you want to include in the dataset. For the next table, you add another `dataitem` control that is embedded within the first `dataitem` control, then add column controls as needed. You continue this pattern for additional tables and fields.

### Defining Properties for the Data Items

Once Viktor has specified the dataitem and column elements he will define the appropriate properties. He sets the [DataItemTableView Property](properties/devenv-dataitemtableview-property.md) in each data item to sort the table view based on a specific field. 

He also sets the [RequestFilterFields Property](properties/devenv-requestfilterfields-property.md) to automatically include a specific field on the filter tab of the request page. For more information about request pages, see [Request Pages](devenv-request-pages.md).

<!-- >[!NOTE]
> Request pages for XMLports are not supported by the Business Central Web client in versions prior to Dynamics 365 Business Central 2019 release wave 2. If you try to run an XMLport with a Request page from the web client in these versions, you receive an error that the XMLport page type is not supported. Alternatively, XMLport request pages do work in the Dynamics NAV Client connected to Business Central. -->

Now, Viktor uses the [DataItemLink (Reports) Property](properties/devenv-dataitemlink-reports-property.md) to set a link between one or more fields of the dataitem tables. Links determine which records to include in the dataset based on the values of a common field between dataitems. This property must be set on the lower dataitem of the report object.

For each of the `column` controls he adds the [IncludeCaption Property](properties/devenv-includecaption-property.md) and sets it to **True**. This property specifies to include the caption of the fields in the dataset of a report.

Finally, he sets the [PrintOnlyIfDetail Property](properties/devenv-printonlyifdetail-property.md) to **True** on a data item to print data only if at least one of its child data items generates output.


## Adding Labels to the Report  
Viktor will now add labels to the report. You define the labels in the `label` part of the report. These labels will be used later as captions.  

The following code exemplifies the code that Viktor has written for the report.

```AL
report 50101 "Report for Multiple Tables"
{
    //Make the report searchable from Tell me under the Administration category.
    UsageCategory = Administration;
    ApplicationArea = All;
    // Use an RDL layout.
    DefaultLayout = RDLC;
    // Specify the name of the file that the report will use for the layout.
    RDLCLayout = 'MyRDLReport.rdl';

    dataset
    {

        dataitem(Customer; Customer)
        {
            // Sort the table view based on the "No." field.
            DataItemTableView = Sorting("No.");
            // Include the "No." field on the filter tab of the request page.
            RequestFilterFields = "No.";
            // Print data only if at least one of the CustLedgerEntry and SalesHeader data items generates output.
            PrintOnlyIfDetail = True;

            // For each field that you want to display you add a column control.
            column(No_Customer; "No.")
            {
                // Include the caption of the "No." field in the dataset of the report.
                IncludeCaption = true;
            }

            column(Name_Customer; Name)
            {
                IncludeCaption = true;

            }

            column(Phone_Customer; "Phone No.")
            {
                IncludeCaption = true;

            }

            column(Address_Customer; Address)
            {
                IncludeCaption = true;

            }

            column(EMail_Customer; "E-Mail")
            {
                IncludeCaption = true;

            }
            dataitem(CustLedger; "Cust. Ledger Entry")
            {

                DataItemTableView = sorting("Entry no.");
                // Set a filter on the child data item, **CustLedgerEntry** to select only the records where the 
                // value of `Customer."No."` field and the `"Customer Ledger Entry"."Customer No."` field matches.
                DataItemLink = "Customer No." = field("No.");

                column(EntryNo_CustLedgerEntry; "Entry No.")
                {
                    IncludeCaption = true;

                }
                column(CustomerNo_CustLedgerEntry; "Customer No.")
                {
                    IncludeCaption = true;

                }
                column(PostingDate_CustLedgerEntry; "Posting Date")
                {
                    IncludeCaption = true;

                }
                column(DocumentType_CustLedgerEntry; "Document Type")
                {
                    IncludeCaption = true;

                }

                column(DocumentNo_CustLedgerEntry; "Document No.")
                {
                    IncludeCaption = true;

                }

                column(Description_CustLedgerEntry; Description)
                {
                    IncludeCaption = true;

                }

                column(CurrencyCode_CustLedgerEntry; "Currency Code")
                {
                    IncludeCaption = true;

                }

                column(Amount_CustLedgerEntry; Amount)
                {
                    IncludeCaption = true;

                }

                column(OriginalAmtLCY_CustLedgerEntry; "Original Amt. (LCY)")
                {
                    IncludeCaption = true;

                }

                column(RemainingAmtLCY_CustLedgEntry; "Remaining Amt. (LCY)")
                {
                    IncludeCaption = true;

                }


                dataitem(DetCustLedger; "Detailed Cust. Ledg. Entry")
                {

                    DataItemTableView = sorting("entry no.");
                    DataItemLink = "Cust. Ledger Entry No." = field("Entry No."), "Customer No." = field("Customer No.");

                    column(EntryNo_DetailedCustLedgEntry; "Entry No.")
                    {
                        IncludeCaption = true;

                    }

                    column(EntryType_DetailedCustLedgEntry; "Entry Type")
                    {
                        IncludeCaption = true;

                    }

                    column(PostingDate_DetailedCustLedgEntry; "Posting Date")
                    {
                        IncludeCaption = true;

                    }

                    column(DocumentType_DetailedCustLedgEntry; "Document Type")
                    {
                        IncludeCaption = true;

                    }

                    column(DocumentNo_DetailedCustLedgEntry; "Document No.")
                    {
                        IncludeCaption = true;

                    }

                    column(AmountLCY_DetailedCustLedgEntry; "Amount (LCY)")
                    {
                        IncludeCaption = true;

                    }

                    column(TransactionNo_DetailedCustLedgEntry; "Transaction No.")
                    {
                        IncludeCaption = true;

                    }

                    column(JournalBatchName_DetailedCustLedgEntry; "Journal Batch Name")
                    {
                        IncludeCaption = true;

                    }

                    column(DebitAmountLCY_DetailedCustLedgEntry; "Debit Amount (LCY)")
                    {
                        IncludeCaption = true;

                    }

                    column(CreditAmountLCY_DetailedCustLedgEntry; "Credit Amount (LCY)")
                    {
                        IncludeCaption = true;

                    }

                }
            }

            dataitem(SalesHeader; "Sales Header")
            {
                DataItemTableView = sorting("Document Type", "No.");
                DataItemLink = "Sell-to Customer No." = field("No.");

                column(DocumentType_SalesHeader; "Document Type")
                {
                    IncludeCaption = true;

                }

                column(No_SalesHeader; "No.")
                {
                    IncludeCaption = true;

                }

                column(PostingDate_SalesHeader; "Posting Date")
                {
                    IncludeCaption = true;

                }

                column(PricesIncludingVAT_SalesHeader; "Prices Including VAT")
                {
                    IncludeCaption = true;

                }

                column(Amount_SalesHeader; Amount)
                {
                    IncludeCaption = true;

                }
            }

        }
    }

    // These labels will be used later as captions in the report layout.  
    labels
    {
        Sales_Document_Caption = 'Sales Documents';
        Total_Caption = 'Total';
    }
}
```  

## Designing the Visual RDL Layout for the Report  
Next, Viktor will design an RDL layout for the report by using Visual Studio Report Designer. He will set properties for the report and the report elements, format the report, and then add the data to the report.  

#### To design the RDL layout for the report  

1.  Build the extension (Ctrl+Shift+B) to generate the `MyRDLReport.rdl` file, and then open the file with Visual Studio 2019.

2.  Right-click anywhere outside the report (in the shaded area) and then choose **Add Page Header**.  

3.  Right-click anywhere outside the report (in the shaded area), and then choose **Report Properties**.  

4.  In the **Report Properties** window, choose the **Page Setup** tab. In the **Paper size** section, under **Orientation**, choose **Landscape**, and then choose the **OK** button.  

5.  On the **View** menu, choose **Toolbox**. Select the **List** control, and then choose the body of the report to add the **List** control to the report. This control will contain and group all the data.  

6.  Move the **List control** to the top of the report body and resize it to cover the whole report body.  

7.  Right-click the middle of the **List** controls, and then click on the box to open the **Rectangle Properties**.  

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

     ![The list control on the report](media/MicrosoftDynamicsNAV_ListControl.jpg "MicrosoftDynamicsNAV\_ListControl")  

     Note that the table contains two table rows, a header row (first row), and a data row (second row). The three parallel lines in the left border of the second row identify the data row.  

2.  Select any table row, right-click the shaded border, and then choose **Tablix Properties** to open the **Tablix Properties** window.  

3.  On the **General** tab, verify that the **Dataset name** field is set to **DataSet\_Result**, and then choose the **OK** button.  

     The table has three columns. Viktor will add a fourth column to the table to hold all the customer data.  

4.  Right-click the middle column header, choose **Insert Column**, and then select **Right** to insert the fourth column into the table.  

5.  Select the second table row (the data row), right-click the row, choose **Delete Rows** to delete the data row, and then choose the **OK** button in the **Delete Rows** window to delete the row and its associated groups.  

6.  Select the remaining table row, right-click the shaded border on the left, choose **Insert Row**, and then choose **Below** to insert another table header row.  

7.  Repeat step 6 to insert a third table header row. There should now be three header rows in the table.  

8.  Right-click the first cell (row 1, column 1) in the table, and then choose **Expression** to open the **Expression** window.  

9. In the **Category** column, select **Parameters**, in the **Item** column, verify that **All** is selected, and then in the **Values** column, double-click **No\_CustomerCaption**. Verify that the **Set expression for: Value** box contains the following value: `=Parameters!No_CustomerCaption.Value`. This cell will display the customer No. caption in the report.  

10. Modify the expression to `=First(Parameters!No_CustomerCaption.Value)`. Choose the **OK** button.  

    > [!NOTE]  
    >  All caption fields must begin with `=First` so that the first value for the caption fields in the data set is retrieved and used as caption. If the First function is not used, the report will return the current value for a field. The current value however may be incorrect. For example, the current value could be empty.  

11. Right-click the second cell (row 1, column 2) in the table, and then choose **Expression** to open the **Expression** window.  

12. In the **Category** column, select **Field\(DataSet\_Result\)**, in the **Item** column verify that **All** is selected, and then in the **Values** column double-click **No\_Customer**. Verify that the **Set expression for: Value** box contains the following value `=Fields!No_Customer.Value`. Choose the **OK** button. This cell will display the Customer No..  

13. Repeat steps 8 through 12 to the enter captions and values in the following cells.  

    > [!NOTE]  
    >  Columns 1 and 3 will contain the captions and columns 2 and 4 will contain the values.  

    |Row|Column|Caption|Value|  
    |---------|------------|-------------|-----------|  
    |2|1|Name\_CustomerCaption|None|  
    |2|2|None|Name\_Customer|  
    |1|3|Address\_CustomerCaption|None|  
    |1|4|None|Address\_Customer|  
    |2|3|PhoneNo\_CustomerCaption|None|  
    |2|4|None|PhoneNo\_Customer|  
    |3|3|Email\_CustomerCaption|None|  
    |3|4|None|Email\_Customer|  

14. Select all table rows (not the whole table), and then on the **View** menu, choose **Properties Window** to open the **Properties** window in Visual Studio.  

15. In the **Properties** window, under **Fill**, set the **BackgroundColor** property to **Plum**. You can choose any color.  

     The layout that Viktor has designed to this point resembles the following illustration.  

     ![The layout containing the customer data](media/MicrosoftDynamicsNAV_CustomerData.jpg "MicrosoftDynamicsNAV\_CustomerData")  

16. On the **Build** menu, choose **Build Web site** to build the project. Inspect the **Output** pane and make sure that there are no build errors. Close Visual Studio.  

    > [!NOTE]  
    > It is a good practice to build the project periodically during the report design to make sure that there are no build errors.  

     Viktor will run the report and preview what he has done to this point.  

17. Go back to your project in Visual Studio Code and Reload the Window.

18. In the `launch.json` file set the `"startupObjectId"` to the **Id** of the report object and the `"startupObjectType"` to `Report`.

19. Press the `F5` key to run the report.

20. In the request page that is displayed, choose the **Preview** button to view the report. The first customer is displayed on the first page. If you page through the report, each customer is displayed on a separate page.  

Viktor will now add the data for the customer ledger entries and detailed ledger entries. The entries will be put in a different table.  

#### To add the data for ledger entry and detailed ledger entry  

1.  Open the `MyRDLReport.rdl` report in Microsoft Visual Studio.  

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

     ![Merged cells](media/MicrosoftDynamicsNAV_MergedCells.jpg "MicrosoftDynamicsNAV\_MergedCells")  

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

16. In the **Category** column, select **Parameters**, and then in the **Values** column double-click **DocumentType\_SalesHeader**. Verify that the **Set expression for: Value** box contains the following value: `Parameters!DocumentType_SalesHeaderCaption.Value`.  

17. Modify the expression to the following value: `=First(Parameters!DocumentType_SalesHeaderCaption.Value)` and then choose the **OK** button. 

18. Right-click the cell that is under the caption that you just created, choose **Expression**. In the **Category** column, select **Fields \(DataSet\_Result\)**, and then in the **Values** column double-click **DocumentType\_SalesHeader**. Choose the **OK** button. Verify that the **Set expression for: Value** box contains the following value: `=Fields!DocumentType_SalesHeader.Value`  

19. Repeat steps 15 through 18 and add the following captions and the corresponding fields.  

    |Caption|Corresponding field|  
    |-------------|-------------------------|  
    |No\_SalesHeaderCaption|No\_SalesHeader|  
    |PostingDate\_SalesHeaderCaption|PostingDate\_SalesHeader|  
    |PricesIncludingVAT\_SalesHeaderCaption|PricesIncludingVAT\_SalesHeader|  
    |Amount\_SalesHeaderCaption|Amount\_SalesHeader|  

20. Select the first two rows and in the **Properties** window, set the **BackgroundColor** property to **Lime**.  

21. Select the data row (last row), in the **Properties** window, set the **BackgroundColor** property to **Turquoise**.  

     Viktor will now set a filter that hides empty rows.  

#### To set a filter hide empty row  

1.  Select any row from this table, right-click the shaded border to the left of the table, and then choose **Tablix Properties**.  

2.  Choose the **Filters** tab and then choose the **Add** button.  

3.  In the **Expression** list box, select **No\_SalesHeader**, set **Operator** to **>**, set **Value** to **0**, and then choose the **OK** button.  

4.  Save the report.  

## Building and Running the Report  

Viktor will run the report to view how it looks like. For this, do the following:

1.  Make sure that the `"startupObjectId"` is set to the **Id** of the report object and the `"startupObjectType"` to `Report` in the `launch.json` file.

2. Press the `F5` key to compile and run the report in Dynamics 365 Business Central.

3.  If you have not disabled the [UseRequestPage Property](properties/devenv-userequestpage-property.md) you will be shown a request page in the Web Client.

     The following illustration shows an example of the request page that is displayed when the report is run.  

     ![Request page](media/request_page_report.PNG?style=centerme "request\_page\_report" )  

     If you choose the **Preview** button on the request page, the report will be displayed with the RLD layout just created.

Viktor can now add advanced features to the report. He can add features such as displaying the company name and logo on every page on the report. He might also want to add features that enable users to apply filters on the request page.  

## See Also  
[Report Overview](devenv-reports.md)  
[Defining a Report Dataset](devenv-report-dataset.md)  
[Creating an RDL Layout Report](devenv-howto-rdl-report-layout.md)
