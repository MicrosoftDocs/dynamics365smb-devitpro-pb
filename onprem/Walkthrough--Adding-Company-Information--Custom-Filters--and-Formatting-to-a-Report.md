---
title: "Walkthrough: Adding Company Information, Custom Filters, and Formatting to a Report"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 6ff83384-54f1-49b3-bc99-ae397e5766b5
caps.latest.revision: 15
manager: edupont
---
# Walkthrough: Adding Company Information, Custom Filters, and Formatting to a Report
When you create a report, you can add features such as formatting, custom filters, company logo, and company name to the report. Adding these features make the report readable and improves the visual presentation of the report. You will add these features to the report that you created in [Walkthrough: Designing a Report from Multiple Tables](Walkthrough--Designing-a-Report-from-Multiple-Tables.md).  

## About This Walkthrough  
 This walkthrough shows you how to add custom filters, add company information, and format a report.  

 This walkthrough illustrates the following tasks:  

-   Declaring the required variables.  

-   Adding a custom filter to the request page. The filter will enable users to display or hide customer details.  

-   Adding company information to the report.  

-   Hiding or showing customer details.  

-   Formatting the data.  

-   Formatting the layout of the report.  

-   Building and running the report.  

### Prerequisites  
 To complete this walkthrough, you will need:  

-   To create a report by using [Walkthrough: Designing a Report from Multiple Tables](Walkthrough--Designing-a-Report-from-Multiple-Tables.md). If you have not created this report, you must create it before you start this walkthrough.  

-   [!INCLUDE[navnowlong](includes/navnowlong_md.md)] installed with a developer license.  

-   The [!INCLUDE[demolong](includes/demolong_md.md)] installed.  

-   Microsoft Visual Studio installed. For more information about which version of Microsoft Visual Studio you need, see [System Requirements for Microsoft Dynamics NAV](System-Requirements-for-Microsoft-Dynamics-NAV.md). This walkthrough assumes that Microsoft Visual Studio 2012 or Microsoft Visual Studio 2013 is used.  

## Story  
 Viktor has created the report that was assigned to him in [Walkthrough: Designing a Report from Multiple Tables](Walkthrough--Designing-a-Report-from-Multiple-Tables.md). Viktor wants to improve the visual presentation of the report by adding the company name and company logo to the report. He will format the data and the layout of the report. The company name and the logo must be displayed on every page. On the request page, Viktor wants to enable users to filter the data by customer number and provide the option to hide or show detailed customer information.  

## Declaring the Required Variables  
 First, Viktor will declare the variables that are that are required to create the custom filter and add the company name and logo to the report.  

#### To declare the variables  

