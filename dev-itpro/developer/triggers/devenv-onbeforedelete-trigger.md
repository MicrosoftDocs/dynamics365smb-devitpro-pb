---
title: "OnBeforeDelete Trigger"
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

# OnBeforeDelete Trigger
Runs when the user tries to delete a record. 

## Applies to  
- Table extensions 
  
## Remarks  
 This trigger runs before the default delete behavior is executed on a record to be deleted. It runs automatically after the user chooses to delete a record in a page from the Web client. The record is not deleted if an error occurs in the trigger code. 

## See Also  
 [Triggers](devenv-triggers.md)  
 [Table and Field Triggers](devenv-table-and-field-triggers.md)   
 [OnAfterDelete Trigger](devenv-onafterdelete-trigger.md)    
