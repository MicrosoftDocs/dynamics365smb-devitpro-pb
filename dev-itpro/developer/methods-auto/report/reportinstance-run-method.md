---
title: "Report.Run Method"
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
# Report.Run Method
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

After you define the *Report* variable, you can run this method or the [RUNMODAL Method \(Report\)](reportinstance-runmodal-method.md) on the variable. With the RUN method, the variable is automatically cleared after the method is executed. With the RUNMODAL method, the variable is not automatically cleared. 

Use RUN method or the RUNMODAL method if you know at design time the exact report that you want to run. Otherwise, use the [REPORT.RUN Method](report-run-method.md) or [REPORT.RUNMODAL Method](report-runmodal-method.md).  
  
If the report you specify does not exist, then a compile error occurs.  


[!INCLUDE[multi_file_download_web_client](../../includes/multi_file_download_web_client.md)]
  
## Example  

```  
var
    CustomerRec: Record Customer;
    SomeReport: Report "Salesperson - Sales Statistics";
begin
    CustomerRec.SETCURRENTKEY("No.");  
    CustomerRec.SETFILTER("Salesperson Code", 'JR|PS');  
    SomeReport.SETTABLEVIEW(CustomerRec);  
    SomeReport.RUN;
end;
```  

## See Also
[Report Data Type](report-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)