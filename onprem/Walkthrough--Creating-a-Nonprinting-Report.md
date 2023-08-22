---
title: "Walkthrough: Creating a Nonprinting Report"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 2f99ed56-44ef-40fa-951e-9990443df153
caps.latest.revision: 18
---
# Walkthrough: Creating a Nonprinting Report
In this walkthrough, you will create a non-printing report. A non-printing report is a report that only does processing without actually outputting or printing a report. This type of processing is usually achieved by using codeunits. You use the [ProcessingOnly Property](ProcessingOnly-Property.md) of the report to make the report non-printing without much programming. This functionality also gives you access to the request page and enables the user to filter the data before you run the report. Instead of writing C/AL code to open tables and retrieve records, you only have to define a data item.  
  
## About this Walkthrough  
 This walkthrough shows you how to create a non-printing report that enable a user to adjust the prices in the item table. The user enters the factor by which to adjust the prices on the request page. The user can use the filters on the request page to filter the data and apply the adjustment to only the filtered data.   
This walkthrough illustrates the following tasks:  
  
-   Defining a data model.  
  
-   Declaring variables.  
  
-   Adding controls to the request page.  
  
-   Using triggers to process the data.  
  
-   Testing the report.  
  
### Prerequisites  
 To complete this walkthrough, you will need:  
  
-   [!INCLUDE[navnowlong](includes/navnowlong_md.md)] installed with a developer license.  
  
-   The [!INCLUDE[demolong](includes/demolong_md.md)].  
  
## Defining the Data Model  
 When you create a new report, you must define where the data that the report will display should come from. You define the dataset in [!INCLUDE[navnow](includes/navnow_md.md)] Report Dataset Designer.This report has one data item that is based on the **Item** table \(table 27\).  
  
#### To define the data model  
  
1.  In the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)], on the **Tools** menu, choose **Object Designer**.  
  
2.  In Object Designer, choose **Report**, and then choose the **New** to open the Report Dataset Designer.  
  
3.  In the first row, in the **Data Source** field, choose the up arrow to open the **Table List** window. In the **Table List** window, select the **Item** table \(table 27\), and then choose the **OK** button.  
  
4.  Verify that the **Data Type** column is set to **DataItem**.  
  
5.  On the **View** menu, choose **Field Menu**.  
  
6.  In the **Field Menu** window, select all the fields and then choose the **OK** button.  
  
     You can select all the fields by selecting the upper-left corner of the window or by holding down the Ctrl key and selecting all the fields.  
  
7.  At the prompt, choose **Yes** to add the selected fields.  
  
8.  Select the **DataItem** row, and on the **View** menu, select **Properties**.  
  
9. In the **Properties** window, select the **DataItemTableView** property, and in the **Value** field, choose the **AssistEdit** button to open the **Table View** window.  
  
10. In the **Key** field, select the **No.** key and choose the **OK** button.  
  
11. In the **Order** drop-down list, select **Ascending**. Choose the **OK** button to close the window.  
  
12. In the **Properties** window, select the **ReqFilterFields** property, and in the **Value** field, choose the **AssistEdit** button to open the **Field List** window.  
  
     You will add filters that will enable users to filter the data based on the **No.** field or the **Inventory Posting Group** field or both.  
  
13. In the first row, choose the up arrow to open the **Item-Field List** window and select the **No.** field, and then choose the **OK** button.  
  
14. In the second row, choose the up arrow to open the **Item-Field List** window and select the **Inventory Posting Group** field, and then choose the **OK** button.  
  
     You will now set the property that will make the report nonprinting. Later, you will add code to triggers to do the actual processing.  
  
15. In Report Dataset Designer, select the next empty row. On the **View** menu, choose **Properties** to open the **Properties** window of the report.  
  
16. In the **Properties** window, locate the **ProcessingOnly** property, and in the **Value** column, choose **Yes**.  
  
17. A message that states that the report layout will be deleted appears. Choose **Yes** to delete the layout. On the **File** menu, choose **Save As**.  
  
18. In the **Save As** dialog box, in the **ID** field, enter **50006**, and then in the **Name** text box, enter **Nonprinting Report**.  
  
19. Make sure **Compile** is selected, and then choose the **OK** button.  
  
## Declaring Variables  
 You will now declare the variables you will be using in the code.  
  
