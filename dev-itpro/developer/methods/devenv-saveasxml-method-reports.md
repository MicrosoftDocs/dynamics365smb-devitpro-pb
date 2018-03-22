---
title: "SAVEASXML Method (Reports)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 734be992-db50-4100-8c1d-2b09d3b67643
caps.latest.revision: 3
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# SAVEASXML Method (Reports)
Saves a report as an .xml file on the computer that is running [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)].  

## Syntax  

```  

[Ok :=] REPORT.SAVEASXML(Number, FileName[, Record])  
[Ok :=] ReportVariable.SAVEASXML(FileName)  
```  

#### Parameters  
 *Number*  
 Type: Integer  

 The ID of the report that you want to run.   

 If the report you specify does not exist, then a run-time error occurs.  

 *FileName*  
 Type: Text  

 The path and the name of the file that you want to save the report as. The path must exist, the file must not be being used, and the [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)] must have permission to write to the file. Otherwise, you will get errors.  

> [!TIP]  
>  If you call this method from a client, such as from an action on a page, then you can use the [DOWNLOAD Method \(File\)](devenv-DOWNLOAD-Method-File.md) to send the .xml file from the computer that is running [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)] to the computer that is running the client.  

 *Record*  
 Type: Record  

 Specifies which record to use in the report. Any filters that have been applied to the record that you specify will be used.  

 *ReportVariable*  
 The report that you want to run.  

## Property Value/Return Value  
 Type: Boolean  

 If you omit this optional return value, then run-time errors can occur. If you include a return value, then it is assumed that you will handle any errors.  

 **true** if the report was saved; otherwise, **false**.  

## Remarks  
 You can use the SAVEASXML method on the global REPORT object and on Report variables. If, at design time, you do not know the specific report that you want to run, then use the global REPORT object and specify the report number in the *Number* parameter. If you know which report you want to run, then create a Report variable, set the **Subtype** of the variable to a specific report, and then use this variable when you call the SAVEASXML method.  

 When you call the SAVEASXML method, the report is generated and saved to "*FileName*." The request page is not shown.  

 If the destination folder that you specify in *FileName* does not exist, then you get the following error:  

 **The specified path is invalid.**  

 If the file that you specify in *FileName* is being used, then you get the following error:  

 **An I/O exception occurred during the operation.**  

 If the [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)] does not have permission to write to the file that you specify in *FileName*, then you get the following error:  

 **Either the caller does not have the required permission or the specified path is read-only.**  

 To resolve this issue, verify that the service account that is running the [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)] instance has write permissions on the path.  

## Example  
 This example shows how to use the SAVEASXML method to save a report as an .xml file on the [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)], and then download the file to a  computer that is running the [!INCLUDE[d365fin_md](../includes/d365fin_md.md)]. This example requires that you create the following variables.  

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
Name := 'C:\Temp\TempReport.xml';  
// Create and open TempFile.  
TempFile.CREATE(Name);  
// Close TempFile so that the SAVEASXML method can write to it.  
TempFile.CLOSE;  

REPORT.SAVEASXML(406,Name);  

TempFile.OPEN(Name);  
TempFile.CREATEINSTREAM(NewStream);  
ToFile := 'Report.xml';  

// Transfer the content from the temporary file on
// server to a file on the client.  
ReturnValue := DOWNLOADFROMSTREAM(  
  NewStream,  
  'Save file to client',  
  '',  
  'Excel File *.xml| *.xml',  
  ToFile);  

// Close the temporary file.  
TempFile.CLOSE();  
```  

 You can create an action on a page and set the action to run this code. When you run the action, the **Export File** dialog box opens. Choose **Save** to save the file to the client.  

## See Also  
 [Report Data Type](../datatypes/devenv-Report-Data-Type.md)
