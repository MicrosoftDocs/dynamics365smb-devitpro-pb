---
title: "Report.Print Method"
description: "Prints a specified report without running the request page. Instead of using the request page to obtain parameters at runtime, the method gets the parameter values as an input parameter string, typically from a RUNREQUESTPAGE method call."
ms.author: solsen
ms.custom: na
ms.date: 05/11/2021
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
# Report.Print Method
> **Version**: _Available or changed with runtime version 1.0._

Prints a specified report without running the request page. Instead of using the request page to obtain parameters at runtime, the method gets the parameter values as an input parameter string, typically from a RUNREQUESTPAGE method call.


## Syntax
```
 Report.Print(Number: Integer, Parameters: String [, PrinterName: String] [, RecordRef: RecordRef])
```
## Parameters
*Number*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The ID of the report that you want to print. If the report that you specify does not exist, then a run-time error occurs.
          
*Parameters*  
&emsp;Type: [String](../string/string-data-type.md)  
A string of request page parameters as XML to use to run the report. The parameter string is typically retrieved from the return value a RUNREQUESTPAGE method call.
        
*PrinterName*  
&emsp;Type: [String](../string/string-data-type.md)  
The name of the printer to use to print the report. The printer must be set up on the client computer. If you do not set this variable, the printer that is set as the default printer is used.
        
*RecordRef*  
&emsp;Type: [RecordRef](../recordref/recordref-data-type.md)  
The RecordRef that refers to the table in which you want to find a record.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 You typically use this method together with the [RunRequestPage Method](../../methods-auto/report/report-runrequestpage-method.md). The RunRequestPage method runs a report request page without actually running the report, but instead, returns the parameters that are set on the request page as a string. You can then call the Print method to get the parameter string and print the report.  

 For a simple example that illustrates how to use the Print method, see example in the [RunRequestPage Method](../../methods-auto/report/report-runrequestpage-method.md) topic.  

## See Also
[Report Data Type](report-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)