1.  In the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)], in Object Designer, select the report that you created by using [Walkthrough: Designing a Report from Multiple Tables](Walkthrough--Designing-a-Report-from-Multiple-Tables.md) \(Report for Multiple Tables \(50001\). Choose **Design** to open Report Dataset Designer.  

2.  On the **View** menu, choose **C/AL Globals** to open the **C/AL Globals** window.  

3.  On the **Variable** tab, in the first row, in the **Name** field, enter **ReportFilters**. In the **DataType** field, choose the drop-down arrow, select **Text**, and then in the **Length** field enter **250**.  

4.  In the second row, in the **Name** field, enter **CompanyInfo**. In the **DataType** field, choose the drop-down arrow, and then select **Record**. In the **SubType** field, choose the up arrow, and then select the **Company Information** table \(79\).  

5.  In the third row, in the **Name** field, enter **ShowCustomerDetails**. In the **DataType** field, choose the drop-down arrow, and then select **Boolean**.  

6.  Close the **C/AL Globals** window.  

## Adding a Custom Filter to the Request Page  
 Viktor will add an option control to the request page. The option control will enable users to show or hide detailed information for a customer. If the detailed information is hidden, only the customer’s number and name will be displayed on the report.  

#### To add a custom filter  

1.  In Report Dataset Designer, on the **View** menu, choose **C/AL code** to open the C/AL Editor.  

2.  In the OnPreReport trigger, add the following code: `ReportFilters := Customer.GETFILTERS;`. Close the C/AL Editor.  

3.  In Report Dataset Designer, right-click the Cust. Ledger Entry DataItem, and then choose **New** to create a new row at the bottom of the Customer DataItem.  

4.  In the new row, in the **Data Source** field, enter the following code: `Customer.TABLECAPTION+':' + ReportFilters`. In the **Name** field, enter **Cust\_ReportFilter**.  

5.  Repeat step 3 to create a new row at the bottom of the Customer DataItem.  

6.  In the new empty row, in the **Data Source** field, choose the AssistEdit button to open the **C/AL Symbol Menu** window. In the leftmost window, select **ReportFilters**, and then choose the **OK** button. In the **Name** field, enter **ReportFilters**.  

7.  On the **File** menu, choose **Save** to save the report.  

8.  In the **Save** window, make sure that **Compile** is selected, and then choose the **OK** button.  

9. On the **View** menu, choose **Layout** to open the RDLC layout in Microsoft Visual Studio.  

10. In the body section of the layout, select the **List** control and move the report down to create space at the top of the report.  

11. On **View** menu, choose **Report Data** to display the Report Data pane.  

12. On the **DataSource** node, under **DataSet\_Result**, drag the **Cust\_ ReportFilter** item to the space you that you created at the top of the body of the Report Designer.  

13. Right-click the Cust\_ReportFilter text box, and then choose **Expression** to open the **Expression** window.  

14. In the **Set expression for: Value** box, replace the expression with the following expression: `=First(Fields!Cust_ReportFilter.Value)`. Choose the **OK** button.  

15. Select the **Cust\_ReportFilter** text box, in the Visual Studio **Properties** pane, locate the **Hidden** property, choose the drop-down list, and then choose **Expression**.  

16. In the **Set expression for: Hidden** box, replace the expression with the following expression: `=iif(First(Fields!ReportFilters.Value=""),true,false)`. Choose the **OK** button.  

17. On the **Build** menu, choose **Build Web Site** to build the project. Inspect the **Output** pane and make sure that there are no build errors. Close Visual Studio.  

## Adding Company Information  
 Viktor will add the company name and logo to the report.  

#### To add a company name  

1.  In Report Dataset Designer, select a DataItem, and then in the dialog box that appears, choose the **Yes** button. The dialog box contains a message that states that the layout of the report is changed by another application.  

2.  In Report Dataset Designer, right-click the Cust. Ledger Entry DataItem, and then choose **New** to create a new row at the bottom of the Customer DataItem.  

3.  In the new row, in the **Data Source** field, choose the AssistEdit button to open the **C/AL Symbol Menu** window.  

4.  In the leftmost box, select **DATABASE**. In the middle box, select **Functions**. In the rightmost box, select **COMPANYNAME**. Choose the **OK** button.  

5.  In the **Name** field, enter **CompanyName**.  

6.  Save and compile the report. On the **View** menu, choose **Layout**.  

7.  In the Report RDLC layout in Visual Studio, on the **View** menu, choose **Report Data**.  

8.  In the **Report Data** pane, right-click the **DataSource** node, choose **Refresh**, and then verify that the **CompanyName** report item appears in the list under the **DataSource** node.  

9. Drag the **CompanyName** report data item to the **Report Header** section of the report, build the report, and then close the Visual Studio Designer. The information that is on the header section will be displayed on every page on the report.  

#### To add a company logo  

1.  In Report Dataset Designer, select a DataItem. In the dialog box that states that the layout of the report is changed by another application, choose the **Yes** button.  

2.  In Report Dataset Designer, right-click the Cust. Ledger Entry DataItem, and then choose **New** to create a new row at the bottom of the Customer DataItem.  

3.  In the new row, in the **Data Source** field, choose the AssistEdit button to open the **C/AL Symbol Menu** window.  

4.  In the leftmost box, select **CompanyInfo**. In the middle box, select **FieldName**. In the rightmost box, select **Picture**. Choose the **OK** button.  

5.  In the **Name** field, enter **Picture**.  

6.  On the **View** menu, choose **C/AL Code**.  

7.  In the **C/AL Editor**, in the [OnInitReport Trigger](OnInitReport-Trigger.md), enter the following code.  

    ```  
    CompanyInfo.GET;  
    CompanyInfo.CALCFIELDS(Picture);  

    ```  

8.  Close the **C/AL Editor**, save the report, and then compile the report.  

9. On the **View** menu, choose **Layout**.  

10. In Visual Studio, on the **View** menu, choose **Toolbox**.  

11. In the **Toolbox** pane, drag the **Image** control to the header section of the report. Put the control where you want the company logo to be displayed, and then choose the **OK** button in the **Image Properties** window. Resize the image to the desired size.  

12. Select the image control, in the **Properties** pane, in **General** node, set the following properties.  

    |Property|Value|  
    |--------------|-----------|  
    |**MIMEType**|Image/bmp|  
    |**Value**|=First\(Fields\!Picture.Value, "DataSet\_Result"\)|  
    |**Source**|Database|  

13. Under **Size**, set the **Sizing** property to **FitProportional**  

14. On the main menu, choose **Build**, and then choose **Build Web Site** to build the project. Review the **Output** pane, make sure that there are no build errors, and then close Visual Studio.  

## Hiding or Showing Customer Details  
 In this section, Viktor will define visibility settings for the customer fields \(address, telephone number, and email\). These fields will be displayed or hidden depending on whether the **Show Customer Details** check box on the request page is selected. If the check box is not selected, only customer number and name will be displayed on the report.  

#### To hide or show detailed customer information  

1.  In Report Dataset Designer, choose **Yes** in the dialog box that appears.  

2.  On the **View** menu, choose **Request Page** to open the **Request Options Page Designer** window.  

3.  In the first row, in the **Caption** field, enter **Container**, and then accept the defaults for the rest of the fields.  

4.  In the second row, in the **Type** field, choose the drop-down arrow, and then select **Group**. In **SubType** field, choose the drop-down arrow, and then select **Group**. In the **Name** field, enter **Option**. Accept the default for the **Caption** field.  

5.  In the next empty row, in the **Type** field, select **Field**. In the **Name** field, enter **ShowCustDetails**. In the **Caption** field, enter **Show Customer Details**.  

6.  In the **SourceExpr** field, choose the AssistEdit button, choose **ShowCustomerDetails** from the first box, choose the **OK** button, and then close the **Request Options Page Designer** window.  

7.  In Report Dataset Designer, create a new row at the bottom of the Customer DataItem. In the new row, in the **Data Source** field, choose the AssistEdit button to open the **C/AL Symbol Menu** window.  

8.  In the leftmost box, select **ShowCustomerDetails**. Choose the **OK** button. In the **Name** field, enter **ShowCustomerDetails**.  

9. Save and compile the report.  

10. On the **View** menu, choose **Layout** to open the RDLC layout in Visual Studio.  

11. In the report layout, in the table that contains the customer data, in the last row, select the first two cells. In the third column, select the cells that contain the customer details data \(address, telephone number, and email\) values and captions. You can select multiple cells by holding down the Ctrl key and selecting the cells.  

     The following illustration shows the selected cells.  

     ![Customer Details cells.](media/MicrosoftDynamicsNAV_CustDetailCells.jpg "MicrosoftDynamicsNAV\_CustDetailCells")  

12. In the **Properties** pane, locate the **Hidden** property, choose the drop-down list, choose **Expression**, and then enter the following conditional expression in the **Set expression for: Hidden** box: `=iif(Fields!ShowCustomerDetails.Value,false,true)`. This expression replaces any expression in the box. Choose the **OK** button. This expression hides the customer details information unless the **Show Customer Details** option is selected on the request page.  

    > [!NOTE]  
    >  When you select multiple cells, the **Properties** pane will display properties that are common to the selected cells.  

13. Build the modified report layout, inspect the **Output** pane and make sure that there are no build errors. Close Microsoft Visual Studio.  

14. In Report Dataset Designer, select a DataItem, in the dialog box that appears, choose the **Yes** button.  

15. On the **File** menu, choose **Save**. In the **Save** window, make sure that **Compile** is selected, and then choose the **OK** button.  

16. In Object Designer, select the report \(50001\), and then choose the **Run** button to run the report.  

     The following illustration shows the Edit Report for Multiple Tables Request Page with the show details filter.  

     ![Request Page with show details filter.](media/MicrosoftDynamicsNAV_ShowDetails.jpg "MicrosoftDynamicsNAV\_ShowDetails")  

17. In the **Where No. is** filter, enter **01445544**. Select the **Show Customer Details** option, and then choose the **Preview** button. Note that the company name and the company logo are displayed on the report and all customer information is displayed.  

    > [!NOTE]  
    >  By default, the **Show Customer Details** option is not selected.  

     The following illustration shows an example of the report with customer details.  

     ![Report with logo and company name.](media/MicrosoftDynamicsNAV_Logo_Company.jpg "MicrosoftDynamicsNAV\_Logo\_Company")  

18. Run the report again. This time, on the Request Page, do not select the **Show Customer Details** option. Note that only the customer ID and the customer name are displayed on the report.  

## Formatting the Data  
 By default, the **DateTime** fields in the report display the date in the 1/20/2013 12:00 am format, **Boolean** fields are displayed as true or false, and the amounts fields are displayed without commas. Viktor will format the **DateTime** values so that they are displayed in the 01/20/2012 \(mm/dd/yyyy\) format,  Boolean values are displayed as **Yes** or **No**, and all the amounts are displayed in the \#,\#\#\#.\#\# format. For example, 2,222.00.  Later, the cells that display the amount values will be formatted to hide zero decimal values.  

#### To format dates value  

1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], select Report Dataset Designer, choose **View**, and then choose **Layout**.  

