---
title: "FieldRef.Active Method"
description: "Checks whether the field that is currently selected is enabled."
ms.author: solsen
ms.custom: na
ms.date: 06/23/2021
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
# FieldRef.Active Method
> **Version**: _Available or changed with runtime version 1.0._

Checks whether the field that is currently selected is enabled.


## Syntax
```AL
Ok :=   FieldRef.Active()
```
> [!NOTE]
> This method can be invoked using property access syntax.

## Parameters
*FieldRef*  
&emsp;Type: [FieldRef](fieldref-data-type.md)  
An instance of the [FieldRef](fieldref-data-type.md) data type.  

## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

Each field in a record can be set as enabled or disabled in the table description.  You cannot use a disabled field because disabled fields cannot contain data.  

This method is like the [FieldActive Method \(Record\)](../../methods-auto/record/record-fieldactive-method.md). 


## Example

The following example opens table 18 \(Customer\) as a RecordRef variable that is named Recref. The [Field Method \(RecordRef\)](../../methods-auto/recordref/recordref-field-method.md) uses Recref to create a FieldRef variable that is named MyFieldRef. MyFieldRef sets a reference to the first field \(field 1\) in the table. The [SetRange Method \(FieldRef\)](../../methods-auto/fieldref/fieldref-setrange-method.md) sets a filter that selects record 30000. The [Field Method \(RecordRef\)](../../methods-auto/recordref/recordref-field-method.md) selects the record and then loops through fields 1 through 6. For each field, the Active method determines whether the field is enabled. If the field is enabled, a message that states that the field is enabled is displayed. Otherwise, a message that states that the field is not enabled is displayed.  

> [!NOTE]  
> You can use the name of the table instead of the table number to open the table by using the following syntax: 

```al
Recref.Open\(DATABASE::Customer\)
```

```
var
    Recref: RecordRef;
    MyFieldRef: FieldRef;
    i: Integer;
    Text000: Label 'Field %1 is enabled.';
    Text001: Label 'Field %1 is not enabled.';
begin
    Recref.Open(18);  
    MyFieldRef := Recref.Field(1);  
    MyFieldRef.SetRange('30000');  
    Recref.Find('-');  
    for i := 1 to 5 do begin
      MyFieldRef := Recref.FieldIndex(i);  
      if MyFieldRef.Active then  
        Message(Text000, i)  
      else begin 
        Message(Text001, i)  
      end;  
    end;  
end;

```  


## See Also
[FieldRef Data Type](fieldref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)