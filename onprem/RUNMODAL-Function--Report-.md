---
title: "RUNMODAL Function (Report)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: cf4cf774-b299-43da-9761-3c6b07e57eba
caps.latest.revision: 13
manager: edupont
---
# RUNMODAL Function (Report)
Loads and executes the report that you specify.  
  
## Syntax  
  
```  
  
Report.RUNMODAL  
```  
  
#### Parameters  
 *Report*  
 Type: Report  
  
 After you define this variable, you can run this function or the Report.RUN function on the variable. As opposed to the Report.RUN function, the system does not automatically clear the variable after it executes this function. You must handle clearing the variable.  
  
## Remarks  
 Use this function or the [RUN Function \(Report\)](RUN-Function--Report-.md) if you know at design time the exact report you want to run. Otherwise, use the [REPORT.RUNMODAL Function](REPORT-RUNMODAL-Function.md) or [REPORT.RUN Function](REPORT-RUN-Function.md).  
  
 If the report you specify does not exist, then a compile error occurs.  
  
 The request page is run modally when you use this function.  
  
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
SomeReport.XXX; // Any user-defined function.  
SomeReport.SETTABLEVIEW(CustomerRec);  
SomeReport.RUNMODAL()  
```  
  
## See Also  
 [Report Data Type](Report-Data-Type.md)