---
title: "TransactionType property"
description: "Sets the transaction type."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# TransactionType Property
> **Version**: _Available or changed with runtime version 1.0._

Sets the transaction type.

## Applies to
-   Xml Port
-   Report

## Property value

|Value|Available or changed with|Description|
|-----------|-----------|---------------------------------------|
|**UpdateNoLocks**|runtime version 1.0|All read operations are performed with READ UNCOMMITTED locking until the table is either modified by a write operation or locked with the **LOCKTABLE** method.|
|**Update**|runtime version 1.0|All read operations are performed with REPEATABLE READ locking until the table is either modified by any write operation or locked with the **LOCKTABLE** method.|
|**Snapshot**|runtime version 1.0|All read operations are performed with REPEATABLE READ locking.|
|**Browse**|runtime version 1.0|All read operations are performed with READ UNCOMMITTED locking.|
|**Report**|runtime version 1.0|Maps to the **Browse** transaction type.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Remarks

There are four basic transaction types: **Browse**, **Snapshot**, **UpdateNoLocks**, and **Update**. Additionally, there is a **Report** type that maps to the **Browse** transaction type. Each transaction type defines the behavior of a transaction in [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] and takes effect from the start of a transaction. A transaction starts at the start of the outermost code or immediately after the [Commit Method \(Database\)](../methods-auto/database/database-commit-method.md) is called. A transaction ends at the end of the outermost code or when the Commit method is called. For example, if a method in a codeunit calls another codeunit, then a new transaction is not started at the start of the second codeunit.  
  
The following table shows transaction behavior with SQL Server.  
  
|**Transaction Type**|**Behavior**|  
|--------------------------|------------------|  
|Browse|This is a read-only transaction. Modifications cannot occur within the transaction. All read operations are performed with READ UNCOMMITTED locking. Therefore, no locks are added and locks that are added by other sessions are not honored. This means that the transaction may read uncommitted data.<br /><br /> For more information about READ UNCOMMITTED locking, see [SET TRANSACTION ISOLATION LEVEL \(Transact-SQL\)](/sql/t-sql/statements/set-transaction-isolation-level-transact-sql) in the MSDN Library.|  
|Snapshot|This is a read-only transaction. Modifications cannot occur within the transaction. All read operations are performed with REPEATABLE READ locking. Therefore, shared locks are added on all data and are maintained until the end of the transaction. This prevents other transactions from modifying any rows that have been read by the current transaction.<br /><br /> For more information about REPEATABLE READ locking, see [SET TRANSACTION ISOLATION LEVEL \(Transact-SQL\)](/sql/t-sql/statements/set-transaction-isolation-level-transact-sql) in the MSDN Library.|  
|UpdateNoLocks|This is an update transaction. Modifications can occur within the transaction. All read operations are performed with READ UNCOMMITTED locking until the table is either modified by a write operation or locked with the [LockTable Method \(Record\)](../methods-auto/record/record-locktable-Method.md). From this point until the end of the transaction, all read operations are performed with UPDLOCK locking.<br /><br /> For more information about UPDLOCK locking, see [Table Hints \(Transact-SQL\)](/sql/t-sql/queries/hints-transact-sql-table) in the MSDN Library.<br /><br /> This transaction type improves concurrency for all tables that users access within the transaction by delaying locking as much as it can. However, the disadvantage is that you must know when to lock the tables for the required transaction behavior.<br /><br /> This is the default transaction type if you have not specified a type with the [CurrentTransactionType Method \(Database\)](../methods-auto/database/database-CurrentTransactionType-method.md).|  
|Update|This is an update transaction. Modifications can occur within the transaction. All read operations are performed with REPEATABLE READ locking until the table is either modified by any write operation or locked with the LockTable method. From this point forward, all read operations are performed with UPDLOCK locking.<br /><br /> This transaction type provides full transaction isolation from the start of the transaction, regardless of the lock status of tables that users access within the transaction.|  
  
> [!NOTE]  
> In earlier versions of [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)], the **Snapshot** and **Update** transaction types performed read operations with SERIALIZABLE locking until the table was either modified by a write operation or locked with the LockTable method. In [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)], these transaction types perform read operations with REPEATABLE READ locking until the table is either modified by a write operation or locked with the LockTable method.  
>  
> Phantom reads cannot occur with SERIALIZABLE locking because the filter range is locked instead of the records. Phantom reads can occur with REPEATABLE READ locking because only the records are locked. You should know this difference when you upgrade from an earlier version to [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)]. For more information about phantom reads, see [Concurrency Effects](/previous-versions/sql/sql-server-2008-r2/ms190805(v=sql.105)) in the MSDN Library.  
  
Report and XMLport objects have a **TransactionType** property, which you can view and modify in the **Properties** window. The **TransactionType** property that is specified on a report or XMLport object is used only when you run the report or XMLport from Object Designer.  
  
## Related information

[Isolation Levels in the Database Engine](/previous-versions/sql/sql-server-2008-r2/ms189122(v=sql.105))  
[CurrentTransactionType Method \(Database\)](../methods-auto/database/database-currenttransactiontype-method.md)
