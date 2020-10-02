---
title: "RDLCLayout Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# RDLCLayout Property

Sets the imported file name and the RDL layout that is used on a report.

> [!NOTE]  
> Reports support both RDL and Word layout. For more information, see [DefaultLayout Property](devenv-defaultlayout-property.md).

## Remarks

The RDL file has to be in the same folder as the AL object. 

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

[Report Object](../devenv-report-object.md)  
[Creating an RDL Layout Report](../devenv-howto-rdl-report-layout.md)   
[WordLayout Property](devenv-wordlayout-property.md)  
[Creating a Word Layout Report](../devenv-howto-report-layout.md)  
 