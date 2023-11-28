---
title: "Report.SaveAsPdf(Integer, Text [, var Record]) Method"
description: "Saves a report as a .pdf file."
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
# Report.SaveAsPdf(Integer, Text [, var Record]) Method
> **Version**: _Available or changed with runtime version 1.0._

Saves a report as a .pdf file.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```AL
[Ok := ]  Report.SaveAsPdf(Number: Integer, FileName: Text [, var Record: Record])
```
## Parameters
*Number*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The ID of the report that you want to run.  

*FileName*  
&emsp;Type: [Text](../text/text-data-type.md)  
The path and name of the file that you want to save the report as.  

*[Optional] Record*  
&emsp;Type: [Record](../record/record-data-type.md)  
Specifies which record to use in the report. Any filters that have been applied to the record that you specify will be used.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
You can use the SaveAsPdf method on the global Report object and on instances of a Report variable.
If, at design time, you do not know the specific report that you want to run, then use this method (the static one) and specify the report object ID in the *Number* parameter. If you do know which report you want to run, then use the instance method [Report.SaveAsPdf(FileName: Text)](./reportinstance-saveaspdf-method.md).

When you call **SaveAsPDF**, the report is generated and saved to the file specified in "*FileName*." A **Saving to PDF** window shows the status of the process. Note that the request page will not be shown.  

[!INCLUDE[report_download_file](../../includes/include-report-download-file.md)]

[!INCLUDE[report_download_pdf_fonts](../../includes/include-report-download-pdf-fonts.md)]

### Error conditions  
The method can fail in the following four ways:
- [!INCLUDE[report_saveas_error_list_report_not_exists](../../includes/include-report-saveas-error-list-report-not-exists.md)]
- [!INCLUDE[report_saveas_error_list_folder_not_exists](../../includes/include-report-saveas-error-list-folder-not-exists.md)]
- [!INCLUDE[report_saveas_error_list_file_used](../../includes/include-report-saveas-error-list-file-used.md)]
- [!INCLUDE[report_saveas_error_list_file_permission](../../includes/include-report-saveas-error-list-file-permission.md)]


If the report you specify does not exist, then a run-time error occurs.  

[!INCLUDE[io_errors](../../includes/include-io-errors.md)]


## Example  
This example shows how to use the static SaveAsPdf method in a safe way (where no errors occur).

```AL 
var
    FileNameAndPath: Text[250];
begin
    // setup that FileNameAndPath is valid to write to

    // Note that by using the scope operator (::), you catch at compile time if MyReport does not exist
    Report.SaveAsPdf(Report::MyReport, FileNameAndPath);
end;
```  

[!INCLUDE[report_save_as_example](../../includes/include-report-saveas-example.md)]



## See Also
[Report Data Type](report-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)