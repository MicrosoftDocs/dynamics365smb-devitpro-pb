---
title: "OnModify Trigger"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# OnModify Trigger
Runs when a user modifies an existing record in a table.  
  
## Applies to  
- Tables  
- Table extensions
  
## Remarks  
 This trigger is run before the default modify behavior, which checks that all the fields of a record are valid before the modification occurs. It runs automatically when the user changes at least one field (different from the primary key field) of a record in a page from the Web Client. If a user modifies a record using AL code, then the *RunTrigger* argument of [MODIFY (Record) Method](../methods-auto/record/record-modify-method.md) or [MODIFYALL (Record) Method](../methods-auto/record/record-modifyall-method.md) must be set to **true** for the OnModify Trigger to run, or otherwise it will not. If an error occurs in the trigger code, the record changes are canceled.  
  
 We recommend that you do not include code that can stop the user from recording a change in the OnModify trigger on a table. For example, do not include code for displaying error messages. If a user has previously changed the contents of some fields in a record, then these changes must always be accepted by the system.  
  
## See Also  
 [Triggers](devenv-triggers.md)  
 [Table and Field Triggers](devenv-table-and-field-triggers.md)  
 [Table Properties](../properties/devenv-table-properties.md)  