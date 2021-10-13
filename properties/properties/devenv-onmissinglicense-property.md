---
title: "OnMissingLicense Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 4a2da080-292d-49b1-9499-48e2931e9d37
caps.latest.revision: 3
author: SusanneWindfeldPedersen
---

 

# OnMissingLicense Property
Specifies what happens to the event subscriber function call when the license of the [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] user account that is running the current session does not include the codeunit that contains the subscriber function.  
  
## Applies to  
  
-   AL functions in codeunits.
  
     This property is only available when the [Event Property](devenv-event-property.md) is set to **Subscriber**.  
  
## Property Value  
  
|Value|Description|  
|-----------|-----------------|  
|**Error**|An error is thrown and the code execution stops. This is the default value.|  
|**Skip**|The subscriber call will be ignored, and execution will continue to the next subscriber.|  
 <!-- 
## Remarks  
 For more information about events, see [Events in Microsoft Dynamics NAV](Events-in-Microsoft-Dynamics-NAV.md).  
  
## See Also  
 [Publishing Events](Publishing-Events.md)   
 [Raising Events](Raising-Events.md)   
 [Subscribing to Events](Subscribing-to-Events.md)   
 [AL Method Statements](../devenv-al-method-statements.md)
 -->

## See Also  
 [Properties](devenv-properties.md)   
 [Query Object](../devenv-query-object.md)