---
title: "Report.RunModal() Method"
description: "Loads and executes the report that you specify."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
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
  
  
The request page is run modally when you use this method. 


[!INCLUDE[multi_file_download_web_client](../../includes/multi_file_download_web_client.md)]
  
## Example  

```al 
var
    CustomerRec: Record Customer;
    SalesReport: Report "Chart of Accounts";
begin
    …  
    Clear(CustomerRec);  
    CustomerRec.SetRecFilter; 

    SalesReport.SetTableView(CustomerRec);  
    SalesReport.RunModal();
end;  
```  

## Related information
[Report.RunModal (static) Method](report-runmodal-method.md)  
[Report Data Type](report-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
