---
title: "NUMBER Method (FieldRef)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 4ec37d7b-bcef-4668-8349-9ff1bc00a966
caps.latest.revision: 10
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# NUMBER Method (FieldRef)
Gets the number of a field as a string.  
  
## Syntax  
  
```  
  
No := FieldRef.NUMBER  
```  
  
#### Parameters  
 *FieldRef*  
 Type: FieldRef  
  
 Refers to the current field.  
  
## Property Value/Return Value  
 Type: Integer  
  
 The number of the table or of the field.  
  
## Remarks  
 This method is like the [FIELDNO Method \(Record\)](devenv-FIELDNO-Method-Record.md) method.  
  
## Example  
 The following example displays the caption and the field number of the first 10 fields in the Location table. The Location table is open as a [RecordRef Data Type](../datatypes/devenv-RecordRef-Data-Type.md) object and the reference is stored in the LocationRecref variable. The FieldIndex variable that stores the field index is initialized to 0. The LocationRecref variable uses the [FIELDINDEX Method \(RecordRef\)](devenv-FIELDINDEX-Method-RecordRef.md) to create a FieldRef that is named MyFieldRef for the specified field index. MyFiledRef now references the field that is specified by the FieldIndex. MyFieldref is then used to display the number and caption of the field The [NUMBER Method \(FIELDREF\)](devenv-NUMBER-Method-FieldRef.md) method retrieves the field number. This is repeated for the first ten fields in the table. This example requires that you create the following global variables.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|LocationRecref|RecordRef|  
|MyFieldRef|FieldRef|  
|FieldIndex|Integer|  
  
```  
  
LocationRecref.OPEN(DATABASE::Location);  
FieldIndex := 0;  
REPEAT  
  FieldIndex  := FieldIndex + 1;  
  MyFieldRef := LocationRecref.FIELDINDEX(FieldIndex);  
  MESSAGE('Field Number: %1  Field Caption: %2.' , MyFieldRef.NUMBER, MyFieldRef.CAPTION);  
UNTIL FieldIndex = 10;  
```  
  
## See Also  
 [FieldRef Data Type](../datatypes/devenv-FieldRef-Data-Type.md)