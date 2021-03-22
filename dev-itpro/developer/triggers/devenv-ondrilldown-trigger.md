---
title: "OnDrillDown Trigger"
description: "OnDrillDown trigger in AL for Business Central."
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# OnDrillDown Trigger

Overrides the default drill-down behavior defined in the table definition for the FlowField.  

## Syntax  

```AL
trigger OnDrillDown()
begin
    ...
end;
```

## Applies to

- Fields on pages  

> [!NOTE]  
> The OnDrillDown trigger is not invoked on fields in a Repeater control<!--NAV in the [!INCLUDE[nav_web](../includes/nav_web_md.md)]-->.  

## Remarks 
The [DrillDown Property](../properties/devenv-drilldown-property.md) must be set to **True** to enable the drill-down.

If there is an error in the trigger code, the drilldown is canceled. You can use this trigger to write to the database.  

This trigger overrides the [DrillDownPageID Property](../properties/devenv-drilldownpageid-property.md) setting of the FlowField.  

## See Also  

[Triggers](devenv-triggers.md)  
[DrillDownPageID Property](../properties/devenv-drilldownpageid-property.md)  
[Page and Action Triggers](devenv-page-and-action-triggers.md)  
[Page Properties](../properties/devenv-page-properties.md)  
