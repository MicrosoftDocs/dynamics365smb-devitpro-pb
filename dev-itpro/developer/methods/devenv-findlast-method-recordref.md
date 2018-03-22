---
title: "FINDLAST Method (RecordRef)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 730062d7-0530-46a7-9cbf-cad9d7732bbd
caps.latest.revision: 13
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# FINDLAST Method (RecordRef)
Finds the last record in a table based on the current key and filter.  
  
## Syntax  
  
```  
  
[Ok :=] RecordRef.FINDLAST  
```  
  
#### Parameters  
 *RecordRef*  
 Type: RecordRef  
  
 The RecordRef that refers to the table in which you want to find the last record.  
  
 If the record is found, it is returned in *RecordRef* and any [FlowFields](../devenv-flowfields.md) in the record are set to zero. You must update any FlowFields using [CALCFIELDS Method \(Record\)](devenv-CALCFIELDS-Method-Record.md).  
  
 If the record is not found and if you omitted the return value, a run-time error occurs.  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **true** if the record was found; otherwise, **false**.  
  
 If you omit this optional return value and if the record cannot be found, a run-time error occurs. If you include a return value, it is assumed that you will handle any errors.  
  
## Remarks  
 You should use this method instead of FIND\('+'\) when you need only the last record.  
  
 You should use this method only when you explicitly want to find the last record in a table or set. Do not use this method in combination with REPEAT..UNTIL.  
  
## Example  
 The following example opens the Item table \(27\) as a RecordRef variable that is named ItemRecref. The FINDLAST method searches for the last record in the table. If the record is found, the description and unit price of the item in the record are displayed in a message box. Otherwise, a message that indicates that the last item was not found is displayed. This example requires that you create the following global variable and text constant.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|ItemRecref|RecordRef|  
  
|Text constant name|DataType|ENU value|  
|------------------------|--------------|---------------|  
|Text000|Text|The last item is %1 and the unit price is %2.|  
|Text001|Text|The last item was not found.|  
  
```  
  
ItemRecref.OPEN(27);  
IF ItemRecref.FINDLAST THEN  
  MESSAGE(Text000, ItemRecref.FIELD(3),  ItemRecref.FIELD(18))  
ELSE  
  MESSAGE(Text001);  
  
```  
  
## See Also  
 [RecordRef Data Type](../datatypes/devenv-RecordRef-Data-Type.md)   
 [FIND Method \(RecordRef\)](devenv-FIND-Method-RecordRef.md)   
 [FINDFIRST Method \(RecordRef\)](devenv-FINDFIRST-Method-RecordRef.md)   
 [FINDSET Method \(RecordRef\)](devenv-FINDSET-Method-RecordRef.md)