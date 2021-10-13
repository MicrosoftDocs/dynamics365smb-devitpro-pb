---
title: "FieldRef.Value([Any]) Method"
description: "Sets or gets the value of the field that is currently selected."
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
# FieldRef.Value([Any]) Method
> **Version**: _Available or changed with runtime version 1.0._

Sets or gets the value of the field that is currently selected. This method returns an error if no field is selected.


## Syntax
```AL
[Value := ]  FieldRef.Value([NewValue: Any])
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*FieldRef*  
&emsp;Type: [FieldRef](fieldref-data-type.md)  
An instance of the [FieldRef](fieldref-data-type.md) data type.  

*[Optional] NewValue*  
&emsp;Type: [Any](../any/any-data-type.md)  
  


## Return Value
*[Optional] Value*  
&emsp;Type: [Any](../any/any-data-type.md)  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

If you omit NewValue, the method returns the current value of the field.  
  
If you want to format the value of a FieldRef you must use `Format(FieldRef)` instead of `Format(FieldRef.Value)`.  
  
## Example

The following example opens table 18, the **Customer** table, a RecordRef variable that is named CustomerRecref. The [Field Method \(RecordRef\)](../recordref/recordref-field-method.md) creates a FieldRef for the first field \(No.\). The reference to the field is stored in the MyFieldRef variable. The [Active Method \(FieldRef\)](../fieldref/fieldref-active-method.md) method determines whether the field is enabled. If the field is enabled, then the record that is identified by the number in the CustomerNo variable is selected. The MyFieldRef variable is updated to refer to the second field \(Name\). Then the value in the second field is changed to Contoso. The [Modify Method \(RecordRef\)](../recordref/recordref-modify-method.md) modifies the record in the table to reflect the change. `MyFieldRef.Value` retrieves the new name and displays it in message box. 

```al
var
    MyFieldRef: FieldRef;
    CustomerRecref: RecordRef;
    CustomerNo: Code;
    Text000: Label 'Customer name has changed to %1.';
begin  
    CustomerNo := '50000';  
    CustomerRecref.Open(18);  
    MyFieldRef := CustomerRecref.Field(1);  
    if MyFieldRef.Active then begin  
      MyFieldRef.Value(CustomerNo);  
      MyFieldRef := CustomerRecref.Field(2);  
      MyFieldRef.Value('Contoso');  
      CustomerRecref.Modify;  
      Message(Text000, MyFieldRef.Value);  
    end;  
end;
```  

## See Also

[FieldRef Data Type](fieldref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)