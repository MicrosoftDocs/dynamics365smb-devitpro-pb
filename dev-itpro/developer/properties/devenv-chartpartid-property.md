---
title: "ChartPartID Property"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 277abf60-998d-4196-b745-ffdcee0b568b
caps.latest.revision: 10
author: SusanneWindfeldPedersen
---

# ChartPartID Property
Sets the ID of the chart to add to the page.  
  
## Applies to  
  
-   Part control on a page  
  
<!-- 
> [!IMPORTANT]  
>  This property is not supported by [!INCLUDE[nav_web](../includes/nav_web_md.md)]. When the page displays in [!INCLUDE[nav_web](../includes/nav_web_md.md)], the property is ignored and the chart does not appear.  
--> 
## Syntax
```
page 50100 MyPage
{
    layout
    {
        area(Factboxes)
        {
            chartpart(ChartName; ChartPartID)
            {
       
            }

        }
    }
```
## Remarks  
 To set this property, you need to first set the value of the [PartType Property](devenv-parttype-property.md) to **Chart**. The ChartPartID property creates a link to the selected chart in the Chart table.  
  
## See Also  
 [PartType Property](devenv-parttype-property.md)   
 [PagePartID Property](devenv-pagepartid-property.md)   
 [SystemPartID Property](devenv-systempartid-property.md)