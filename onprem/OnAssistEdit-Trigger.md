---
title: "OnAssistEdit Trigger"
ms.custom: na
ms.date: 05/10/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
author: jswymer
---
# OnAssistEdit Trigger
Executed in place of the [AssistEdit Property](AssistEdit-Property.md) features that are provided in [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)].  
  
## Applies To  
 Fields on pages  

<!-- 
> [!NOTE]  
>  The trigger is not invoked on a page that is in view mode in the [!INCLUDE[nav_web](includes/nav_web_md.md)].  -->
  
## Remarks  
 The trigger is not invoked if the [AssistEdit property](assistedit-property.md) is set to **No**. 
 
 If there is an error in the trigger code, then the page is closed.  
  
 You can use this trigger to write to the database.  

> [!NOTE]
> In the [!INCLUDE[nav_web](includes/nav_web_md.md)], when the page is in the view mode or if the field has the data type of Option, the AssistEdit on the field appears as a hyperlink instead of a button. 
  
## See Also  
 [Triggers](Triggers.md)