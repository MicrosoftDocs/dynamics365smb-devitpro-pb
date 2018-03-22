---
title: "Business Attribute"
ms.custom: na
ms.date: 06/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
# Business Attribute
Specifies the method to be business type event publisher.

## Syntax  
  
```  
[Business(IncludeSender : Boolean)] 
```    
  
#### Arguments  
*IncludeSender*  
Type: Boolean  
  
Specifies whether global methods in the object that contains the event publisher method are exposed to event subscriber methods that subscribe to the event.

**True** exposes the global methods in the object that contains the event publisher function to event subscriber functions; **false** does not. The default value is **false**.

When you set the argument to **true**, the signature of event subscriber methods that subscribe to the published event automatically include a VAR parameter for the published event object, as shown in the following example:

```
 [EventSubscriber] CheckAddressLine(VAR Sender : Codeunit "My Publisher Object")
```
  
## Remarks
For more information about the different event types, see [Event Types](../devenv-event-types.md).

## Example
This example publishes a business type event by using the OnAddressLineChanged method. The method takes a single text data type parameter. The IncludeSender argument are set to **false**.
```
[Business(false)]
    PROCEDURE OnAddressLineChanged(line : Text[100]);
    begin
        
    end;

```  
  
## See Also  
 [Events in aL](../devenv-events-in-al.md)
 [Publishing Events](../devenv-publishing-events.md)   
 [Raising Events](../devenv-raising-events.md)   
 [Subscribing to Events](../devenv-subscribing-to-events.md)   
 [Method Attributes](devenv-method-attributes.md)