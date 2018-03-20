---
title: "EventSubscriberInstance Property"
ms.custom: na
ms.date: 06/14/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: fcdfc082-79ae-4a6a-a8fa-d006a107ffda
caps.latest.revision: 4
author: SusanneWindfeldPedersen
---

 

# EventSubscriberInstance Property
Specifies how event subscriber methods in a codeunit are bound to the codeunit instance and the events that they subscribe to.  

## Applies to  

-   Codeunits  

## Property Value  

|Value|Description|  
|-----------|-----------------|  
|**Static-Automatic**|Subscribers are statically bound to events and the codeunit instances are controlled by the system. This is the default value.<br /><br /> **Binding – Scope**<br /><br /> All bindings are for the current tenant group. When [!INCLUDE[navxapp](../includes/navxapp_md.md)]s are not used, tenant group 0 is used, which is the same as a static binding cross all current and future sessions in the system.<br /><br /> If the event subscription is part of a [!INCLUDE[navxapp](../includes/navxapp_md.md)], it will be a static binding cross all current and future sessions within the tenant group(s) that has the [!INCLUDE[navxapp](../includes/navxapp_md.md)] installed and enabled. **Note:**  With this setting, you cannot call the [BINDSUBSCRIPTION Method](../methods/devenv-bindsubscription-method.md) or [UNBINDSUBSCRIPTION Method](../methods/devenv-unbindsubscription-method.md) for any events in this codeunit; otherwise, an error occurs. <br /><br /> **Instances**<br /><br /> All codeunit instances are controlled by the system. If the subscriber codeunit is defined as single instance (as specified by the [SingleInstance Property](devenv-singleinstance-property.md)), the first call to a subscriber method will create the instance and it will be kept for the lifespan of the session.<br /><br /> If the codeunit is not declared as single instance, a new instance will automatically be created just before the call to the subscriber method, and immediately disposed afterwards – each subscriber method call will be run on its own instance.|  
|**Manual**|Subscribers are bound to an event by calling the BINDSUBSCRIPTION method. This enables you to control which event subscriber instances are called when an event is raised. If the BINDSUBSCRIPTION method is not called, then nothing will happen when the event is raised.<br /><br /> **Bindings – Scope**<br /><br /> The binding of event subscribers to events is completely manual. To establish the binding, you must call the BINDSUBSCRIPTION method to pass an instance of a subscriber codeunit. Only then will the event subscriber methods be called.<br /><br /> You can stop (or unbind) the subscriber method calls by either calling the UNBINDSUBSCRIPTION method or by letting the previously bound instance go out of scope. For example, you declare a local variable, call BINDSUBSCRIPTION, and then eventually exit the method that declares the local variable. All bindings on the instance are automatically unbound.<br /><br /> **Instances**<br /><br /> By controlling the instance of the subscriber codeunit, you control the lifespan. If you store the instance on a single instance codeunit global variable, you are effectively creating a binding that lasts the whole session. However, it is still only bound for your session. Other sessions must also call BINDSUBSCRIPTION to establish the direct binding to the instance of the subscriber codeunit. <br /><br />**Important**: If you are devloping in on a production solution, be aware that with a manually bound subscriber function, you can experience a runtime error if the event subscriber object has been updated by an operation done during development environment, such as recompiling the object. This causes the event subscription object's metadata to become stale and prevents the event subscriber function from being called. A message similar to the following appears in the event log:<br /><br />`A manually bound event subscriber is stale and will no longer be called. This can be caused by the subscriber object being updated by an operation in the development environment.` |  

## Remarks  
 On the event publisher side, the bindings are always considered static. For example, if you bind instance *A* of a given subscriber codeunit, all instances of publisher application objects will start calling the event subscribers. You cannot design it so that a specific instance of publisher table *X* calls only a specific instance of subscriber codeunit *A*. However, you can achieve the same by using/storing some global state on the subscriber.  
<!--
 For more information about events, see [Events in Microsoft Dynamics NAV](Events-in-Microsoft-Dynamics-NAV.md).  

## See Also  
 [Publishing Events](Publishing-Events.md)   
 [Raising Events](Raising-Events.md)   
 [Subscribing to Events](Subscribing-to-Events.md)   
 [AL Method Statements](../devenv-al-method-statements.md) -->
