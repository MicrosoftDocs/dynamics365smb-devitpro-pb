---
title: Record instance isolation level
description: Learn how to set the isolation levels used when querying the Business Central database. 
author: phduck 
ms.author: magram 
ms.reviewer: jswymer
ms.service: dynamics365-business-central
ms.topic: conceptual
ms.date: 12/19/2022
ms.custom: bap-template
---
# Record instance isolation level

The isolation level on a transaction determines the degree to which it's isolated from other transactions to prevent problems in concurrent situations. On the record level, the isolation level improves the integrity and stability of data when multiple transactions are reading the same record. It defines how to protect a transaction from the effects of other transactions by taking locks, preventing reads of uncommitted data, or preventing modifications.

Database locking can be a major cause for performance issues. When AL code takes fewer locks, it increases the performance of the system for end users. By using record instance isolation level, you can improve performance by limiting database locks to only what necessary.

## How isolation level works by default

The runtime of Business Central automatically determines the isolation levels used when querying the database. A transaction's isolation level is heightened either implicitly by writes on a record or explicitly via a [LockTable](methods-auto/record/record-locktable-method-md) method call, both on a per-table basis. The heightened isolation level persists for the entirety of the transaction, leaving subsequent code executed be impacted by heightened isolation levels, whether it's required or wished.

The below example shows AL code with SQL isolation level hints annotated on database reads, which solely relies on transaction determined locking.

```al
local procedure CurrentBehavior()
var
    cust: Record Customer;
    otherCust: Record Customer;
    curr: Record Currency;
begin
    cust.FindFirst(); // READUNCOMMITTED

    // Heighten isolation level for Customer table.
    cust.LockTable();

    cust.FindLast(); // UPDLOCK

    // Also impacts other instances of same table.
    otherCust.FindSet(); // UPDLOCK

    // But does not impact other tables.
    curr.Find(); // READUNCOMMITTED
end;
```

## Record instance isolation level

With the introduction of record instance isolation level (RIIL), it's possible to explicitly select the isolation level for reads on a record instance. RIIL will override the transaction's isolation level for a given table. It's possible to both heighten and lower the isolation level, with the effect being localized to the record instance instead of lasting for the entire length of the transaction.

The following example shows AL code with SQL isolation level hints annotated on database reads, with RIIL used to override the transaction's isolation level.

```al
local procedure UsingReadIsolation()
var
    cust: Record Customer;
    otherCust: Record Customer;
    curr: Record Currency;
begin
    cust.FindFirst(); // READUNCOMMITTED

    // Heighten isolation level for Customer table.
    cust.LockTable();

    // Explicitly select another isolation level than the transaction's.
    otherCust.ReadIsolation := IsolationLevel::ReadUncommitted;

    otherCust.FindSet(); // READUNCOMMITED
end;
```

## Isolation level enum values

|Value|Description|
|-|-|
|Default|Follows the transaction's state. It's the same as not using read isolation.|
|ReadUncommitted|Allows dirty reads, which means it can read rows that have been modified by other transactions but not yet committed. It takes no locks and ignores locks from other transactions.|
|ReadCommitted|Allows reads on committed data only, in other words, it can't read data that has been modified by other transactions but not yet committed. But it doesn't guarantee that rows read will stay consistent throughout the entirety of the transaction.|
|RepetableRead|Ensures that all reads are stable by holding shared locks for the lifetime of the transaction. The transaction can't read data that has been modified but not yet committed by other transactions, and no other transactions can modify data that's been read by the current transaction until the current transaction completes.|
|UpdLock|Reads for update, disallowing others to read with the same intent.|

For more about non-default values, go to [SET TRANSACTION ISOLATION LEVEL](/sql/t-sql/statements/set-transaction-isolation-level-transact-sql) and [](/sql/t-sql/queries/hints-transact-sql-table?#updlock) in the SQL Server documentation.

## Temporarily heightening the isolation level

Previously AL only provided explicit isolation level control via the `LockTable` method, which would ensure the all reads for the remainder of the transaction would use UpdLock. Instead, with RIIL code can be explicit about the isolation guarantees it needs and leave subsequent code unimpacted by its execution.

The following example heightens the isolation level on a record instance of type "G/L Entry". It takes the lock on the last row, while subsequent reads won't trigger further locks to be taken. Such usage makes sense in cases with event subscribers, where one injects code into an existing business logic flow. Where it wasn't expected to introduce a `LockTable` call causing subsequent reads against a table to lock.

```al
// Gets the next "Entry No." and locks just last row.
// Without causing the rest of transaction to begin taking locks.
local procedure GetNextEntryNo(): Integer
var
    GLEntry: Record "G/L Entry";
begin
    GLEntry.ReadIsolation := IsolationLevel::UpdLock;
    GLEntry.FindLast();
    exit(GLEntry."Entry No." + 1)
end;
```

## Temporarily lowering the isolation level

Inside a transaction, it isn't possible to determine the current isolation level used in the transaction. If previously executed code has triggered a higher isolation level, counting on the entire table will require locks on the entire table. With RIIL, for example, you could get an estimated record count without locking everyone else out from making changes to the table.

```al
local procedure GetEstimatedCount(tableno: Integer) : Integer
var
    rref: RecordRef;
begin
    rref.Open(tableno);
    rref.ReadIsolation := IsolationLevel::ReadUncommitted;
    exit(rref.Count);
end;
```

## Differences between transaction locking and RIIL

When using FlowFields and the default transaction state, it's the table state of the target table of the FlowField's formula which is used to determine the isolation level, not source table's target state. When using RIIL the target table doesn't matter since the isolation level specified on the ReadIsolation property is used.

```al
local procedure Foo()
var
    purchLine: Record "Purchase Line";
    curr: Record Currency;
begin
    curr.FindFirst();

    curr.CalcFields(curr."Vendor Outstanding Orders"); // READUNCOMMITED

    purchLine.LockTable();

    curr.CalcFields(curr."Vendor Outstanding Orders"); // UPDLOCK

    curr.ReadIsolation := IsolationLevel::ReadUncommitted;

    curr.CalcFields(curr."Vendor Outstanding Orders"); // READUNCOMMITTED
end;
```

## See also

[LockTable](methods-auto/record/record-locktable-method-md) 