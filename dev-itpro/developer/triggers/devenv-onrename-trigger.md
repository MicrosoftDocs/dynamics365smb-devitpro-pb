---
title: "OnRename Trigger"
ms.custom: na
ms.date: 04/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: f3b559c5-98d1-4880-9c36-cbff899ff993
author: SusanneWindfeldPedersen
manager: edupont
---


# OnRename Trigger
Runs when a user tries to rename a record.  
  
## Applies to  
- Tables  
  
## Remarks  
When you rename a record in one location, it is updated in all other locations. It runs automatically when the user changes a record's primary key field in a page from the Web Client.  The OnRename trigger runs after field validation and before the default renaming behavior, which checks that the new name does not correspond to an already existing record before the rename occurs. The record is not renamed if an error occurs in the trigger code.  
  
## See Also  
 [Triggers](devenv-triggers.md)  
 [Table and Field Triggers](devenv-table-and-field-triggers.md)  