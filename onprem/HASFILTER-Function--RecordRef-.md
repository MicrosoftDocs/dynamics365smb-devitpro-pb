---
title: "HASFILTER Function (RecordRef)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 4a38a4c6-069f-411f-b334-7d20bffa8a96
caps.latest.revision: 11
manager: edupont
---
# HASFILTER Function (RecordRef)
Determines whether a filter has been applied to the table that the RecordRef refers to.  
  
## Syntax  
  
```  
  
Ok := RecordRef.HASFILTER  
```  
  
#### Parameters  
 *RecordRef*  
 Type: RecordRef  
  
 The RecordRef that is used to identify the table.  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **true** if the table referred to by *RecordRef* has a filter; otherwise, **false**.  
  
 If you omit this return value and if the record cannot be found, a run-time error occurs. If you include the return value, it is assumed that you will handle any errors.  
  
## Remarks  
 This function works just like the [HASFILTER Function \(Record\)](HASFILTER-Function--Record-.md).  
  
## Example  
 The following example opens the Customer table with a RecordRef variable that is named RecRef. The HASFILTER function determines whether a filter has been applied in the Customer table. The function returns **false** because no filters are applied. The return value is stored in the varHasFilters variable. The [SETRECFILTER Function \(RecordRef\)](SETRECFILTER-Function--RecordRef-.md) is used to set a filter. The HASFILTER function now returns **true**. This example requires that you create the following variables and text constant in the **C/AL Globals** window.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|RecRef|RecordRef|  
|varHasFilters|Text|  
  
|Text constant name|DataType|ENU value|  
|------------------------|--------------|---------------|  
|Text000|Text|Are there any filters? %1|  
  
```  
  
RecRef.OPEN(DATABASE::Customer);  
VarHasFilters := RecRef.HASFILTER;  
MESSAGE('Are there any filters? %1', VarHasFilters);  
RecRef.SETRECFILTER;  
VarHasFilters := RecRef.HASFILTER;  
MESSAGE(Text000, VarHasFilters);  
```  
  
## See Also  
 [RecordRef Data Type](RecordRef-Data-Type.md)