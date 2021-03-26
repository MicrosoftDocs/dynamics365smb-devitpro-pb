---
title: "Report.SaveAsXml Method"
ms.author: solsen
ms.custom: na
ms.date: 02/15/2021
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
# Report.SaveAsXml Method
> **Version**: _Available or changed with runtime version 1.0._

Saves the resulting data set of a query as an .xml file. The following code shows the syntax of the SAVEASXML function. The first line of code is the syntax for an instance method call. The second line of code is the syntax for a static method call.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```
[Ok := ]  Report.SaveAsXml(Number: Integer, FileName: String [, var Record: Record])
```
## Parameters
*Number*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The ID of the query object that you want to save as an .xml file.  If the query that you specify does not exist, then a run-time error occurs.
        
*FileName*  
&emsp;Type: [String](../string/string-data-type.md)  
The path and name of the file that you want to save the query to.
        
*Record*  
&emsp;Type: [Record](../record/record-data-type.md)  
Specifies which record to use in the report. Any filters that have been applied to the record that you specify will be used.  


## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 You can use the SaveAsXML method on the global Report object and on Report variables. If, at design time, you do not know the specific report that you want to run, then use the global Report object and specify the report number in the *Number* parameter. If you know which report you want to run, then create a Report variable, set the **Subtype** of the variable to a specific report, and then use this variable when you call the SaveAsXML method.  

 When you call the SaveAsXML method, the report is generated and saved to "*FileName*." The request page is not shown.  

 If the destination folder that you specify in *FileName* does not exist, then you get the following error:  

 **The specified path is invalid.**  

 If the file that you specify in *FileName* is being used, then you get the following error:  

 **An I/O exception occurred during the operation.**  

 If the [!INCLUDE[d365fin_server_md](../../includes/d365fin_server_md.md)] does not have permission to write to the file that you specify in *FileName*, then you get the following error:  

 **Either the caller does not have the required permission or the specified path is read-only.**  

 To resolve this issue, verify that the service account that is running the [!INCLUDE[d365fin_server_md](../../includes/d365fin_server_md.md)] instance has write permissions on the path.  

## Example  
 This example shows how to use the SaveAsXML method to save a report as an .xml file on the [!INCLUDE[d365fin_server_md](../../includes/d365fin_server_md.md)], and then download the file to a  computer that is running the [!INCLUDE[d365fin_md](../../includes/d365fin_md.md)]. 
 
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
    Name := 'C:\Temp\TempReport.xml';  
    // Create and open TempFile.  
    TempFile.Create(Name);  
    // Close TempFile so that the SaveAsXML method can write to it.  
    TempFile.Close;  
    
    Report.SaveAsXML(406,Name);  
    
    TempFile.Open(Name);  
    TempFile.CreateInStream(NewStream);  
    ToFile := 'Report.xml';  
    
    // Transfer the content from the temporary file on
    // server to a file on the client.  
    ReturnValue := DownloadFromStream(  
      NewStream,  
      'Save file to client',  
      '',  
      'Excel File *.xml| *.xml',  
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