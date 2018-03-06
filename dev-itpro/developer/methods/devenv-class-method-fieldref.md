---
title: "CLASS Method (FieldRef)"
ms.custom: na
ms.date: 07/04/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 02da3621-d1ac-4aec-86c6-268c9f78429a
author: SusanneWindfeldPedersen
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# CLASS Method (FieldRef)
Gets the value of the [FieldClass Property](../properties/devenv-FieldClass-Property.md) of the field that is currently selected.  
  
 This method returns an error if no field is selected.  
  
## Syntax  
  
```  
  
Class := FieldRef.CLASS  
```  
  
#### Parameters  
 *FieldRef*  
 Type: FieldRef  
  
 Refers to the current field.  
  
## Property Value/Return Value  
 Type: Option  
  
 The field class of the field.  
  
## Remarks  
 The FieldRef refers to the field that you are interested in.  
  
 The CLASS method returns the class as an Option. However, you cannot assign the class to an Option variable directly. Instead, you must use the [EVALUATE Method](devenv-EVALUATE-Method.md). The EVALUATE method has a variable parameter to which the value is assigned and a string parameter. You use the FORMAT method to convert the result of the FieldRef.CLASS method to Text, and then use the EVALUATE method to convert the Text to an Option.  
  
## Example  
 In this example, the return value of the CLASS method is converted to Text and then converted to an Option. This example requires that you create the following variables.  
  
|Name|DataType|  
|----------|--------------|  
|OptionVar|Option|  
|FldRef|FieldRef|  
  
 The value of the **OptionString** property of OptionVar is Normal,FlowFilter,FlowField.  
  
```  
EVALUATE(OptionVar,FORMAT(FldRef.CLASS));  
```  
  
## Example  
 In this example, the return value of the CLASS method is converted to Text and then converted to an Option. This example uses the Field virtual table instead of an Option variable. The Field virtual table has a Class field, which is an Option and already has the correct OptionString.  
  
 This example requires that you create the following variables.  
  
|Name|DataType|Subtype|  
|----------|--------------|-------------|  
|FieldRec|Record|Field|  
|FldRef|FieldRef|Not applicable|  
  
```  
EVALUATE(FieldRec.Class,FORMAT(FldRef.CLASS));  
```  
  
## See Also  
 [FieldRef Data Type](../datatypes/devenv-FieldRef-Data-Type.md)