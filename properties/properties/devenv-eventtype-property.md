---
title: "EventType Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 0d10d3d0-071f-4241-8f07-58a15a0ee1b4
caps.latest.revision: 4
author: SusanneWindfeldPedersen
---

 

# EventType Property
Specifies the type of event that is published by the event publisher function.  
  
## Applies to  
  
-   AL methods  
  
     This property is only available when the [Event Property](devenv-event-property.md) of a function is set to **Publisher**.  
  
## Property Value  
  
|Value|Description|  
|-----------|-----------------|  
|**Business**|The event is a business event type. A business event has an implied promise or contract that it will not to change in future [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] releases. Business events are typically implemented by ISVs and Microsoft.|  
|**Integration**|The event is an integration event type. An integration event is like a business event except that is does not have the same promise or contract of not changing. Therefore, it less restrictive. Integration events are typically for integrating [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] with other solutions.|  
 <!-- 
 For more information about the different event types, see [Event Types](Event-Types.md)  
  
## Remarks  
 For more information about events, see [Events in Microsoft Dynamics NAV](Events-in-Microsoft-Dynamics-NAV.md).  
  
## See Also  
 [Publishing Events](Publishing-Events.md)   
 [Raising Events](Raising-Events.md)   
 [Subscribing to Events](Subscribing-to-Events.md)   
 [AL Method Statements](../devenv-al-method-statements.md) -->