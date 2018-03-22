---
title: "NAME Method (FieldRef)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 644334ea-8769-4466-bd5c-4b0a06666fff
caps.latest.revision: 11
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# NAME Method (FieldRef)
Gets the name of a field as a string.  

## Syntax  

```  

Name := FieldRef.NAME  
```  

#### Parameters  
 *FieldRef*  
 The FieldRef of the field in the record.  

## Property Value/Return Value  
 Type: Text Constant or Code  

 The name of the field given as input.  

## Remarks  
 The [CAPTION Method \(FieldRef, TestPage Field\)](devenv-CAPTION-Method-FieldRef-TestPage-Field.md) method retrieves the [Caption Property](../properties/devenv-Caption-Property.md) of a field. To enable your application for multilanguage functionality, you must use the [FIELDCAPTION Method \(Record\)](devenv-FIELDCAPTION-Method-Record.md) instead.  

 This method is similar to the [FIELDNAME Method \(Record\)](devenv-FIELDNAME-Method-Record.md) method.  

## Example  
 The following example opens the Customer table as a RecordRef variable that is named CustomerRecref. The [FIELD Method \(RecordRef\)](devenv-FIELD-Method-RecordRef.md) creates a reference to the fields in the table and stores the FieldRef in the MyFieldRef variable. The code loops through field 1 through 5. For each field, the NAME method retrieves the name of the field and stores the value in the varName variable. The field number and the value in the varName variable are displayed in a message box. This example requires that you create the following global variables and text constant.  

|Variable name|DataType|  
|-------------------|--------------|  
|CustomerRecref|RecordRef|  
|MyFieldRef|FieldRef|  
|varName|Text|  
|i|Integer|  

|Text constant|ENU value|  
|-------------------|---------------|  
|Text000|The name of field %1 is "%2".\\|  

```  

FOR i := 1 TO 5 DO BEGIN  
CustomerRecref.OPEN(DATABASE::Customer);  
MyFieldRef := CustomerRecref.FIELD(i);  
varName := MyFieldRef.NAME;  
MESSAGE(Text000, i, varName);  
CustomerRecref.CLOSE;  
END;  

```  

## See Also  
 [FieldRef Data Type](../datatypes/devenv-FieldRef-Data-Type.md)   
 [Multilanguage Development](../devenv-multilanguage-development.md)
