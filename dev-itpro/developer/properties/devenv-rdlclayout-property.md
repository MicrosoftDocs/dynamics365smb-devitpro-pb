---
title: "RDLCLayout Property"
description: "Sets the RDL layout that is used on a report and returns it as a data stream."
ms.author: solsen
ms.custom: na
ms.date: 06/15/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# RDLCLayout Property
> **Version**: _Available or changed with runtime version 1.0._

Sets the RDL layout that is used on a report and returns it as a data stream.

## Applies to
-   Report
-   Report Extension

[//]: # (IMPORTANT: END>DO_NOT_EDIT)


[!INCLUDE[possible_layouts_note](../includes/include-possible-layouts-note.md)]

## Remarks

The RDL file has to be in the same folder as the AL object. 


[!INCLUDE[single_layouts](../includes/include-single-layout-obsolete.md)]

## Example

The following example shows how to use this property to generate the *MyRDLCReport.rdl* file.

```AL
pageextension 50123 MyExtension extends "Customer List"
{
    trigger OnOpenPage();
    begin
        report.Run(Report::MyRdlReport);
    end;
}

report 50123 MyRdlReport
{
    DefaultLayout = RDLC;
    RDLCLayout = 'MyRDLCReport.rdl';

}
```

## See Also
[Creating an RDL Layout Report](../devenv-howto-rdl-report-layout.md)   
[ExcelLayout Property](devenv-excellayout-property.md)  
[Creating an Excel layout report](../devenv-howto-excel-report-layout.md)  
[WordLayout Property](devenv-wordlayout-property.md)  
[Creating a Word Layout Report](../devenv-howto-report-layout.md)  
[Developing reports](devenv-reports.md)  
[Defining multiple report layouts](devenv-multiple-report-layouts.md)  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)   