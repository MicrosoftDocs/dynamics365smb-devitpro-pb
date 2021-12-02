---
title: "FieldRef.Class() Method"
description: "Gets the value of the FieldClass Property of the field that is currently selected."
ms.author: solsen
ms.custom: na
ms.date: 07/07/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# FieldRef.Class() Method
> **Version**: _Available or changed with runtime version 1.0._

Gets the value of the FieldClass Property of the field that is currently selected. This method returns an error if no field is selected.


## Syntax
```AL
Class :=   FieldRef.Class()
```
> [!NOTE]
> This method can be invoked using property access syntax.

## Parameters
*FieldRef*  
&emsp;Type: [FieldRef](fieldref-data-type.md)  
An instance of the [FieldRef](fieldref-data-type.md) data type.  

## Return Value
*Class*  
&emsp;Type: [FieldClass](../fieldclass/fieldclass-option.md)  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The FieldRef refers to the field that you are interested in.  
  
The Class method returns the class as an Option. However, you cannot assign the class to an Option variable directly. Instead, you must use the [Evaluate Method](../system/system-evaluate-method.md). The Evaluate method has a variable parameter to which the value is assigned and a string parameter. You use the Format method to convert the result of the FieldRef.Class method to Text, and then use the Evaluate method to convert the Text to an Option.  
  
## Example 1

In this example, the return value of the Class method is converted to Text and then converted to an Option. The value of the **OptionString** property of OptionVar is Normal,FlowFilter,FlowField.  
  
```al
var
    OptionVar: Option;
    FldRef: FieldRef;
begin
    Evaluate(OptionVar,Format(FldRef.Class));  
end;
```  
  
## Example 2

 
In this example, the return value of the Class method is converted to Text and then converted to an Option. This example uses the Field virtual table instead of an Option variable. The Field virtual table has a Class field, which is an Option and already has the correct OptionString.  

```al
var
    FieldRec: Record Field;
    FldRef: FieldRef;
begin
    Evaluate(FieldRec.Class,Format(FldRef.Class));  
end;
```  

## See Also

[FieldRef Data Type](fieldref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)