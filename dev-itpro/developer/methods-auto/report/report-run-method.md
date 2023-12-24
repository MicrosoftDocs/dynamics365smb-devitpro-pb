---
title: "Report.Run(Integer [, Boolean] [, Boolean] [, var Record]) Method"
description: "Loads and executes the report that you specify (static method)."
ms.author: solsen
ms.custom: na
ms.date: 12/18/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Report.Run(Integer [, Boolean] [, Boolean] [, var Record]) Method
> **Version**: _Available or changed with runtime version 1.0._

Loads and executes the report that you specify.


## Syntax
```AL
Report.Run(Number: Integer [, RequestWindow: Boolean] [, SystemPrinter: Boolean] [, var Record: Record])
```
## Parameters
*Number*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The ID of the report that you want to run.  

*[Optional] RequestWindow*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Specifies whether the request window for the report will be displayed. The request window is part of the report object.  

*[Optional] SystemPrinter*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Specifies whether to use the default Windows printer or use table 78, Printer Selection, to find the correct printer for this report.  

*[Optional] Record*  
&emsp;Type: [Record](../record/record-data-type.md)  
Specifies which record to use in the report. Any filters that are attached to the record that you specify are used.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  

Use this method, or the [Report.RunModal Method](report-runmodal-method.md), if you don't know the specific report that you want to run when you're designing your application. If you do know the specific report that you want to run, then you can use the [Run Method](reportinstance-run-method.md) or the [RunModal Method](reportinstance-runmodal-method.md). 
  
If the report you specify doesn't exist, then a runtime error occurs.  

[!INCLUDE[multi_file_download_web_client](../../includes/multi_file_download_web_client.md)]


## Printing

The parameter `SystemPrinter` is only used for on-premises scenarios (print on server). Here, the [!INCLUDE[prod_short](../../includes/prod_short.md)] server will use the default printer on the server if you use SystemPrinter=true, otherwise it will use printer selection. 

For the online version of [!INCLUDE[prod_short](../../includes/prod_short.md)], users can use printer extension and browser print.


## Example: Using `Report::<object ID>` syntax

As mentioned previously, the `Report.Run` method throws a runtime error if no report with the supplied object ID exists. If you know the report object, a safe way to call `Report.Run` is to use the `Report::<object identifier>` syntax because the compiler will tell you if the report object doesn't exist.  

```AL
begin
    Report.Run(Report::MyReport);
end;
```

## Example 1

This example shows how to run a report. This example displays the request window and sends the report to the printer that's selected in the `Printer Selection` table.  

```al
Report.Run(1001);  
```  

## Example 2

This example shows how to run a report. This example skips the request window, starts the report immediately, and sends the report to the printer that's selected in the `Printer Selection` table.  

```al
Report.Run(1001, False);  
```  

## Example 3

This example shows how to run a report. This example skips the request window and starts the report immediately. It sends the report to the system printer instead of the printer that is selected in the `Printer Selection` table.  

```al
Report.Run(1001, False, True);  
```  

## Example 4

This example shows how to run a report for which you specify a record. This example displays the request window and sends the report to the system printer.
 
```al
var
    MyRec: Record Customer;
begin
    MyRec.FindLast;  
    MyRec.SetRecFilter;  
    Report.Run(101, True, True, MyRec);  
end;
```   

## See also

[Report Data Type](report-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)