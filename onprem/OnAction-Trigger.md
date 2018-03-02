---
title: "OnAction Trigger"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 05bae0df-26f3-4b16-9e21-1c79ab3d1737
caps.latest.revision: 10
manager: edupont
---
# OnAction Trigger
Executed when a user selects an action on a page.  
  
## Syntax  
  
```  
  
OnAction()  
```  
  
## Applies To  
  
-   Page actions  
  
## Remarks  
 This is called after the action properties, such as the [RunObject Property](RunObject-Property.md), are invoked.  
  
 You typically use the [RunObject Property](RunObject-Property.md) to run objects such as pages, reports, and codeunits from an action. You can use the OnAction trigger when you require more processing than the [RunObject Property](RunObject-Property.md) can support, such as filtering data before a page is displayed or writing to the database.  
  
> [!NOTE]  
>  The OnAction trigger is not used on Role Center pages. If you add C/AL code to the trigger, the Role Center page will compile, but the C/AL code will be ignored at runtime.  
  
## See Also  
 [Page and Action Triggers](Page-and-Action-Triggers.md)