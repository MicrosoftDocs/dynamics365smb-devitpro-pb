---
title: "SAVEASWORD Method (REPORT)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 28bc7f53-285a-4b21-9541-8a3ea9b1fea5
caps.latest.revision: 11
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# SAVEASWORD Method (REPORT)
Saves a report on the computer that is running [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)] as a Microsoft Word \(.doc\) document.  

## Syntax  

```  
[Ok :=] REPORT.SAVEASWORD(Number, FileName[, Record])  
[Ok :=] ReportVariable.SAVEASWORD(FileName)  
```  

#### Parameters  
 *Number*  
 Type: Integer  

 The ID of the report that you want to run.   

 If the report you specify does not exist, then a run-time error occurs.  

 *FileName*  
 Type: Text  

 The path and the name of the file that you want to save the report as. The path must exist, the file must not be being used, and the [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)] process must have permission to write to the file. Otherwise, you will get errors.  

 *Record*  
 Type: Record  

 Specifies which record to use in the report. Any filters that have been applied to the record that you specify will be used.  

 *ReportVariable*  
 The report that you want to run.  

## Property Value/Return Value  
 Type: Boolean  

 **true** if the report was saved; otherwise, **false**.  

 If you omit this optional return value, then run-time errors can occur. If you include a return value, then it is assumed that you will handle any errors.  

## Remarks  
 You can use the SAVEASWORD method on the global REPORT object or on Report variables. If, at design time, you do not know the specific report that you want to run, then use the global REPORT object and specify the report number in the *Number* parameter. If you do know which report you want to run, then create a Report variable, set the Subtype of the variable to a specific report, and use this variable when you call the SAVEASWORD method.  

 When you call the SAVEASWORD method, the report is generated and saved to "*FileName*." The request page is not shown.  

 If the destination folder that you specify in *FileName* does not exist, then you get the following error:  

 **The specified path is invalid.**  

 If the file that you specify in *FileName* is being used, then you get the following error:  

 **An I/O exception occurred during the operation.**  

 If the [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)] process does not have permission to write to the file that you specify in *FileName*, then you get the following error:  

 **Either the caller does not have the required permission or the specified path is read-only.**  

## Example  
 This example shows how to use the SAVEASWORD method to save the Word document on the [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)], and then download the file to a different computer that is running the [!INCLUDE[d365fin_md](../includes/d365fin_md.md)] application. It requires that you create the following variables.  

|Variable name|DataType|Length|  
|-------------------|--------------|------------|  
|TempFile|File|Not applicable|  
|Name|Text|250|  
|NewStream|InStream|Not applicable|  
|ToFile|Text|250|  
|ReturnValue|Boolean|Not applicable|  

```  
// Specify that TempFile is opened as a binary file.  
TempFile.TEXTMODE(FALSE);  
// Specify that you can write to TempFile.  
TempFile.WRITEMODE(TRUE);  
Name := 'C:\Temp\TempReport.doc';  
// Create and open TempFile.  
TempFile.CREATE(Name);  
// Close TempFile so that the SAVEASWORD method can write to it.  
TempFile.CLOSE;  

REPORT.SAVEASWORD(406,Name);  

TempFile.OPEN(Name);  
TempFile.CREATEINSTREAM(NewStream);  
ToFile := 'Report.doc';  

// Transfer the content from the temporary file on the  
// server to a file on the client.  
ReturnValue := DOWNLOADFROMSTREAM(  
  NewStream,  
  'Save file to client',  
  '',  
  'Word File *.doc| *.doc',  
  ToFile);  

// Close the temporary file.  
TempFile.CLOSE();  
```  

 You can create an action on a page and set the action to run this code. When you run the action, the **Export File** dialog box opens. Choose **Save** to save the file to the client.
