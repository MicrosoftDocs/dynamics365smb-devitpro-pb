---
title: "TestField.Caption Method"
ms.author: solsen
ms.custom: na
ms.date: 02/15/2021
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
# TestField.Caption Method
> **Version**: _Available or changed with runtime version 1.0._

Gets the current caption of the field as a String.


## Syntax
```
Result :=   TestField.Caption()
```
> [!NOTE]
> This method can be invoked using property access syntax.

## Parameters
*TestField*
&emsp;Type: [TestField](testfield-data-type.md)
An instance of the [TestField](testfield-data-type.md) data type.

## Return Value
*Result*
&emsp;Type: [String](../string/string-data-type.md)
The current caption of the field as a String.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
Caption returns the caption of a field. Caption first looks for a [CaptionML Property](../../properties/devenv-captionml-property.md).  
  
If it does not find one, it will use the [Name Property](../../properties/devenv-properties.md). This means that Caption is enabled for multilanguage functionality.  
  
This method is similar to the [FieldCaption Method \(Record\)](../record/record-fieldcaption-method.md) method.  
  
## Example  
 The following example opens table 18 \(Customer\) as a RecordRef variable that is named CustomerRecref. The code uses the [Field Method \(RecordRef\)](../recordref/recordref-field-method.md) to loop through field 1 through 9 and creates a FieldRef variable that is named MyFieldRef. For each field, the Caption method retrieves the caption of the field, stores it in the varCaption variable and displays it in a message box.

```al
var
    CustomerRecRef: RecordRef;
    MyFieldRef: FieldRef;
    varCaption: Text;
    i: Integer;
    Text000: Label 'The caption for field %1 is "%2".';
begin
    CustomerRecref.Open(18);  
    for i := 1 to 9 do begin  
      MyFieldRef := CustomerRecref.Field(i);  
      varCaption := MyFieldRef.Caption;  
      Message(Text000, i, varCaption);  
    end;  
    CustomerRecref.Close;  
end;
```  
  

## See Also
[TestField Data Type](testfield-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)