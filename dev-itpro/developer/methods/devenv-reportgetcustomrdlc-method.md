---
title: "ReportGetCustomRdlc Method"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 77da162a-e857-4af2-91a2-5aa347697ff0
caps.latest.revision: 5
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# ReportGetCustomRdlc Method
Loads the proper custom RDLC layout for a report at run time and uses the layout to render the report.  
  
## Syntax  
  
```  
  
ReportGetCustomRdlc(ReportID : Integer) : Text  
```  
  
#### Parameters  
 *ObjectType*  
 Type: Option  
  
 The [!INCLUDE[d365fin_md](../includes/d365fin_md.md)] object type that is running. Currently only the **Report** value is supported.  
  
 *ReportID*  
 Type: Integer  
  
 The ID of the [!INCLUDE[d365fin_md](../includes/d365fin_md.md)] report object that is run.  
  
## Return Value  
 Type: Text  
  
 The RDLC layout as text string.  
  
## Applies To  
 Report layout implementation in codeunit 1 **ApplicationManagement**.  
  
## Remarks  
 At report run time, this method is called if the [HasCustomLayout Method](devenv-HasCustomLayout-Method.md) determines that the report is currently set up to use a custom RDLC layout. The ReportGetCustomRdlc method is called after the [OnPreReport Trigger](../triggers/devenv-OnPreReport-Trigger.md) is invoked.  
  
## Example  
 The following example shows the default implementation on the method in codeunit 1. This example uses a variable **ReportLayout** that has the data type **Record** and subtype **Report Layout**.  
  
```  
EXIT(ReportLayout.GetCustomRdlc(ReportId));  
```  
  
## See Also  
 <!--Links [Customizing Report Layout Implementation in Codeunit 1](Customizing-Report-Layout-Implementation-in-Codeunit-1.md) -->  
 [REPORT.RUN Method](devenv-REPORT-RUN-Method.md)   
 [SAVEASWORD Method \(REPORT\)](devenv-SAVEASWORD-Method-REPORT.md)   
 [SAVEASPDF Method \(Report\)](devenv-SAVEASPDF-Method-Report.md)   
 [SAVEASEXCEL Method \(Report\)](devenv-SAVEASEXCEL-Method-Report.md)