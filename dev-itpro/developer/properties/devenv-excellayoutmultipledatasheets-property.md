---
title: "ExcelLayoutMultipleDataSheets property"
description: "Sets whether an Excel layout will render to multiple data sheets or in a single sheet named Data."
ms.author: solsen
ms.date: 02/18/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# ExcelLayoutMultipleDataSheets Property
> **Version**: _Available or changed with runtime version 12.0._

Sets whether an Excel layout will render to multiple data sheets or in a single sheet named Data. 
    
Multiple sheets will be named Data_DataItemName, where DataItemName is the dataitem name used in the report design. 
There will be one sheet per root dataitem in the report object. The default is to use a single sheet for all data.
    

## Applies to
-   Report
-   Report Layout

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

Starting in 2025 release wave 1 (runtime 15), the `ExcelLayoutMultipleDataSheets` property is available on individual report layouts. It lets you override the global property defined on the report object. If the `ExcelLayoutMultipleDataSheets` property isn't used or is set to `false` on the report object, you can add Excel layouts that use the `ExcelLayoutMultipleDataSheets` feature without breaking existing layouts that users added. This cabability is useful for adding new Excel layouts to a report using the structure that `ExcelLayoutMultipleDataSheets` provides. Learn more in [Creating an Excel layout report](../devenv-howto-excel-report-layout.md#excel-layout-data-contract-in-2023-release-wave-2-and-later-versions).


## Example

This code demonstrates how to use the `ExcelLayoutMultipleDataSheets` property. Although the `ExcelLayoutMultipleDataSheets` property is `false` on the report object, the rendered report in Excel includes worksheets for `DataItem1` and `DataItem2` because the `ExcelLayoutMultipleDataSheets` property is `true` in the `layout` definition.  

```al
report 50100 MyReport
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = MyLayout;
    ExcelLayoutMultipleDataSheets = false;

    dataset
    {
        dataitem(DataItem1; Table1)
        {
            column(Column1; Column1)
            {

            }
        }
        dataitem(DataItem2; Table2)
        {
            column(Column2; Column2)
            {

            }
        }
    }

    rendering
    {
        layout(MyLayout1)
        {
            Type = Excel;
            LayoutFile = 'mySpreadsheet.xlsx';
            ExcelLayoutMultipleDataSheets = true;
        }
    }

}
```

## Related information

[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  