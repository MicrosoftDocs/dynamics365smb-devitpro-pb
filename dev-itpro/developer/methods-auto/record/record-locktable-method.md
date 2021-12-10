---
title: "Record.LockTable([Boolean] [, Boolean]) Method"
description: "Starts locking on a table to protect it from write transactions that conflict with each other."
ms.author: solsen
ms.custom: na
ms.date: 12/06/2021
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
# Record.LockTable([Boolean] [, Boolean]) Method
> **Version**: _Available or changed with runtime version 1.0._

Starts locking on a table to protect it from write transactions that conflict with each other.


## Syntax
```AL
 Record.LockTable([Wait: Boolean] [, VersionCheck: Boolean])
```
## Parameters
*Record*  
&emsp;Type: [Record](record-data-type.md)  
An instance of the [Record](record-data-type.md) data type.  

*[Optional] Wait*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Specifies what to do if the table is already locked. If this parameter is true and if another application has already locked the table, the system will wait until the table is unlocked. If this parameter is false and if another application has already locked the table, a run-time error occurs.  

*[Optional] VersionCheck*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
If this parameter is true, the version of the Record will be checked. If this parameter is false, blank, or not used, the version will not be checked.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

If the session is not using Read Scale-Out, then LockTable does the following:  

1) Starts a transaction.
2) Makes sure that all subsequent statements that read data will apply an UPDLOCK on the database.

If the session is using Read Scale-Out, then LockTable does the following:

1) Makes sure that all subsequent statements that read data use REPEATABLEREAD on the database.

Because all write operations automatically lock the table that is being used, LockTable would appear unnecessary. However, you could have a transaction in which an application wants to inspect data before possibly changing it, with a guarantee that the data being changed has not been modified by other applications since the read operation. The solution is to explicitly lock the table before the read operation. This makes sure that no other application makes changes between the read operation and the possible write operation.

The table lock is released (unlocked) when the transaction is committed.

This method works the same as the RecordRef [LockTable Method](../recordref/recordref-locktable-method.md).

## See Also
[Record Data Type](record-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
[AL Database Methods and Performance on SQL Server](../../../administration/optimize-sql-al-Database-methods-and-performance-on-server.md)