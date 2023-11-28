---
title: "Report.SaveAsHtml(Text) Method"
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
# Report.SaveAsHtml(Text) Method
> **Version**: _Available or changed with runtime version 1.0._

Saves a report as an HTML file. The file is saved on the computer where the server instance is running, and then downloaded to the client when ready. \> This method is only supported when a report uses a Word report layout when it is run.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```AL
[Ok := ]  Report.SaveAsHtml(FileName: Text)
```
## Parameters
*Report*  
&emsp;Type: [Report](report-data-type.md)  
An instance of the [Report](report-data-type.md) data type.  

*FileName*  
&emsp;Type: [Text](../text/text-data-type.md)  
The folder path and name of the file that you want to save the report as. The path must already exist and the service (login) account that is used by the server instance must have permission to write to the target folder. Otherwise, you will get errors.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The SaveAsHTML method uses the logic in the codeunit **9651 Document Report Mgt.** code unit to handle the format transformation.  

The SaveAsHTML method can be used on the Report data type and on Report variables. When you are programming the SaveAsHTML method, if you do not know the specific report that you want to run, then use the static version of the SaveAsHTML method, see [Report.SaveAsHtml(Integer, Text [, var Record])](./report-saveashtml-method.md).  

When you call the SaveAsHTML method, the report is generated and saved to "FileName." The request page is not shown.  

[!INCLUDE[report_download_file](../../includes/include-report-download-file.md)]

### Error conditions  
The method can fail in the following four ways:
- [!INCLUDE[report_saveas_error_list_layout_not_word](../../includes/include-report-saveas-error-list-layout-not-word.md)]
- [!INCLUDE[report_saveas_error_list_folder_not_exists](../../includes/include-report-saveas-error-list-folder-not-exists.md)]
- [!INCLUDE[report_saveas_error_list_file_used](../../includes/include-report-saveas-error-list-file-used.md)]
- [!INCLUDE[report_saveas_error_list_file_permission](../../includes/include-report-saveas-error-list-file-permission.md)]

Reports that use an RDLC or Excel layout when run cannot be saved in the HTML format. A runtime error will occur if SaveAsHTML is used on such a report layout.

[!INCLUDE[io_errors](../../includes/include-io-errors.md)]

## Example  
This example shows how to use the static SaveAsHtml method in a safe way (where no errors occur).

```al 
var
    FileNameAndPath: Text[250];
    MyReportInstance: Report MyReport;
begin
    // setup that FileNameAndPath is valid to write to

    // Check if the default layout of MyReport is of type Word

    MyReportInstance.SaveAsHtml(FileNameAndPath);
end;
```  

[!INCLUDE[report_save_as_example](../../includes/include-report-saveas-example.md)]

## See Also
[Report Data Type](report-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)