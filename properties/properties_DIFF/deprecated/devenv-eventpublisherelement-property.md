--- 
title: "EventPublisherElement Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: d4d8ff88-c108-45ee-ad70-d20a06beb049
caps.latest.revision: 5
author: SusanneWindfeldPedersen
---

 

# EventPublisherElement Property
Specifies the table field that the trigger event pertains to.  

## Applies to  

-   AL methods  

     This property is only available on event subscriber methods that handle validation-type trigger events. The [Event Property](devenv-event-property.md) must be set to **Subscriber**, the [EventPublisherObject Property](devenv-eventpublisherobject-property.md) must be set to a table, and the [Eventmethod Property](devenv-eventmethod-property.md) must be set to a validate trigger event, such as **OnAfterValidateEvent**.  

## Property value  
 A field in the table that is specified by the [EventPublisherObject Property](devenv-eventpublisherobject-property.md).  

## Remarks  
 You use this property to set up an event subscriber method that will be called when the trigger event that is specified by the [Eventmethod Property](devenv-eventmethod-property.md) is raised on the specified table field. <!-- For more information, see [Subscribing to Events](Subscribing-to-Events.md).  -->

## See Also  
 [IncludeSender Property](devenv-includesender-property.md)   
 <!--  [Publishing Events](Publishing-Events.md)   
 [Raising Events](Raising-Events.md)   
 [Subscribing to Events](Subscribing-to-Events.md)   
 [AL Method Statements](../devenv-al-method-statements.md) -->
