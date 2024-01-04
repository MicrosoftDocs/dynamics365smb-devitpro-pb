---
title: "DefaultRenderingLayout Property"
description: "Sets the default layout that should be used for this report."
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
# DefaultRenderingLayout Property
> **Version**: _Available or changed with runtime version 9.0._

Sets the default layout that should be used for this report.

## Applies to
-   Report

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example

The following example shows how to use this property together with a *rendering* section.

```AL
report 50124 MyExcelReport
    DefaultRenderingLayout = MyExcelLayout; 
    // More report properties goes here

    rendering
    {
        layout(MyExcelLayout) 
        {
            Type = Excel; 
            Caption = 'Excel layout for the sales report'; 
            Summary = 'The Excel layout for the sales report is used for ad-hoc analysis';
            LayoutFile = './Src/Reports/SalesReport.xlsx'; 
        }

        layout(MyWordLayout) 
        {
            Type = Word; 
            Caption = 'Word layout for the sales report'; 
            Summary = 'The Word layout for the sales report is used for print and pdf generation';
            LayoutFile = './Src/Reports/SalesReport.docx'; 
        }        
    }

    // dataset definition goes here
```

## See also

[Developing reports](../devenv-reports.md)  
[Defining multiple report layouts](../devenv-multiple-report-layouts.md)  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  