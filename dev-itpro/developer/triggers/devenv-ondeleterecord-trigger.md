---
title: "OnDeleteRecord Trigger"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# OnDeleteRecord Trigger

Runs before a record is deleted from the table.  
  
## Syntax  

```AL
trigger OnDeleteRecord(): Ok
begin
    ...
end;
``` 
  
## Return Value

 *Ok*  
  
 \(Boolean\) If **true**, the record is deleted. If **false**, the record is not deleted. This value is checked after each  call.  
  
## Applies to  
  
- Pages  
  
## Remarks  

The action is canceled but the page is not closed if an error occurs in the trigger code. You can use this trigger to write to the database.  
  
## See Also  

[Triggers](devenv-triggers.md)  
[Page and Action Triggers](devenv-page-and-action-triggers.md)  
[Page Properties](../properties/devenv-page-properties.md)  