---
title: "AssistEdit Property"
ms.custom: na
ms.date: 05/10/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
author: jswymer
---
# AssistEdit Property
Sets assist-edit capabilities for a text box.  
  
## Applies To  
  
-   Page Fields  
  
## Property Value  
 **Yes** if assist-edit capabilities and an AssistEdit button are provided; otherwise, **No**. The default value is **No**.  
  
## Remarks  
 You can add C/AL code in the [OnAssistEdit Trigger](OnAssistEdit-Trigger.md) to change the default assist-edit behavior.  
  
> [!NOTE]
> In the [!INCLUDE[nav_web](includes/nav_web_md.md)], when the page is in the view mode or if the field has the data type of Option, the AssistEdit on the field appears as a hyperlink instead of a button. 
  
## See Also  
 [Lookup Property](Lookup-Property.md)   
 [DrillDown Property](DrillDown-Property.md)