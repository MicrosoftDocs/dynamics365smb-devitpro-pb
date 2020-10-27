---
title: "OnAfterGetRecord Trigger"
description: "OnAfterGetRecord trigger in AL for Business Central."
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# OnAfterGetRecord Trigger

Runs after a record is retrieved from a table but before it is displayed to the user.  

## Applies to

- Pages  

## Syntax  

```AL
trigger OnAfterGetRecord()
begin
    ...
end;
``` 
  
## Remarks  

Use this trigger to calculate variables that depend on the current record.  
  
If there is an error trigger code, then the page is closed.  
  
## See Also  

[Triggers](devenv-triggers.md)  
[Page and Action Triggers](devenv-page-and-action-triggers.md)  