---
title: "OnAfterModifyRecord Trigger"
description: "OnAfterModifyRecord trigger in AL for Business Central."
ms.date: 04/01/2021
ms.topic: reference
author: SusanneWindfeldPedersen
---

# OnAfterModifyRecord Trigger
Runs after a record has been modified.  

## Applies to  
- XMLports  

## Remarks  
 This trigger is used when you import data from an XMLport and then update an existing record in a table with the data from the XMLport.  

 If the [AutoSave Property](../properties/devenv-autosave-property.md) is **false**, then although the record is not modified automatically, the OnAfterModifyRecord trigger is still called after the modification would have occurred.  

## See Also  
 [OnAfterInsertRecord Trigger](devenv-onafterinsertrecord-trigger.md)   
 [OnBeforeModifyRecord Trigger](devenv-onbeforemodifyrecord-trigger.md)   
 [OnBeforeInsertRecord Trigger](devenv-onbeforeinsertrecord-trigger.md)   
 [AutoReplace Property](../properties/devenv-autoreplace-property.md)   
 [AutoSave Property](../properties/devenv-autosave-property.md)   
 [AutoUpdate Property](../properties/devenv-autoupdate-property.md)  
 [XMLport Triggers](devenv-xmlport-triggers.md)  
