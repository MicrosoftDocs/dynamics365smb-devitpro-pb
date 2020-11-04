---
title: "ReadState Property"
ms.author: solsen
ms.custom: na
ms.date: 11/04/2020
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
# ReadState Property
Specifies which records are read and how they are locked when a query is executed.

## Applies to
-   Query

## Property Value

|Value|Description|
|-----------|---------------------------------------|
|ReadUncommitted|Reads all data, regardless of whether it has been committed to the database. This means that the query can read data from table rows that have been modified by another running transaction, but have not yet been committed.<br /><br /> This mode is sometimes referred to as a dirty read.  For those familiar with SQL, this translates to reading the data with ‘Read Uncommitted’.<br /><br /> No additional locks are placed on the read data. Because the query does not lock the rows it reads, other transactions can also read, modify, and delete the same data as the query.<br /><br /> Setting the property to **ReadUncommitted** can improve performance compared to **ReadShared** and **ReadExclusive**. However, the query can read data that potentially is rolled back or changed by another transaction when the query is running.|
|ReadShared|Reads only data that has been committed to the database.<br /><br /> Share locks are placed on all read data, which prevents it from being modified or deleted by other transactions. The locks are held until the current transaction is committed. It is possible for other transactions to read the data. **Note:**  The Transaction Type of the transaction within which the query is running is not affected. <br /><br /> If you are familiar with SQL, this mode translates to reading the data with Repeatable Read.|
|ReadExclusive|Reads only data that has been committed to the database.<br /><br /> Update locks are placed on all read data, which prevents it from being modified or deleted by other transactions. It is possible for other transactions to read the data depending on their transaction types. **Note:**  The Transaction Type of the transaction within which the query is running is not affected. <br /><br /> If you are familiar with SQL, this mode translates to reading the data with UpdLocks.|
[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  

Committed data is data that is saved to the database when a transaction is completed.  
  
The ReadState property will overrule the current transaction type of the data as set by a [CURRENTTRANSACTIONTYPE Method (Database)](../methods-auto/database/database-currenttransactiontype-method.md) call in the AL code because queries ignore the CURRENTTRANSACTIONTYPE method call.   
  
Each query will use the specified ReadState regardless of other queries that have already been executed. This means that you can read uncommitted data and committed data from the same tables in the same transaction. However, the strictest lock placed on a row will remain until the transaction is committed.

## See Also

[Properties](devenv-properties.md)  