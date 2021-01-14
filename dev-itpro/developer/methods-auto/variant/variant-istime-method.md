---
title: "Variant.IsTime Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
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
# Variant.IsTime Method
> **Version**: _Available from runtime version 1.0._

Indicates whether an AL variant contains a Time variable.


## Syntax
```
Ok :=   Variant.IsTime()
```
> [!NOTE]
> This method can be invoked using property access syntax.

## Parameters
*Variant*
&emsp;Type: [Variant](variant-data-type.md)
An instance of the [Variant](variant-data-type.md) data type.

## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if the AL variant contains a Time variable, otherwise **false**.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example  
 The following example determines whether an AL variant contains a time variable. The code initializes the MyTime variable with a Time value. The MyTime variable is assigned to the variant variable that is named MyVariant. The **IsTime** method determines whether the variant contains a Time variable and stores the return value in the varResult variable. In this case, the variant contains a Time variable so **Yes** is returned and displayed in a message box. The [IsCode Method (Variant)](../../methods/devenv-iscode-method-variant.md) determines whether the variant contains a Code variable. The return value is **No** because the variant does not contain a code. 
 
```  
var
    MyTime: Time;
    MyVariant: Variant;
    varResult: Boolean;
    Text000: Label 'Does the variant >%1\< contain a time variable? %2.';
    Text001: Label 'Does the variant >%1\< contain a code variable? %2.';
begin
    MyTime := Time;  
    MyVariant := MyTime;  
    varResult := MyVariant.IsTime;  
    Message(Text000,MyVariant,varResult);  
    varResult := MyVariant.IsCode;  
    Message(Text001,MyVariant,varResult);
end;
```  
  

## See Also
[Variant Data Type](variant-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)