---
title: "TestField.Value Method"
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
# TestField.Value Method
> **Version**: _Available from runtime version 1.0._

Gets or sets the value of this field.


## Syntax
```
[Value := ]  TestField.Value([Value: String])
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*TestField*
&emsp;Type: [TestField](testfield-data-type.md)
An instance of the [TestField](testfield-data-type.md) data type.

*Value*  
&emsp;Type: [String](../string/string-data-type.md)  
The new value to set for this field.  


## Return Value
*Value*
&emsp;Type: [String](../string/string-data-type.md)
The value of this field.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
If you omit NewValue, the method returns the current value of the field.  
  
If you want to format the value of a FieldRef you must use `FORMAT(FieldRef)` instead of `FORMAT(FieldRef.VALUE)`.  


## Example  
 The following example opens table 18, the **Customer** table, a RecordRef variable that is named CustomerRecref. The [FIELD Method \(RecordRef\)](../recordref/recordref-field-method.md) creates a FieldRef for the first field \(No.\). The reference to the field is stored in the MyFieldRef variable. The [ACTIVE Method \(FieldRef\)](../fieldref/fieldref-active-method.md) method determines whether the field is enabled. If the field is enabled, then the record that is identified by the number in the CustomerNo variable is selected. The MyFieldRef variable is updated to refer to the second field \(Name\). Then the value in the second field is changed to Contoso. The [MODIFY Method \(RecordRef\)](../recordref/recordref-modify-method.md) modifies the record in the table to reflect the change. `MyFieldRef.VALUE` retrieves the new name and displays it in message box. 
 
```  
var
    CustomerRecRef: RecordRef;
    MyFieldRef: FieldRef;
    CustomerNo: Code;
    Text000: Label 'Customer name has changed to %1.';
begin
    CustomerNo := '50000';  
    CustomerRecref.Open(18);  
    MyFieldRef := CustomerRecref.FIELD(1);  
    if MyFieldRef.ACTIVE then begin  
      MyFieldRef.VALUE(CustomerNo);  
      MyFieldRef := CustomerRecref.FIELD(2);  
      MyFieldRef.VALUE('Contoso');  
      CustomerRecref.MODIFY;  
      Message(Text000, MyFieldRef.VALUE);  
    end;  
end;
```  

## See Also
[TestField Data Type](testfield-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)