---
title: "SAVEAS Method"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 3a77faff-8804-4b90-aba5-445b03debc7a
caps.latest.revision: 6
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# SAVEAS Method
Runs a specific report without a request page and saves the report as a PDF, Excel, Word, or XML file. Instead of using the request page to obtain parameters at runtime, the method gets the parameter values as an input parameter string, typically from the return value of a [RUNREQUESTPAGE Method](devenv-RUNREQUESTPAGE-Method.md) call.  

## Syntax  

```  
[Ok:=] REPORT.SAVEAS(Number, Parameters, Format, OutStream[, RecordRef])  
```  

#### Parameters  
 *Number*  
 Type: Integer  

 The ID of the report that you want to save. To specify the report from a list, on the **View** menu, choose **Symbols**.  

 If the report that you specify does not exist, then a run-time error occurs.  

 *Parameters*  
 Type: Text or Code  

 A string of request page parameters as XML to use to run the report. The parameter string is retrieved from the return value a [RUNREQUESTPAGE Method](devenv-RUNREQUESTPAGE-Method.md) method call.  

 *Format*  
 Type: Option  

 The type of file to save the report as. The following options are supported: **Pdf**, **Excel**, **Word**, and **XML**.  

 *OutStream*  
 Type: OutStream  

 The stream to which to write a report.  

 *RecordRef*  
 Type: RecordRef  

 The RecordRef that refers to the table in which you want to find a record.  

## Return Value  
 Type: Boolean  

 If you omit this optional return value and if the report cannot be saved as a file, then a run-time error occurs that states that the report cannot be saved. If you include a return value, then it is assumed that you will handle any errors and no run-time error occurs, even though the report is not saved.  

 **True** if the report was saved to a file; otherwise, **false**.  

## Remarks  
 You typically use this method together with the [RUNREQUESTPAGE Method](devenv-RUNREQUESTPAGE-Method.md) method. The RUNREQUESTPAGE method runs a report request page without actually running the report, but instead, returns the parameters that are set on the request page as a string. You can then call the SAVEAS method to get the parameter string and save the report to a file of the specified format.  

 For a simple example that illustrates how to use the SAVEAS method, see example in the [RUNREQUESTPAGE Method](devenv-RUNREQUESTPAGE-Method.md) method topic.  

> [!NOTE]  
>  By default, when a report uses an RDLC report layout at runtime, fonts are embedded in the generated PDF. You can specify whether fonts are embedded in the PDF for RDLC reports by changing the **Report PDF Font Embedding** setting in the [!INCLUDE[d365fin_server_md](../includes/d365fin_server_md.md)] instance configuration or changing the **PDFFontEmbedding** property in report objects. <!--NAV For more information, see [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md) and [PDFFontEmbedding Property](../properties/devenv-PDF-FontEmbedding-Property.md).-->  

## See Also  
 [Report Object](../devenv-report-object.md)   
 [EXECUTE Method](devenv-EXECUTE-Method.md)   
 [PRINT Method](devenv-PRINT-Method.md)  
  <!--Links [Request Pages](Request-Pages.md)-->   
