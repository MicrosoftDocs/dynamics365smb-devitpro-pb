---
title: "Report.RunModal() Method"
description: "Loads and executes the report that you specify."
ms.author: solsen
ms.custom: na
ms.date: 07/07/2021
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
# Report.RunModal() Method
> **Version**: _Available or changed with runtime version 1.0._

Loads and executes the report that you specify.


## Syntax
```AL
 Report.RunModal()
```

## Parameters
*Report*  
&emsp;Type: [Report](report-data-type.md)  
An instance of the [Report](report-data-type.md) data type.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
After you define the *Report* variable, you can run this method or the [Run Method \(Report\)](reportinstance-run-method.md) on the variable. As opposed to the Run method, with the RunModal method, the variable is not cleared after it executes this function. You must handle clearing the variable.

Use the RunModal method or the Run method if you know at design time the exact report you want to run. Otherwise, use the [Report.RunModal Method](report-runmodal-method.md) or [Report.Run Method](report-run-method.md).  
  
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
    Clear(CustomerRec);  
    CustomerRec.SetRecFilter;  
    SomeReport.XXX; // Any user-defined method.  
    SomeReport.SetTableView(CustomerRec);  
    SomeReport.RunModal();
end;  
```  

## See Also
[Report Data Type](report-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)