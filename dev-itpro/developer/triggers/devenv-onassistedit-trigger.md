---
title: "OnAssistEdit Trigger"
ms.custom: na
ms.date: 06/19/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 8b1ead83-80f1-42cc-b091-d0732efc156b
author: SusanneWindfeldPedersen
manager: edupont
---


# OnAssistEdit Trigger
Executed in place of the [AssistEdit Property](../properties/devenv-assistedit-property.md) features that are provided in the application.  

## Applies To  
 Fields on pages  

> [!NOTE]  
>  The trigger is not invoked on a page that is in view mode<!--NAV in the [!INCLUDE[nav_web](../includes/nav_web_md.md)]-->.  

## Remarks  
 If there is an error in the trigger code, then the page is closed.  

 You can use this trigger to write to the database.  

## See Also  
 [Triggers](devenv-triggers.md)  
 [AssistEdit Property](../properties/devenv-assistedit-property.md)  
 [Page and Action Triggers](devenv-page-and-action-triggers.md)  
 [Page Properties](../properties/devenv-page-properties.md)  