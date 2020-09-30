---
title: "Variant.IsRecord Method"
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
# Variant.IsRecord Method
Indicates whether an AL variant contains a Record variable.


## Syntax
```
Ok :=   Variant.IsRecord()
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
**true** if the AL variant contains a Record variable, otherwise **false**.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example  
 The following example determines whether an AL variant contains a record variable. The GET method gets customer number 10000 from the **Customer** table. The record is stored in the MyRecord variable. The MyRecord variable is assigned to the variant variable that is named MyVariant. The **ISRECORD** method determines whether the variant contains a Record variable and stores the return value in the varResult variable. In this case, the variant contains a Record variable so **true** is returned and displayed in a message box. The [ISCODE Method (Variant)](../../methods/devenv-iscode-method-variant.md)determines whether the variant contains a code variable. The return value is **false** because the variant does not contain a code. 
 
```  
var
    MyRecord: Record Customer;
    MyVariant: Variant;
    varResult: Boolean;
    Text000: Label 'Does the variant >%1< contain a record variable? %2.';
    Text001: Label 'Does the variant >%1< contain a code variable? %2.';
begin
    MyRecord.GET('10000');  
    MyVariant := MyRecord;  
    varResult := MyVariant.ISRECORD;  
    MESSAGE(Text000,MyVariant,varResult);  
    varResult := MyVariant.ISCODE;  
    MESSAGE(Text001,MyVariant,varResult);  
end;
```  

## See Also
[Variant Data Type](variant-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)