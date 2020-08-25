---
title: "FindSet Method"
ms.author: solsen
ms.custom: na
ms.date: 04/15/2020
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
# FindSet Method
Finds a set of records in a table based on the current key and filter. FINDSET can only retrieve records in ascending order.


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
**true** if the operation was successful; otherwise **false**.  If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.    


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 You should use this method only when you explicitly want to loop through a recordset. You should only use this method in combination with repeat..until.  
  
 Furthermore, FINDSET only allows you to loop through the recordset from the top down. If you want to loop from the bottom up, you should use FIND\(‘+’\).  
  
 The general rules for using FINDSET are the following:  
  
-   FINDSET\(FALSE,FALSE\) - Read-only. This uses no server cursors and the record set is read with a single server call.  
  
-   FINDSET\(TRUE,FALSE\) - This is used to update non-key fields. This uses a cursor with a fetch buffer similar to FIND\(‘-’\).  
  
-   FINDSET\(TRUE,TRUE\) - This is used to update key fields.  
  
 This method is designed to optimize finding and updating sets. If you set any or both of the parameters to **false**, you can still modify the records in the set but these updates will not be performed optimally.  
  
 This method works the same way as the [FINDSET Method \(Record\)](../record/record-findset-method.md).  
  
## Example  
 The following example opens table 18 \(Customer\) as a RecordRef variable that is named MyRecordRef. The [FIELD Method \(RecordRef\)](recordref-field-method.md) creates a FieldRef variable that is named MyFieldRef with the first field \(No.\). The [SETFILTER Method \(FieldRef\)](../fieldref/fieldref-setfilter-method.md) uses the MyFieldRef variable to set a filter that selects records from 30000 to 32000. `MyRecordRef.FIELD(2)` creates a FieldRef for the second field \(Name\). The FINDSET method finds the set of records based on the key and the filters that have been set. The *ForUpdate* parameters and *UpdateKeys* are both set to **FALSE**. This makes the records in the set read-only. The record ID and name of each customer in the record set is displayed in a message box until no records are left in the record set. 
  
```  
var
    MyRecordRef: RecordRef;
    MyFieldRef: FieldRef;
    Text000: Label '%1: "%2" is found in the set of records.';
begin    
    MyRecordRef.OPEN(18);  
    MyFieldRef := MyRecordRef.FIELD(1);  
    MyFieldRef.SETFILTER('30000..32000');  
    MyFieldRef := MyRecordRef.FIELD(2);  
    if MyRecordRef.FINDSET(FALSE, FALSE) then begin  
      repeat  
        MESSAGE(Text000 , MyRecordRef.RECORDID, MyFieldRef.VALUE);  
      until MyRecordRef.NEXT = 0;  
    end;  
end;
```  

## See Also
[RecordRef Data Type](recordref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)