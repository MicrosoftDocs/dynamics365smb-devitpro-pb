---
title: "HASFILTER Method (RecordRef)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 4a38a4c6-069f-411f-b334-7d20bffa8a96
caps.latest.revision: 11
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# HASFILTER Method (RecordRef)
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
 This method works just like the [HASFILTER Method \(Record\)](devenv-HASFILTER-Method-Record.md).  
  
## Example  
 The following example opens the Customer table with a RecordRef variable that is named RecRef. The HASFILTER method determines whether a filter has been applied in the Customer table. The method returns **false** because no filters are applied. The return value is stored in the varHasFilters variable. The [SETRECFILTER Method \(RecordRef\)](devenv-SETRECFILTER-Method-RecordRef.md) is used to set a filter. The HASFILTER method now returns **true**. This example requires that you create the following global variables and text constant.  
  
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
 [RecordRef Data Type](../datatypes/devenv-RecordRef-Data-Type.md)