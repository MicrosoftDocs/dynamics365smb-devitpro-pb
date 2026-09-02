---
title: OnBeforeModify Trigger in AL for Business Central
description: Learn how the OnBeforeModify trigger runs in AL table extensions in Business Central before a record is modified, and how trigger errors cancel the changes.
ms.date: 04/01/2021
ms.topic: reference
ms.reviewer: solsen
ms.author: solsen
author: SusanneWindfeldPedersen
---

# OnBeforeModify trigger

Runs when a user modifies an existing record in a table.

## Applies to

- Table extensions

## Remarks

This trigger is run before the default modify behavior, which checks that all the fields of a record are valid before the modification occurs. It runs automatically when the user changes at least one field (different from the primary key field) of a record in a page from the Web Client. If an error occurs in the trigger code, the record changes are canceled.

## Related information

[Triggers](devenv-triggers.md)  
[Table and Field Triggers](devenv-table-and-field-triggers.md)  
[OnAfterModify Trigger](devenv-onaftermodify-trigger.md)
