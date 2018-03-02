---
title: "EventPublisherElement Property"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: d4d8ff88-c108-45ee-ad70-d20a06beb049
caps.latest.revision: 5
manager: edupont
---
# EventPublisherElement Property
Specifies the table field that the trigger event pertains to.  

## Applies to  

-   C/AL functions.  

     This property is only available on event subscriber functions that handle validation-type trigger events. The [Event Property](Event-Property.md) must be set to **Subscriber**, the [EventPublisherObject Property](EventPublisherObject-Property.md) must be set to a table, and the [EventFunction Property](EventFunction-Property.md) must be set to a validate trigger event, such as **OnAfterValidateEvent**.  

## Property value  
 A field in the table that is specified by the [EventPublisherObject Property](EventPublisherObject-Property.md).  

## Remarks  
 You use this property to set up an event subscriber function that will be called when the trigger event that is specified by the [EventFunction Property](EventFunction-Property.md) is raised on the specified table field. For more information, see [Subscribing to Events](Subscribing-to-Events.md).  

## See Also  
 [Publishing Events](Publishing-Events.md)   
 [Raising Events](Raising-Events.md)   
 [Subscribing to Events](Subscribing-to-Events.md)   
 [GlobalVarAccess Property](GlobalVarAccess-Property.md)   
 [IncludeSender Property](IncludeSender-Property.md)   
 [C/AL Function Statements](C-AL-Function-Statements.md)
