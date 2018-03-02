---
title: "OnInit Trigger"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: ffb70449-fd7c-4726-9f8b-619445b8eaac
caps.latest.revision: 11
manager: edupont
---
# OnInit Trigger
Initializes the user-defined variables on the page.  
  
## Applies To  
 Pages  
  
## Remarks  
 The C/AL code in this trigger is executed immediately after the variables are cleared and the page is loaded. This trigger cannot be used to access the controls on the page. You can change properties that are dynamic, including those properties that can only be changed when the page is opened.  
  
 After this trigger is executed, the [OnOpenPage Trigger](OnOpenPage-Trigger.md) for pages is called. If an error occurs in the trigger code, then the page is closed.  
  
> [!NOTE]  
>  The OnInit trigger does not support calls to control add-in methods and properties because the trigger is invoked before the page is instantiated. For more information see, [Exposing Methods and Properties in a Windows Client Control Add-in](Exposing-Methods-and-Properties-in-a-Windows-Client-Control-Add-in.md).  
  
## See Also  
 [Triggers](Triggers.md)