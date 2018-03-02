---
title: "FINDFIRST Function (Record)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: a7109cd2-9035-44ba-99b1-b51f0b2e3b12
caps.latest.revision: 12
manager: edupont
---
# FINDFIRST Function (Record)
Finds the first record in a table based on the current key and filter.  
  
## Syntax  
  
```  
  
[Ok :=] Record.FINDFIRST  
```  
  
#### Parameters  
 *Record*  
 Type: Record  
  
 If the record is found, then it is returned in this parameter and any [FlowFields](FlowFields.md) in the record are set to zero. You must update the FlowFields by using the [CALCFIELDS Function \(Record\)](CALCFIELDS-Function--Record-.md).  
  
 If the record is not found and if you omit the return value, then a run-time error occurs.  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **true** if the record was found; otherwise, **false**.  
  
 If you omit this optional return value and the record is not found, then a run-time error occurs. If you include a return value, then you must handle any errors.  
  
## Remarks  
 This function should be used instead of **FIND**\('-'\) when you only need the first record.  
  
 You should only use this function when you explicitly want to find the first record in a table or set. Do not use this function in combination with **REPEAT**.. **UNTIL**.  
  
## Example  
 This example requires that you create the following variable.  
  
|Variable name|Datatype|Subtype|  
|-------------------|--------------|-------------|  
|SalesSetupRec|Record|Sales & Receivables Setup|  
  
 This example also assumes that you have a **ConfigurePost** function.  
  
```  
// Read the first record only.   
IF SalesSetupRec.FINDFIRST THEN BEGIN  
  ConfigurePost(SalesSetupRec);  
END;  
```  
  
## See Also  
 [FIND Function \(Record\)](FIND-Function--Record-.md)   
 [FINDLAST Function \(Record\)](FINDLAST-Function--Record-.md)   
 [FINDSET Function \(Record\)](FINDSET-Function--Record-.md)   
 [Record Data Type](Record-Data-Type.md)