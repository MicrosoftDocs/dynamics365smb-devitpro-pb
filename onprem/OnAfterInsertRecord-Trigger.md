---
title: "OnAfterInsertRecord Trigger"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 2dd18e75-4bbe-4e88-8f22-a5b064708bfd
caps.latest.revision: 6
manager: edupont
---
# OnAfterInsertRecord Trigger
Executed after a record has been inserted into a database table.  
  
## Applies To  
 XMLports.  
  
## Remarks  
 This trigger is only used to import data and can be used to move data from temporary tables to real tables.  
  
 If the [AutoSave Property](AutoSave-Property.md) is **No**, then although the record is not inserted automatically, the OnAfterInsertRecord trigger is still called after the insertion would have occurred.  
  
## See Also  
 [Triggers](Triggers.md)