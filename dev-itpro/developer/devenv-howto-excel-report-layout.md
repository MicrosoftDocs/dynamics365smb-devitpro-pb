---
title: "Creating an Excel Layout Report"
description: "Describes the steps involved in creating a report that uses an Excel layout."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 04/01/2022
ms.reviewer: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Creating an Excel Layout Report

[!INCLUDE[2022_releasewave1](../includes/2022_releasewave1.md)]

When you create a new report, there are two main tasks to consider. First, you define the report dataset of data items and columns. Then, you design the report layout. With the Excel report layout, you can create a basic report that prints a dataset and leave it up to the end-user to further modify it by using the full palette of capabilities in Excel such as sliders, diagrams, charts, pivot tables, and PowerQuery to design the report. This offers flexibility and freedom for the end-user, being able to change the look and feel of a report, adding additional views, filtering, and sorting on data. Such a layout designed by the end-user, can be imported and used as a new layout. 

For more information about the report object, see [Report Object](devenv-report-object.md) and for report extension objects, see [Report Extension Object](devenv-report-ext-object.md).

## How Excel layouts work
When designing an Excel layout, you need to know how the layout is connected to the dataset definition (also known as the _data contract_), how the layout file is validated when importing it into [!INCLUDE[prod_short](../includes/prod_short.md)], and how the [!INCLUDE[prod_short](../includes/prod_short.md)] server merges the layout with data when running the report.

### The Excel layout data contract
Every Excel layout file must have a worksheet called _Data_. This worksheet has one purpose: defining which metadata fields from the the dataset definition of the report object the layout uses. This is sometimes also called the _data contract_ between the layout file and the report dataset definition. The data contract consists of the following rules:
1. metadata fields must be written in the first row of the _Data_ worksheet, one in each cell.
2. all metadata fields in the _Data_ worksheet must exist as metadata fields in the dataset definition of the report object.
3. you cannot rename fields in the _Data_ worksheet (they must match metadata fields in the dataset definition).
4. you do not have to use all metadata fields in the dataset definition in the _Data_ worksheet.

> [!TIP]  
> When developing Excel layouts, you can add demo data to the _Data_ worksheet to make it easier to see the end result when the report is rendered with the layout. The data is removed when importing it to [!INCLUDE[prod_short](../includes/prod_short.md)] but if you include Excel layouts in an app/extension, you might want to keep the demo data there for easier troubleshooting later.

