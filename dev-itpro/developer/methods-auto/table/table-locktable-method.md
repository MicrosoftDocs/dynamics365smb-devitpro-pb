---
title: "LockTable Method"
ms.author: solsen
ms.custom: na
ms.date: 11/02/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# LockTable Method
Locks a table to protect it from write transactions that conflict with each other.

## Syntax
```
 Table.LockTable([Wait: Boolean], [VersionCheck: Boolean])
```
## Parameters
*Table*  
&emsp;Type: [Table](table-data-type.md)  
An instance of the [Table](table-data-type.md) data type.  

*Wait*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
  
*VersionCheck*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 Because all write operations automatically lock the table that is being used, **LOCKTABLE** appears unnecessary. However, you could have a transaction in which an application wants to inspect data and then only possibly change it. You require a guarantee that the data being changed has not been modified by other applications since the read operation. The solution is to explicitly lock the table before the read operation. This guarantees that no other application makes changes between the read operation and the possible write operation.  
  
## Example  
 This example uses pseudo-language to show the scope of write locks. Both an explicit lock and an automatic lock are illustrated.  
  
 The first line \(1\) explicitly locks table A. If this explicit lock was not set on table A, the Database Management System \(DBMS\) would automatically lock this table when a record was inserted \(3\). Table B is not locked explicitly, but is locked automatically by the DBMS when a record is inserted \(4\). Both locks are active until the system exits the AL code module \(5\).  
  
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
  
 If a data update depends on a prior read operation and there is a long time between the read operation and the write operation, then you may not want to lock the table as you usually would during a transaction. This enables you to avoid preventing other users from updating the table until your transaction is committed.  

## See Also
[Table Data Type](table-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)