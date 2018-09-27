---
title: "Execute Method"
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
# Execute Method
Runs a report in preview or processing-only mode without showing the request page in the client. The function gets the request page parameter values as an input parameter string from a RUNREQUESTPAGE function call. The OnOpen and OnClose triggers on the request page will run even though the request page is not shown.

## Syntax
```
 Report.Execute(Parameters: String, [RecordRef: RecordRef])
```
## Parameters
*Report*  
&emsp;Type: [Report](report-data-type.md)  
An instance of the [Report](report-data-type.md) data type.  

*Parameters*  
&emsp;Type: [String](string-data-type.md)  
A string of request page parameters as XML to use to run the report. The parameter string is typically retrieved from the return value a RUNREQUESTPAGE function call.
          
*RecordRef*  
&emsp;Type: [RecordRef](recordref-data-type.md)  
The RecordRef that refers to a record in a table.
          



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 You typically use this method together with the [RUNREQUESTPAGE Method](devenv-RUNREQUESTPAGE-Method.md) method. The RUNREQUESTPAGE method runs a report request page without actually running the report, but instead, returns the parameters that are set on the request page as a string. You can then call the EXECUTE method to get the parameter string and run the report.  

 For a simple example that illustrates how to use the EXECUTE method, see example in the [RUNREQUESTPAGE Method](devenv-RUNREQUESTPAGE-Method.md) method topic.  

## See Also
[Report Data Type](report-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)