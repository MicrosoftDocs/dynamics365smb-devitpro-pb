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
Excel now opens and you can see the dataset of the 
1. Back in Visual Studio Code, press **Ctrl+F5** to compile and launch [!INCLUDE [prod_short](includes/prod_short.md)].
1. Now, search for **Customer List** report, and run the report in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)]. 
1. Choose **Excel** on the request page of the report.


## See also

[Report Design Overview](devenv-report-design-overview.md)  
[Report Object](devenv-report-object.md)  
[Creating a Word Layout Report](devenv-howto-report-layout.md)  
[Creating an RDL Layout Report](devenv-howto-rdl-report-layout.md)  
[DefaultRenderingLayout Property](developer/properties/devenv-defaultrenderinglayout-property.md)  
[ExcelLayout Property](developer/properties/devenv-excellayout-property.md)  
[LayoutFile Property](developer/properties/devenv-layoutfile-property.md)  
[MimeType Property](developer/properties/devenv-mimetype-property.md)  
[Summary Property](developer/properties/devenv-summary-property.md)  
[SummaryML Property](developer/properties/devenv-summaryml-property.md)