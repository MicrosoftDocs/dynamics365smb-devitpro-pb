---
title: "RecordRef.DeleteAll Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
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
# RecordRef.DeleteAll Method
> **Version**: _Available from runtime version 1.0._

Deletes all records in a table that fall within a specified range.


## Syntax
```
 RecordRef.DeleteAll([RunTrigger: Boolean])
```
## Parameters
*RecordRef*
&emsp;Type: [RecordRef](recordref-data-type.md)
An instance of the [RecordRef](recordref-data-type.md) data type.

*RunTrigger*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Specifies whether the code in the OnDelete trigger will be executed. If this parameter is true, the code will be executed. If this parameter is false (default), the code will not be executed. This parameter is optional.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 This method works the same way as the [DeleteAll Method \(Record\)](../library.md).  
  
## Example  
 The following example opens table 18 \(Customer\) as a RecordRef variable that is named CustomerRecRef. The [Field Method \(RecordRef\)](recordref-field-method.md) creates a FieldRef variable that is named MyFieldRef for field 1 \(No.\). From the No. field, the [SetRange Method \(FieldRef\)](../fieldref/fieldref-setrange-method.md) selects records in the range from 10000 to 20000. The number of records in the range is displayed in a message box. The DeleteALL method deletes all records in that range. The number of records is displayed again. This time, 0 is displayed because all the records in the range are deleted.
 
```al
var
    MyFieldRef: FieldRef;
    CustomerRecRef: RecordRef;
    Text000: Label 'The number of records in the range is %1.;
begin 
    CustomerRecRef.Open(18);  
    MyFieldRef := CustomerRecRef.Field(1);  
    MyFieldRef.SetRange('10000' , '20000');  
    Message(Text000 ,CustomerRecRef.Count);  
    CustomerRecRef.DeleteALL;  
    Message(Text000 ,CustomerRecRef.Count);  
end;
```  
  

## See Also
[RecordRef Data Type](recordref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)