---
title: "VALIDATE Function (FieldRef)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: cd589e34-0250-47e7-825f-1b0b56361f14
caps.latest.revision: 16
manager: edupont
---
# VALIDATE Function (FieldRef)
Use this function to enter a new value into a field and have the new value validated by the properties and code that have been defined for that field.  
  
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
 The VALIDATE function first checks any [TableRelation Property](TableRelation-Property.md), and then executes the [OnValidate \(Fields\) Trigger](OnValidate--Fields--Trigger.md) of the field.  
  
 If you omit *NewValue*, the function validates the current value.  
  
 This function is like the [VALIDATE Function \(Record\)](VALIDATE-Function--Record-.md).  
  
## Example  
 The following example opens table 17 \(G/L Entry\) as a RecordRef that is named EntryRecref. The [FINDFIRST Function \(RecordRef\)](FINDFIRST-Function--RecordRef-.md) searches for the first record in the table. The [FIELD Function \(RecordRef\)](FIELD-Function--RecordRef-.md) sets the field to 3, which is the G/L Account No. field. The **VALIDATE** function validates and inserts the specified value \(1210\) into the field. The [MODIFY Function \(RecordRef\)](MODIFY-Function--RecordRef-.md) modifies the table. A message that indicates the G/L Account No. field has changed is displayed. To show that the code in the **OnValidate** trigger is executed, design the **G/L Entry** table and add the following code to the **G/L Account No. – OnValidate** trigger: `MESSAGE('The OnValidate trigger is called.');`  
  
 This example requires that you create the following variables and text constants in the **C/AL Globals** windows.  
  
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
 [FieldRef Data Type](FieldRef-Data-Type.md)