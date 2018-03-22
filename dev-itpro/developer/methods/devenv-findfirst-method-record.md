---
title: "FINDFIRST Method (Record)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: a7109cd2-9035-44ba-99b1-b51f0b2e3b12
caps.latest.revision: 12
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# FINDFIRST Method (Record)
Finds the first record in a table based on the current key and filter.  
  
## Syntax  
  
```  
  
[Ok :=] Record.FINDFIRST  
```  
  
#### Parameters  
 *Record*  
 Type: Record  
  
 If the record is found, then it is returned in this parameter and any [FlowFields](../devenv-flowfields.md) in the record are set to zero. You must update the FlowFields by using the [CALCFIELDS Method \(Record\)](devenv-CALCFIELDS-Method-Record.md).  
  
 If the record is not found and if you omit the return value, then a run-time error occurs.  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **true** if the record was found; otherwise, **false**.  
  
 If you omit this optional return value and the record is not found, then a run-time error occurs. If you include a return value, then you must handle any errors.  
  
## Remarks  
 This method should be used instead of **FIND**\('-'\) when you only need the first record.  
  
 You should only use this method when you explicitly want to find the first record in a table or set. Do not use this method in combination with **REPEAT**.. **UNTIL**.  
  
## Example  
 This example requires that you create the following variable.  
  
|Variable name|Datatype|Subtype|  
|-------------------|--------------|-------------|  
|SalesSetupRec|Record|Sales & Receivables Setup|  
  
 This example also assumes that you have a **ConfigurePost** method.  
  
```  
// Read the first record only.   
IF SalesSetupRec.FINDFIRST THEN BEGIN  
  ConfigurePost(SalesSetupRec);  
END;  
```  
  
## See Also  
 [FIND Method \(Record\)](devenv-FIND-Method-Record.md)   
 [FINDLAST Method \(Record\)](devenv-FINDLAST-Method-Record.md)   
 [FINDSET Method \(Record\)](devenv-FINDSET-Method-Record.md)   
 [Record Data Type](../datatypes/devenv-Record-Data-Type.md)