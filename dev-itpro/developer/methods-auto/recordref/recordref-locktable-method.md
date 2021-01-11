---
title: "RecordRef.LockTable Method"
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
# RecordRef.LockTable Method
> **Version**: _Available from runtime version 1.0._

Locks a table to protect it from write transactions that conflict with each other.


## Syntax
```
 RecordRef.LockTable([Wait: Boolean] [, VersionCheck: Boolean])
```
## Parameters
*RecordRef*
&emsp;Type: [RecordRef](recordref-data-type.md)
An instance of the [RecordRef](recordref-data-type.md) data type.

*Wait*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Specifies what to do if the table is already locked. If this parameter is true and if another application has already locked the table, the system will wait until the table is unlocked. If this parameter is false and if another application has already locked the table, a run-time error occurs.  
*VersionCheck*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
If this parameter is true, the version of the RecordRef will be checked. If this parameter is false, blank, or not used, the version will not be checked.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 Because all write operations automatically lock the table that is being used, LockTable would appear unnecessary. However, you could have a transaction in which an application wants to inspect data before possibly changing it, with a guarantee that the data being changed has not been modified by other applications since the read operation. The solution is to explicitly lock the table before the read operation. This makes sure that no other application makes changes between the read operation and the possible write operation. 

 
The table lock is released (unlocked) when the transaction is committed. 
  
 This method works the same as the [LockTable Method \(Record\)](../record/record-locktable-method.md).  
  
## Example 1

 The following example opens table number 18 \(Customer\) as a RecordRef that is named MyRecordRef. The LockTable method locks the table. This ensures that no records are inserted or deleted during the counting process. The [Count Method \(RecordRef\)](recordref-count-method.md) then retrieves the number of records in the table. The number of records is stored in the Count variable. The name of the table and the number of records in the table is displayed in a message box. The varTableNo variable can be used to open any table and get the number of records in that table by changing the value of the varTableNo variable. 
  
```al
var
    CustomerRecref: RecordRef;
    Count: Integer;
    varTableNo: Integer;
    Text000: Label 'The number of records in the %1 table is: %2.'; 
begin
    varTableNo := 18;  
    MyRecordRef.Open(varTableNo);  
    MyRecordRef.LockTable;  
    Count := MyRecordRef.Count;  
    Message(Text000, MyRecordRef.Name, Count);  
end;
```  
  
## Example 2

 This example uses pseudo-language to show the scope of write locks. Both an explicit lock and an automatic lock are illustrated. The first line \(1\) explicitly locks table A. If this explicit lock was not set on table A, the Database Management System \(DBMS\) would automatically lock this table when a record is inserted \(3\). Table B is not locked explicitly, but is locked automatically by the DBMS when a record is inserted \(4\). Both locks are active until the system exits the AL code module \(5\).  
  
``` 
BeginWriteTransaction   
TableA.LockTable // (1)  
FindRec(TableA, ...) // (2)  
.  
.  
InsertRec(TableA,...) // (3)  
.  
InsertRec(TableB) // (4)  
.  
.  
EndWriteTransaction // (5)  
```  
  
 If a data update depends on a prior read operation and there is a long time between the read operation and the write operation, you may not want to lock the table as you usually would during a transaction. This enables you to prevent other users from updating the table until your transaction is committed.  
  

## See Also
[RecordRef Data Type](recordref-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)