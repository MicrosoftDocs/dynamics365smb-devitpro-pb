---
title: "OnDeleteRecord Trigger"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: a1fd9af0-4f10-430c-8a06-c5751eb2daee
caps.latest.revision: 9
manager: edupont
---
# OnDeleteRecord Trigger
Executed before a record is deleted from the table.  
  
## Syntax  
  
```  
  
[Ok]:= OnDeleteRecord  
```  
  
## Return Value  
 *Ok*  
  
 \(Boolean\) If **true**, the record is deleted. If **false**, the record is not deleted. This value is checked after each function call.  
  
## Applies To  
  
-   Pages  
  
## Remarks  
 The action is canceled but the page is not closed if an error occurs in the trigger code. You can use this trigger to write to the database.  
  
## See Also  
 [Triggers](Triggers.md)