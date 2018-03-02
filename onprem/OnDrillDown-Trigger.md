---
title: "OnDrillDown Trigger"
ms.custom: na
ms.date: 05/10/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
author: jswymer
---
# OnDrillDown Trigger
Overrides the default drill-down behavior defined in the table definition for the FlowField.  
  
## Applies To  
 Fields on pages  
  
> [!NOTE]  
>  The OnDrillDown trigger is not invoked on fields in a Repeater control in the [!INCLUDE[nav_web](includes/nav_web_md.md)].  
  
## Remarks  
 If there is an error in the trigger code, the drilldown is canceled. You can use this trigger to write to the database.  
  
 This trigger overrides the [DrillDownPageID Property](DrillDownPageID-Property.md) setting of the FlowField.  

> [!NOTE]
> In the [!INCLUDE[nav_web](includes/nav_web_md.md)], when the page is in the view mode or if the field has the data type of Option, the drill-down on the field appears as a hyperlink instead of a button. 
  
  
## See Also  
 [Triggers](Triggers.md)