---
title: "RUNMODAL Method (Report)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: cf4cf774-b299-43da-9761-3c6b07e57eba
caps.latest.revision: 13
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# RUNMODAL Method (Report)
Loads and executes the report that you specify.  
  
## Syntax  
  
```  
  
Report.RUNMODAL  
```  
  
#### Parameters  
 *Report*  
 Type: Report  
  
 After you define this variable, you can run this method or the Report.RUN method on the variable. As opposed to the Report.RUN method, the system does not automatically clear the variable after it executes this method. You must handle clearing the variable.  
  
## Remarks  
 Use this method or the [RUN Method \(Report\)](devenv-RUN-Method-Report.md) if you know at design time the exact report you want to run. Otherwise, use the [REPORT.RUNMODAL Method](devenv-REPORT-RUNMODAL-Method.md) or [REPORT.RUN Method](devenv-REPORT-RUN-Method.md).  
  
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
 [Report Data Type](../datatypes/devenv-Report-Data-Type.md)