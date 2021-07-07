---
title: "RecordRef.Delete([Boolean]) Method"
description: "Deletes a record in a table."
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
# RecordRef.Delete([Boolean]) Method
> **Version**: _Available or changed with runtime version 1.0._

Deletes a record in a table.


## Syntax
```AL
[Ok := ]  RecordRef.Delete([RunTrigger: Boolean])
```
## Parameters
*RecordRef*  
&emsp;Type: [RecordRef](recordref-data-type.md)  
An instance of the [RecordRef](recordref-data-type.md) data type.  

*[Optional] RunTrigger*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Specifies whether the code in the OnDelete trigger will be executed. If this parameter is true, the code will be executed. If this parameter is false, then the code in the OnDelete trigger is not executed. The default value is false. This parameter is optional.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 The current key and any filters on the record do not affect this operation. The record to delete is identified by the values in its primary key.  

 If an end-user modifies a record between the time that another end-user or another process reads the record and modifies it, then the second user must refresh the value of the record variable before editing the record. Otherwise, the end-user receives the following run-time error:  

 **Another user has modified the record for this \<Table Name> after you retrieved it from the database.**  

 **Enter your changes again in the updated window, or start the interrupted activity again.**  

 In earlier versions of [!INCLUDE[d365fin_md](../../includes/d365fin_md.md)], certain situations allowed code that an end-user runs to modify a record after a newer version of the record was written and committed to the database. This would overwrite the newer changes. However, in [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)], we have restricted the [Modify Method \(RecordRef\)](recordref-modify-method.md), [Rename Method \(RecordRef\)](recordref-rename-method.md), and **Delete** Method \(RecordRef\) so that the end-user receives the following run-time error in these certain situations:  

 **Unable to change an earlier version of the \<Table Name> record. The record should be read from the database again. This is a programming error.**  

 You must design your application so that you use the most up-to-date version of the record for modifications to the database. You use the [Get Method \(RecordRef\)](recordref-get-method.md) to refresh the record with the latest version.  

## Example  
 The following example deletes a record from the Customer table. The code starts by opening the **Customer** table \(18\) as a RecordRef variable that is named MyRecordRef. The [Field Method \(RecordRef\)](recordref-field-method.md) creates a FieldRef that is named MyFieldRef for field 1, which is the primary key of the **Customer** table. The [Value Method \(FieldRef, TestPage Field\)](../fieldref/fieldref-value-method.md) assigns the value 10000 to the field that the MyFieldRef variable refers to. The [Find Method \(RecordRef\)](recordref-find-method.md) searches the table for a record with field 1 = 10000. If the record is found, then it is deleted, the table is modified, and a message is displayed. 
 
```al
var
    varRecordToDelete: Code;
    MyRecordRef: RecordRef;
    Text000: Label 'Customer %1 is deleted.;
begin
    varRecordToDelete := '10000';  
    MyRecordRef.Open(18);  
    MyFieldRef := MyRecordRef.Field(1);  
    MyFieldRef.Value := varRecordToDelete;  
    if MyRecordRef.Find('=') then begin  
      ifMyRecordRef.Delete then begin  
        MyRecordRef.Modify;  
        Message(Text000, MyFieldRef.Value);  
      end;  
    end;  
end;

```  

## See Also
[RecordRef Data Type](recordref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)