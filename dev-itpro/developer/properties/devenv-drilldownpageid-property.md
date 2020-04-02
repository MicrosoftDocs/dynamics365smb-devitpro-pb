---
title: "DrillDownPageID Property"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# DrillDownPageID Property
Sets the ID of the page to use as a drill-down.  
  
## Applies To  
  
- Page Fields  
  
- Tables  

<!--  //NAV
> [!IMPORTANT]  
>  This property is not supported on Repeater controls on pages when it is displayed in the [!INCLUDE[nav_web](includes/nav_web_md.md)].  
--> 

## Syntax

```
DrillDownPageID = 50100;
```

## Remarks  

Drill-downs are a system-wide feature of fields (normal fields and [FlowFields](../devenv-flowfields.md)) that let you see the underlying transactions that make up the information shown in the field. For example, the DrillDownID property is typically used to create a link from a Cue to an underlying page.  
  
## See Also  

[Properties](devenv-properties.md)
