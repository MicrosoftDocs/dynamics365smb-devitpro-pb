---
title: "TestField.Caption Method"
ms.author: solsen
ms.custom: na
ms.date: 10/01/2020
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
# TestField.Caption Method
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
CAPTION returns the caption of a field. CAPTION first looks for a [CaptionML Property](../../properties/devenv-captionml-property.md).  
  
If it does not find one, it will use the [Name Property](../../properties/devenv-name-property.md). This means that CAPTION is enabled for multilanguage functionality.  
  
This method is similar to the [FIELDCAPTION Method \(Record\)](../record/record-fieldcaption-method.md) method.  
  
## Example  
 The following example opens table 18 \(Customer\) as a RecordRef variable that is named CustomerRecref. The code uses the [FIELD Method \(RecordRef\)](../recordref/recordref-field-method.md) to loop through field 1 through 9 and creates a FieldRef variable that is named MyFieldRef. For each field, the CAPTION method retrieves the caption of the field, stores it in the varCaption variable and displays it in a message box.

```
var
    CustomerRecRef: RecordRef;
    MyFieldRef: FieldRef;
    varCaption: Text;
    i: Integer;
    Text000: Label 'The caption for field %1 is "%2".';
begin
    CustomerRecref.OPEN(18);  
    for i := 1 to 9 do begin  
      MyFieldRef := CustomerRecref.FIELD(i);  
      varCaption := MyFieldRef.CAPTION;  
      MESSAGE(Text000, i, varCaption);  
    end;  
    CustomerRecref.CLOSE;  
end;
```  
  

## See Also
[TestField Data Type](testfield-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)