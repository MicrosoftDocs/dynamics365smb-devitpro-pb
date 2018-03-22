---
title: "LENGTH Method (FieldRef)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 214bc234-51a9-4ff0-8863-3beb36221e5e
caps.latest.revision: 13
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# LENGTH Method (FieldRef)
Gets the maximum size of the field \(the size specified in the **DataLength** property of the field\). This method is usually used for finding the defined length of code and text fields.  
  
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
 For Text and Code fields this method returns the defined length. For other types of fields, it returns the fixed byte size, for example, Integer fields returns 4.  
  
## Example  
 The following example opens the Customer table as a RecordRef variable. The [FIELD Method \(RecordRef\)](devenv-FIELD-Method-RecordRef.md) creates a FieldRef for any specified field and stores the reference in the MyFieldRef variable. The LENGTH method retrieves the maximum size of the field and stores the value in the varLength variable. The value that is stored in the varLength is displayed in a message box. This example requires that you create the following global variables and text constant.  
  
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
 [FieldRef Data Type](../datatypes/devenv-FieldRef-Data-Type.md)