---
title: "EventPublisherObject Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 52162969-4523-4998-813c-341c63f65992
caps.latest.revision: 5
author: SusanneWindfeldPedersen
---

 

# EventPublisherObject Property
Specifies the object that contains the event publisher method that the event subscriber responds to.  
  
## Applies to  
  
-   AL methods  
  
This property is only available when the [Event Property](devenv-event-property.md) is set to **Subscriber**.  
  
## Property Value  
Application object.  
  
## Remarks  
You use this property to set up an event subscriber method to subscribe to a published event. There are three types of events: business, integration, and trigger.  
  
-   Business and integration events are published by event publisher methods in objects such as codeunits, pages, or tables. To subscribe to a business or integration type event, you specify the object that contains the event publisher method for the event.  
  
-   Trigger events are system events that are declared in tables. To subscribe to a trigger event, you specify the table.  
  
After you set this property, you set the [EventMethod Property](devenv-eventmethod-property.md) to specify the event publisher method that you want the event subscriber to subscribe to.  
  
<!--For more information about events, see [Event Types](Event-Types.md) and [Subscribing to Events](Subscribing-to-Events.md).  
 -->  
## See Also  
[Properties](devenv-properties.md)  
[AL Method Statements](../methods/devenv-al-method-reference.md)
<!-- 
[Publishing Events](Publishing-Events.md)   
[Raising Events](Raising-Events.md)   
[Events in Microsoft Dynamics NAV](Events-in-Microsoft-Dynamics-NAV.md)   
-->