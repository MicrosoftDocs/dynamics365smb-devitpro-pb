---
title: "OnInit Trigger"
description: "OnInit trigger in AL for Business Central."
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# OnInit Trigger

Initializes the user-defined variables on the page.  

## Syntax  

```AL
trigger OnInit()
begin
    ...
end;
``` 
 
## Applies to

- Pages  
  
## Remarks  

The AL code in this trigger is run immediately after the variables are cleared and the page is loaded. This trigger cannot be used to access the controls on the page. You can change properties that are dynamic, including those properties that can only be changed when the page is opened.  
  
After this trigger is executed, the [OnOpenPage Trigger](devenv-onopenpage-trigger.md) for pages is called. If an error occurs in the trigger code, then the page is closed.  
  
> [!NOTE]  
> The OnInit trigger does not support calls to control add-in methods and properties because the trigger is invoked before the page is instantiated. <!-- For more information see, [Exposing Methods and Properties in a Windows Client Control Add-in](exposing-methods-and-properties-in-a-windows-client-control-add-in.md). --> 
  
## See Also

[Triggers](devenv-triggers.md)  
[Page and Action Triggers](devenv-page-and-action-triggers.md)  