---
title: "TransactionType System Option"
ms.author: solsen
ms.custom: na
ms.date: 10/17/2018
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
# TransactionType Option Type
Represents a transaction type.

## Members
|  Member  |  Description  |
|----------------|---------------|
|UpdateNoLocks|<br/>      This is an update transaction. Modifications can occur within the transaction. All read operations are performed with READ UNCOMMITTED locking until the table is either modified by a write operation or locked with the LOCKTABLE Method (Record). From this point until the end of the transaction, all read operations are performed with UPDLOCK locking.<br/><br/>      This transaction type improves concurrency for all tables that users access within the transaction by delaying locking as much as it can. However, the disadvantage is that you must know when to lock the tables for the required transaction behavior.<br/>    |
|Update|<br/>      This is an update transaction. Modifications can occur within the transaction. All read operations are performed with REPEATABLE READ locking until the table is either modified by any write operation or locked with the LOCKTABLE method. From this point forward, all read operations are performed with UPDLOCK locking.<br/><br/>      This transaction type provides full transaction isolation from the start of the transaction, regardless of the lock status of tables that users access within the transaction.<br/>    |
|Snapshot|This is a read-only transaction. Modifications cannot occur within the transaction. All read operations are performed with REPEATABLE READ locking. Therefore, shared locks are added on all data and are maintained until the end of the transaction. This prevents other transactions from modifying any rows that have been read by the current transaction.|
|Browse|This is a read-only transaction. Modifications cannot occur within the transaction. All read operations are performed with READ UNCOMMITTED locking. Therefore, no locks are added and locks that are added by other sessions are not honored. This means that the transaction may read uncommitted data.|
|Report|<br/>      Report option maps to one of the basic options. This enables a report to use the most concurrent read-only form of data access for the connected server. <br/>    <br/>      When you use Microsoft Dynamics NAV Database Server, it maps to Snapshot and when you use SQL Server, it maps to Browse.<br/>    |

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  