---
title: "TransactionType Property"
ms.author: solsen
ms.custom: na
ms.date: 10/29/2020
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
# TransactionType Property
Sets the transaction type.

## Applies to
-   Xml Port
-   Report

## Property Value

|Value|Description|
|-----------|---------------------------------------|
|UpdateNoLocks|TODO:Add documentation|
|Update|TODO:Add documentation|
|Snapshot|TODO:Add documentation|
|Browse|TODO:Add documentation|
|Report|TODO:Add documentation|
[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

There are four basic transaction types: **Browse**, **Snapshot**, **UpdateNoLocks**, and **Update**. Additionally, there is a **Report** type that maps to the **Browse** transaction type. Each transaction type defines the behavior of a transaction in [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] and takes effect from the start of a transaction. A transaction starts at the start of the outermost code or immediately after the [Commit Method \(Database\)](../methods-auto/database/database-commit-method.md) is called. A transaction ends at the end of the outermost code or when the Commit method is called. For example, if a method in a codeunit calls another codeunit, then a new transaction is not started at the start of the second codeunit.  
  
The following table shows transaction behavior with SQL Server.  
  
|**Transaction Type**|**Behavior**|  
|--------------------------|------------------|  
|Browse|This is a read-only transaction. Modifications cannot occur within the transaction. All read operations are performed with READ UNCOMMITTED locking. Therefore, no locks are added and locks that are added by other sessions are not honored. This means that the transaction may read uncommitted data.<br /><br /> For more information about READ UNCOMMITTED locking, see [SET TRANSACTION ISOLATION LEVEL \(Transact-SQL\)](https://go.microsoft.com/fwlink/?LinkId=251872) in the MSDN Library.|  
|Snapshot|This is a read-only transaction. Modifications cannot occur within the transaction. All read operations are performed with REPEATABLE READ locking. Therefore, shared locks are added on all data and are maintained until the end of the transaction. This prevents other transactions from modifying any rows that have been read by the current transaction.<br /><br /> For more information about REPEATABLE READ locking, see [SET TRANSACTION ISOLATION LEVEL \(Transact-SQL\)](https://go.microsoft.com/fwlink/?LinkId=251872) in the MSDN Library.|  
|UpdateNoLocks|This is an update transaction. Modifications can occur within the transaction. All read operations are performed with READ UNCOMMITTED locking until the table is either modified by a write operation or locked with the [LockTable Method \(Record\)](../methods-auto/record/record-locktable-Method.md). From this point until the end of the transaction, all read operations are performed with UPDLOCK locking.<br /><br /> For more information about UPDLOCK locking, see [Table Hints \(Transact-SQL\)](https://go.microsoft.com/fwlink/?LinkId=251875) in the MSDN Library.<br /><br /> This transaction type improves concurrency for all tables that users access within the transaction by delaying locking as much as it can. However, the disadvantage is that you must know when to lock the tables for the required transaction behavior.<br /><br /> This is the default transaction type if you have not specified a type with the [CurrentTransactionType Method \(Database\)](../methods-auto/database/database-CurrentTransactionType-method.md).|  
|Update|This is an update transaction. Modifications can occur within the transaction. All read operations are performed with REPEATABLE READ locking until the table is either modified by any write operation or locked with the LockTable method. From this point forward, all read operations are performed with UPDLOCK locking.<br /><br /> This transaction type provides full transaction isolation from the start of the transaction, regardless of the lock status of tables that users access within the transaction.|  
  
> [!NOTE]  
> In earlier versions of [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)], the **Snapshot** and **Update** transaction types performed read operations with SERIALIZABLE locking until the table was either modified by a write operation or locked with the LockTable method. In [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)], these transaction types perform read operations with REPEATABLE READ locking until the table is either modified by a write operation or locked with the LockTable method.  
>  
> Phantom reads cannot occur with SERIALIZABLE locking because the filter range is locked instead of the records. Phantom reads can occur with REPEATABLE READ locking because only the records are locked. You should know this difference when you upgrade from an earlier version to [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)]. For more information about phantom reads, see [Concurrency Effects](https://go.microsoft.com/fwlink/?LinkId=251936) in the MSDN Library.  
  
Report and XMLport objects have a **TransactionType** property, which you can view and modify in the **Properties** window. The **TransactionType** property that is specified on a report or XMLport object is used only when you run the report or XMLport from Object Designer.  
  
## See Also

[Isolation Levels in the Database Engine](https://go.microsoft.com/fwlink/?LinkId=251873)  
[CurrentTransactionType Method \(Database\)](../methods-auto/database/database-currenttransactiontype-method.md)