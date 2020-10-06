---
title: "OnQueryClosePage Trigger"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# OnQueryClosePage Trigger

Runs as a page closes and before the [OnClosePage Trigger](devenv-OnClosePage-Trigger.md) executes.  

## Syntax  

```AL
trigger OnQueryClosePage(CloseAction): Ok 
begin
    ...
end;
```  

#### Parameters

 *CloseAction*  

 (Action) The *CloseAction* chosen by the user; usually OK or Cancel.  

## Return Value  
 *Ok*  
 Type: Boolean  

 **True** to close the page; otherwise **false**. This value is checked after each  call.  

## Applies to  

- Pages  

<!--NAV  
> [!IMPORTANT]  
>  The OnQueryClosePage trigger is not fully supported by the [!INCLUDE[nav_web](../includes/nav_web_md.md)]. When the page displays in the [!INCLUDE[nav_web](../includes/nav_web_md.md)], the trigger is only invoked when the page is hosted in a modal popup window \(MPO\).  
-->  

> [!IMPORTANT]  
> The trigger is only invoked when the page is hosted in a modal popup window \(MPO\).  

## Remarks

If the page that is closing and all its child pages return **true** in the OnQueryClosePage trigger, then the [OnClosePage Trigger](devenv-onclosepage-trigger.md) is called for all child pages and then for the parent page.  

If an error occurs in the OnQueryClosePage trigger or it returns **false**, then the page is not closed.  

When the OnQueryClosePage trigger is called on a subpage, the *CloseAction* parameter is set to the same value as the parent page.  

You can use this trigger to write to the database.

## See Also  

[OnClosePage Trigger](devenv-onclosepage-trigger.md)  
[Page and Action Triggers](devenv-page-and-action-triggers.md)  
[Page Properties](../properties/devenv-page-properties.md)  
[Triggers](devenv-triggers.md)  

