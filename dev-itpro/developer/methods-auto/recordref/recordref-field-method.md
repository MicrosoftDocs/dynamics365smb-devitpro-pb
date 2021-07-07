---
title: "RecordRef.Field(Integer) Method"
description: "Gets a FieldRef for the field that has the number FieldNo in the table that is currently selected."
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
# RecordRef.Field(Integer) Method
> **Version**: _Available or changed with runtime version 1.0._

Gets a FieldRef for the field that has the number FieldNo in the table that is currently selected. If no field has this number, the method returns an error.


## Syntax
```AL
Field :=   RecordRef.Field(FieldNo: Integer)
```
## Parameters
*RecordRef*  
&emsp;Type: [RecordRef](recordref-data-type.md)  
An instance of the [RecordRef](recordref-data-type.md) data type.  

*FieldNo*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The number that the field has in the table that is currently selected. This is the field for which you want the FieldRef.  


## Return Value
*Field*  
&emsp;Type: [FieldRef](../fieldref/fieldref-data-type.md)  
A new FieldRef of the record


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 This method returns an error if the record is not opened and if the field is not found.  
  
 You might obtain better performance by using the [FieldIndex Method \(RecordRef\)](recordref-fieldindex-method.md).  
  
## Example  
 The following example opens table 18 \(Customer\) as a RecordRef variable that is named MyRecordRef. MyRecordRef uses the Field method to create a reference to the No. field \(field 1\). The value in the No. field is then set to a specified record No. In this example, the record is set to 30000. The [Find Method \(RecordRef\)](recordref-find-method.md) method.md records for record 30000. If record is found, the Field method retrieves the value in the Name field \(field 2\), stores it in the varOldName variable and displays it in a message box. The [Value Method \(FieldRef, TestPage Field\)](../fieldref/fieldref-value-method.md) changes the value in the Name field to a new name. In this example, the new name is ‘Contoso’. The table is then modified to reflect this change and the new value in the Name field is retrieved and displayed in a message box. You can specify any record in the table and change the value in the Name field.
 
```al
var
    MyRecordRef: RecordRef;
    MyFieldRef: FieldRef;
    varOldName: FieldRef;
    varNewName: Text;
    MyRecord: Code;
begin  
    MyRecord := '30000';  
    varNewName := 'Contoso';  
    MyRecordRef.Open(18);  
    MyFieldRef := MyRecordRef.Field(1);  
    MyFieldRef.Value := MyRecord;  
    if MyRecordRef.Find('=') then begin  
      varOldName := MyRecordRef.Field(2);  
      Message('Old Name: %1', varOldName);  
      varOldName.Value := varNewName;  
      MyRecordRef.Modify;    
      Message('New Name: %1', MyRecordRef.Field(2));  
    end;  
end;
```  

## See Also
[RecordRef Data Type](recordref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)