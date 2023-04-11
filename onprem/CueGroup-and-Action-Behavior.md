---
title: "CueGroup and Action Behavior"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 2a38a6ea-f96f-495c-86e4-cf4f7264e42f
caps.latest.revision: 4
---
# CueGroup and Action Behavior
Cues are used on the UI to visually provide a way to show the number of entities in a table and view the entities in a filtered list. For example, the Cue can show the total number of open invoices, sales orders, or credit memos.  
  
 In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] Cue fields can be grouped inside a CueGroup and appear on, for example, a CardPart page.  
  
> [!NOTE]  
>  It is a best practice to place Actions in the ribbon. If you, however, decide to place Actions on a CardPart page, be aware of the differences in behavior on the display targets as stated in the table below.  
  
|Display target|CueGroup behavior|  
|--------------------|-----------------------|  
|[!INCLUDE[nav_windows](includes/nav_windows_md.md)]|-   CueGroup fields are always shown as Cue tiles.<br />-   Actions are always shown as hyperlinked text.|  
|[!INCLUDE[nav_web](includes/nav_web_md.md)]|-   CueGroup fields are always shown as Cue tiles.<br />-   Actions are only shown if there are no Cue fields and then they are shown as Action tiles.|  
  
## See Also  
 [Adding the Cue CardPart Page on the Role Center Page](Walkthrough--Creating-a-Cue-Based-on-a-FlowField.md#AddingCuePartToRoleCenter)   
 [Walkthrough: Creating a Role Center](Walkthrough--Creating-a-Role-Center.md)
