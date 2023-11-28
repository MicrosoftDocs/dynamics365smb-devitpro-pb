---
title: "Report.SaveAsWord(Text) Method"
description: "Saves a report on the computer that is running the server as a Microsoft Word (.doc) document."
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
# Report.SaveAsWord(Text) Method
> **Version**: _Available or changed with runtime version 1.0._

Saves a report on the computer that is running the server as a Microsoft Word (.doc) document.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```AL
[Ok := ]  Report.SaveAsWord(FileName: Text)
```
## Parameters
*Report*  
&emsp;Type: [Report](report-data-type.md)  
An instance of the [Report](report-data-type.md) data type.  

*FileName*  
&emsp;Type: [Text](../text/text-data-type.md)  
The path and the name of the file that you want to save the report as. The path must exist, the file must not be being used, and the server process must have permission to write to the file. Otherwise, you will get errors.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
The SaveAsWord method can be used on the Report data type and on Report variables. When you are programming the SaveAsWord method, if you do not know the specific report that you want to run, then use the static version of the SaveAsWord method, see [Report.SaveAsWord(Integer, Text [, var Record])](./report-saveasword-method.md).  

When you call the SaveAsWord method, the report is generated and saved to "*FileName*." The request page is not shown.  

[!INCLUDE[report_download_file](../../includes/include-report-download-file.md)]

### Error conditions  
The method can fail in the following three ways:
[!INCLUDE[report_saveas_error_list](../../includes/include-report-saveas-error-list.md)]

[!INCLUDE[io_errors](../../includes/include-io-errors.md)]

## Example  
This example shows how to use the static SaveAsWord method in a safe way (where no errors occur).

```AL 
var
    FileNameAndPath: Text[250];
    MyReportInstance: Report::MyReport
begin
    // setup that FileNameAndPath is valid to write to

    MyReportInstance.SaveAsWord(FileNameAndPath);
end;
```  

[!INCLUDE[report_save_as_example](../../includes/include-report-saveas-example.md)]

You can create an action on a page and set the action to run this code. When you run the action, the **Export File** dialog box opens. Choose **Save** to save the file to the client.


## See Also
[Report Data Type](report-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)