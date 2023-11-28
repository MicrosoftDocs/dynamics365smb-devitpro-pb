---
title: "Report.SaveAsXml(Integer, Text [, var Record]) Method"
description: "Saves the resulting data set of a query as an .xml file."
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
# Report.SaveAsXml(Integer, Text [, var Record]) Method
> **Version**: _Available or changed with runtime version 1.0._

Saves the resulting data set of a query as an .xml file. The following code shows the syntax of the SAVEASXML function. The first line of code is the syntax for an instance method call. The second line of code is the syntax for a static method call.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```AL
[Ok := ]  Report.SaveAsXml(Number: Integer, FileName: Text [, var Record: Record])
```
## Parameters
*Number*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The ID of the query object that you want to save as an .xml file.  If the query that you specify does not exist, then a run-time error occurs.  

*FileName*  
&emsp;Type: [Text](../text/text-data-type.md)  
The path and name of the file that you want to save the query to.  

*[Optional] Record*  
&emsp;Type: [Record](../record/record-data-type.md)  
Specifies which record to use in the report. Any filters that have been applied to the record that you specify will be used.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
You can use the SaveAsXml method on the global Report object and on instances of a Report variable.
If, at design time, you do not know the specific report that you want to run, then use this method (the static one) and specify the report object ID in the *Number* parameter. If you do know which report you want to run, then use the instance method [Report.SaveAsXml(FileName: Text)](./report-saveasxml-method.md).

When you call the SaveAsXML method, the report is generated and saved to "*FileName*." The request page is not shown.  

### Error conditions  
The method can fail in the following four ways:
- If the report you specify in "*Number*" does not exist,
[!INCLUDE[report_saveas_error_list](../../includes/include-report-saveas-error-list.md)]

If the report you specify does not exist, then a run-time error occurs.  

[!INCLUDE[io_errors](../../includes/include-io-errors.md)]

[!INCLUDE[report_download_file](../../includes/include-report-download-file.md)]

## Example  
This example shows how to use the static SaveAsXml method in a safe way (where no errors occur).

```al 
var
    FileNameAndPath: Text[250];
begin
    // setup that FileNameAndPath is valid to write to

    // Note that by using the scope operator (::), you catch at compile time if MyReport does not exist
    Report.SaveAsXml(Report::MyReport, FileNameAndPath);
end;
```  

[!INCLUDE[report_save_as_example](../../includes/include-report-saveas-example.md)]


You can create an action on a page and set the action to run this code. When you run the action, the **Export File** dialog box opens. Choose **Save** to save the file to the client.  


## See Also
[Report Data Type](report-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)