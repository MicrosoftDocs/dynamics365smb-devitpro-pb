---
title: "EventMethod Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: ccfbe1a3-b0ac-4933-9036-ae499041ecd5
caps.latest.revision: 4
author: SusanneWindfeldPedersen
---

 

# EventMethod Property
Specifies the event publisher method that the event subscriber method subscribes to.  

## Applies to  

-   AL methods.  

     This property is only available when the [Event Property](devenv-event-property.md) is set to **Subscriber**.  

## Property Value  
An event publisher method in the object that is specified in the [EventPublisherObject Property](devenv-eventpublisherobject-property.md).  

## Remarks  
You use this property to set up an event subscriber method to respond to the event that is declared by the event publisher method. When the event is raised in the application, the event subscriber method is called.  

You add AL code to this method that defines the logic to handle the event when it is called.  

<!-- 
For more information about events, see [Subscribing to Events](Subscribing-to-Events.md).
-->
## See Also  
[Properties](devenv-properties.md)  
[AL Method Reference](../methods/devenv-al-method-reference.md)  
[EventPublisherObject Property](devenv-eventpublisherobject-property.md)

<!-- //NAV 
[Events in Microsoft Dynamics NAV](Events-in-Microsoft-Dynamics-NAV.md)  
[Publishing Events](Publishing-Events.md)   
[Raising Events](Raising-Events.md)    
-->