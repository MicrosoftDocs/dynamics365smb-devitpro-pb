---
title: "FieldRef.Name Method"
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
# FieldRef.Name Method
> **Version**: _Available or changed with runtime version 1.0._

Gets the name of a field as a string.


## Syntax
```
Name :=   FieldRef.Name()
```
> [!NOTE]
> This method can be invoked using property access syntax.

## Parameters
*FieldRef*
&emsp;Type: [FieldRef](fieldref-data-type.md)
An instance of the [FieldRef](fieldref-data-type.md) data type.

## Return Value
*Name*
&emsp;Type: [String](../string/string-data-type.md)



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The [Caption Method \(FieldRef, TestPage Field\)](../../methods/devenv-caption-method-fieldref-testpage-field.md) method retrieves the [Caption Property](../../properties/devenv-caption-property.md) of a field. To enable your application for multilanguage functionality, you must use the [FieldCaption Method \(Record\)](../../methods-auto/record/record-fieldcaption-method.md) instead.  

This method is similar to the [FieldName Method \(Record\)](../../methods-auto/record/record-fieldname-method.md).  

## Example

The following example opens the Customer table as a RecordRef variable that is named CustomerRecref. The [Field Method \(RecordRef\)](../../methods-auto/recordref/recordref-field-method.md) creates a reference to the fields in the table and stores the FieldRef in the MyFieldRef variable. The code loops through field 1 through 5. For each field, the Name method retrieves the name of the field and stores the value in the varName variable. The field number and the value in the varName variable are displayed in a message box.

```al
var
    MyFieldRef: FieldRef;
    CustomerRecref: RecordRef;
    varName: Text;
    i: Integer;
    Text000: Label 'The name of field %1 is "%2".\\';
begin
    for i := 1 to 5 do begin  
        CustomerRecref.Open(Database::Customer);  
        MyFieldRef := CustomerRecref.Field(i);  
        varName := MyFieldRef.Name;  
        Message(Text000, i, varName);  
        CustomerRecref.Close;  
    end;  
end;
```  

## See Also
[FieldRef Data Type](fieldref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)