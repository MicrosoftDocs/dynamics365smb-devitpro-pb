---
title: "RunModal Method"
ms.author: solsen
ms.custom: na
ms.date: 10/17/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# RunModal Method
Loads and executes the report that you specify.

## Syntax
```
 Report.RunModal(Number: Integer, [RequestWindow: Boolean], [SystemPrinter: Boolean], [var Record: Table])
```
## Parameters
*Number*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The ID of the report that you want to run.
        
*RequestWindow*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Specifies whether the request window for the report will be displayed. The request window is part of the report object.
        
*SystemPrinter*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Specifies whether to use the default Windows printer or use table 78, Printer Selection, to find the correct printer for this report.
        
*Record*  
&emsp;Type: [Table](../table/table-data-type.md)  
Specifies which record to use in the report. Any filters that are attached to the record that you specify are used.
        



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 Use this method or the [RUN Method \(Report\)](../../methods/devenv-run-method-report.md) if you know at design time the exact report you want to run. Otherwise, use the [REPORT.RUNMODAL Method](../../methods/devenv-report-runmodal-method.md) or [REPORT.RUN Method](../../methods/devenv-report-run-method.md).  
  
 If the report you specify does not exist, then a compile error occurs.  
  
 The request page is run modally when you use this method.  
  
## Example  
 This example requires that you create the following variables.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|CustomerRec|Record|Customer|  
|SomeReport|Report|Chart of Accounts|  
  
```  
…  
CLEAR(CustomerRec);  
CustomerRec.SETRECFILTER;  
SomeReport.XXX; // Any user-defined method.  
SomeReport.SETTABLEVIEW(CustomerRec);  
SomeReport.RUNMODAL()  
```  

## See Also
[Report Data Type](report-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)