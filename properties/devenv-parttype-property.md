---
title: "PartType Property"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 349c9d29-18c7-4544-8560-f4eabba8f3fb
caps.latest.revision: 11
author: SusanneWindfeldPedersen
---

# PartType Property
<!-- article redirected -->
Sets the content type that can display in a part FactBox.  

<!-- This property does not appli to AL. -->
  
## Applies To  
  
-   Part controls on pages  
  
## Remarks
 The following table describes the available **SubType** options.  
  
|[!INCLUDE[bp_tableoption](../includes/bp_tableoption_md.md)]|[!INCLUDE[bp_tabledescription](../includes/bp_tabledescription_md.md)]|  
|----------------------------------|---------------------------------------|  
|Page|Select to display a page in the part. You specify the page in the set the [PagePartID Property](devenv-pagepartid-property.md).|  
|System|Select to display a system part that includes either Outlook, Notes, MyNotes, or RecordLinks. You specify the system part using the [SystemPartID Property](devenv-systempartid-property.md).|  
|Chart|Select to display a chart in the part. You specify the system part using the [ChartPartID Property](devenv-chartpartid-property.md).|  
<!-- //NAV  
> [!NOTE]  
>  System and Chart options are not supported by the [!INCLUDE[nav_web](../includes/nav_web_md.md)]. If the page is displayed in the [!INCLUDE[nav_web](../includes/nav_web_md.md)], then the property is ignored.  
-->  
## See Also  
 [PagePartID Property](devenv-pagepartid-property.md)   
 [SystemPartID Property](devenv-systempartid-property.md)   
 [ChartPartID Property](devenv-chartpartid-property.md)