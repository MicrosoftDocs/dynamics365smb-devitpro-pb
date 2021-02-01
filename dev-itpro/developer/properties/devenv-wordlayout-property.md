---
title: "WordLayout Property"
ms.author: solsen
ms.custom: na
ms.date: 11/24/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# WordLayout Property
> **Version**: _Available from runtime version 1.0._

Sets the Word layout that is used on a report and returns it as a data stream.

## Applies to
-   Report


[//]: # (IMPORTANT: END>DO_NOT_EDIT)


> [!NOTE]  
> Reports support both Word and RDL layout.

## Remarks

The Word file has to be in the same folder as the AL object.

## Example

The following example shows how to use this property to generate the *MyWordReport.docx* file.

```AL
pageextension 50100 MyExtension extends "Customer List"
{
    trigger OnOpenPage();
    begin
        report.Run(Report::MyWordReport);
    end;
}

report 50124 MyWordReport
{
    DefaultLayout = Word;
    WordLayout = 'MyWordReport.docx';
}
```

## See Also

[Creating a Word Layout Report](../devenv-howto-report-layout.md)  
[RDLCLayout Property](devenv-rdlclayout-property.md)  
[Creating an RDL Layout Report](../devenv-howto-rdl-report-layout.md)  