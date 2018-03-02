---
title: "SAVEAS Function"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 3a77faff-8804-4b90-aba5-445b03debc7a
caps.latest.revision: 6
manager: edupont
---
# SAVEAS Function
Runs a specific report without a request page and saves the report as a PDF, Excel, Word, or XML file. Instead of using the request page to obtain parameters at runtime, the function gets the parameter values as an input parameter string, typically from the return value of a [RUNREQUESTPAGE Function](RUNREQUESTPAGE-Function.md) call.  

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

 A string of request page parameters as XML to use to run the report. The parameter string is retrieved from the return value a [RUNREQUESTPAGE Function](RUNREQUESTPAGE-Function.md) function call.  

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

 **true** if the report was saved to a file; otherwise, **false**.  

## Remarks  
 You typically use this function together with the [RUNREQUESTPAGE Function](RUNREQUESTPAGE-Function.md) function. The RUNREQUESTPAGE function runs a report request page without actually running the report, but instead, returns the parameters that are set on the request page as a string. You can then call the SAVEAS function to get the parameter string and save the report to a file of the specified format.  

 For a simple example that illustrates how to use the SAVEAS function, see example in the [RUNREQUESTPAGE Function](RUNREQUESTPAGE-Function.md) function topic.  

> [!NOTE]  
>  By default, when a report uses an RDLC report layout at runtime, fonts are embedded in the generated PDF. You can specify whether fonts are embedded in the PDF for RDLC reports by changing the **Report PDF Font Embedding** setting in the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance configuration or changing the **PDFFontEmbedding** property in report objects. For more information, see [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md) and [PDFFontEmbedding Property](PDFFontEmbedding-Property.md).  

## See Also  
 [Reports](Reports.md)   
 [Request Pages](Request-Pages.md)   
 [EXECUTE Function](EXECUTE-Function.md)   
 [PRINT Function](PRINT-Function.md)
