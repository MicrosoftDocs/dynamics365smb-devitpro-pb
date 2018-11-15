---
title: "Run Method"
ms.author: solsen
ms.custom: na
ms.date: 11/06/2018
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

After you define the *Report* variable, you can run this method or the [RUNMODAL Method \(Report\)](../../methods/devenv-runmodal-method-report.md) method on the variable. With the RUN method, the variable is automatically cleared after the method is executed. With the RUNMODAL method, the variable is not automatically cleared. 

Use RUN method or the RUNMODAL method if you know at design time the exact report that you want to run. Otherwise, use the [REPORT.RUNMODAL Method](../../methods/devenv-report-runmodal-method.md) or [REPORT.RUN Method](../../methods/devenv-report-run-method.md).  
  
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
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)