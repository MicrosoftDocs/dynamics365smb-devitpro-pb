---
title: "IncludeSender Property"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 83d2305f-6d7c-44b7-9e63-897ebb81c4b5
caps.latest.revision: 6
manager: edupont
---
# IncludeSender Property
Specifies whether global functions in the object that contains the event publisher function are exposed to event subscriber functions that subscribe to the event.  
  
## Applies to  
  
-   C/AL functions.  
  
     This property is only available when the [Event Property](Event-Property.md) is set to **Publisher**.  
  
## Property Value  
 **Yes** to expose the global functions in the object that contains the event publisher function to event subscriber functions; otherwise, **No**. The default value is **No**.  
  
## Remarks  
 Setting the property to **Yes** enables you to call global functions in the object that contains the event publisher function from event subscriber functions that subscribe to the published event.  
  
 When you set the property to **Yes**, the signature of event subscriber functions that subscribe to the published event automatically include a VAR parameter for the published event object, as shown in the following example:  
  
 `LOCAL [EventSubscriber] CheckAddressLine(VAR Sender : Codeunit "My Publisher Object")`  
  
 For more information about events, see [Events in Microsoft Dynamics NAV](Events-in-Microsoft-Dynamics-NAV.md).  
  
## See Also  
 [Publishing Events](Publishing-Events.md)   
 [Raising Events](Raising-Events.md)   
 [Subscribing to Events](Subscribing-to-Events.md)   
 [GlobalVarAccess Property](GlobalVarAccess-Property.md)   
 [C/AL Function Statements](C-AL-Function-Statements.md)