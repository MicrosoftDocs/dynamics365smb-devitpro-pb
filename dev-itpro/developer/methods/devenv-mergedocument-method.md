---
title: "MergeDocument Method"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 8f07e5a8-72ed-46ef-bc5a-04089315c90a
caps.latest.revision: 5
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# MergeDocument Method
Loads the custom Word layout that is currently set up to use on the report and renders it in the targeted format, such as Word or PDF.  

## Syntax  

```  

MergeDocument(ObjectType : 'Report'; ObjectID : Integer;ReportAction : 'SaveAsPdf,SaveAsWord,SaveAsExcel,Preview,Print'; XmlData : Instream; FileName : Text)  
```  

#### Parameters  
 *ObjectType*  
 Type: Option  

 The [!INCLUDE[d365fin_md](../includes/d365fin_md.md)] object type that is run. Currently only Report is supported.  

 *ObjectID*  
 Type: Integer  

 The ID of the [!INCLUDE[d365fin_md](../includes/d365fin_md.md)] object.  

 *ReportAction*  
 Type: Option  

 The action that runs a report the request page or method call. The parameter has the following values: **SaveAsPdf**, **SaveAsWord**, **SaveAsExcel**, **Preview**, or **Print**.  

 *XmlData*  
 Type: Instream  

 The report data as structured XML.  

> [!NOTE]  
>  The delivered XML is in the same format as the XML that is produced by calling the [SAVEASXML Method \(Reports\)](devenv-SAVEASXML-Method-Reports.md).  

 *FileName*  
 Type: Text  

 The path and the name of the report file that is returned by the report request page action or method calls **SaveAsWord**, **SaveAsPdf**, or **SaveAsExcel**. The parameter is empty for **Preview** and **Print** actions.  

## Applies To  
 Report layout implementation in codeunit 1 **ApplicationManagement**.  

## Remarks  
 At report run time, this method is called if the [HasCustomLayout Method](devenv-HasCustomLayout-Method.md) determines that the report is currently set up to use a custom Word layout. The MergerDocument method is called after the [OnPostReport Trigger](../triggers/devenv-OnPostReport-Trigger.md) is invoked.  

## Example  
 The following example shows the default implementation on the method in codeunit 1. This example uses a variable **DocumentReportMgt** that has the data type **Codeunit** and subtype **Document Report Mgt.**.  

```  
IF ObjectType <> ObjectType::Report THEN  
    ERROR(NotSupportedErr);  

DocumentReportMgt.MergeWordLayout(ObjectID,ReportAction,XmlData,FileName);  

```  

## See Also  
 <!--Links [Customizing Report Layout Implementation in Codeunit 1](Customizing-Report-Layout-Implementation-in-Codeunit-1.md) -->  
 [REPORT.RUN Method](devenv-REPORT-RUN-Method.md)   
 [SAVEASWORD Method \(REPORT\)](devenv-SAVEASWORD-Method-REPORT.md)   
 [SAVEASPDF Method \(Report\)](devenv-SAVEASPDF-Method-Report.md)   
 [SAVEASEXCEL Method \(Report\)](devenv-SAVEASEXCEL-Method-Report.md)
