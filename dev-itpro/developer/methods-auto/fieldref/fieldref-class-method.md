---
title: "FieldRef.Class Method"
ms.author: solsen
ms.custom: na
ms.date: 09/15/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# FieldRef.Class Method
Gets the value of the FieldClass Property of the field that is currently selected. This method returns an error if no field is selected.


## Syntax
```
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
  
 The CLASS method returns the class as an Option. However, you cannot assign the class to an Option variable directly. Instead, you must use the [EVALUATE Method](../../methods/devenv-evaluate-method.md). The EVALUATE method has a variable parameter to which the value is assigned and a string parameter. You use the forMAT method to convert the result of the FieldRef.CLASS method to Text, and then use the EVALUATE method to convert the Text to an Option.  
  
## Example  
 In this example, the return value of the CLASS method is converted to Text and then converted to an Option. The value of the **OptionString** property of OptionVar is Normal,FlowFilter,FlowField.  
  
```  
var
    OptionVar: Option;
    FldRef: FieldRef;
begin
    EVALUATE(OptionVar,forMAT(FldRef.CLASS));  
end;
```  
  
## Example  
 In this example, the return value of the CLASS method is converted to Text and then converted to an Option. This example uses the Field virtual table instead of an Option variable. The Field virtual table has a Class field, which is an Option and already has the correct OptionString.  

```
var
    FieldRec: Record Field;
    FldRef: FieldRef;
begin
    EVALUATE(FieldRec.Class,FORMAT(FldRef.CLASS));  
end;
```  
  

## See Also
[FieldRef Data Type](fieldref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)