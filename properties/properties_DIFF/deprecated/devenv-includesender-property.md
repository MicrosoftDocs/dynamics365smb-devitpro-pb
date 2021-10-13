---
title: "IncludeSender Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 83d2305f-6d7c-44b7-9e63-897ebb81c4b5
caps.latest.revision: 6
author: SusanneWindfeldPedersen
---

# IncludeSender Property

Specifies whether global methods in the object that contains the event publisher method are exposed to event subscriber methods that subscribe to the event.  
  
## Applies to  
  
- AL Methods  
  
  This property is only available when the [Event Property](devenv-event-property.md) is set to **Publisher**.  
  
## Property Value

**True** to expose the global methods in the object that contains the event publisher method to event subscriber methods; otherwise, **false**. The default value is **false**.  

## Syntax

```AL
IncludeSender = true;
```
  
## Remarks

Setting the property to **true** enables you to call global methods in the object that contains the event publisher method from event subscriber methods that subscribe to the published event.  
  
When you set the property to **true**, the signature of event subscriber methods that subscribe to the published event automatically include a VAR parameter for the published event object, as shown in the following example:  
  
`LOCAL [EventSubscriber] CheckAddressLine(VAR Sender : Codeunit "My Publisher Object")`  
  
<!--  For more information about events, see [Events in Microsoft Dynamics NAV](Events-in-Microsoft-Dynamics-NAV.md).  -->
  
## See Also

<!--[Publishing Events](Publishing-Events.md)   
[Raising Events](Raising-Events.md)   
[Subscribing to Events](Subscribing-to-Events.md)  
[AL Method Statements](AL-Method-Statements.md) -->