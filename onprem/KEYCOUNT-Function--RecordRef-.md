---
title: "KEYCOUNT Function (RecordRef)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 07c42afb-c018-46eb-8ab7-9db9785d78b5
caps.latest.revision: 9
---
# KEYCOUNT Function (RecordRef)
Gets the number of keys that exist in the table that is referred to by the RecordRef. Returns an error if no table is selected.  
  
## Syntax  
  
```  
  
Count := RecordRef.KEYCOUNT  
```  
  
#### Parameters  
 *RecordRef*  
 Type: RecordRef  
  
 The RecordRef that identifies the record and the table in which you are interested.  
  
## Property Value/Return Value  
 Type: Integer  
  
 The number of keys that have been identified in the table.  
  
## Example  
 The following example opens the Customer table \(18\) as a RecordRef variable that is named CustomerRecref. The KEYCOUNT function retrieves the number of keys that are defined in the Customer table. The return value of the function is stored in the KeyCount variable and displayed in a message box. The KeyCount variable contains the number 13 because 13 keys are defined in the Customer table. This example requires that you create the following variables and text constant in the **C/AL Globals** window.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|CustomerRecref|RecordRef|  
|KeyCount|Integer|  
  
|Text constant|ENU value|  
|-------------------|---------------|  
|Text000|The table has %1 keys.|  
  
```  
  
CustomerRecref.OPEN(18);  
KeyCount := CustomerRecref.KEYCOUNT;  
MESSAGE(Text000, KeyCount);  
  
```  
  
## See Also  
 [RecordRef Data Type](RecordRef-Data-Type.md)