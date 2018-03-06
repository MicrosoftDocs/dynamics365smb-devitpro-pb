---
title: "CALCFIELD Function (FieldRef)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: d226598c-f73c-41f1-baa9-17a642483c35
caps.latest.revision: 25
---
# CALCFIELD Function (FieldRef)
Updates FlowFields in a record.  
  
## Syntax  
  
```  
  
[Ok :=] FieldRef.CALCFIELD  
```  
  
#### Parameters  
 *FieldRef*  
 Type: FieldRef  
  
 The FieldRef of the FlowField that you want to update.  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **true** if FlowField has been calculated; otherwise, **false**.  
  
## Remarks  
 FlowFields are virtual fields. The values in these fields are not saved in the table.  
  
 This means that you must use the CALCFIELDS function to update them. For example, if you retrieve a record using the [FIND Function \(RecordRef\)](FIND-Function--RecordRef-.md) and [NEXT Function \(RecordRef\)](NEXT-Function--RecordRef-.md) functions, the FlowFields in those records are set to zero \(0\). Then, you can call FieldRef.CALCFIELD, to calculate the value in one of the FlowFields.  
  
 When a FlowField is a direct source expression of a control on a page or a report, the calculation is automatically performed.  
  
 You can also use the CALCFIELDS function to calculate binary large objects \(BLOBs\). For more information, see [BLOB Data Type](BLOB-Data-Type.md).  
  
 This function is similar to the [CALCFIELDS Function \(Record\)](CALCFIELDS-Function--Record-.md) function.  
  
## Example  
 The following example opens table 18 \(Customer\) as a RecordRef variable that is named CustRecordref. The [FIND Function \(RecordRef\)](FIND-Function--RecordRef-.md) selects the first record in the table and then loops through all the records until no records could be found. For each record, the [FIELD Function \(RecordRef\)](FIELD-Function--RecordRef-.md) creates a FieldRef variable that is named MyFieldref for the Balance Due field \(field 66\), which is a flow field. The CALCFIELD function is called to update the field before the customer ID and the balance due are displayed. Otherwise, the balance due for every record will be set to 0. This example requires that you create the following variables and text constants in the **C/AL Globals** windows.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|CustRecordref|RecordRef|  
|MyFieldRef|FieldRef|  
|Count|Integer|  
  
|Text constant|ENU value|  
|-------------------|---------------|  
|Text000|%1: \\Balance Due: %2|  
  
```  
  
Count := 0;  
CustRecordref.OPEN(18);  
IF CustRecordref.FIND('-') THEN  
  REPEAT  
    MyFieldRef := CustRecordref.FIELD(66);  
    MyFieldRef.CALCFIELD;  
    MESSAGE(Text000, CustRecordref.RECORDID, MyFieldRef);  
    Count := Count + 1;  
  UNTIL CustRecordref.NEXT = 0;  
```  
  
## See Also  
 [FieldRef Data Type](FieldRef-Data-Type.md)   
 [FlowFields](FlowFields.md)