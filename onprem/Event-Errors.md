---
title: "Event Errors"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 8a467932-73ef-498d-b61e-3dbb9f04519d
caps.latest.revision: 7
---
# Event Errors
When the runtime detects raised publisher events, it tries to identify subscribers for handling the events. If event subscribers are not correctly configured to subscribe to published events, errors will occur. For example, errors can occur when an event subscriber points to a non-existing event publisher object or function, or there is a mismatch between the signatures of an event publisher and subscriber functions. When errors occur, the event subscriber function for handling the event is disabled and tagged with an error in the database, which you can view from the **Event Subscriptions** page. For more information, see [How to: View the Event Subscriptions](How-to--View-the-Event-Subscriptions.md).  

 The following table describes the errors that can occur when subscribing to events.  

|Error code|Cause|  
|----------------|-----------|  
|ErrorOriginalApplicationObjectNotFound|The event publisher object, which contains the publisher function to subscribe to, is not available. The event publisher object is specified by the [EventPublisherObject Property](EventPublisherObject-Property.md) of the event subscriber function.|  
|ErrorOriginalMethodNotFound|The event publisher function that the event subscriber function subscribes to is not available. The event publisher function is specified by the [EventFunction Property](EventFunction-Property.md) of the event subscriber function.|  
|ErrorParameterMismatch|The parameters in the event subscriber function's signature do not match the parameters in the publisher function.|  
|ErrorGlobalVariableNotFound|A global variable that is referenced in the event subscriber function signature is not available in the object that contains the event publisher function \(specified by the [EventPublisherObject Property](EventPublisherObject-Property.md) of the event subscriber function\).|  
|ErrorFieldNotFound|The table field that is specified by the [EventPublisherElement Property](EventPublisherElement-Property.md) of the event subscriber function is not available. This error pertains to **OnBeforeValidateEvent** or **OnAfterValidateEvent** trigger events on a table.|  
|ErrorOriginalApplicationObjectTypeNotSupported|The application object that contains the event publisher function that the subscriber function subscribes to is not supported. The application object is specified by the [EventPublisherObject Property](EventPublisherObject-Property.md) of the event subscriber function.|  
|ErrorGlobalVariableAccessNotAllowed|A global variable that is referenced in the event subscriber function signature is not accessible. Verify that the [GlobalVarAccess Property](GlobalVarAccess-Property.md) of the event publisher function that the event subscriber function subscribes to is set to **Yes**.|  
|ErrorIncludeSenderNotAllowed|The event subscriber function signature includes a *Sender* parameter for accessing the object that contains the event publisher function to which the event subscriber subscribes. However, the event publisher function does not allow sender access as specified by the [IncludeSender Property](IncludeSender-Property.md).|  
|ErrorSenderParameterIsWrongType|The *Sender* parameter that is declared in the event subscriber function has a subtype value that does not match the event publisher object that raises the event.|  

## See Also  
 [Events in Microsoft Dynamics NAV](Events-in-Microsoft-Dynamics-NAV.md)   
 [Publishing Events](Publishing-Events.md)   
 [Raising Events](Raising-Events.md)   
 [Subscribing to Events](Subscribing-to-Events.md)
