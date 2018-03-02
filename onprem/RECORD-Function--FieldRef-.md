---
title: "RECORD Function (FieldRef)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: f3232aae-2395-4afe-b1f0-c4e4f16d71d5
caps.latest.revision: 11
---
# RECORD Function (FieldRef)
Gets the RecordRef of the field that is currently selected.  
  
 This function returns an error if no field is selected.  
  
## Syntax  
  
```  
  
RecordRef := FieldRef.RECORD  
```  
  
#### Parameters  
 FieldRef  
 Type: FieldRef  
  
 Refers to the current field.  
  
## Return Value  
 Type: RecordRef  
  
 The RecordRef of the field that is currently selected.  
  
 See also [RecordRef Data Type](RecordRef-Data-Type.md).  
  
## Example  
 The following example opens the Item table as a RecordRef variable that is named ItemRecref, creates a reference to field 1 \(No.\), and stores the value in the variable named MyFieldRef. The RECORD function uses the MyFieldRef variable to return the RecordRef of field 1 and stores the reference in a variable named MyRecRef. `MyRecRef.NUMBER` returns the table that the selected field belongs to. This example requires that you create the following variables and text constant in the **C/AL Globals** windows.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|ItemRecref|RecordRef|  
|MyFieldRef|FieldRef|  
|MyRecRef|RecordRef|  
  
|Text constant|ENU value|  
|-------------------|---------------|  
|Text000|The selected field is from table %1.|  
  
```  
  
ItemRecref.OPEN(DATABASE::Item);  
MyFieldRef := ItemRecref.FIELD(1);  
MyRecRef := MyFieldRef.RECORD;  
MESSAGE(Text000, MyRecRef.NUMBER);  
```  
  
## See Also  
 [FieldRef Data Type](FieldRef-Data-Type.md)