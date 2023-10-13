---
title: "Report.Execute(Integer, Text [, RecordRef]) Method"
description: "Runs a report in preview or processing-only mode without showing the request page in the client."
ms.author: solsen
ms.custom: na
ms.date: 10/13/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Report.Execute(Integer, Text [, RecordRef]) Method
> **Version**: _Available or changed with runtime version 1.0._

Runs a report in preview or processing-only mode without showing the request page in the client. The preview document will be downloaded as a PDF file to the user's browser client, where it can be read with the PDF reader. It won't open the Business Central preview page in the browser. The method gets the request page parameter values as an input parameter string from a RUNREQUESTPAGE method call. The OnOpen and OnClose triggers on the request page will run even though the request page is not shown.


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
A string of request page parameters as XML to use to run the report. The parameter string is typically retrieved from the return value a RUNREQUESTPAGE method call.  

*[Optional] RecordRef*  
&emsp;Type: [RecordRef](../recordref/recordref-data-type.md)  
The RecordRef that refers to a record in a table.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
You typically use this method together with the [RunRequestPage Method](../../methods-auto/report/report-runrequestpage-method.md) method. The [RunRequestPage Method](../../methods-auto/report/report-runrequestpage-method.md)) runs a report request page without actually running the report, but instead, it returns the parameters that are set on the request page as a string. You can then call the Execute method to get the parameter string and run the report.  

For more information, see [RunRequestPage Method](../../methods-auto/report/report-runrequestpage-method.md).  

> [!NOTE]  
> Be careful when crafting the string for the RunRequestPage parameter without using the RunRequestPage method. If the XML content is malformed, then a runtime error might occur when calling `Report.Execute`. 

> [!NOTE]  
> The `Report.Execute` method isn't supported for reports running with an Excel Layout.


## Example (using `Report::<object identifier>` syntax)

As mentioned above, the `Report.Execute` method will throw a runtime error if no report with the supplied object ID exists. If you know the report object, a safe way to call Report.Execute is to use the `Report::<object identifier>` syntax as the compiler will tell you if the report object doesn't exist.  

```AL
procedure MyProcKnownReport()
var
    RequestPagePayload: Text;
begin
    RequestPagePayload := Report.RunRequestPage(Report::MyReport);
    Report.Execute(Report::MyReport, RequestPagePayload);
end;
```



## See Also
[Report Data Type](report-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)
