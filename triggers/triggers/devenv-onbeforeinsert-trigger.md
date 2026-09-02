---
title: OnBeforeInsert Trigger in AL for Business Central
description: Learn how the OnBeforeInsert trigger runs in AL table extensions in Business Central before a new record is inserted, and how trigger errors cancel the insert.
ms.date: 04/01/2021
ms.topic: reference
ms.reviewer: solsen
ms.author: solsen
author: SusanneWindfeldPedersen
---

# OnBeforeInsert trigger

Runs when a user inserts a new record into the table.

## Applies to

- Table extensions

## Remarks

This trigger is run before default insert behavior, which checks that the record to be inserted does not already exist before the insertion occurs. It runs automatically after the user chooses to insert a new record in a page from the Web Client. The new record is not inserted if an error occurs in the trigger code.

## Related information

[Triggers](devenv-triggers.md)  
[Table and Field Triggers](devenv-table-and-field-triggers.md)  
[OnAfterInsert Trigger](devenv-onafterinsert-trigger.md)
