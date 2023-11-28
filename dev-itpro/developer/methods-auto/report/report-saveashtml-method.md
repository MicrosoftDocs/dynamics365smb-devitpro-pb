---
title: "Report.SaveAsHtml(Integer, Text [, var Record]) Method"
description: "Saves a report as an HTML file."
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
# Report.SaveAsHtml(Integer, Text [, var Record]) Method
> **Version**: _Available or changed with runtime version 1.0._

Saves a report as an HTML file. The file is saved on the computer where the server instance is running, and then downloaded to the client when ready. \> This method is only supported when a report uses a Word report layout when it is run.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```AL
[Ok := ]  Report.SaveAsHtml(Number: Integer, FileName: Text [, var Record: Record])
```
## Parameters
*Number*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The ID of the report object that you want to run.  

*FileName*  
&emsp;Type: [Text](../text/text-data-type.md)  
The folder path and name of the file that you want to save the report as. The path must already exist and the service (login) account that is used by the server instance must have permission to write to the target folder. Otherwise, you will get errors.  

*[Optional] Record*  
&emsp;Type: [Record](../record/record-data-type.md)  
Specifies which record to use in the report. Any filters that have been applied to the record that you specify will be used.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
The SaveAsHTML method uses the logic in the codeunit **9651 Document Report Mgt.** code unit to handle the format transformation.  
  
You can use the SaveAsHTML method on the global Report object and on instances of a Report variable.
If, at design time, you do not know the specific report that you want to run, then use this method (the static one) and specify the report object ID in the *Number* parameter. If you do know which report you want to run, then use the instance method [Report.SaveAsHTML(FileName: Text)](./report-saveashtml-method.md).

When you call the SaveAsHtml method, the report is generated and saved to "FileName." The request page is not shown.  

[!INCLUDE[report_download_file](../../includes/include-report-download-file.md)]

### Error conditions  
The method can fail in the following five ways:
- If the report you specify in "*Number*" does not exist,
- If the default layout of the report is not of type Word,
[!INCLUDE[report_saveas_error_list](../../includes/include-report-saveas-error-list.md)]

If the report you specify does not exist, then a run-time error occurs.  

Reports that use an RDLC or Excel layout when run cannot be saved in the HTML format. A runtime error will occur if SaveAsHTML is used on such a report layout.

[!INCLUDE[io_errors](../../includes/include-io-errors.md)]

## Example  
This example shows how to use the static version of SaveAsHtml method in a safe way (where no errors occur).

```al 
var
    FileNameAndPath: Text[250];
begin
    // setup that FileNameAndPath is valid to write to

    // Check if the default layout of MyReport is of type Word

    // Note that by using the scope operator (::), you catch at compile time if MyReport does not exist
    Report.SaveAsHtml(Report::MyReport, FileNameAndPath);
end;
```  

[!INCLUDE[report_save_as_example](../../includes/include-report-saveas-example.md)]


## See Also
[Report Data Type](report-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)