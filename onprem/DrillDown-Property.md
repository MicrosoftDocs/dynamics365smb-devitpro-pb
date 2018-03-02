---
title: "DrillDown Property"
ms.custom: na
ms.date: 05/10/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
author: jswymer
---
# DrillDown Property
Sets a drill-down for a field on a page.  
  
## Applies To  
  
-   Page Fields  

<!-- 
> [!IMPORTANT]  
>  This property is not supported on Repeater controls on pages when it is displayed in the [!INCLUDE[nav_web](includes/nav_web_md.md)]. --> 
  
## Property Value  
 **Yes** if a drill-down for the field is provided; otherwise, **No**. The default value is **No**.  
  
## Remarks  
 Drill-downs are a system-wide feature of [FlowFields](FlowFields.md) that let you see the underlying transactions that make up the information shown in the FlowField. For example, if the FlowField shows an account balance, then providing a drill-down for this text box lets the user quickly see the various transactions that make up the balance shown in the field. 

> [!NOTE]
> In the [!INCLUDE[nav_web](includes/nav_web_md.md)], when the page is in the view mode or if the field has the data type of Option, the drill-down on the field appears as a hyperlink instead of a button. 
  
## See Also  
 [Pages](Pages.md)   
 [Page Properties](Page-Properties.md)   
 [Page Properties Not Supported by Microsoft Dynamics NAV Web Client](Page-Properties-Not-Supported-by-Microsoft-Dynamics-NAV-Web-Client.md)