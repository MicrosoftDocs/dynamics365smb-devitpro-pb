---
title: OnBeforeDelete Trigger in AL for Business Central
description: Learn how the OnBeforeDelete trigger runs in AL table extensions in Business Central before a record is deleted, and how trigger errors cancel the deletion.
ms.date: 04/01/2021
ms.topic: reference
ms.reviewer: solsen
ms.author: solsen
author: SusanneWindfeldPedersen
---

# OnBeforeDelete trigger

Runs when the user tries to delete a record.

## Applies to

- Table extensions

## Remarks

This trigger runs before the default delete behavior is executed on a record to be deleted. It runs automatically after the user chooses to delete a record in a page from the Web client. The record is not deleted if an error occurs in the trigger code.

## Related information

[Triggers](devenv-triggers.md)  
[Table and Field Triggers](devenv-table-and-field-triggers.md)  
[OnAfterDelete Trigger](devenv-onafterdelete-trigger.md)