For more information about the data contract, see [Understanding Excel layouts](https://learn.microsoft.com/en-us/dynamics365/business-central/ui-excel-report-layouts?tabs=any-report#understanding-excel-layouts).


### Validating an Excel layout
When importing an Excel layout as part of an app or when a user uploads an Excel layout file, the [!INCLUDE[prod_short](../includes/prod_short.md)] server does the following
1. loads the Excel layout file and validates if the file is indeed an Excel file (pptx) and that it is not password protected. If the file is not a valid Excel file, the [!INCLUDE[prod_short](../includes/prod_short.md)] server rejects the layout.
2. reads the metadata fields present in the _Data_ worksheet (the content of the data contract). If no _Data_ worksheet exists, the [!INCLUDE[prod_short](../includes/prod_short.md)] server rejects the layout.
3. removes any other data present in the _Data_ worksheet.
4. validates if the metadata fields present in the _Data_ worksheet are all present as metadata fields in the dataset definition of the report object (checking if the data contract is valid). If this is not the case, the [!INCLUDE[prod_short](../includes/prod_short.md)] server rejects the layout.


### Running a report with an Excel layout
When running a report with an Excel layout, the [!INCLUDE[prod_short](../includes/prod_short.md)] server does the following:
1. generates the dataset as specified in the dataset definition in the report object and modified by the filters and options from the request page
2. loads the Excel layout file
3. inserts the data into the _Data_ table in the _Data_ worksheet in the Excel layout file
4. provides the merged Excel workbook to the user for download or view in Excel online if this has been enabled by the tenant administrator. For more information about viewing Excel outputs in Excel online, please see [Save Excel workbooks and report files in OneDrive](https://learn.microsoft.com/en-us/dynamics365/business-central/across-onedrive-overview#save-excel-workbooks-and-report-files-in-onedrive)


## Drillthrough to Business Central from an Excel layout
With drillthrough in an Excel layout, you can create hyperlinks back into [!INCLUDE[prod_short](../includes/prod_short.md)] from Excel cells. When the report reader click the cell, they drill through to the target page to get details that are filtered to that context. To implement a drillthrough link, you need to know which page to open and also construct which filters to apply to that page. You filter the data that is displayed in the page by using the filter URL parameter. The filter parameter let you display specific records from the underlying table of the page. 

For more information, see [Web URL syntax](devenv-web-client-urls).

## Using fonts in Excel layouts
The online version of Business Central contains pre-installed fonts on the servers that can be used when generating reports. You can use any of these fonts in your layout.

For more information, see [Available Fonts in Business Central online](https://learn.microsoft.com/en-us/dynamics365/business-central/ui-fonts)



## Create a simple Excel layout report
The following steps will show how to create a basic report based on an Excel layout. The example also illustrates how compilation triggers a starter template for the Excel layout. If an existing layout is referenced with the `LayoutFile` property the layout is validated based on the schema of the report dataset. 

The example extends the **Contact List** report only by adding a `rendering` section, which adds a new Excel layout to the list of options for printing the **Contact List** report. The layout does not yet exist, but will be generated based on the *existing report dataset* for the report and can then be modeled by using Excel reporting capabilities. The example uses the [Type Property](properties/devenv-type-property.md) to set the type of report to `Excel` and it uses the [LayoutFile Property](properties/devenv-layoutfile-property.md) to specify the name of the file that contains the Excel layout. If this is not present, it will be generated.

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
    > [!TIP]  
    > Another way of generating the data set to build a layout on, is to run a report in Business Central and on the request page, then choose the **Microsoft Excel Document (data only)** option, and you will get the same starting point. Then you can design the layout, save as a new layout, and include in your AL project.
1. Right-click the generated `MyExcelContactList.xlsx` file, and choose **Reveal in File Explorer**. This will open File Explorer.
1. Choose the `MyExcelContactList.xlsx` file in File Explorer and open it in Excel.  
Excel now opens and you should see the dataset of the Contact List. **Note** that it is important to not change the dataset in Excel, only the layout.
1. In Excel, go to the **Insert** tab, choose **PivotTable**, and then choose **From Table/Range** with the default options of **Data** and **New worksheet**. Choose the **OK** button.
1. From the **PivotTable Fields** pane to the right, choose a suitable number of fields to add to the report.
1. Save the report and close the Excel window.
1. Back in Visual Studio Code, press **Ctrl+F5** to compile and launch [!INCLUDE [prod_short](includes/prod_short.md)].  
1. Now, to choose the changed report layout, search for the **Report Layout Selection** page, and then search for the **Contact List** (ID 5050) report. 
1. In the **Layout Type** column, choose **Excel**, and then choose the **Run Report** from the action bar.
1. On the request page, choose the **Download** button, and once the report is downloaded, open it.
1. In Excel, you should now see the Contact List report as a pivot table, sorted as you specified in step 6.

> [!NOTE]  
> If the report layout is not generated, open the `settings.json` from Visual Studio Code. Use **Ctrl+Shift+P**, then choose **Preferences: Open User Settings**, locate the **AL Language extension**. Under **Compilation Options**, choose **Edit in settings.json** and add the following line:  
>
>```json
>"al.compilationOptions": {
>   "generateReportLayout": true
> }
>```

It is possible to specify multiple layouts for a report. For more information, see [Defining Multiple Report Layouts](devenv-multiple-report-layouts.md).

## See also

[Report Design Overview](devenv-report-design-overview.md)  
[Report Object](devenv-report-object.md)
[Creating a Word Layout Report](devenv-howto-report-layout.md)  
[Creating an RDL Layout Report](devenv-howto-rdl-report-layout.md)  
[Defining Multiple Report Layouts](devenv-multiple-report-layouts.md)  
[ExcelLayout Property](properties/devenv-excellayout-property.md)  
[LayoutFile Property](properties/devenv-layoutfile-property.md)  
[Save Excel workbooks and report files in OneDrive](https://learn.microsoft.com/en-us/dynamics365/business-central/across-onedrive-overview#save-excel-workbooks-and-report-files-in-onedrive)   
[Understanding Excel layouts](https://learn.microsoft.com/en-us/dynamics365/business-central/ui-excel-report-layouts?tabs=any-report#understanding-excel-layouts)   
[Available Fonts in Business Central online](https://learn.microsoft.com/en-us/dynamics365/business-central/ui-fonts)   
