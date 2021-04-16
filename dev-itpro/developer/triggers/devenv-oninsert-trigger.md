---
title: "OnInsert Trigger"
description: "OnInsert trigger in AL for Business Central."
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# OnInsert Trigger
Runs when a user inserts a new record into the table.  
  
## Applies to  
- Tables  
  
## Remarks  
 This trigger is run before default insert behavior, which checks that the record to be inserted does not already exist before the insertion occurs. It runs automatically after the user chooses to insert a new record in a page from the Web client. If a user inserts a record using AL code, then the *RunTrigger* argument of [INSERT (Record) Method](../methods-auto/record/record-insert-method.md) must be set to **true** for the OnInsert Trigger to run, or otherwise it will not. The new record is not inserted if an error occurs in the trigger code.  
  
 In tables where records are entered in pages that have the [DelayedInsert Property](../properties/devenv-delayedinsert-property.md) set to **true**, we recommend that you write any code that is in an OnInsert trigger so that it will always succeed. For example, this applies to journal lines.  
  
## See Also  
 [Triggers](devenv-triggers.md)   
 [PasteIsValid Property](../properties/devenv-pasteisvalid-property.md)  
 [Table and Field Triggers](devenv-table-and-field-triggers.md)  
 [Table Properties](../properties/devenv-table-properties.md)  