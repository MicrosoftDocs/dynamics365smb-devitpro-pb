---
title: "Report.Execute Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
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
# Report.Execute Method
> **Version**: _Available from runtime version 1.0._

Runs a report in preview or processing-only mode without showing the request page in the client. The method gets the request page parameter values as an input parameter string from a RunRequestPage method call. The OnOpen and OnClose triggers on the request page will run even though the request page is not shown.


## Syntax
```
 Report.Execute(Number: Integer, Parameters: String [, RecordRef: RecordRef])
```
## Parameters
*Number*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The ID of the report that you want to run. If the report that you specify does not exist, then a run-time error occurs.
          
*Parameters*  
&emsp;Type: [String](../string/string-data-type.md)  
A string of request page parameters as XML to use to run the report. The parameter string is typically retrieved from the return value a RunRequestPage method call.
          
*RecordRef*  
&emsp;Type: [RecordRef](../recordref/recordref-data-type.md)  
The RecordRef that refers to a record in a table.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 You typically use this method together with the [RunRequestPage Method](../../methods-auto/report/report-runrequestpage-method.md) method. The [RunRequestPage Method](../../methods-auto/report/report-runrequestpage-method.md)) runs a report request page without actually running the report, but instead, returns the parameters that are set on the request page as a string. You can then call the Execute method to get the parameter string and run the report.  

 For [RunRequestPage Method](../../methods-auto/report/report-runrequestpage-method.md) method topic.  

## See Also
[Report Data Type](report-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)