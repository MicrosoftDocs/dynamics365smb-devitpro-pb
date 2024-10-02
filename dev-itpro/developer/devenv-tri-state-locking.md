---
title: Tri-state locking in database
description: Learn about the tri-state locking feature in Business Central.
author: jswymer
ms.author: jswymer 
ms.reviewer: jswymer
ms.topic: conceptual 
ms.collection: 
ms.date: 09/04/2023
ms.custom: bap-template
---

# Tri-state locking in database

[!INCLUDE[prod_short](../includes/2023_releasewave2.md)]

The tri-state locking feature is aimed at enhancing the performance and concurrency of database transactions. By enabling this feature, AL-based read operations that follow write operations are performed optimistically, rather than with strict consistency and low concurrency. So, users can expect higher levels of concurrency and fewer blocked or failed operations while accessing data. 

> [!NOTE]
> Explicitly using the [LockTable](methods-auto/record/record-locktable-method.md) method in code will maintain the same behavior, disabling optimistic reads.

## Locking behavior

The [!INCLUDE[prod_short](../developer/includes/prod_short.md)] server uses database locks on a table when a session starts to change data in the table. The following examples illustrate the legacy locking behavior, used in versions 22 and earlier, compared to tri-state locking.

```AL
// locking behavior in versions 22 (and earlier)
trigger OnAction()
var
    currency1: Record Currency;
    currency2: Record Currency;    
begin
    currency1.FindFirst(); // SQL statement use READUNCOMMITTED

    currency1.Code := 'DKK';
    currency1."ISO Code" := 'DKK';
    currency1.Symbol := 'Kr';
    currency1.Insert();

    currency2.FindLast(); // SQL statement use UPDLOCK (so locks data with an exclusive lock)
end;
```  

Contrast this behavior with how locks are taken with tri-state locking.

```AL
// locking behaviour with tri-state locking
trigger OnAction()
var
    currency1: Record Currency;
    currency2: Record Currency;    
begin
    currency1.FindFirst(); // SQL statement use READUNCOMMITTED

    currency1.Code := 'DKK';
    currency1."ISO Code" := 'DKK';
    currency1.Symbol := 'Kr';
    currency1.Insert();

    currency2.FindLast(); // SQL statement use READCOMMITTED (so locks data with a shared lock)
end;
```  

In both cases, the locking behavior is about what happens in a session after a record instance does a data modification (insert/update/delete) on a table. 

| Properties | Locking behavior in versions 22 (and earlier) | Locking behavior with tri-state locking  | 
| ---------- | ----- | ---------  | 
| Default isolation level for subsequent operations | UpdLock | ReadCommitted |
| Locking behavior | Session would acquire update lock on data from the table until it committed or rolled back its changes.  | Session only acquires a shared lock when reading data. |
| Consequences | Could cause blocking and contention issues when multiple sessions tried to access or modify the same table. | Allows other sessions to read and write to the same table concurrently, if they don't conflict with each other's changes. |

## Enable and disable tri-state locking for a tenant

Tri-state locking is enabled by default for Business Central online and on-premises. If you prefer to use legacy locking, you can disable tri-state locking from the **Feature Management** page as follows:  

- In version 25, set the **Enabled for** field for the **Feature: Enable legacy locking scheme in AL** to **All users**:

- In versions 24 and 23, set the **Enabled for** field for **Feature: Enable tri-state locking in AL** to **None**.

Changes take effect on users the next time they sign in to Business Central. Learn more about feature management in [Enabling Upcoming Features Ahead of Time](../administration/feature-management.md).

> [!NOTE]
> If you're using Business Central on-premises, the `EnableTriStateLocking` setting in the server configuration must also be set to `true` to use tri-state locking. [Learn more about configuring the server](../administration/configure-server-instance.md#Database).

## See also

[Release plan: Performance gain by reducing locks in the database](/dynamics365/release-plan/2023wave2/smb/dynamics365-business-central/performance-gain-reducing-locks-database)  
[Monitoring SQL database locks](../administration/monitor-database-locks.md)  
