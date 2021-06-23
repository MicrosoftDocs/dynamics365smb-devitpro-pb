---
title: "Report.SaveAs Method"
description: "Runs a specific report without a request page and saves the report as a PDF, Excel, Word, or XML file."
ms.author: solsen
ms.custom: na
ms.date: 06/23/2021
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
# Report.SaveAs Method
> **Version**: _Available or changed with runtime version 1.0._

Runs a specific report without a request page and saves the report as a PDF, Excel, Word, or XML file. Instead of using the request page to obtain parameters at runtime, the method gets the parameter values as an input parameter string, typically from the return value of a RUNREQUESTPAGE method call.


## Syntax
```AL
[Ok := ]  Report.SaveAs(Parameters: String, Format: ReportFormat, var OutStream: OutStream [, RecordRef: RecordRef])
```
## Parameters
*Report*  
&emsp;Type: [Report](report-data-type.md)  
An instance of the [Report](report-data-type.md) data type.  

*Parameters*  
&emsp;Type: [String](../string/string-data-type.md)  
A string of request page parameters as XML to use to run the report. The parameter string is retrieved from the return value a RUNREQUESTPAGE method call.
          
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
 You typically use this method together with the [RunRequestPage Method](../report/reportinstance-runrequestpage-method.md) method. The RunRequestPage method runs a report request page without actually running the report, but instead, returns the parameters that are set on the request page as a string. You can then call the SaveAs method to get the parameter string and save the report to a file of the specified format.  

 For a simple example that illustrates how to use the SaveAs method, see example in the [RunRequestPage Method](../report/reportinstance-runrequestpage-method.md) method topic.  

> [!NOTE]  
>  By default, when a report uses an RDL report layout at runtime, fonts are embedded in the generated PDF. You can specify whether fonts are embedded in the PDF for RDL reports by changing the **Report PDF Font Embedding** setting in the [!INCLUDE[d365fin_server_md](../../includes/d365fin_server_md.md)] instance configuration or changing the **PDFFontEmbedding** property in report objects. <!--NAV For more information, see [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md) and [PDFFontEmbedding Property](../properties/devenv-PDF-FontEmbedding-Property.md).-->  


## See Also
[Report Data Type](report-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)