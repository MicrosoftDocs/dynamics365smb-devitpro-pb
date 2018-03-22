---
title: "OnInsertRecord Trigger"
ms.custom: na
ms.date: 06/19/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: eb1d2913-5ab8-40db-8790-e5e6b80b6722
author: SusanneWindfeldPedersen
manager: edupont
---


# OnInsertRecord Trigger
Executed before a new record is inserted into the table.  
  
## Syntax  
  
```  
  
[Ok]:= OnInsertRecord(BelowxRec)  
```  
  
## Return Value  
 *BelowxRec*  
 \(Boolean\) This return value indicates whether the new record was inserted after the last record in the table \(xRec\) or not. If **false**, the record was inserted between an existing record and the last record. If **true**, the record was inserted below the last record in the table \(xRec\).  
  
 *Ok*  
 \(Boolean\) Indicates whether a new record should be inserted. The return value is checked after each  call. If **true**, the record is inserted. If **false**, the record is not inserted.  
  
## Applies To  
  
-   Pages  
  
## Remarks  
 If an error occurs in the trigger code, the action is canceled, but the page is not closed. The user cannot enter any new data and an error is shown in the message bar.  
  
## See Also  
 [Triggers](devenv-triggers.md)  
 [Page and Action Triggers](devenv-page-and-action-triggers.md)  
 [Page Properties](../properties/devenv-page-properties.md)   