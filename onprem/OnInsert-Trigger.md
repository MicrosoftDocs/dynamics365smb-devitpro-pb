---
title: "OnInsert Trigger"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: bb3d397f-f74a-43ba-9ca2-5f43b601fdfa
caps.latest.revision: 10
manager: edupont
---
# OnInsert Trigger
Executed when a user inserts a new record into the table.  
  
## Applies To  
 Tables  
  
## Remarks  
 This trigger is executed before default insert behavior occurs. The new record is not inserted if an error occurs in the trigger code.  
  
 In tables where records are entered in pages that have the [DelayedInsert Property](DelayedInsert-Property.md) set to **Yes**, we recommend that you write any code that is in an OnInsert trigger so that it will always succeed. For example, this applies to journal lines.  
  
## See Also  
 [Triggers](Triggers.md)   
 [PasteIsValid Property](PasteIsValid-Property.md)