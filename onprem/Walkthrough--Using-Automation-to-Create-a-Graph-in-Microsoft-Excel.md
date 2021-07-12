---
title: "Walkthrough: Using Automation to Create a Graph in Microsoft Excel"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: e95ed58f-036b-49f9-b9a7-8fe3958f77fd
caps.latest.revision: 24
manager: edupont
---
# Walkthrough: Using Automation to Create a Graph in Microsoft Excel
In this walkthrough, you will transfer data from the **G/L Entry** table to Microsoft Excel and create a graph. This example shows how to handle enumerations by creating a graph in Excel that shows the distribution of personnel expenses by departments. In the chart of accounts, you can see that Total Personnel Expenses is the total of accounts 8700 to 8790. In the **Dimension Value** table, you can see that there are three departments: ADM, PROD, and SALES. You will create a codeunit that retrieves this data from the **G/L Entry** table, transfers it to Excel, and creates a graph that is similar to the one that is shown in the following figure:  
  
 ![Excel graph.](media/NAVAutomationExcelGraph.PNG "NAVAutomationExcelGraph")  
  
 You will run the codeunit directly from Object Designer. In a real application, you would call it from an appropriate place, such as from a menu in the chart of accounts window.  
  
## About This Walkthrough  
 This walkthrough illustrates the following tasks:  
  
-   Creating a codeunit that declares the Automation variables that are required for using Excel Automation.  
  
-   Adding C/AL code to the codeunit to run the Automation object that opens Excel.  
  
-   Adding C/AL code to the Automation codeunit to transfer data from a table record to Excel.  
  
-   Adding C/AL code that creates a graph in Excel.  
  
### Prerequisites  
 To complete this walkthrough, you will need:  
  
-   [!INCLUDE[navnowlong](includes/navnowlong_md.md)] with a developer license.  
  
-   The CRONUS International Ltd. demo data company.  
  
-   Microsoft Excel 2013 or Microsoft Excel 2010.  
  
