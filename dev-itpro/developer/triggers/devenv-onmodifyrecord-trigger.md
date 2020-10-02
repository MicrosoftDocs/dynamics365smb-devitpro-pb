---
title: "OnModifyRecord Trigger"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# OnModifyRecord Trigger
Runs before a record is modified in the table.  

## Syntax  
```  
trigger OnModifyRecord(): Ok
begin
    ...
end;
```   

## Return Value  
 *Ok*  
  
 (Boolean) Indicates whether a record should be modified. The return value is checked after each  call. If **true**, the record is modified (default). If **false**, the record is not modified.  
  
## Applies to  
  
- Pages  
  
## Remarks  
 If an error occurs in the trigger code, the action is canceled, but the page is not closed.  
  
 You can write to the database using this trigger.  
  
## See Also  
 [Triggers](devenv-triggers.md)  
 [Page and Action Trigger](devenv-page-and-action-triggers.md)  
 [Page Properties](../properties/devenv-page-properties.md)  
