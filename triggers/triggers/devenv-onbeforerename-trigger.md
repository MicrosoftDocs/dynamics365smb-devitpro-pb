---
title: OnBeforeRename Trigger in AL for Business Central
description: Learn how the OnBeforeRename trigger runs in AL table extensions in Business Central before a record is renamed, and how trigger errors cancel the rename.
ms.date: 04/01/2021
ms.topic: reference
ms.reviewer: solsen
ms.author: solsen
author: SusanneWindfeldPedersen
---

# OnBeforeRename trigger

Runs when a user tries to rename a record.

## Applies to

- Table extensions

## Remarks

When you rename a record in one location, it is updated in all other locations. It runs automatically when the user changes a record's primary key field in a page from the Web Client.  The OnBeforeRename trigger runs after field validation and before the default renaming behavior, which checks that the new name does not correspond to an already existing record before the rename occurs. The record is not renamed if an error occurs in the trigger code.

## Related information

[Triggers](devenv-triggers.md)  
[Table and Field Triggers](devenv-table-and-field-triggers.md)  
[OnAfterRename Trigger](devenv-onafterrename-trigger.md)
