---
title: "OnAfterModifyRecord Trigger"
ms.custom: na
ms.date: 06/19/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 5471bdd5-60fb-44fa-b6bf-96d776714be6
author: SusanneWindfeldPedersen
manager: edupont
---



# OnAfterModifyRecord Trigger
Executed after a record has been modified.  

## Applies To  
 XMLports  

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
