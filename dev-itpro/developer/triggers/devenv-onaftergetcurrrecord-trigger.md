---
title: "OnAfterGetCurrRecord Trigger"
ms.custom: na
ms.date: 10/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: ccb832bd-0368-4de5-b91f-eb953ac2ef3e
author: SusanneWindfeldPedersen
---

# OnAfterGetCurrRecord Trigger
Runs after the current record is retrieved from the table.  

## Syntax  
```  
trigger OnAfterGetCurrRecord()
begin
    ...
end;
``` 

## Applies To  
- Pages  

## Remarks  
 In a page with a repeater control, the trigger is only called when the current record in the repeater is updated. OnAfterGetCurrRecord is called directly after all OnAfterGetRecord triggers are called for each row in a list.  

 If there is an error in the trigger code, then the page is closed.  

## See Also  
 [Triggers](devenv-triggers.md)  
 [Page and Action Triggers](devenv-page-and-action-triggers.md)  
