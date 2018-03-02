---
title: "LENGTH Function (FieldRef)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 214bc234-51a9-4ff0-8863-3beb36221e5e
caps.latest.revision: 13
---
# LENGTH Function (FieldRef)
Gets the maximum size of the field \(the size specified in the **DataLength** property of the field\). This function is usually used for finding the defined length of code and text fields.  
  
## Syntax  
  
```  
  
Length := FieldRef.LENGTH  
```  
  
#### Parameters  
 *FieldRef*  
 Type: FieldRef  
  
 Refers to the current field.  
  
## Return Value  
 Type: Integer  
  
 The defined length of the field.  
  
## Remarks  
 For Text and Code fields this function returns the defined length. For other types of fields, it returns the fixed byte size, for example, Integer fields returns 4.  
  
## Example  
 The following example opens the Customer table as a RecordRef variable. The [FIELD Function \(RecordRef\)](FIELD-Function--RecordRef-.md) creates a FieldRef for any specified field and stores the reference in the MyFieldRef variable. The LENGTH function retrieves the maximum size of the field and stores the value in the varLength variable. The value that is stored in the varLength is displayed in a message box. This example requires that you create the following variables and text constant in the **C/AL Globals** window.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|CustomerRecref|RecordRef|  
|MyFieldRef|FieldRef|  
|varLength|Integer|  
|varFieldNo|Integer|  
  
|Text constant|ENU value|  
|-------------------|---------------|  
|Text000|The maximum size of the field is %1.|  
  
```  
  
varFieldNo := 1;  
CustomerRecref.OPEN(DATABASE::Customer);  
MyFieldRef := CustomerRecref.FIELD(varFieldNo);  
varLength := MyFieldRef.LENGTH;  
MESSAGE(Text000, varLength);  
```  
  
## See Also  
 [FieldRef Data Type](FieldRef-Data-Type.md)