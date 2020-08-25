---
title: "DrillDown Property"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# DrillDown Property
Sets a drill-down for a field on a page.  
  
## Applies To  
  
-   Page Fields  
<!--  
> [!IMPORTANT]  
>  This property is not supported on Repeater controls on pages when it is displayed in the [!INCLUDE[nav_web](includes/nav_web_md.md)].  
-->
## Property Value  
 
**True** if a drill-down for the field is provided; otherwise, **false**. The default value is **false**.  

## Syntax

```
DrillDrown = true;
```
  
## Remarks  

Drill-downs are a system-wide feature of [FlowFields](../devenv-flowfields.md) that let you see the underlying transactions that make up the information shown in the FlowField. For example, if the FlowField shows an account balance, then providing a drill-down for this text box lets the user quickly see the various transactions that make up the balance shown in the field.  
  
## See Also  
 [Pages Overview](../devenv-pages-overview.md)   
 [Page Properties](devenv-page-properties.md)   
