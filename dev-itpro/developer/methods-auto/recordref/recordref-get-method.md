---
title: "RecordRef.Get Method"
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
# RecordRef.Get Method
> **Version**: _Available or changed with runtime version 1.0._

Gets a record based on the ID of the record.


## Syntax
```
[Ok := ]  RecordRef.Get(RecordID: RecordId)
```
## Parameters
*RecordRef*
&emsp;Type: [RecordRef](recordref-data-type.md)
An instance of the [RecordRef](recordref-data-type.md) data type.

*RecordID*  
&emsp;Type: [RecordId](../recordid/recordid-data-type.md)  
The RecordID that contains the table number and the primary key of the table and is used to identify the record that you want to get.  


## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 This method always uses the primary key for the table. It ignores any filters that are set, except security filters. Security filters are applied or ignored based on the Security Filter Mode. The current key and filters are not changed after you call this method. <!--Links For more information, see [Security Filter Modes](Security-Filter-Modes.md)-->.  
  
## Example  
 The following example opens the Customer table with the RecordRef variable, RecRef. The code assigns the first field in the table, which is the No. field, to MyFieldRef variable. The variable is assigned a value of 30000 by using the [Field Method \(RecordRef\)](recordref-field-method.md). The [RecordId Method \(RecordRef\)](recordref-recordid-method.md) retrieves the record ID of the record that has a value of 30000 in the No. field. The Get method then uses the RecID variable then to retrieves the record.
 
```al
var
    RecRef: RecordRef;
    MyFieldRef: FieldRef;
    RecID: RecordId;
begin     
    RecRef.Open(Database::Customer);  
    MyFieldRef := RecRef.Field(1);  
    MyFieldRef.Value := '30000';  
    if RecRef.Find('=') then begin  
      RecID := RecRef.RecordId;  
      RecRef.Get(RecID);  
    end;  
end;
```  

## See Also
[RecordRef Data Type](recordref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)