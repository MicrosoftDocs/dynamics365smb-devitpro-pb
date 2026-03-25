---
title: "Report.Execute(Integer, Text [, RecordRef]) Method"
description: "Runs a report in preview or processing-only mode without showing the request page in the client."
ms.author: solsen
ms.date: 03/11/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Report.Execute(Integer, Text [, RecordRef]) Method
> **Version**: _Available or changed with runtime version 1.0._

Runs a report in preview or processing-only mode without showing the request page in the client. The preview document will be downloaded as a PDF file to the user's browser client, where it can be read with the PDF reader. It won't open the Business Central preview page in the browser. The method gets the request page parameter values as an input parameter string from a RunRequestPage method call. The OnOpen and OnClose triggers on the request page will run even though the request page is not shown.


## Syntax
```AL
 Report.Execute(Number: Integer, Parameters: Text [, RecordRef: RecordRef])
```
## Parameters
*Number*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The ID of the report that you want to run. If the report that you specify does not exist, then a run-time error occurs.  

*Parameters*  
&emsp;Type: [Text](../text/text-data-type.md)  
A string of request page parameters as XML to use to run the report. The parameter string is typically retrieved from the return value a RunRequestPage method call.  

*[Optional] RecordRef*  
&emsp;Type: [RecordRef](../recordref/recordref-data-type.md)  
The RecordRef that refers to a record in a table.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Report data type](report-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)