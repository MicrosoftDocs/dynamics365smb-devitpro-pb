---
title: "RecordRef.FindSet Method"
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
# RecordRef.FindSet Method
> **Version**: _Available from runtime version 1.0._

Finds a set of records in a table based on the current key and filter. FindSET can only retrieve records in ascending order.


## Syntax
```
[Ok := ]  RecordRef.FindSet([ForUpdate: Boolean] [, UpdateKey: Boolean])
```
## Parameters
*RecordRef*
&emsp;Type: [RecordRef](recordref-data-type.md)
An instance of the [RecordRef](recordref-data-type.md) data type.

*ForUpdate*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Set this parameter to false if you do not want to modify any records in the set. Set this parameter to true if you want to modify records in the set. If you set this parameter to true, the LOCKTABLE method (RecordRef) is immediately performed on the table before the records are read.  
*UpdateKey*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
This parameter only applies if ForUpdate is true. If you are going to modify any field value within the current key, set this parameter to true.  


## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 You should use this method only when you explicitly want to loop through a recordset. You should only use this method in combination with repeat..until.  
  
 Furthermore, FindSET only allows you to loop through the recordset from the top down. If you want to loop from the bottom up, you should use Find\(‘+’\).  
  
 The general rules for using FindSET are the following:  
  
-   FindSET\(FALSE,FALSE\) - Read-only. This uses no server cursors and the record set is read with a single server call.  
  
-   FindSET\(TRUE,FALSE\) - This is used to update non-key fields. This uses a cursor with a fetch buffer similar to Find\(‘-’\).  
  
-   FindSET\(TRUE,TRUE\) - This is used to update key fields.  
  
 This method is designed to optimize finding and updating sets. If you set any or both of the parameters to **false**, you can still modify the records in the set but these updates will not be performed optimally.  
  
 This method works the same way as the [FindSET Method \(Record\)](../record/record-findset-method.md).  
  
## Example  
 The following example opens table 18 \(Customer\) as a RecordRef variable that is named MyRecordRef. The [Field Method \(RecordRef\)](recordref-field-method.md) creates a FieldRef variable that is named MyFieldRef with the first field \(No.\). The [SETFILTER Method \(FieldRef\)](../fieldref/fieldref-setfilter-method.md) uses the MyFieldRef variable to set a filter that selects records from 30000 to 32000. `MyRecordRef.Field(2)` creates a FieldRef for the second field \(Name\). The FindSET method finds the set of records based on the key and the filters that have been set. The *ForUpdate* parameters and *UpdateKeys* are both set to **FALSE**. This makes the records in the set read-only. The record ID and name of each customer in the record set is displayed in a message box until no records are left in the record set. 
  
```  
var
    MyRecordRef: RecordRef;
    MyFieldRef: FieldRef;
    Text000: Label '%1: "%2" is found in the set of records.';
begin    
    MyRecordRef.Open(18);  
    MyFieldRef := MyRecordRef.Field(1);  
    MyFieldRef.SETFILTER('30000..32000');  
    MyFieldRef := MyRecordRef.Field(2);  
    if MyRecordRef.FindSET(FALSE, FALSE) then begin  
      repeat  
        Message(Text000 , MyRecordRef.RecordId, MyFieldRef.Value);  
      until MyRecordRef.Next = 0;  
    end;  
end;
```  

## See Also
[RecordRef Data Type](recordref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)