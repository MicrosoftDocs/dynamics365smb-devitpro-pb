---
title: "RUN Function (Report)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: d707fe21-fedc-4593-8987-14ce3f14a5ba
caps.latest.revision: 13
manager: edupont
---
# RUN Function (Report)
Loads and executes the report that you specify.  
  
## Syntax  
  
```  
  
Report.RUN  
```  
  
#### Parameters  
 *Report*  
 Type: Report  
  
 After you define this variable, you can run this function or the Report.RUNMODAL function on the variable. The variable is automatically cleared after it executes this function.  
  
## Remarks  
 Use this function or the [RUNMODAL Function \(Report\)](RUNMODAL-Function--Report-.md) if you know at design time the exact report that you want to run. Otherwise, use the [REPORT.RUNMODAL Function](REPORT-RUNMODAL-Function.md) or [REPORT.RUN Function](REPORT-RUN-Function.md).  
  
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
 [Report Data Type](Report-Data-Type.md)