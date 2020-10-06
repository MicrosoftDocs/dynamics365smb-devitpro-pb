---
title: "OnBeforeInsertRecord Trigger"
description: "OnBeforeInsertRecord trigger in AL for Business Central."
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# OnBeforeInsertRecord Trigger
Runs after a record has been loaded and before it is inserted into a database table.  
  
## Applies to  
- XMLports  
  
## Remarks  
 This trigger is only used to import data. It is typically used for evaluation or calculations before the record is inserted into the database table.  
  
 If the [AutoSave Property](../properties/devenv-autosave-property.md) is **false**, then although the record is not inserted automatically, the OnBeforeInsertRecord trigger is still called before the insertion would have occurred.  
  
## See Also  
 [AutoSave Property](../properties/devenv-autosave-property.md)  
 [Triggers](devenv-triggers.md)  
 [XMLport Triggers](devenv-xmlport-triggers.md)  
 [OnAfterInsertRecord Trigger](devenv-onafterinsertrecord-trigger.md)  