---
title: "FieldRef.Caption() Method"
description: "Gets the current caption of a field as a String."
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
# FieldRef.Caption() Method
> **Version**: _Available or changed with runtime version 1.0._

Gets the current caption of a field as a String.


## Syntax
```AL
Caption :=   FieldRef.Caption()
```
> [!NOTE]
> This method can be invoked using property access syntax.

## Parameters
*FieldRef*  
&emsp;Type: [FieldRef](fieldref-data-type.md)  
An instance of the [FieldRef](fieldref-data-type.md) data type.  

## Return Value
*Caption*  
&emsp;Type: [String](../string/string-data-type.md)  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The Caption method returns the caption of a field. Caption first looks for a [CaptionML Property](../../properties/devenv-captionml-property.md). If it does not find one, it will use the [Name Property](../../properties/devenv-properties.md). This means that Caption is enabled for multilanguage functionality.  
  
This method is similar to the [FieldCaption Method \(Record\)](../../methods-auto/record/record-fieldcaption-method.md).  
  
## Example

The following example opens table 18 \(Customer\) as a RecordRef variable that is named CustomerRecref. The code uses the [Field Method \(RecordRef\)](../../methods-auto/recordref/recordref-field-method.md) to loop through field 1 through 9 and creates a FieldRef variable that is named MyFieldRef. For each field, the Caption method retrieves the caption of the field, stores it in the varCaption variable and displays it in a message box. 

```al
var
    MyFieldRef: FieldRef;
    CustomerRecref: RecordRef;
    varCaption: Text;
    i: Integer;
    Text000: Label 'The caption for field %1 is "%2"';
begin
    CustomerRecref.Open(18);  
    for i := 1 to 9 do begin  
      MyFieldRef := CustomerRecRef.Field(i);  
      varCaption := MyFieldRef.Caption;  
      Message(Text000, i, varCaption);  
    end;  
    CustomerRecref.Close;  
end;
```  

## See Also
[FieldRef Data Type](fieldref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)