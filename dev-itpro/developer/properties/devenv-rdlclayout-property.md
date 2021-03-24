---
title: "RDLCLayout Property"
ms.author: solsen
ms.custom: na
ms.date: 01/26/2021
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
# RDLCLayout Property
> **Version**: _Available or changed with runtime version 1.0._

Sets the RDLC layout that is used on a report and returns it as a data stream.

## Applies to
-   Report

[//]: # (IMPORTANT: END>DO_NOT_EDIT)


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
 