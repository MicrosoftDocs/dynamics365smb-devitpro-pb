---
title: "VALIDATE Method (FieldRef)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: cd589e34-0250-47e7-825f-1b0b56361f14
author: SusanneWindfeldPedersen
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# VALIDATE Method (FieldRef)
Use this method to enter a new value into a field and have the new value validated by the properties and code that have been defined for that field.  

## Syntax  

```  

FieldRef.VALIDATE([NewValue])  
```  

#### Parameters  
 *FieldRef*  
 Type: FieldRef  

 Refers to the current field.  

 *NewValue*  
 Type: must be compatible with the data type of the field referred to by the FieldRef.  

 The value to insert in the field.  

## Remarks  
 The VALIDATE method first checks any [TableRelation Property](../properties/devenv-TableRelation-Property.md), and then executes the [OnValidate \(Fields\) Trigger](../triggers/devenv-OnValidate-Fields-Trigger.md) of the field.  

 If you omit *NewValue*, the method validates the current value.  

 This method is like the [VALIDATE Method \(Record\)](devenv-VALIDATE-Method-Record.md).  

## Example  
 The following example opens table 17 \(G/L Entry\) as a RecordRef that is named EntryRecref. The [FINDFIRST Method \(RecordRef\)](devenv-FINDFIRST-Method-RecordRef.md) searches for the first record in the table. The [FIELD Method \(RecordRef\)](devenv-FIELD-Method-RecordRef.md) sets the field to 3, which is the G/L Account No. field. The **VALIDATE** method validates and inserts the specified value \(1210\) into the field. The [MODIFY Method \(RecordRef\)](devenv-MODIFY-Method-RecordRef.md) modifies the table. A message that indicates the G/L Account No. field has changed is displayed. To show that the code in the **OnValidate** trigger is executed, design the **G/L Entry** table and add the following code to the **G/L Account No. – OnValidate** trigger: `MESSAGE('The OnValidate trigger is called.');`  

 This example requires that you create the following global variables and text constantss.  

|Variable name|DataType|  
|-------------------|--------------|  
|EntryRecref|RecordRef|  
|MyFieldRef|FieldRef|  

|Text constant|ConstValue|  
|-------------------|----------------|  
|Text000|The G/L Account No. for record %1 is %2.|  
|Text001|The G/L Account No. for record %1 has changed to %2.|  

```  
EntryRecref.OPEN(17);  
IF EntryRecref.FINDFIRST THEN BEGIN  
  MyFieldRef := EntryRecref.FIELD(3);  
  MESSAGE(Text000, EntryRecref.RECORDID, MyFieldRef.VALUE);  
  MyFieldRef.VALIDATE('1210');  
  EntryRecref.MODIFY;  
  MESSAGE(Text001, EntryRecref.RECORDID, MyFieldRef.VALUE);  
END;  
```  

## See Also  
 [FieldRef Data Type](../datatypes/devenv-FieldRef-Data-Type.md)
