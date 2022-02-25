---
title: "Creating an Excel Layout Report"
description: "Describes the steps involved in creating a report that uses an Excel layout."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 02/04/2022
ms.reviewer: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Creating an Excel Layout Report

When you create a new report, there are two tasks main tasks. First, you define the report dataset of data items and columns. Then, you design the report layout. These steps will show how to create a report based on an Excel layout. For more information about the report object, see [Report Object](devenv-report-object.md) and for report extension objects, see [Report Extension Object](devenv-report-ext-object.md).

## Create a simple Excel layout report

The following example extends the **Contact List** report only by adding a `rendering` section, which adds a new Excel layout to the list of options for printing the **Contact List** report. The layout does not yet exist, but will be generated based on the existing report dataset for the report and can then be modeled by using Excel reporting capabilities. The example uses the [Type Property](properties/devenv-type-property.md) to set the type of report to `Excel` and it uses the [LayoutFile Property](developer/properties/devenv-layoutfile-property.md) to specify the name of the file that contains the Excel layout. If this is not present, it will be generated.

1. Create a new report extension of the **Contact List** page by adding the following lines of code: 

    ```al
    reportextension 50101 MyExtContactList extends "Contact - List"
    {
        rendering
        {
            layout(LayoutExcel)
            {
                Type = Excel;
                LayoutFile = 'MyExcelContactList.xlsx';
            }
        }
    }
    ```

2. Now, press **Ctrl+Shift+P**, and then choose **AL: Package**. The `MyExcelContactList.xlsx` will be generated, as you can see in the right pane of Visual Studio Code. 
1. Right-click the generated `MyExcelContactList.xlsx` file, and choose **Reveal in File Explorer**. This will open File Explorer.
1. Choose the `MyExcelContactList.xlsx` file in File Explorer and open it in Excel.  
Excel now opens and you should see the dataset of the Contact List.
1. In Excel, go to the **Insert** tab, choose **PivotTable**, and then choose **From Table/Range** with the default options of **Data** and **New worksheet**. Choose the **OK** button.
1. From the **PivotTable Fields** pane to the right, choose a suitable number of fields to add to the report.
1. Save the report and close the Excel window.
1. Back in Visual Studio Code, press **Ctrl+F5** to compile and launch [!INCLUDE [prod_short](includes/prod_short.md)].  
1. Now, to choose the changed report layout, search for the **Report Layout Selection** page, and then search for the **Contact List** (ID 5050) report. 
1. In the **Layout Type** column, choose **Excel**, and then choose the **Run Report** from the action bar.
1. On the request page, choose the **Download** button, and once the report is downloaded, open it.
1. In Excel, you should now see the Contact List report as a pivot table, sorted as you specified in step 6.


## See also

[Report Design Overview](devenv-report-design-overview.md)  
[Report Object](devenv-report-object.md)  
[Creating a Word Layout Report](devenv-howto-report-layout.md)  
[Creating an RDL Layout Report](devenv-howto-rdl-report-layout.md)  
[Defining multiple report layouts](devenv-multiple-report-layouts.md)  
[ExcelLayout Property](developer/properties/devenv-excellayout-property.md)  
[LayoutFile Property](developer/properties/devenv-layoutfile-property.md)  
