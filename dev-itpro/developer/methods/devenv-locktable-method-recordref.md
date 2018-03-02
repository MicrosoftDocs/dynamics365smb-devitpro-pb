---
title: "LOCKTABLE Method (RecordRef)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 9aec85a8-3284-4819-bba0-7d0183c8e4e7
caps.latest.revision: 11
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# LOCKTABLE Method (RecordRef)
Locks a table to protect it from write transactions that conflict with each other.  
  
## Syntax  
  
```  
  
RecordRef.LOCKTABLE  
```  
  
#### Parameters  
 *RecordRef*  
 Type: RecordRef  
  
 The RecordRef that refers to the table that you want to lock.  
  
## Remarks  
 Because all write operations automatically lock the table that is being used, LOCKTABLE would appear unnecessary. However, you could have a transaction in which an application wants to inspect data before possibly changing it, with a guarantee that the data being changed has not been modified by other applications since the read operation. The solution is to explicitly lock the table before the read operation. This makes sure that no other application makes changes between the read operation and the possible write operation.  
  
 This method works the same as the [LOCKTABLE Method \(Record\)](devenv-LOCKTABLE-Method-Record.md).  
  
## Example  
 The following example opens table number 18 \(Customer\) as a RecordRef that is named MyRecordRef. The LOCKTABLE method locks the table. This is ensures that no records are inserted or deleted during the counting process. The [COUNT Method \(RecordRef\)](devenv-COUNT-Method-RecordRef.md) then retrieves the number of records in the table. The number of records is stored in the Count variable. The name of the table and the number of records in the table is displayed in a message box. The varTableNo variable can be used to open any table and get the number of records in that table by changing the value of the varTableNo variable. This example requires that you create the following global variables and text constant.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|MyRecordRef|RecordRef|  
|Count|Integer|  
|varTableNo|Integer|  
  
|Text constant name|DataType|ENU value|  
|------------------------|--------------|---------------|  
|Text000|Text|The number of records in the %1 table is: %2.|  
  
```  
varTableNo := 18;  
MyRecordRef.OPEN(varTableNo);  
MyRecordRef.LOCKTABLE;  
Count := MyRecordRef.COUNT;  
MESSAGE(Text000, MyRecordRef.NAME, Count);  
```  
  
## Example  
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
 [RecordRef Data Type](../datatypes/devenv-RecordRef-Data-Type.md)