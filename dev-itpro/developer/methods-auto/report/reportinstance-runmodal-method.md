---
title: "Report.RunModal Method"
ms.author: solsen
ms.custom: na
ms.date: 09/15/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Report.RunModal Method
Loads and executes the report that you specify.


## Syntax
```
 Report.RunModal()
```

## Parameters
*Report*  
&emsp;Type: [Report](report-data-type.md)  
An instance of the [Report](report-data-type.md) data type.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
After you define the *Report* variable, you can run this method or the [RUN Method \(Report\)](reportinstance-run-method.md) on the variable. As opposed to the RUN method, with the RUNMODAL method, the variable is not cleared after it executes this function. You must handle clearing the variable.

Use the RUNMODAL method or the RUN method if you know at design time the exact report you want to run. Otherwise, use the [REPORT.RUNMODAL Method](report-runmodal-method.md) or [REPORT.RUN Method](report-run-method.md).  
  
 If the report you specify does not exist, then a compile error occurs.  
  
 The request page is run modally when you use this method. 


[!INCLUDE[multi_file_download_web_client](../../includes/multi_file_download_web_client.md)]
  
## Example  

```  
var
    CustomerRec: Record Customer;
    SomeReport: Report "Chart of Accounts";
begin
    …  
    CLEAR(CustomerRec);  
    CustomerRec.SETRECFILTER;  
    SomeReport.XXX; // Any user-defined method.  
    SomeReport.SETTABLEVIEW(CustomerRec);  
    SomeReport.RUNMODAL();
end;  
```  

## See Also
[Report Data Type](report-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)