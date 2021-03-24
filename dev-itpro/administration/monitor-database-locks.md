---
title: "Monitoring SQL Database Locks"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: jswymer
---
# Monitoring SQL Database Locks

## About Locks

Locking controls access to the same data at the same time by multiple users. To protect a transaction from another transaction modifying the same data, the first transaction puts a lock on the data. The lock remains until the transactions is done.

When a database lock occurs, concurrent transactions are limited in their access to the affected data resource. The limit is determined by the locking mode set by SQL Server. In the client, depending on the locking mode, users may be blocked from completing transactions on the locked data. If so, they'll typically get a message that indicates lock condition.

For general information about database locks in SQL Server, see [Transaction Locking and Row Versioning Guide](/sql/relational-databases/sql-server-transaction-locking-and-row-versioning-guide).

## View Database Locks

To view database locks, open page **9511 Database Locks** in the client.

The **Database Locks** page gives a snapshot of all current database locks in SQL Server. It provides information like the table and database resource affected by the lock. Or, the AL object or method that ran the transaction that caused the lock. These details can help you better understand the locking condition. For an explanation about the fields shown, use the tooltips on the page or refer to [sp_lock (Transact-SQL)](/sql/relational-databases/system-stored-procedures/sp-lock-transact-sql)

> [!TIP]
> If you are running [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Fall 2018 or earlier, you'll have to use the [!INCLUDE[nav_dev_long_md](../developer/includes/nav_dev_long_md.md)]. On the **Tools** menu, choose **Debugger**, and then choose **Database Locks**.

<!--
|  Field |  Description  |
|--------------|---------------|
|Table Name|Specifies the name of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] table affected by the lock.|
|SQL Lock Resource Type|Specifies the database resource affected by the lock, such as DATABASE, FILE, OBJECT, PAGE, KEY, and more.|  
|SQL Lock Request Mode|Specifies the lock mode that determines how concurrent transactions can access the resource. For more information, see /sql/relational-databases/sql-server-transaction-locking-and-row-versioning-guide [Lock Modes](/previous-versions/sql/sql-server-2008-r2/ms175519(v=sql.105)).|
|SQL Lock Request Status|Specifies the current status of the lock, which can be one of the following:</br></br>**CNVRT** means that the lock is transitioning from another mode, but the conversion is blocked by another process that holds a lock with a conflicting mode.</br>**GRANT** means that the lock is active.</br>**WAIT** means that the lock is blocked by another process that holds a lock with a conflicting mode.|
|Executing AL Object Type|Specifies the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] object in AL that is running the transaction, such as a page or report.|
|Executing AL Object Id|Specifies the ID of the object that is running.|
|Executing AL Method|Specifies the AL function that is running the transaction that caused the lock.|
-->
##  See Also

[Viewing Database Locks](/dynamics365/business-central/admin-view-database-locks)  
[Monitoring SQL Database Deadlocks](monitor-database-deadlocks.md)