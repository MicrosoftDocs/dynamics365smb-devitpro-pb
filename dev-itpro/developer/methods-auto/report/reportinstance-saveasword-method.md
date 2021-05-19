---
title: "Report.SaveAsWord Method"
ms.author: solsen
ms.custom: na
ms.date: 05/19/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Report.SaveAsWord Method
> **Version**: _Available from runtime version 1.0._

Saves a report on the computer that is running the server as a Microsoft Word (.doc) document.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```
[Ok := ]  Report.SaveAsWord(FileName: String)
```
## Parameters
*Report*
&emsp;Type: [Report](report-data-type.md)
An instance of the [Report](report-data-type.md) data type.

*FileName*  
&emsp;Type: [String](../string/string-data-type.md)  
The path and the name of the file that you want to save the report as. The path must exist, the file must not be being used, and the server process must have permission to write to the file. Otherwise, you will get errors.
          


## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 You can use the SaveAsWORD method on the global Report object or on Report variables. If, at design time, you do not know the specific report that you want to run, then use the global Report object and specify the report number in the *Number* parameter. If you do know which report you want to run, then create a Report variable, set the Subtype of the variable to a specific report, and use this variable when you call the SaveAsWORD method.  

 When you call the SaveAsWORD method, the report is generated and saved to "*FileName*." The request page is not shown.  

 If the destination folder that you specify in *FileName* does not exist, then you get the following error:  

 **The specified path is invalid.**  

 If the file that you specify in *FileName* is being used, then you get the following error:  

 **An I/O exception occurred during the operation.**  

 If the [!INCLUDE[d365fin_server_md](../../includes/d365fin_server_md.md)] process does not have permission to write to the file that you specify in *FileName*, then you get the following error:  

 **Either the caller does not have the required permission or the specified path is read-only.**  

## Example  
 This example shows how to use the SaveAsWORD method to save the Word document on the [!INCLUDE[d365fin_server_md](../../includes/d365fin_server_md.md)], and then download the file to a different computer that is running the [!INCLUDE[d365fin_md](../../includes/d365fin_md.md)] application. 
 
```  
var
    TempFile: File;
    Name: Text[250];
    NewStream: InStream;
    ToFile: Text[250];
    ReturnValue: Boolean;
begin
    // Specify that TempFile is opened as a binary file.  
    TempFile.TextMode(False);  
    // Specify that you can write to TempFile.  
    TempFile.WriteMode(True);  
    Name := 'C:\Temp\TempReport.doc';  
    // Create and open TempFile.  
    TempFile.Create(Name);  
    // Close TempFile so that the SaveAsWORD method can write to it.  
    TempFile.Close;  
    
    Report.SaveAsWORD(406,Name);  
    
    TempFile.Open(Name);  
    TempFile.CreateInStream(NewStream);  
    ToFile := 'Report.doc';  
    
    // Transfer the content from the temporary file on the  
    // server to a file on the client.  
    ReturnValue := DownloadFromStream(  
      NewStream,  
      'Save file to client',  
      '',  
      'Word File *.doc| *.doc',  
      ToFile);  
    
    // Close the temporary file.  
    TempFile.Close();  
end;
```  

 You can create an action on a page and set the action to run this code. When you run the action, the **Export File** dialog box opens. Choose **Save** to save the file to the client.


## See Also
[Report Data Type](report-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)