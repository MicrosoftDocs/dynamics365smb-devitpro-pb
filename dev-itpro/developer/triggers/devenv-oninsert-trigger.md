---
title: "OnInsert Trigger"
ms.custom: na
ms.date: 06/19/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: bb3d397f-f74a-43ba-9ca2-5f43b601fdfa
author: SusanneWindfeldPedersen
manager: edupont
---


# OnInsert Trigger
Executed when a user inserts a new record into the table.  
  
## Applies To  
 Tables  
  
## Remarks  
 This trigger is executed before default insert behavior occurs. The new record is not inserted if an error occurs in the trigger code.  
  
 In tables where records are entered in pages that have the [DelayedInsert Property](../properties/devenv-delayedinsert-property.md) set to **true**, we recommend that you write any code that is in an OnInsert trigger so that it will always succeed. For example, this applies to journal lines.  
  
## See Also  
 [Triggers](devenv-triggers.md)   
 [PasteIsValid Property](../properties/devenv-pasteisvalid-property.md)  
 [Table and Field Triggers](devenv-table-and-field-triggers.md)  
 [Table Properties](../properties/devenv-table-properties.md)  