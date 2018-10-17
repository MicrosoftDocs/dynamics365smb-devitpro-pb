---
title: "Print Method"
ms.author: solsen
ms.custom: na
ms.date: 09/27/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .resx files in the ModernDev repo.)
# Print Method
Prints a specified report without running the request page. Instead of using the request page to obtain parameters at runtime, the function gets the parameter values as an input parameter string, typically from a RUNREQUESTPAGE function call.

## Syntax
```
 Report.Print(Parameters: String, [PrinterName: String], [RecordRef: RecordRef])
```
## Parameters
*Report*  
&emsp;Type: [Report](report-data-type.md)  
An instance of the [Report](report-data-type.md) data type.  

*Parameters*  
&emsp;Type: [String](string-data-type.md)  
A string of request page parameters as XML to use to run the report. The parameter string is typically retrieved from the return value a RUNREQUESTPAGE function call.
          
*PrinterName*  
&emsp;Type: [String](string-data-type.md)  
The name of the printer to use to print the report. The printer must be set up on the client computer. If you do not set this variable, the printer that is set as the default printer is used.
          
*RecordRef*  
&emsp;Type: [RecordRef](recordref-data-type.md)  
The RecordRef that refers to the table in which you want to find a record.
          



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 You typically use this method together with the [RUNREQUESTPAGE Method](devenv-RUNREQUESTPAGE-Method.md) method. The RUNREQUESTPAGE method runs a report request page without actually running the report, but instead, returns the parameters that are set on the request page as a string. You can then call the PRINT method to get the parameter string and print the report.  

 For a simple example that illustrates how to use the PRINT method, see example in the [RUNREQUESTPAGE Method](devenv-RUNREQUESTPAGE-Method.md) method topic.  
## See Also
[Report Data Type](report-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)