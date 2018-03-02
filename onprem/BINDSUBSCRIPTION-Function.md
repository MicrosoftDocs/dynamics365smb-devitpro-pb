---
title: "BINDSUBSCRIPTION Function"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 42a22ef0-46b1-497a-ae4d-c57c6b496719
caps.latest.revision: 4
manager: edupont
---
# BINDSUBSCRIPTION Function
Binds the event subscriber functions in the codeunit to the current codeunit instance for handling the events that they subscribe to. This essentially activates the subscriber functions for the codeunit instance.  
  
## Syntax  
  
```  
[OK:=] BINDSUBSCRIPTION(Codeunit)  
```  
  
#### Parameters  
 *Codeunit*  
 Type: Codeunit  
  
 The codeunit that contains the event subscribers.  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **true** if the event subscriber functions bind successfully to the codeunit instance and no errors occurred; otherwise **false**.  
  
 If you omit this optional return value and the binding is not successful, then a run-time error occurs. If you include the return value, then you must handle any errors.  
  
## Remarks  
 You can only call this function on codeunits that have the [EventSubscriberInstance Property](EventSubscriberInstance-Property.md) set to **Manual**.  
  
 The codeunit instance to which event subscribers bind will be this exact instance and events will be raised on this instance. You cannot bind the same instance more than once, but you can bind multiple instances of the same codeunit. This will result in an event subscriber call on each bound instance when a given event is raised.  
  
## Example  
 The following code illustrates a typical use of the BINDSUBSCRIPTION function.  
  
```  
Function MyFunction(….)  
LocalVar  
  SubScriberCodeunit5000;  
BEGIN  
  // Set global information on the subscriber codeunit if required  
  // You can rely on the instance being the same as the one receiving the event subscriber call  
  
  SubScriberCodeunit5000.MySetGlobalInfo(<info you can later test in the subscriber event method>)  
  BINDSUBSCRIPTION(SubscriberCodeunit5000);  
  DoSomething(…);  // After binding, all subscriptions on SubscriberCodeunit5000 are “active”.  
  
END; // Notice, that when SubScriberCodeunit888 goes out of scope, all bindings are removed.  
  
```  
  
## See Also  
 [UNBINDSUBSCRIPTION Function](UNBINDSUBSCRIPTION-Function.md)   
 [Events in Microsoft Dynamics NAV](Events-in-Microsoft-Dynamics-NAV.md)   
 [Subscribing to Events](Subscribing-to-Events.md)   
 [Raising Events](Raising-Events.md)   
 [Publishing Events](Publishing-Events.md)