2.  In the Visual Studio RDCL layout designer, select the posting date cell from the Cust Ledger Entry item, in the **Properties** window, locate the **Format** property, and then set the value to **d**.  

3.  Repeat step 2 to format all the dates in the report, save the changes, and then build the report.  

#### To format a Boolean value  

1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], in Report Dataset Designer, select a DataItem, and then choose **Yes** in the dialog box that appears.  

2.  In the last empty row at the bottom of the Sales Header DataItem, in the **Data Source** field, enter the following expression: `FORMAT("Sales Header"."Prices Including VAT")`. In the **Name** field, enter **F\_Prices\_Including\_VAT**.  

3.  Select the **Prices Including VAT** row, choose **View**, choose **Properties**, and then verify that the [IncludeCaption Property](IncludeCaption-Property.md) is set to **No**. Save and compile the report.  

4.  On the **View** menu, choose **Layout**.  

5.  Right-click the cell that contains the Prices Including VAT value in the Sales Header item, and then choose **Expression**.  

6.  Delete the expression in the **Set expression for: Value** box.  

7.  In the **Expression** window, in the **Category** box, select **Fields\(DataSet\_Results\)**, and then in the **Values** box, double-click **F\_Prices\_Including\_VAT**.  

8.  Verify that the **Set expression for: Value** box contains the following expression: `=Fields!F_Prices_Including_VAT.Value`. Choose the **OK** button.  

