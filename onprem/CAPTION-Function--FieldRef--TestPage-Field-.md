---
title: "CAPTION Function (FieldRef, TestPage Field)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 4addc78b-44ac-43ac-861e-d7e848b32414
caps.latest.revision: 18
---
# CAPTION Function (FieldRef, TestPage Field)
Gets the current caption of a field as a String.  
  
## Syntax  
  
```  
  
Caption := FieldRef.CAPTION  
```  
  
```  
  
Caption := TestPageField.CAPTION  
```  
  
#### Parameters  
 *FieldRef*  
 Type: FieldRef  
  
 Refers to the current field.  
  
 *TestPageField*  
 The current field on a TestPage.  
  
## Property Value/Return Value  
 Type: Text or Code  
  
 **CaptionML** or **Name** property as Text or Code.  
  
## Remarks  
 CAPTION returns the caption of a field. CAPTION first looks for a [CaptionML Property](CaptionML-Property.md).  
  
 If it does not find one, it will use the [Name Property](Name-Property.md). This means that CAPTION is enabled for multilanguage functionality.  
  
 This function is similar to the [FIELDCAPTION Function \(Record\)](FIELDCAPTION-Function--Record-.md) function.  
  
## Example  
 The following example opens table 18 \(Customer\) as a RecordRef variable that is named CustomerRecref. The code uses the [FIELD Function \(RecordRef\)](FIELD-Function--RecordRef-.md) to loop through field 1 through 9 and creates a FieldRef variable that is named MyFieldRef. For each field, the CAPTION function retrieves the caption of the field, stores it in the varCaption variable and displays it in a message box. This example requires that you create the following variables and text constant in the **C/AL Globals** window.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|CustomerRecref|RecordRef|  
|MyFieldRef|FieldRef|  
|varCaption|Text|  
|i|Integer|  
  
|Text constant|ENU value|  
|-------------------|---------------|  
|Text000|The caption for field %1 is "%2".|  
  
```  
  
CustomerRecref.OPEN(18);  
FOR i := 1 TO 9 DO BEGIN  
  MyFieldRef := CustomerRecref.FIELD(i);  
  varCaption := MyFieldRef.CAPTION;  
  MESSAGE(Text000, i, varCaption);  
END;  
CustomerRecref.CLOSE;  
```  
  
## See Also  
 [FieldRef Data Type](FieldRef-Data-Type.md)   
 [Multilanguage Development](Multilanguage-Development.md)