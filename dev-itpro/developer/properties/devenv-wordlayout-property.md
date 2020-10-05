---
title: "WordLayout Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: dd671414-a7c3-44bd-a860-a8bda61c7913
caps.latest.revision: 15
author: SusanneWindfeldPedersen
---

 

# WordLayout Property
Sets the imported file name and the Word layout that is used on a report.


> [!NOTE]
> Reports support both Word and RDLC layout.

## Remarks
The  Word file has to be in the same folder as the AL object. 

## Example
<!--
Code taken from this file: devenv-howto-report-layout
-->
The following example shows how to use this property to generate the *MyWordReport.docx* file.

```
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
 