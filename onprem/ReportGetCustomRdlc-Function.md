---
title: "ReportGetCustomRdlc Function"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 77da162a-e857-4af2-91a2-5aa347697ff0
caps.latest.revision: 5
manager: edupont
---
# ReportGetCustomRdlc Function
Loads the proper custom RDLC layout for a report at run time and uses the layout to render the report.  
  
## Syntax  
  
```  
  
ReportGetCustomRdlc(ReportID : Integer) : Text  
```  
  
#### Parameters  
 *ObjectType*  
 Type: Option  
  
 The [!INCLUDE[navnow](includes/navnow_md.md)] object type that is running. Currently only the **Report** value is supported.  
  
 *ReportID*  
 Type: Integer  
  
 The ID of the [!INCLUDE[navnow](includes/navnow_md.md)] report object that is run.  
  
## Return Value  
 Type: Text  
  
 The RDLC layout as text string.  
  
## Applies To  
 Report layout implementation in codeunit 1 **ApplicationManagement**.  
  
## Remarks  
 At report run time, this function is called if the [HasCustomLayout Function](HasCustomLayout-Function.md) determines that the report is currently set up to use a custom RDLC layout. The ReportGetCustomRdlc function is called after the [OnPreReport Trigger](OnPreReport-Trigger.md) is invoked.  
  
## Example  
 The following example shows the default implementation on the function in codeunit 1. This example uses a variable **ReportLayout** that has the data type **Record** and subtype **Report Layout**.  
  
```  
EXIT(ReportLayout.GetCustomRdlc(ReportId));  
```  
  
## See Also  
 [Customizing Report Layout Implementation in Codeunit 1](Customizing-Report-Layout-Implementation-in-Codeunit-1.md)   
 [REPORT.RUN Function](REPORT-RUN-Function.md)   
 [SAVEASWORD Function \(REPORT\)](SAVEASWORD-Function--REPORT-.md)   
 [SAVEASPDF Function \(Report\)](SAVEASPDF-Function--Report-.md)   
 [SAVEASEXCEL Function \(Report\)](SAVEASEXCEL-Function--Report-.md)