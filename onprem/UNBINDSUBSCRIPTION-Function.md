---
title: "UNBINDSUBSCRIPTION Function"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 7a59b63e-d8f5-44ca-a9b4-6b68b810c19d
caps.latest.revision: 4
manager: edupont
---
# UNBINDSUBSCRIPTION Function
Unbinds the event subscriber functions from in the codeunit instance. This essentially deactivates the subscriber functions for the codeunit instance.  
  
## Syntax  
  
```  
[OK:=] UNBINDSUBSCRIPTION(Codeunit)  
```  
  
#### Parameters  
 *Codeunit*  
 Type: Codeunit  
  
 The codeunit that contains the event subscribers.  
  
## Property Value/Return Value  
 Type: Boolean  
  
 **true** if the event subscriber functions unbind successfully to the codeunit instance and no errors occurred; otherwise **false**.  
  
 If you omit this optional return value and the operation is not successful, then a run-time error occurs. If you include the return value, then you must handle any errors.  
  
## Remarks  
 You can only call this function on codeunits that have the [EventSubscriberInstance Property](EventSubscriberInstance-Property.md) set to **Manual**.  
  
 Calling this function on a codeunit that has not been bound \(by the [BINDSUBSCRIPTION Function](BINDSUBSCRIPTION-Function.md)\) will result in an error. If the call to this function is successfull, all bindings are removed.  
  
 The codeunit instance that is unbound will be the same instance that previously was bound.  
  
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
  UNBINDSUBSCRIPTION(SubscriberCodeunit888);  // Now deactivating again  
  DoStuff(…);  // This time no events are raised inside SubscriberCodeunit888;  
  
END;  
  
```  
  
## See Also  
 [BINDSUBSCRIPTION Function](BINDSUBSCRIPTION-Function.md)   
 [Events in Microsoft Dynamics NAV](Events-in-Microsoft-Dynamics-NAV.md)   
 [Subscribing to Events](Subscribing-to-Events.md)   
 [Raising Events](Raising-Events.md)   
 [Publishing Events](Publishing-Events.md)