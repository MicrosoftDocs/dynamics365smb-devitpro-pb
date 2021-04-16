---
title: "OnDrillDown (Page Field) Trigger"
ms.author: solsen
ms.custom: na
ms.date: 04/16/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# OnDrillDown (Page Field) Trigger
> **Version**: _Available or changed with runtime version 1.0._

Overrides the default drill-down behavior defined in the table definition for the FlowField.


## Syntax
```
trigger OnDrillDown()
begin
    ...
end;
```



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

> [!NOTE]  
> The OnDrillDown trigger is not invoked on fields in a Repeater control<!--NAV in the [!INCLUDE[nav_web](../includes/nav_web_md.md)]-->.  

## Remarks 
The [DrillDown Property](../../properties/devenv-drilldown-property.md) must be set to **True** to enable the drill-down.

If there is an error in the trigger code, the drilldown is canceled. You can use this trigger to write to the database.  

This trigger overrides the [DrillDownPageID Property](../../properties/devenv-drilldownpageid-property.md) setting of the FlowField.  

## See Also  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
[OnDrillDown (Control Extension) Trigger](../pagefieldextension/devenv-ondrilldown-pagefieldextension-trigger.md)
