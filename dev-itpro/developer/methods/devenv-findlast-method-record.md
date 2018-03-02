---
title: "FINDLAST Method (Record)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: dd9f9a1d-27b2-4c6d-ba91-d4a2a201f9b7
caps.latest.revision: 9
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# FINDLAST Method (Record)
Finds the last record in a table based on the current key and filter.  
  
## Syntax  
  
```  
  
[Ok :=] Record.FINDLAST  
```  
  
#### Parameters  
 *Record*  
 Type: Record  
  
 If the record was found, it is returned in this parameter and any [FlowFields](../devenv-flowfields.md) in the record are set to zero. You must update the FlowFields by using the [CALCFIELDS Method \(Record\)](devenv-CALCFIELDS-Method-Record.md).  
  
 If the record was not found and if you omitted the return value, a run-time error occurs.  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **true** if the record was found; otherwise, **false**.  
  
 If you omit this optional return value and the record cannot be found, a run-time error occurs. If you include a return value, you must handle any errors.  
  
## Remarks  
 This method should be used instead of FIND\('+'\) when you only need the last record.  
  
 You should only use this method when you explicitly want to find the last record in a table/set. Do not use this method in combination with REPEAT...UNTIL.  
  
## Example  
 This example requires that you create a Record variable named GLEntryRec for the G/L Entry table.  
  
```  
// Read the last record only.   
IF GLEntryRec.FINDLAST THEN  
  …  
```  
  
## See Also  
 [FIND Method \(Record\)](devenv-FIND-Method-Record.md)   
 [FINDFIRST Method \(Record\)](devenv-FINDFIRST-Method-Record.md)   
 [FINDSET Method \(Record\)](devenv-FINDSET-Method-Record.md)   
 [Record Data Type](../datatypes/devenv-Record-Data-Type.md)