---
title: "OnModifyRecord Trigger"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 0e06ffde-8cce-4e62-8d40-4109cca9495a
caps.latest.revision: 9
manager: edupont
---
# OnModifyRecord Trigger
Executed before a record is modified in the table.  
  
## Syntax  
  
```  
  
[Ok]:= OnModifyRecord  
```  
  
## Return Value  
 *Ok*  
  
 \(Boolean\) Indicates whether a record should be modified. The return value is checked after each function call. If **true**, the record is modified \(default\). If **false**, the record is not modified.  
  
## Applies To  
  
-   Pages  
  
## Remarks  
 If an error occurs in the trigger code, the action is canceled, but the page is not closed.  
  
 You can write to the database using this trigger.  
  
## See Also  
 [Triggers](Triggers.md)