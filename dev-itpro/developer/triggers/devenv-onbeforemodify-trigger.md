---
title: "OnBeforeModify Trigger"
description: "OnBeforeModify trigger in AL for Business Central."
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.author: t-blrobl
ms.service: "dynamics365-business-central"
author: blrobl
---

# OnBeforeModify Trigger
Runs when a user modifies an existing record in a table.  
  
## Applies to  
- Table extensions
  
## Remarks  
 This trigger is run before the default modify behavior, which checks that all the fields of a record are valid before the modification occurs. It runs automatically when the user changes at least one field (different from the primary key field) of a record in a page from the Web Client. If an error occurs in the trigger code, the record changes are canceled.  
  
## See Also  
 [Triggers](devenv-triggers.md)  
 [Table and Field Triggers](devenv-table-and-field-triggers.md)  
 [OnAfterModify Trigger](devenv-onaftermodify-trigger.md)
