---
title: "Variant.IsByte Method"
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
# Variant.IsByte Method
Indicates whether an AL variant contains a Byte data type variable.


## Syntax
```
Ok :=   Variant.IsByte()
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
**true** if the AL variant contains a Byte variable, otherwise **false**.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example  
 The following example determines whether an AL variant contains a Byte data type variable. The code initializes the MyByte data type variable with the constant text string **A**. The MyByte variable is assigned to the variant variable that is named MyVariant. The **ISBYTE** method determines whether the variant contains a Byte variable and stores the return value in the varResult variable. In this case, the variant contains a Byte variable so **true** is returned and displayed in a message box. 
 
```  
var
    MyByte: Byte;
    MyVariant: Variant;
    varResult: Boolean;
    Text000: Label 'Does the variant contain a byte variable? %1.';
begin
    MyByte := 'A';  
    MyVariant := MyByte;  
    varResult := MyVariant.ISBYTE;  
    MESSAGE(Text000,varResult);  
end;
```  
  

## See Also
[Variant Data Type](variant-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)