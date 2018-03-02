---
title: "FINDFIRST Function (RecordRef)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 4bebda93-0d67-450a-ac92-c86d53e9ab24
caps.latest.revision: 14
manager: edupont
---
# FINDFIRST Function (RecordRef)
Finds the first record in a table based on the current key and filter.  
  
## Syntax  
  
```  
  
[Ok :=] RecordRef.FINDFIRST  
```  
  
#### Parameters  
 *RecordRef*  
 Type: RecordRef  
  
 The RecordRef that refers to the table in which you want to find a record.  
  
 If the record is found, it is returned in *RecordRef* and any [FlowFields](FlowFields.md) in the record are set to zero. You must update any FlowFields using [CALCFIELDS Function \(Record\)](CALCFIELDS-Function--Record-.md).  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **true** if the record was found; otherwise, **false**.  
  
 If you omit this optional return value and if the record cannot be found, a run-time error occurs. If you include a return value, it is assumed that you will handle any errors.  
  
## Remarks  
 You should use this function instead of FIND\('-'\) when you need only the first record.  
  
 You should use this function only when you explicitly want to find the first record in a table or set. Do not use this function in combination with REPEAT..UNTIL.  
  
## Example  
 The following example opens the Item table \(27\) as a RecordRef variable that is named ItemRecref. The FINDFIRST function searches for the first record in the table. If the record is found, the description and unit price of the item in the record are displayed in a message box. Otherwise, a message that indicates that the first item was not found is displayed. This example requires that you create the following variable and text constant in the **C/AL Globals** window.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|ItemRecref|RecordRef|  
  
|Text constant name|DataType|ENU value|  
|------------------------|--------------|---------------|  
|Text000|Text|The first item is %1 and the unit price is %2.|  
|Text001|Text|The first item was not found.|  
  
```  
  
ItemRecref.OPEN(27);  
IF ItemRecref.FINDFIRST THEN  
  MESSAGE(Text000, ItemRecref.FIELD(3),  ItemRecref.FIELD(18))  
ELSE  
  MESSAGE(Text001);  
  
```  
  
## See Also  
 [RecordRef Data Type](RecordRef-Data-Type.md)   
 [FIND Function \(RecordRef\)](FIND-Function--RecordRef-.md)   
 [FINDLAST Function \(RecordRef\)](FINDLAST-Function--RecordRef-.md)   
 [FINDSET Function \(RecordRef\)](FINDSET-Function--RecordRef-.md)