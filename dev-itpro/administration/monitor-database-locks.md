---
title: "Monitoring SQL Database Locks"
ms.custom: na
ms.date: 10/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
# Monitoring SQL Database Locks
## About Locks
Microsoft SQL Server uses locking to control access by multiple users to the same data at the same time. To protect a transaction against other transactions modifying the same data, the first transaction puts a lock on the data until it is done.

When a database lock occurs, concurrent transactions are limited in their access to the affected data resource, as determined by the locking mode set by SQL Server. In the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] client, depending on the locking mode, users may be blocked from completing transactions on the locked data, and will typically get a message that indicates lock condition.

For general information about database locks in SQL Server, see [Locking in the Database Engine](https://aka.ms/sqlserverdatabaselocking).

## View Database Locks
You can use the [!INCLUDE[nav_dev_long_md](../developer/includes/nav_dev_long_md.md)] to view the current locks in the database. On the **Tools** menu, choose **Debugger**, and then choose **Database Locks**.

The **Database Locks** page displays all the active locks on tables in the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database in SQL Server, providing details that can help you better understand the locking condition.

|  Field |  Description  |
|--------------|---------------|
|Table Name|Specifies the name of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] table affected by the lock.|
|SQL Lock Resource Type|Specifies the database resource affected by the lock, such as DATABASE, FILE, OBJECT, PAGE, KEY, and more.|  
|SQL Lock Request Mode|Specifies the lock mode that determines how concurrent transactions can access the resource. For more information, see [Lock Modes](https://aka.ms/sqldatabaselockmodes).|
|SQL Lock Request Status|Specifies the current status of the lock, which can be one of the following:</br></br>**CNVRT** means that the lock is transitioning from another mode, but the conversion is blocked by another process that holds a lock with a conflicting mode.</br>**GRANT** means that the lock is active.</br>**WAIT** means that the lock is blocked by another process that holds a lock with a conflicting mode.|
|Executing AL Object Type|Specifies the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] object in AL that is running the transaction, such as a page or report.|
|Executing AL Object Id|Specifies the ID of the object that is running.|
|Executing AL Method|Specifies the AL function that is running the transaction that caused the lock.|

##  See Also
[Monitoring SQL Database Deadlocks](monitor-database-deadlocks.md)  