#### To format the amount values  

1.  In the table that contains the Customer Ledger Entry data, select the cell that contains the **Amount** field.  

2.  In the **Properties** pane, locate the **Format** property, select the drop-down list, and then choose **Expression** to open the **Expression** window.  

3.  In the **Category** box, select **Fields\(DataSet\_Results\)**, and then in the **Values** box, double-click **Amount\_CustLedgerEntryFormat**.  

4.  Verify that the **Set expression for: Value** box contains the following expression: `=Fields!Amount_CustLedgerEntryFormat.Value`. Choose the **OK** button.  

5.  Repeat steps 1 through 4 and format the cells that contain Amount values as show in the following table. Make sure that you double-click the appropriate field in the **Values** box and verify that the **Set expression for: Value** box contains the expression for appropriate field.  

    |Table|Field|Fields\(DataSet\_Results\) Value to double-click|Set expression for: Value box|  
    |-----------|-----------|-------------------------------------------------------|-----------------------------------|  
    |Customer Ledger Entry|Original Amt. \(LCY\)|OriginalAmtLCY\_CustLedgerEntryFormat|=Fields\!OriginalAmtLCY\_CustLedgerEntryFormat.Value|  
    |Customer Ledger Entry|Remaining Amt.\(LCY\)|RemainingAmtLCY\_CustLedgerEntryFormat|=Fields\!RemainingAmtLCY\_CustLedgerEntryFormat.Value|  
    |Detailed Customer Ledger Entry|Amount \(LCY\)|AmountLCY\_DetailedCustLedgEntryFormat|=Fields\!AmountLCY\_DetailedCustLedgEntryFormat.Value|  
    |Detailed Customer Ledger Entry|Debit Amount \(LCY\)|DebitAmountLCY\_DetailedCustLedgEntryFormat|=Fields\!DebitAmountLCY\_DetailedCustLedgEntryFormat.Value|  
    |Detailed Customer Ledger Entry|Credit Amount \(LCY\)|CreditAmountLCY\_DetailedCustLedgEntryFormat|=Fields\!CreditAmountLCY\_DetailedCustLedgEntryFormat.Value|  
    |Sales Header|Amount|Amount\_SalesHeaderFormat|=Fields\!Amount\_SalesHeaderFormat.Value|  

    > [!NOTE]  
    >  The field that displays the total amount uses the format of the **Amount** field in the **Customer Ledger Entry** table.  