-   The language in the regional settings of your computer matches the language version of Microsoft Excel.  
  
     This is a known issue. For more information, see [Bug: "Old Format or invalid type library"](https://go.microsoft.com/fwlink/?LinkID=250990) in the Microsoft Support site.  
  
## Creating the Codeunit and Declaring Variables  
 To implement Automation in a codeunit, you define the Automation variables. To define an Automation variable, you specify an Automation server and the Automation object.  
  
#### To create the codeunit and declare variables  
  
1.  In Object Designer, choose **Codeunit**, and then choose the **New** button to create a new codeunit.  
  
2.  On the **View** menu, choose **C/AL Globals**.  
  
3.  On the **Variables** tab, add the following variables:  
  
    > [!NOTE]  
    >  For the Automation data type variables, the subtype **Microsoft Excel 15.0/14.0 Object Library** defines the Automation server, and the class specifies the Automation object of the **Microsoft Excel 15.0/14.0 Object Library**.  
  
    |Name|Data type|Subtype|Class|  
    |----------|---------------|-------------|-----------|  
    |GLEntry|Record|G/L Entry||  
    |xlApp|Automation|Microsoft Excel 15.0 or 14.0 Object Library|Application|  
    |xlBook|Automation|Microsoft Excel 15.0 or 14.0 Object Library|Workbook|  
    |xlSheet|Automation|Microsoft Excel 15.0 or 14.0 Object Library|Worksheet|  
    |xlChart|Automation|Microsoft Excel 15.0 or 14.0 Object Library|Chart|  
    |xlRange|Automation|Microsoft Excel 15.0 or 14.0 Object Library|Range|  
  
4.  Close the **C/AL Globals** window.  
  
## Adding the Code  
 Now you add the code for the codeunit.  
  
#### To add the code  
  
1.  In the C/AL Editor, set the key for the **G/L Entry** table, and then use `SETFILTER` to select the accounts by adding the following code to the **OnRun** trigger.  
  
    ```  
    GLEntry.SETCURRENTKEY("G/L Account No.","Business Unit Code",   
    "Global Dimension 1 Code","Global Dimension 2 Code","Posting Date");  
    GLEntry.SETFILTER("G/L Account No.",'8700..8790');  
    ```  
  
2.  Create an instance of Excel by adding the following code.  
  
    ```  
    CREATE(xlApp, FALSE, TRUE);  
    ```  
  
3.  Add a new workbook to Excel.  
  
    ```  
    xlBook := xlApp.Workbooks.Add(-4167);  
    xlSheet:= xlApp.ActiveSheet;  
    xlSheet.Name := 'Personnel Expenses';  
    ```  
  
     The following describes the code:  
  
    -   In the first line, you use the **Add** method of the **Workbooks** collection to return a new workbook. The attribute **-4167** is the enumerator value of worksheets as they apply to Workbook objects. For more information, see [About the Enumerator Value](#AboutEnumerator).  
  
    -   In the second line, you use the **ActiveSheet** property of the Application class to ensure that what is done next affects the active sheet of the new workbook.  
  
    -   In the third line, you use the **Name** property to name the sheet.  
  
###  <a name="AboutEnumerator"></a> About the Enumerator Value  
 In the preceding procedure, the **Add** method includes the attribute **-4167**. In the Microsoft Excel Visual Basic Help, the **Add** method as it applies to the Workbooks object takes one **Template** argument, which is of type VARIANT. The description in the Help says:  
  
 If this argument is a constant, the new workbook contains a single sheet of the specified type. Can be one of the following: XlWBATemplate constants: xlWBATChart, xlWBATExcel4IntlMacroSheet, xlWBATExcel4MacroSheet, or xlWBATWorkSheet.  
  
 For more information, see Workbooks.Add Method \(Excel\), [https://go.microsoft.com/fwlink/?LinkId=404331](https://go.microsoft.com/fwlink/?LinkId=404331).  
  
 Instead of passing xlWBATWorkSheet as the **Template** argument, you are passing the number -4167. In this case, the **Template** argument, which is of type VARIANT, is an enumeration. Enumerations are either USERDEF types or not. This is not a USERDEF type, so it looks like a VARIANT in the C/AL Symbol Menu. You have to look in the Microsoft Excel Visual Basic Help to figure out that it is actually an enumeration. Arguments can be constants with names like xl\* in Excel, wd\* in Word, and ol\* in Outlook. In [!INCLUDE[navnow](includes/navnow_md.md)], you cannot use the symbolic name xlWBATWorkSheet. You have to use the enumerator -4167. The following procedure describes how you can find an enumerator value if you need to.  
  
##### To find an enumerator value  
  
1.  Open Excel, and on the **Developer** tab, choose **Visual Basic**.  
  
    > [!NOTE]  
    >  If you do not see the **Developer** tab, then in the **File** menu, choose  **Options**, and then choose **Customize the Ribbon**. Under **Customize the Ribbon**, choose **Developer**, and then choose **OK**.  
  
2.  On the **View** menu of Visual Basic Editor, choose **Object Browser**.  
  
3.  In the Project/Library list in the list box in the upper-left corner of the Object Browser, select **Excel**.  
  
4.  In the **Classes** list, select **XlWBATemplate**.  
  
5.  In the **Members of ‘XlWBATemplate’** list, select **xlWBATWorkSheet**. You can see the value in the information pane at the bottom of the Object Browser. In the following example, the value is **-4167..**  
  
     **Const xlWBATWorksheet = -4167 \(&HFFFFEFB9\)**  
  
## Transferring Data  
 To transfer the data, you must calculate the data and transfer the results of the calculation.  
  
#### To transfer data  
  
1.  In the C/AL Editor, on the codeunit, use SETRANGE to filter the entries in the **G/L Entry** table on the **Global Dimension 1 Code** field. The first department is ADM \(Administration\). Then, you use CALCSUMS\(Amount\) to get the sum for the ADM department. To do this, add the following code.  
  
    ```  
    GLEntry.SETRANGE("Global Dimension 1 Code", 'ADM');  
    GLEntry.CALCSUMS(Amount);  
    ```  
  
2.  To transfer the data to Microsoft Excel, add the following code.  
  
    ```  
    xlSheet.Range('A2').Value := 'Administration';  
    xlSheet.Range('A3').Value := GLEntry.Amount;  
    ```  
  
3.  Add this code for the PROD and SALES departments:  
  
    ```  
    GLEntry.SETRANGE("Global Dimension 1 Code", 'PROD');  
    GLEntry.CALCSUMS(Amount);  
    xlSheet.Range('B2').Value := 'Production';  
    xlSheet.Range('B3').Value := GLEntry.Amount;  
    GLEntry.SETRANGE("Global Dimension 1 Code", 'SALES');  
    GLEntry.CALCSUMS(Amount);  
    xlSheet.Range('C2').Value := 'Sales';  
    xlSheet.Range('C3').Value := GLEntry.Amount;  
    ```  
  
## Creating the Graph  
 The final step is to create the graph. You will use the ChartWizard method to create a 3-D pie chart. This is a fast and simple way to do it. You can more tightly control the design of the graph by setting it up using the methods and properties of the various Chart objects, such as ChartArea and Legend.  
  
#### To create the graph  
  
1.  In the C/AL Editor, on the current codeunit, define a range for the data in the graph.  
  
    ```  
    xlRange := xlSheet.Range('A2:C3');  
    ```  
  
2.  Add a new chart sheet and give it a name.  
  
    ```  
    xlChart := xlBook.Charts.Add;  
    xlChart.Name := 'Personnel Expenses - Graph';  
    ```  
  
3.  Create the graph.  
  
    ```  
    xlChart.ChartWizard(xlRange,-4102,7,1,1,0,0,'Personnel Expenses');   
    ```  
  
     The following table describes the optional arguments that are used in the **ChartWizard** method.  
  
    |Argument|Description|Value in method call|  
    |--------------|-----------------|--------------------------|  
    |Source|The range that contains the source data for the new chart.|xlRange – The object returned by xlSheet.Range\(‘A2:C3’\).|  
    |Gallery|The chart type.|-4102 – The enumerator for the xl3DPie XlChartType enumeration.|  
    |Format|The option number for the built-in auto formats.|7|  
    |PlotBy|An integer specifying whether the data for each series is in rows or columns.|1 – The enumerator for the xlRows XlRowCol enumerator.|  
    |CategoryLabels|An integer specifying the number of rows or columns within the source range that contains category labels.|1 – There is one row with category labels \(the department names\).|  
    |SeriesLabels|An integer specifying the number of rows or columns within the source range that contains series labels.|0 – There are no series labels in your data.|  
    |HasLegend|TRUE to include a legend.|0|  
    |Title|VARIANT with the title of the chart.|You pass a string such as ‘Personnel Expenses’.|  
  
4.  Make Excel visible by adding the following code.  
  
    ```  
    xlApp.Visible := TRUE;  
    ```  
  
     Excel produces a General Protection Fault error when you close a new Excel worksheet that is created when Excel is invisible. To resolve this, you can make Excel visible immediately after you create a new worksheet. You can also make Excel visible just before you create a new Excel worksheet and then make it invisible again immediately after creating the new Excel worksheet. In this case, you would add the following code.  
  
    ```  
    xlApp.Visible := TRUE;  
    xlBook := xlApp.Workbooks.Open(FileName);  
    xlApp.Visible := FALSE;  
    ```  
  
## Saving and Running the Codeunit  
 You can test the codeunit for creating the graph by running the codeunit from Object Designer.  
  
#### To save and run a codeunit  
  
1.  On the **File** menu, choose **Save**.  
  
2.  In the **Save As** window, enter an ID and name, and then choose the **OK** button.  
  
3.  In Object Designer, select the codeunit, and then choose the **Run** button.  
  
     The Microsoft Excel graph should appear.  
  
    > [!NOTE]  
    >  If you get an error states **Old format or invalid type library**, then make sure that the language in the regional settings of your computer matches the language version of Microsoft Excel. For more information, see [Bug: "Old Format or invalid type library"](https://go.microsoft.com/fwlink/?LinkID=250990).  
  
## See Also  
 [How to: Create an Automation Controller](How-to--Create-an-Automation-Controller.md)   
 [Walkthrough: Using Automation to Write a Letter in Microsoft Office Word](Walkthrough--Using-Automation-to-Write-a-Letter-in-Microsoft-Office-Word.md)