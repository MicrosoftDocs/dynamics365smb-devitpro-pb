---
title: "AssistEdit Property"
ms.author: solsen
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: dd671414-a7c3-44bd-a860-a8bda61c7913
caps.latest.revision: 15
author: SusanneWindfeldPedersen
---

# AssistEdit Property
Sets assist-edit capabilities for a text box.  
  
## Applies To  
  
-   Page Fields  
  
## Property Value  
 **True** if assist-edit capabilities and an AssistEdit button are provided; otherwise, **false**. The default value is **false**.  

## Syntax
```
AssistEdit = true;
```

## Remarks  
 You can add AL code in the [OnAssistEdit Trigger](../triggers/devenv-onassistedit-trigger.md) to change the default assist-edit behavior.  
  
 <!-- //NAV
 In the [!INCLUDE[nav_web](includes/nav_web_md.md)], the AssistEdit button does not appear on the field when the page is in the view mode or if the field has the data type of Option.  
 --> 
## See Also  
 [Lookup Property](devenv-lookup-property.md)   
 [DrillDown Property](devenv-drilldown-property.md)