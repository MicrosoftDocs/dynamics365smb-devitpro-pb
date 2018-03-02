---
title: "HasCustomLayout Function"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 721512fc-5ebc-49cb-a50a-5f9fbda62e91
caps.latest.revision: 6
manager: edupont
---
# HasCustomLayout Function
Determines whether a report is currently set up to use a custom Word layout or RDLC layout at run time.  
  
## Syntax  
  
```  
  
HasCustomLayout(ObjectType : 'Report'; ObjectID : Integer) : Integer  
```  
  
#### Parameters  
 *ObjectType*  
 Type: Option  
  
 The [!INCLUDE[navnow](includes/navnow_md.md)] object type that is run. Currently only the **Report** value is supported.  
  
 *ObjectID*  
 Type: Integer  
  
 The ID of the [!INCLUDE[navnow](includes/navnow_md.md)] report object.  
  
## Return Value  
 Type: Integer  
  
 The following values are available.  
  
|Value|Description|  
|-----------|-----------------|  
|0|The report is not currently set up to use a custom RDLC or Word layout.|  
|1|The report is currently set up to use a custom RDLC layout.|  
|2|The report is currently set up to use a custom Word layout.|  
  
## Applies To  
 Report layout implementation in codeunit 1 **ApplicationManagement**.  
  
## Remarks  
 This function is executed when a report is run from the [!INCLUDE[navnow](includes/navnow_md.md)] client or by a call to the Run, SaveAsWord, SaveAsPdf, and SaveAsExcel functions. The HasCustomLayout function is executed at run time before the [OnPreReport Trigger](OnPreReport-Trigger.md).  
  
## Example  
 The following example shows the default implementation on the function in codeunit 1. This example uses a variable **ReportLayout** that has the data type **Record** and subtype **Report Layout**.  
  
```  
IF ObjectType <> ObjectType::Report THEN  
    ERROR(NotSupportedErr);  
  
IF ReportLayout.GetActiveReportLayout(ObjectID,ReportLayout.Type::RDLC) THEN  
    EXIT(1);  
IF ReportLayout.GetActiveReportLayout(ObjectID,ReportLayout.Type::Word) THEN  
    EXIT(2);  
EXIT(0);  
```  
  
## See Also  
 [Customizing Report Layout Implementation in Codeunit 1](Customizing-Report-Layout-Implementation-in-Codeunit-1.md)   
 [REPORT.RUN Function](REPORT-RUN-Function.md)   
 [SAVEASWORD Function \(REPORT\)](SAVEASWORD-Function--REPORT-.md)   
 [SAVEASPDF Function \(Report\)](SAVEASPDF-Function--Report-.md)   
 [SAVEASEXCEL Function \(Report\)](SAVEASEXCEL-Function--Report-.md)