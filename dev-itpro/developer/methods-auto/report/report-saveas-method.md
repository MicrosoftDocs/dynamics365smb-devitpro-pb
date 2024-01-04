---
title: "Report.SaveAs(Integer, Text, ReportFormat, var OutStream [, RecordRef]) Method"
description: "Runs a specific report without a request page and saves the report as a PDF, Excel, Word, HTML, or XML file. (static method)"
ms.author: solsen
ms.custom: na
ms.date: 03/02/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Report.SaveAs(Integer, Text, ReportFormat, var OutStream [, RecordRef]) Method
> **Version**: _Available or changed with runtime version 1.0._

Runs a specific report without a request page and saves the report as a PDF, Excel, Word, HTML, or XML file. Instead of using the request page to obtain parameters at runtime, the method gets the parameter values as an input parameter string, typically from the return value of a RunRequestPage method call.


## Syntax
```AL
[Ok := ]  Report.SaveAs(Number: Integer, Parameters: Text, Format: ReportFormat, var OutStream: OutStream [, RecordRef: RecordRef])
```
## Parameters
*Number*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The ID of the report that you want to save. If the report that you specify does not exist, then a run-time error occurs.  

*Parameters*  
&emsp;Type: [Text](../text/text-data-type.md)  
A string of request page parameters as XML to use to run the report. The parameter string is retrieved from the return value a RunRequestPage method call.  

*Format*  
&emsp;Type: [ReportFormat](../reportformat/reportformat-option.md)  
The type of file to save the report as. The following options are supported: Pdf, Excel, Word, and XML.  

*OutStream*  
&emsp;Type: [OutStream](../outstream/outstream-data-type.md)  
The stream to which to write a report.  

*[Optional] RecordRef*  
&emsp;Type: [RecordRef](../recordref/recordref-data-type.md)  
The RecordRef that refers to the table in which you want to find a record.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

You typically use this method together with the [RunRequestPage Method](../../methods-auto/report/report-runrequestpage-method.md) method. The `RunRequestPage` method runs a report request page without actually running the report, but instead, it returns the parameters that are set on the request page as a string. You can then call the `SaveAs` method to get the parameter string and save the report to a file of the specified format.  

For a simple example that illustrates how to use the `SaveAs` method, see the example in the [RunRequestPage Method](../../methods-auto/report/report-runrequestpage-method.md) method article. 

> [!NOTE]  
> By default, when a report uses an RDL report layout at runtime, fonts are embedded in the generated PDF. You can specify whether fonts are embedded in the PDF for RDL reports by changing the **Report PDF Font Embedding** setting in the [!INCLUDE[d365fin_server_md](../../includes/d365fin_server_md.md)] instance configuration or changing the **PDFFontEmbedding** property in report objects. 

### Error conditions

The method can fail in the following two ways:
- [!INCLUDE[report_saveas_error_list_report_not_exists](../../includes/include-report-saveas-error-list-report-not-exists.md)]
- If the string of request page parameters as XML specified in "*Parameters*" can't be parsed as valid request page data.

If the report you specify doesn't exist, then a runtime error occurs.  

## Example (robust coding)

This example shows how to use the static `SaveAs` method in a safe way (where no errors occur).

```AL 
var
    RequestPageParameters: Text;
    Format: ReportFormat;
    Stream: OutStream;
begin
    // setup RequestPageParameters, Format, and Stream variables

    // Note that by using the scope operator (::), you catch at compile time if MyReport does not exist
    Report.SaveAs(Report::MyReport, RequestPageParameters, Format, Stream);
end;
``` 

## See also

[Report Data Type](report-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)
