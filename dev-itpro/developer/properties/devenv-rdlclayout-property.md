---
title: "RDLCLayout Property"
ms.custom: na
ms.date: 10/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: dd671414-a7c3-44bd-a860-a8bda61c7913
caps.latest.revision: 15
author: SusanneWindfeldPedersen
---

 

# RDLCLayout Property
Sets the imported file name and the RDLC layout that is used on a report.


> [!NOTE]
> Reports support both RDLC and Word layout.

## Remarks
The RLD file has to be in the same folder as the AL object. 

## Example
<!--
Code taken from this file: devenv-howto-rdl-report-layout
-->
The following example shows how to use this property to generate the *MyRDLCReport.rdl* file.

```
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
 