---
title: "OnDelete Trigger"
description: "OnDelete trigger in AL for Business Central."
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# OnDelete Trigger
Runs when a user tries to delete a record.  
  
## Applies to  
- Tables  
- Table extensions
  
## Remarks  
 This trigger runs before the default delete behavior, which checks that the record exists before the deletion occurs. It runs automatically after the user chooses to delete a record in a page from the Web Client. If a user deletes a record using AL code, then the *RunTrigger* argument of [DELETE (Record) Method](../methods-auto/record/record-delete-method.md) or [DELETEALL (Record) Method](../methods-auto/record/record-deleteall-method.md) must be set to **true** for the OnDelete Trigger to run, or otherwise it will not. The record is not deleted if an error occurs in the trigger code.  
  
## See Also  
 [Triggers](devenv-triggers.md)  
 [Table and Field Triggers](devenv-table-and-field-triggers.md)  
