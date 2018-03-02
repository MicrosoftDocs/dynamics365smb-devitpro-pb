---
title: "SAVEASHTML Method (Report)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 5a570de4-a310-42ea-80f1-dd26d8e2b1a3
caps.latest.revision: 18
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# SAVEASHTML Method (Report)
Saves a report as an HTML file. The file is saved on the computer where the [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)] instance is running, and then downloaded to the client when ready.  
  
> [!IMPORTANT]  
>  This method is only supported when a report uses a Word report layout when it is run.  
  
## Syntax  
  
```  
  
[Ok :=] REPORT.SAVEASHTML(Number, FileName [,SystemPrinter] [, Record])  
[Ok :=] ReportVariable.SAVEASHTML(FileName)  
```  
  
#### Parameters  
 *Number*  
 Type: Integer  
  
 The ID of the report object that you want to run.  
  
 *FileName*  
 Type: Text  
  
 The folder path and name of the file that you want to save the report as.  
  
 The path must already exist and the service \(login\) account that is used by the [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)] instance must have permission to write to the target folder. Otherwise, you will get errors.  
  
 *Record*  
 Type: Record  
  
 Specifies which record to use in the report. Any filters that have been applied to the record that you specify will be used.  
  
 *ReportVariable*  
 Type: Report  
  
 Specifies the report that you want to run.  
  
## Property Value/Return Value  
 Type: Boolean  
  
 Indicates whether the report was saved successfully.  
  
 **true** if the report was saved; otherwise, **false**.  
  
-   If you omit the return value, then when a report cannot be saved for some reason, an error message appears to the user, such as "Out of hard disk space," "The file parameter is not open," and so on.  
  
-   If you use the return value and an error occurs, **false** is returned and no error message appears. It is assumed that you will handle any errors.  
  
## Remarks  
 The SAVEASHTML method uses the logic in the codeunit **9651 Document Report Mgt.** code unit to handle the format transformation.  
  
 The SAVEASHTML method can be used on the Report data type and on Report variables. When you are programming the SAVEASHTML method, if you do not know the specific report that you want to run, then use the global REPORT object and specify the report number in the *Number* parameter. If you know which report you want to run, then create a Report variable, set the **Subtype** of the variable to a specific report, and then use this variable when you call the SAVEASHTML method.  
  
 When you call the SAVEASXML method, the report is generated and saved to "FileName." The request page is not shown.  
  
 Reports that use an RDLC layout when run cannot be saved in the HTML format. A runtime error will occur if SAVEASHTML is used on an RDLC report.  
  
## See Also  
 [Report Data Type](../datatypes/devenv-Report-Data-Type.md)