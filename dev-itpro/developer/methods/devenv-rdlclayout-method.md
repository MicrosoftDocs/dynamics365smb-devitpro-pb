---
title: "RDLCLAYOUT Method"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: d0a7992f-a1f2-4c37-bfc0-cfc0459cfe44
caps.latest.revision: 4
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# RDLCLAYOUT Method
Gets the RDLC layout that is used on a report and returns it as a data stream.  
  
 The method has an instance call and a static call. The following code shows the syntax of the **RDLC** method. The first line of code is the syntax for an instance method call. The second line of code is the syntax for a static method call.  
  
## Syntax  
  
```  
  
[Ok :=] ReportVariable.RDLCLAYOUT(InStream)  
```  
  
```  
  
[Ok :=] REPORT.RDLCLAYOUT(Number, InStream)  
```  
  
#### Parameters  
 *ReportVariable*  
 Type: Report  
  
 A variable that specifies the report object.  
  
 *Number*  
 Type: Integer  
  
 The ID of the report object for which you want to get the RDLC layout.  
  
 *InStream*  
 Type: ISequentialStream  
  
 The variable in which to return the RDLC layout.  
  
## Return Value  
 Type: Boolean  
  
 **true** if the RDLC layout was retrieved successfully; otherwise, **false**.  
  
## Remarks  
 Using the return value is optional. When you use the return value, if the RDLC layout cannot be retrieved at run-time, then the system returns **false** and no error recorded. When you omit the return value, if the RDLC layout cannot be retrieved at run-time, then an error occurs, which states that the layout could not be retrieved.  
  
<!--Links
## See Also  
 [Designing Word Report Layouts](Designing-Word-Report-Layouts.md)-->