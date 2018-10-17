---
title: "Run Method"
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
# Run Method
Loads and executes the report that you specify.

## Syntax
```
 Report.Run()
```

## Parameters
*Report*  
&emsp;Type: [Report](report-data-type.md)  
An instance of the [Report](report-data-type.md) data type.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 Use this method or the [RUNMODAL Method \(Report\)](devenv-RUNMODAL-Method-Report.md) if you know at design time the exact report that you want to run. Otherwise, use the [REPORT.RUNMODAL Method](devenv-REPORT-RUNMODAL-Method.md) or [REPORT.RUN Method](devenv-REPORT-RUN-Method.md).  
  
 If the report you specify does not exist, then a compile error occurs.  
  
## Example  
 This example requires that you create the following variables.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|CustomerRec|Record|Customer|  
|SomeReport|Report|Salesperson - Sales Statistics|  
  
```  
CustomerRec.SETCURRENTKEY("No.");  
CustomerRec.SETFILTER("Salesperson Code", 'JR|PS');  
SomeReport.SETTABLEVIEW(CustomerRec);  
SomeReport.RUN  
```  

## See Also
[Report Data Type](report-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)