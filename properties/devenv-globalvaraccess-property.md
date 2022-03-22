---
title: "GlobalVarAccess Property"
ms.custom: na
ms.date: 04/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: f8792ef2-9a9e-4be6-a6d1-d5fa8b5a5705
caps.latest.revision: 3
author: SusanneWindfeldPedersen
--- 

<!-- This property is no longer supported, and the topic has been redirected to methods/devenv-integration-attribute.md -->

# GlobalVarAccess Property
Specifies whether global variables in the object that contains the event publisher method are accessible to event subscriber methods that subscribe to the published event.  
  
## Applies to  
 AL Methods.  
  
 This property is only available when the [Event Property](devenv-event-property.md) is set to **Publisher** and the [EventType Property](devenv-eventtype-property.md) is set to **Integration**.  
  
## Property Value  
 **True** to allow access from event subscriber methods to global variables in the object that contains the event publisher method; otherwise, **false**. The default value is **false**.  

## Syntax
```
GlobalVarAccess = true;
```
 
## Remarks  
 When you set the GlobalVarAccess property to **true**, event subscriber methods that subscribe to an event can call the global variable parameters in the object that is specified by the [EventPublisherObject Property](devenv-eventpublisherobject-property.md), which contains the event publisher method that declares the event. You must add variable parameters to the event subscriber methods manually and use a name and type that matches the variable declaration in the event publisher object.  

## See Also  
[Properties](devenv-properties.md)  
[Essential AL Methods](../devenv-Essential-AL-Methods.md)   
[EventPublisherObject Property](devenv-eventpublisherobject-property.md)  
<!-- 
[Events in Microsoft Dynamics NAV](Events-in-Microsoft-Dynamics-NAV.md)   
[Publishing Events](Publishing-Events.md)   
[Raising Events](Raising-Events.md)   
[Subscribing to Events](Subscribing-to-Events.md)   
[GlobalVarAccess Property](devenv-globalvaraccess-property.md)   
[AL Method Statements](AL-method-Statements.md)
-->