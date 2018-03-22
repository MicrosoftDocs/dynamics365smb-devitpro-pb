---
title: "HasCustomLayout Method"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 721512fc-5ebc-49cb-a50a-5f9fbda62e91
caps.latest.revision: 6
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# HasCustomLayout Method
Determines whether a report is currently set up to use a custom Word layout or RDLC layout at run time.  
  
## Syntax  
  
```  
  
HasCustomLayout(ObjectType : 'Report'; ObjectID : Integer) : Integer  
```  
  
#### Parameters  
 *ObjectType*  
 Type: Option  
  
 The [!INCLUDE[d365fin_md](../includes/d365fin_md.md)] object type that is run. Currently only the **Report** value is supported.  
  
 *ObjectID*  
 Type: Integer  
  
 The ID of the [!INCLUDE[d365fin_md](../includes/d365fin_md.md)] report object.  
  
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
 This method is executed when a report is run from the client or by a call to the Run, SaveAsWord, SaveAsPdf, and SaveAsExcel methods. The HasCustomLayout method is executed at run time before the [OnPreReport Trigger](../triggers/devenv-OnPreReport-Trigger.md).  
  
## Example  
 The following example shows the default implementation on the method in codeunit 1. This example uses a variable **ReportLayout** that has the data type **Record** and subtype **Report Layout**.  
  
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
 <!--Links [Customizing Report Layout Implementation in Codeunit 1](Customizing-Report-Layout-Implementation-in-Codeunit-1.md) -->  
 [REPORT.RUN Method](devenv-REPORT-RUN-Method.md)   
 [SAVEASWORD Method \(REPORT\)](devenv-SAVEASWORD-Method-REPORT.md)   
 [SAVEASPDF Method \(Report\)](devenv-SAVEASPDF-Method-Report.md)   
 [SAVEASEXCEL Method \(Report\)](devenv-SAVEASEXCEL-Method-Report.md)