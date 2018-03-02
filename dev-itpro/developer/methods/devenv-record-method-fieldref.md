---
title: "RECORD Method (FieldRef)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: f3232aae-2395-4afe-b1f0-c4e4f16d71d5
caps.latest.revision: 11
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# RECORD Method (FieldRef)
Gets the RecordRef of the field that is currently selected.  
  
 This method returns an error if no field is selected.  
  
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
  
 See also [RecordRef Data Type](../datatypes/devenv-RecordRef-Data-Type.md).  
  
## Example  
 The following example opens the Item table as a RecordRef variable that is named ItemRecref, creates a reference to field 1 \(No.\), and stores the value in the variable named MyFieldRef. The RECORD method uses the MyFieldRef variable to return the RecordRef of field 1 and stores the reference in a variable named MyRecRef. `MyRecRef.NUMBER` returns the table that the selected field belongs to. This example requires that you create the following global variables and text constants.  
  
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
 [FieldRef Data Type](../datatypes/devenv-FieldRef-Data-Type.md)