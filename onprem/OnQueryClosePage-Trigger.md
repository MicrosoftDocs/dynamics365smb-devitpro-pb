---
title: "OnQueryClosePage Trigger"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 820616a5-daa7-4819-8bf8-02f376ef806e
caps.latest.revision: 14
manager: edupont
---
# OnQueryClosePage Trigger
Executed as a page closes and before the [OnClosePage Trigger](OnClosePage-Trigger.md) executes.  
  
## Syntax  
  
```  
  
[Ok]:= OnQueryClosePage(CloseAction)  
```  
  
#### Parameters  
 *CloseAction*  
  
 \(Action\) The *CloseAction* chosen by the user; usually OK or Cancel.  
  
## Return Value  
 *Ok*  
 Type: Boolean  
  
 **true** to close the page; otherwise **false**. This value is checked after each function call.  
  
## Applies To  
  
-   Pages  
  
> [!IMPORTANT]  
>  The OnQueryClosePage trigger is not fully supported by the [!INCLUDE[nav_web](includes/nav_web_md.md)]. When the page displays in the [!INCLUDE[nav_web](includes/nav_web_md.md)], the trigger is only invoked when the page is hosted in a modal popup window \(MPO\).  
  
## Remarks  
 If the page that is closing and all its child pages return **true** in the OnQueryClosePage trigger, then the [OnClosePage Trigger](OnClosePage-Trigger.md) is called for all child pages and then for the parent page.  
  
 If an error occurs in the OnQueryClosePage trigger or it returns **false**, then the page is not closed.  
  
 When the OnQueryClosePage trigger is called on a subpage, the *CloseAction* parameter is set to the same value as the parent page.  
  
 You can use this trigger to write to the database.