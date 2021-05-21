---
title: "Report.Execute Method"
description: "Runs a report in preview or processing-only mode without showing the request page in the client. The preview document will be downloaded as a PDF file to the user's browser client, where it can be read with the PDF reader. It won't open the Business Central preview page in the browser. The method gets the request page parameter values as an input parameter string from a RUNREQUESTPAGE method call. The OnOpen and OnClose triggers on the request page will run even though the request page is not shown."
ms.author: solsen
ms.custom: na
ms.date: 05/21/2021
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
# Report.Execute Method
> **Version**: _Available or changed with runtime version 1.0._

Runs a report in preview or processing-only mode without showing the request page in the client. The preview document will be downloaded as a PDF file to the user's browser client, where it can be read with the PDF reader. It won't open the Business Central preview page in the browser. The method gets the request page parameter values as an input parameter string from a RUNREQUESTPAGE method call. The OnOpen and OnClose triggers on the request page will run even though the request page is not shown.


## Syntax
```
 Report.Execute(Parameters: String [, RecordRef: RecordRef])
```
## Parameters
*Report*  
&emsp;Type: [Report](report-data-type.md)  
An instance of the [Report](report-data-type.md) data type.

*Parameters*  
&emsp;Type: [String](../string/string-data-type.md)  
A string of request page parameters as XML to use to run the report. The parameter string is typically retrieved from the return value a RUNREQUESTPAGE method call.
          
*RecordRef*  
&emsp;Type: [RecordRef](../recordref/recordref-data-type.md)  
The RecordRef that refers to a record in a table.
          



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  

After the Execute method is executed, the system does not automatically clear the *Report* variable. You must handle clearing the variable.

You typically use this method together with the [RunRequestPage Method](../../methods-auto/report/report-runrequestpage-method.md). The RunRequestPage method runs a report request page without actually running the report, but instead, returns the parameters that are set on the request page as a string. You can then call the Execute method to get the parameter string and run the report.  

 For a simple example that illustrates how to use the Execute method, see example in the [RunRequestPage Method](../../methods-auto/report/report-runrequestpage-method.md) topic.  

## See Also
[Report Data Type](report-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)