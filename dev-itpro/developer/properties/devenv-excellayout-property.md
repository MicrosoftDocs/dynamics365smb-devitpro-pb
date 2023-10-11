---
title: "ExcelLayout Property"
description: "Sets the Excel layout that is used on a report and returns it as a data stream."
ms.author: solsen
ms.custom: na
ms.date: 10/11/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# ExcelLayout Property
> **Version**: _Available or changed with runtime version 9.0._

Sets the Excel layout that is used on a report and returns it as a data stream.

## Applies to
-   Report
-   Report Extension

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

[!INCLUDE[possible_layouts_note](../includes/include-possible-layouts-note.md)]

## Remarks
[!INCLUDE[single_layouts](../includes/include-single-layout-obsolete.md)]

## Example

The following example shows how to use this property to generate the *MyExcelReport.xlsx* file.

```AL
pageextension 50100 MyExtension extends "Customer List"
{
    trigger OnOpenPage();
    begin
        report.Run(Report::MyExcelReport);
    end;
}

report 50124 MyExcelReport
{
    DefaultLayout = Excel;
    WordLayout = 'MyExcelReport.xlsx';
}
```

## See also

[Creating an Excel layout report](../devenv-howto-excel-report-layout.md)  
[WordLayout Property](devenv-wordlayout-property.md)  
[Creating a Word Layout Report](../devenv-howto-report-layout.md)  
[RDLCLayout Property](devenv-rdlclayout-property.md)  
[Creating an RDL Layout Report](../devenv-howto-rdl-report-layout.md)  
[Developing reports](../devenv-reports.md)  
[Defining multiple report layouts](../devenv-multiple-report-layouts.md)  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  