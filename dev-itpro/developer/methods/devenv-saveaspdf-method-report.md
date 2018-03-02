---
title: "SAVEASPDF Method (Report)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 1207d441-176f-4f16-9547-43402e5d5043
caps.latest.revision: 21
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# SAVEASPDF Method (Report)
Saves a report as a .pdf file.  

## Syntax  

```  

[Ok :=] REPORT.SAVEASPDF(Number, FileName[, Record])  
[Ok :=] ReportVariable.SAVEASPDF(FileName)  
```  

#### Parameters  
 *Number*  
 Type: Integer  

 The ID of the report that you want to run.   

 *FileName*  
 Type: Text  

 The path and name of the file that you want to save the report as.  

 *Record*  
 Type: Record  

 Specifies which record to use in the report. Any filters that have been applied to the record that you specify will be used.  

 *ReportVariable*  
 The report that you want to run.  

## Property Value/Return Value  
 Type: Boolean  

 **true** if the report was saved; otherwise, **false**.  

 If you omit this optional return value, then run-time errors can occur. If you include a return value, it is assumed that you will handle any errors.  

## Remarks  
 You can use the **SAVEASPDF** method on the global REPORT object or on Report variables. If, at design time, you do not know the specific report that you want to run, then use the global REPORT object and specify the report number in the *Number* parameter. If you do know which report you want to run, then create a Report variable, set the Subtype of the variable to a specific report, and use this variable when you call the **SAVEASPDF** method.  

 When you call **SAVEASPDF**, the report is generated and saved to "*FileName*." A **Saving to PDF** window shows the status of the process. Note that the request page will not be shown.  

 The *FileName* parameter specifies a location on the computer that is running [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)]. If you call this method from a client, such as from an action on a page, then use the [DOWNLOAD Method \(File\)](devenv-DOWNLOAD-Method-File.md) to download the .pdf file from the computer that is running [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)] to the computer that is running the client.  

> [!NOTE]  
>  By default, when a report uses an RDLC report layout at runtime, fonts are embedded in the generated PDF. You can specify whether fonts are embedded in the PDF for RDLC reports by changing the **Report PDF Font Embedding** setting in the [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)] instance configuration or changing the **PDFFontEmbedding** property in report objects. <!--NAV For more information, see [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md) and [PDFFontEmbedding Property](../properties/devenv-PDF-FontEmbedding-Property.md).-->  

## Example  
 This example shows how to use the **SAVEASPDF** method to save a specific report as a PDF file on the computer that is running [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)]. It requires that you create the following variables.  

|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|Filename|Text|Not applicable|  
|ReturnValue|Boolean|Not applicable|  
|Report206|Report|Sales - Invoice|  

```  
Filename := 'C:\MyReports\report206.pdf';   
ReturnValue := Report206.SAVEASPDF(Filename);  
```  

## See Also  
 [Report Data Type](../datatypes/devenv-Report-Data-Type.md)