#### To declare variables  
  
1.  On the **View** menu, choose **C/AL Globals** and declare the following variables. You will enter the variable name and the data type in the **C/AL Globals** window. The subtype and length are not applicable.  
  
    |Variable name|DataType|  
    |-------------------|--------------|  
    |Window|Dialog|  
    |Adjustment|Decimal|  
    |NewPrice|Decimal|  
  
## Adding Controls to the Request Page  
 You will now add a text box where the user will enter the adjustment factor. By default, the value of the text box is 0.  
  
#### To add a text box control  
  
1.  On the **View** menu, choose **Request Page** to open the Request Options Page Designer.  
  
2.  In the Request Options Page Designer, on the first row, in the **Name** column, enter a name, then in the **Type** column, select **Container**, and then in the **Subtype** column, select **ContentArea**. For example, you can name the container **AdjustmentContainer**.  
  
3.  On the second row, in the **Caption** column, enter **Enter the adjustment factor**, and in the **Type** column, select **Field**. In the **Source Expr** column, choose the **AssistEdit** button to open the **C/AL Symbol Menu** window.  
  
4.  In the **C/AL Symbol Menu** window, select **Adjustment**, the variable you created earlier, and choose the **OK** button. This value will be used as the factor by which the unit price will be adjusted.  
  
5.  Verify that the second row is indented one unit to the right and then close the Request Options Page Designer.  
  
## Using Triggers to Execute Code  
 Now that you have defined the data model and designed the request page, you will add C/AL code to the triggers of the **Item** data item to calculate the actual price adjustment.  
  
#### To use the triggers to execute code  
  
1.  In Report Dataset Designer, select the **DataItem** row.  
  
2.  On the **View** menu, choose **C/AL Code** to open the **C/AL Editor**.  
  
3.  In the OnPreDataItem\(\) trigger, enter the following lines of code:  
  
    ```  
  
    Window.OPEN('Processing item #1#########');  
    If Adjustment = 0 THEN  
      CurrReport.QUIT;  
  
    ```  
  
     The first statement in the `OnPreDataItem` trigger opens a progress window that shows the progress of the report as it is run. Because the report is nonprinting, the usual printing progress window is not shown. If the table is large, the report may run for a while. Therefore, it is a good idea to show the user how the process is progressing.  
  
     The second statement ends the report without doing any processing if the adjustment factor is 0 \(zero\). If the adjustment factor were allowed to be zero, all the prices in the table could be set to zero.  
  
4.  In the `OnAfterGetRecord()` trigger, enter the following lines of code:  
  
    ```  
  
    Window.UPDATE(1,"No.");  
    NewPrice := Adjustment * "Unit Price";  
    VALIDATE("Unit Price", NewPrice);  
    MODIFY;  
  
    ```  
  
     The first statement in the `OnAfterGetRecord` trigger enters the item number in the window when a new record is retrieved. The second statement uses the value stored in the adjustment variable to adjust the unit price of the items and assigns the adjusted price to the *NewPrice* variable. The `VALIDATE` function of the Unit Price field is used to update the price of the items. Any special processing \(for example, updating of related fields\) in the `OnValidate` trigger of the table field is performed. Finally, the `MODIFY` function is used to write the change.  
  
5.  Close the **C/AL Editor** window and save the report.  
  
## Testing the Report  
 You can now test the report.  
  
#### To test the report  
  
1.  In Object Designer, select the report you just created and then choose **Run**. The request page for the report is displayed.  
  
2.  In the **Enter the adjustment factor** text box, enter an adjustment factor. For example, you can enter **10** and then choose **OK**. The window opens and displays the items that are being adjusted. In this case, the unit prices for all the items in the table are adjusted. The report is not displayed and is not printed.  
  
     You can run the **Items** table, look at the unit prices and run to report again using an adjustment factor of 10. If you look at the unit prices in the **Item** table again, you will notice that the unit prices have increased by a multiple of 10. You can also set the filters to select specific records to modify.  
  
## Next Steps  
 You might consider designing a report that has a layout and can be printed. For more information, see [Walkthrough: Designing a Customer List Report](Walkthrough--Designing-a-Customer-List-Report.md).  
  
## See Also  
 [Report Design Walkthroughs](Report-Design-Walkthroughs.md)
