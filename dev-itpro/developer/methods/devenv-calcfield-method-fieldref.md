---
title: "CALCFIELD Method (FieldRef)"
ms.custom: na
ms.date: 07/04/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: d226598c-f73c-41f1-baa9-17a642483c35
author: SusanneWindfeldPedersen
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# CALCFIELD Method (FieldRef)
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

 **True** if FlowField has been calculated; otherwise, **false**.  

## Remarks  
 FlowFields are virtual fields. The values in these fields are not saved in the table.  

 This means that you must use the CALCFIELDS method to update them. For example, if you retrieve a record using the [FIND Method \(RecordRef\)](devenv-FIND-Method-RecordRef.md) and [NEXT Method \(RecordRef\)](devenv-NEXT-Method-RecordRef.md) methods, the FlowFields in those records are set to zero \(0\). Then, you can call FieldRef.CALCFIELD, to calculate the value in one of the FlowFields.  

 When a FlowField is a direct source expression of a control on a page or a report, the calculation is automatically performed.  

 You can also use the CALCFIELDS method to calculate binary large objects \(BLOBs\). For more information, see [BLOB Data Type](../datatypes/devenv-BLOB-Data-Type.md).  

 This method is similar to the [CALCFIELDS Method \(Record\)](devenv-CALCFIELDS-Method-Record.md) method.  

## Example  
 The following example opens table 18 \(Customer\) as a RecordRef variable that is named CustRecordref. The [FIND Method \(RecordRef\)](devenv-FIND-Method-RecordRef.md) selects the first record in the table and then loops through all the records until no records could be found. For each record, the [FIELD Method \(RecordRef\)](devenv-FIELD-Method-RecordRef.md) creates a FieldRef variable that is named MyFieldref for the Balance Due field \(field 66\), which is a flow field. The CALCFIELD method is called to update the field before the customer ID and the balance due are displayed. Otherwise, the balance due for every record will be set to 0. This example requires that you create the following global variables and text constantss.  

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
 [FieldRef Data Type](../datatypes/devenv-FieldRef-Data-Type.md)   
 [FlowFields](../devenv-flowfields.md)  
