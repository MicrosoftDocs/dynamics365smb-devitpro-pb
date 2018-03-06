---
title: "CLASS Function (FieldRef)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 02da3621-d1ac-4aec-86c6-268c9f78429a
caps.latest.revision: 14
manager: edupont
---
# CLASS Function (FieldRef)
Gets the value of the [FieldClass Property](FieldClass-Property.md) of the field that is currently selected.  
  
 This function returns an error if no field is selected.  
  
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
  
 The CLASS function returns the class as an Option. However, you cannot assign the class to an Option variable directly. Instead, you must use the [EVALUATE Function](EVALUATE-Function.md). The EVALUATE function has a variable parameter to which the value is assigned and a string parameter. You use the FORMAT function to convert the result of the FieldRef.CLASS function to Text, and then use the EVALUATE function to convert the Text to an Option.  
  
## Example  
 In this example, the return value of the CLASS function is converted to Text and then converted to an Option. This example requires that you create the following variables.  
  
|Name|DataType|  
|----------|--------------|  
|OptionVar|Option|  
|FldRef|FieldRef|  
  
 The value of the **OptionString** property of OptionVar is Normal,FlowFilter,FlowField.  
  
```  
EVALUATE(OptionVar,FORMAT(FldRef.CLASS));  
```  
  
## Example  
 In this example, the return value of the CLASS function is converted to Text and then converted to an Option. This example uses the Field virtual table instead of an Option variable. The Field virtual table has a Class field, which is an Option and already has the correct OptionString.  
  
 This example requires that you create the following variables.  
  
|Name|DataType|Subtype|  
|----------|--------------|-------------|  
|FieldRec|Record|Field|  
|FldRef|FieldRef|Not applicable|  
  
```  
EVALUATE(FieldRec.Class,FORMAT(FldRef.CLASS));  
```  
  
## See Also  
 [FieldRef Data Type](FieldRef-Data-Type.md)