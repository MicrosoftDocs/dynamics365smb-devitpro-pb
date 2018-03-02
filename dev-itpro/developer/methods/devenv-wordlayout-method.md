---
title: "WORDLAYOUT Method"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: d0dd11d6-a428-4cf4-b9fb-47959ab4868c
author: SusanneWindfeldPedersen
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# WORDLAYOUT Method
Gets the Word report layout that is used on a report and returns it as a data stream.  
  
 The method has an instance call and a static call. The following code shows the syntax of the **WORDLAYOUT** method. The first line of code is the syntax for an instance method call. The second line of code is the syntax for a static method call.  
  
## Syntax  
  
```  
  
[Ok :=] ReportVariable.WORDLAYOUT(InStream)  
```  
  
```  
  
[Ok :=] REPORT.WORDLAYOUT(Number, InStream)  
```  
  
#### Parameters  
 *ReportVariable*  
 Type: Report  
  
 A variable that specifies the report object.  
  
 *Number*  
 Type: Integer  
  
 The ID of the report object for which you want to get the Word report layout.  
  
 *InStream*  
 Type: ISequentialStream  
  
 The variable in which to return the Word report layout.  
  
## Return Value  
 Type: Boolean  
  
 **true** if the Word report layout was retrieved successfully; otherwise, **false**.  
  
## Remarks  
 Using the return value is optional. When you use the return value, if the Word report layout cannot be retrieved at run-time, then the system returns **false** and no error recorded. When you omit the return value, if the Word report layout cannot be retrieved at run-time, then an error occurs, which states that the Word report could not be retrieved.  
  
<!--Links
## See Also  
 [Designing Word Report Layouts](Designing-Word-Report-Layouts.md)-->