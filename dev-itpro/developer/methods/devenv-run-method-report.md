---
title: "RUN Method (Report)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: d707fe21-fedc-4593-8987-14ce3f14a5ba
caps.latest.revision: 13
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# RUN Method (Report)
Loads and executes the report that you specify.  
  
## Syntax  
  
```  
  
Report.RUN  
```  
  
#### Parameters  
 *Report*  
 Type: Report  
  
 After you define this variable, you can run this method or the Report.RUNMODAL method on the variable. The variable is automatically cleared after it executes this method.  
  
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
 [Report Data Type](../datatypes/devenv-Report-Data-Type.md)