---
title: "Report.SaveAsExcel(Text) Method"
description: "Saves a report on the computer that is running the server as a Microsoft Excel (.xls) workbook."
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
# Report.SaveAsExcel(Text) Method
> **Version**: _Available or changed with runtime version 1.0._

Saves a report on the computer that is running the server as a Microsoft Excel (.xls) workbook.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```AL
[Ok := ]  Report.SaveAsExcel(FileName: Text)
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
You can use the SaveAsExcel method on the global Report object and on instances of a Report variable. If, at design time, you do not know the specific report that you want to run, then use the static version of the method: [Report.SaveAsExcel(Integer, Text [, var Record])](./report-saveasexcel-method.md). 

When you call the SaveAsExcel method, the report is generated and saved to "*FileName*." The request page is not shown. 

[!INCLUDE[report_download_file](../../includes/include-report-download-file.md)]

### Error conditions  
The method can fail in the following three ways:
[!INCLUDE[report_saveas_error_list](../../includes/include-report-saveas-error-list.md)]

[!INCLUDE[io_errors](../../includes/include-io-errors.md)]

## Example  
This example shows how to use the SaveAsExcel method to generate the report in the [!INCLUDE[prod_short](../../includes/prod_short.md)] server and then download the Excel workbook file to the server.
 
```AL
var
    MyReport: Report MyReport
    TempFile: File;
    FileNameAndPath: Text[250];
    NewStream: InStream;
    ToFile: Text[250];
    ReturnValue: Boolean;
begin
    // Specify that TempFile is opened as a binary file.  
    TempFile.TextMode(False);  
    // Specify that you can write to TempFile.  
    TempFile.WriteMode(True);  

    FileNameAndPath := 'C:\Temp\TempReport.xlsx';  

    // Create and open TempFile.  
    TempFile.Create(FileNameAndPath);  
    // Close TempFile so that the SaveAsExcel method can write to it.  
    TempFile.Close;  
    
    MyReport.SaveAsExcel(FileNameAndPath);  
    
    TempFile.Open(FileNameAndPath);  
    TempFile.CreateInStream(NewStream);  

    ToFile := 'MyReport.xlsx';  
    
    // Transfer the content from the temporary file on the  
    // server to a file on the client.  
    ReturnValue := DownloadFromStream(  
      NewStream,  
      'Save file to client',  
      '',  
      'Excel File *.xlsx| *.xlsx',  
      ToFile
    );  
    
    // Close the temporary file.  
    TempFile.Close();  
end;
```  

You can create an action on a page and set the action to run this code. When you run the action, the **Export File** dialog box opens. Choose **Save** to save the file to the client.  

## See Also
[Report Data Type](report-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)