#### To hide zero decimal values  

1.  Right-click the cell that displays the amount in the Sales header item, choose **Expression**, in the **Set expression for: Value** box, replace the expression with following expression: `=Code.BlankZero(Fields!Amount_SalesHeader.Value)`. The `Code.BlankZero()` function hides decimal values that are zero.  

2.  Repeat step 1 to apply the `Code.BlankZero()` function to all the amount fields.  

## Formatting the Report Layout  
 Viktor will format the report to make it visually appealing and he will resize the cell to make the values readable.  

#### To format the report layout  

1.  Select the list control, in the **Properties** pane, under **Fill** set the **BackgroundColor** property to **No Color**.  

2.  Select all the rows in the customer item table and then set the **BackgroundColor** property to **No Color**.  

3.  Repeat step 2 and set the **BackgroundColor** property of all rows, for all tables, to **No Color**.  

4.  Ensure that the size of the list control and all tables do not exceed the width of the page.  

5.  Resize the table columns and rows so that the values in the fields fit in the table cells.  

6.  Drag a text box from the **Toolbox** to the header section of the report, right-click the text box, and then choose **Text Box Properties**.  

7.  In the **Text Box Properties** window, choose the **General** tab. In the **Value** field, enter a title for the report. For example, you can enter **Report From Multiple Tables**.  

8.  Under **Sizing options**, verify that the **Allow height to increase** option is selected, and then choose the **OK** button.  

9. Select the text box that contains the title that you just created. In the **Properties** pane, expand **Font**, set the **FontSize** property to **14pt**, and then set the **FontWeight** property to **Bold**.  

