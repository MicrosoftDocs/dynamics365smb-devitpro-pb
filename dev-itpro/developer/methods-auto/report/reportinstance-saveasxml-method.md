---
title: "Report.SaveAsXml(Text) Method"
description: "Saves the resulting data set of a query as an .xml file.The following code shows the syntax of the SAVEASXML method."
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
# Report.SaveAsXml(Text) Method
> **Version**: _Available or changed with runtime version 1.0._

Saves the resulting data set of a query as an .xml file.The following code shows the syntax of the SAVEASXML method. The first line of code is the syntax for an instance method call. The second line of code is the syntax for a static method call.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```AL
[Ok := ]  Report.SaveAsXml(FileName: Text)
```
## Parameters
*Report*  
&emsp;Type: [Report](report-data-type.md)  
An instance of the [Report](report-data-type.md) data type.  

*FileName*  
&emsp;Type: [Text](../text/text-data-type.md)  
The path and name of the file that you want to save the query to.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
You can use the SaveAsXML method on the global Report object and on Report variables. If, at design time, you do not know the specific report that you want to run, then use the static version of the SaveAsXml method, see [Report.SaveAsXml(Integer, Text [, var Record])](./report-saveasxml-method.md).  

When you call the SaveAsXML method, the report is generated and saved to the file specified in "*FileName*." The request page is not shown.  

[!INCLUDE[report_download_file](../../includes/include-report-download-file.md)]

### Error conditions  
The method can fail in the following three ways:
- [!INCLUDE[report_saveas_error_list_folder_not_exists](../../includes/include-report-saveas-error-list-folder-not-exists.md)]
- [!INCLUDE[report_saveas_error_list_file_used](../../includes/include-report-saveas-error-list-file-used.md)]
- [!INCLUDE[report_saveas_error_list_file_permission](../../includes/include-report-saveas-error-list-file-permission.md)]
If the report you specify does not exist, then a run-time error occurs.  


[!INCLUDE[io_errors](../../includes/include-io-errors.md)]

## Example  
This example shows how to use the static SaveAsXml method in a safe way (where no errors occur).

```al 
var
    FileNameAndPath: Text[250];
    MyReportInstance: Report MyReport;    
begin
    // setup that FileNameAndPath is valid to write to

    MyReportInstance.SaveAsXml(FileNameAndPath);
end;
```  

[!INCLUDE[report_save_as_example](../../includes/include-report-saveas-example.md)]


You can create an action on a page and set the action to run this code. When you run the action, the **Export File** dialog box opens. Choose **Save** to save the file to the client.  


## See Also
[Report Data Type](report-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)