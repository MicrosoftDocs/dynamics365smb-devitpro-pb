---
title: "Report.Run Method"
ms.author: solsen
ms.custom: na
ms.date: 10/01/2020
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
 Report.Run(Number: Integer [, RequestWindow: Boolean] [, SystemPrinter: Boolean] [, var Record: Record])
```
## Parameters
*Number*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The ID of the report that you want to run.
        
*RequestWindow*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Specifies whether the request window for the report will be displayed. The request window is part of the report object.
        
*SystemPrinter*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Specifies whether to use the default Windows printer or use table 78, Printer Selection, to find the correct printer for this report.
        
*Record*  
&emsp;Type: [Record](../record/record-data-type.md)  
Specifies which record to use in the report. Any filters that are attached to the record that you specify are used.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  

Use this method, or the [REPORT.RUNMODAL Method](report-runmodal-method.md), if you do not know the specific report that you want to run when you are designing your application. If you do know the specific report that you want to run, then you can use the [RUN Method](reportinstance-run-method.md) or the [RUNMODAL Method](reportinstance-runmodal-method.md). 
  
If the report you specify does not exist, then a compile error occurs.  

[!INCLUDE[multi_file_download_web_client](../../includes/multi_file_download_web_client.md)]
  
## Example 1

 This example shows how to run a report. This example displays the request window and sends the report to the printer that is selected in the Printer Selection table.  

```  
REPORT.RUN(1001);  
```  

## Example 2

 This example shows how to run a report. This example skips the request window, starts the report immediately, and sends the report to the printer that is selected in the Printer Selection table.  

```  
REPORT.RUN(1001, FALSE);  
```  

## Example 3

 This example shows how to run a report. This example skips the request window and starts the report immediately. It sends the report to the system printer instead of the printer that is selected in the Printer Selection table.  

```  
REPORT.RUN(1001, FALSE, TRUE);  
```  

## Example 4

 This example shows how to run a report for which you specify a record. This example displays the request window and sends the report to the system printer.
 
```  
var
    MyRec: Record Customer;
begin
    MyRec.FINDLAST;  
    MyRec.SETRECFILTER;  
    Report.RUN(101, TRUE, TRUE, MyRec);  
end;
```   

## See Also
[Report Data Type](report-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)