10. Select the table that contains the customer data. In the **Properties** pane, expand the **Padding** node, and then verify that **Left**, **Right**, **Top** and **Bottom** properties are set to 0.  

11. Repeat step 10 to set the padding for the tables that contain the Cust. Ledger Entries and Sales Header items.  

12. In the **Properties** pane, set the properties for the controls and elements, as shown in the following table.  

    |Control or element|BoarderStyle|FontFamily|FontSize|FontWeight|  
    |------------------------|------------------|----------------|--------------|----------------|  
    |Row that contains the Cust. Ledger Entry captions|Bottom - Solid|Not applicable|Not applicable|Not applicable|  
    |All controls on the report|Not applicable|Segoe UI|8pt|Not applicable|  
    |All caption cells|Not applicable|Not applicable|Not applicable|Bold|  
    |All data cells|Not applicable|Not applicable|Not applicable|Normal|  

13. Select the page header. In the **Properties** pane, expand the **General** node, and then set the **Height** property to **1.5in** or **3.8cm**.  

14. In the **Properties** pane, set the **Location** properties for the controls as shown in the following table.  

    |Control|Top|Left|  
    |-------------|---------|----------|  
    |Table that contains the Cust. Ledger Entries data.|0.8in  or 1,9cm|Not applicable|  
    |Table that contains the Sales Header data.|2.08in or 6cm|Accept the default|  

15. Select an area in the **List control**, in the **Properties** pane, expand **Size**, and then set the **Height** property to **2.85in** or **7.24cm**.  

16. Select all the rows except the footer row in the **Cust. Ledger Entries**, and then set the **BackgroundColor** property to **\#f0f0f0**.  

17. Repeat step 16 to set the **BackgroundColor** property for all rows in the table that contain the **Sales Header** item.  

18. In the table that contains the **Cust. Ledger Entries** item, select the columns that contain the amount fields, captions, and the total fields. Set the **TextAlign** property to **Right**.  

19. Repeat step 18 to set the **TextAlign** property for the **Prices Including VAT** column in the **Sales Header** item.  

20. In the table that contains the **Cust. Ledger Entries** table, select the merged cells that contain the CustomerNo caption and field value, and then set the **TextAlign** property to **Center**.  

21. Repeat step 20 and set the **TextAlign** property for the merged cell that contains the Description caption and field value.  

22. Select the Total caption and Total Amount cells, expand the **Font** property, and then set **FontWeight** to **Bold**.  

23. Select all cells that contain an amount field, in the **General** node, make sure that the **CanGrow** property is set to **True**.  

24. Select the last row in the **Cust. Ledger Entry** table, expand the **BorderColor** property node, and set the **Top** property to **Black**.  

## Building and Running the Report  
 You will now build and run the report. Note all of the features that Viktor has added to the report.  

#### To build and run the report  

1.  On the **Build** menu, choose **Build Web Site** to build the project. Review the **Output** pane, make sure that there are no build errors, and then close Visual Studio.  

2.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], in Report Dataset Designer, select a DataItem. In.the dialog box that appears that states that the layout of the report is changed by another application, choose the **Yes** button.  

3.  On the **File** menu, choose **Save** and in the **Save** window, make sure that **Compile** is selected. Choose the **OK** button.  

4.  In Object Designer, select the report that you just formatted \(50001\), and then choose the **Run** button to run the report.  

5.  On the request page, select the **Show Customer Details** option, and then choose the **Preview** button to view the report.  

     The following illustration shows an example of the completed and formatted report.  

     ![Formatted report.](media/MicrosoftDynamicsNAV_FormatedReport.jpg "MicrosoftDynamicsNAV\_FormatedReport")  

## See Also  
 [Walkthrough: Designing a Report from Multiple Tables](Walkthrough--Designing-a-Report-from-Multiple-Tables.md)   
 [Report Design Walkthroughs](Report-Design-Walkthroughs.md)
