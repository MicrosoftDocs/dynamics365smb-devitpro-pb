---
title: "MergeDocument Function"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 8f07e5a8-72ed-46ef-bc5a-04089315c90a
caps.latest.revision: 5
manager: edupont
---
# MergeDocument Function
Loads the custom Word layout that is currently set up to use on the report and renders it in the targeted format, such as Word or PDF.  
  
## Syntax  
  
```  
  
MergeDocument(ObjectType : 'Report'; ObjectID : Integer;ReportAction : 'SaveAsPdf,SaveAsWord,SaveAsExcel,Preview,Print'; XmlData : Instream; FileName : Text)  
```  
  
#### Parameters  
 *ObjectType*  
 Type: Option  
  
 The [!INCLUDE[navnow](includes/navnow_md.md)] object type that is run. Currently only Report is supported.  
  
 *ObjectID*  
 Type: Integer  
  
 The ID of the [!INCLUDE[navnow](includes/navnow_md.md)] object.  
  
 *ReportAction*  
 Type: Option  
  
 The action that runs a report the request page or function call. The parameter has the following values: **SaveAsPdf**, **SaveAsWord**, **SaveAsExcel**, **Preview**, or **Print**.  
  
 *XmlData*  
 Type: Instream  
  
 The report data as structured XML.  
  
> [!NOTE]  
>  The delivered XML is in the same format as the XML that is produced by calling the [SAVEASXML Function \(Reports\)](SAVEASXML-Function--Reports-.md).  
  
 *FileName*  
 Type: Text  
  
 The path and the name of the report file that is returned by the report request page action or function calls **SaveAsWord**, **SaveAsPdf**, or **SaveAsExcel**. The parameter is empty for **Preview** and **Print** actions.  
  
## Applies To  
 Report layout implementation in codeunit 1 **ApplicationManagement**.  
  
## Remarks  
 At report run time, this function is called if the [HasCustomLayout Function](HasCustomLayout-Function.md) determines that the report is currently set up to use a custom Word layout. The MergerDocument function is called after the [OnPostReport Trigger](OnPostReport-Trigger.md) is invoked.  
  
## Example  
 The following example shows the default implementation on the function in codeunit 1. This example uses a variable **DocumentReportMgt** that has the data type **Codeunit** and subtype **Document Report Mgt.**.  
  
```  
IF ObjectType <> ObjectType::Report THEN  
    ERROR(NotSupportedErr);  
  
DocumentReportMgt.MergeWordLayout(ObjectID,ReportAction,XmlData,FileName);  
  
```  
  
## See Also  
 [Customizing Report Layout Implementation in Codeunit 1](Customizing-Report-Layout-Implementation-in-Codeunit-1.md)   
 [REPORT.RUN Function](REPORT-RUN-Function.md)   
 [SAVEASWORD Function \(REPORT\)](SAVEASWORD-Function--REPORT-.md)   
 [SAVEASPDF Function \(Report\)](SAVEASPDF-Function--Report-.md)   
 [SAVEASEXCEL Function \(Report\)](SAVEASEXCEL-Function--Report-.md)