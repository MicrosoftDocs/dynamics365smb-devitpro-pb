---
title: "BusinessEvent Attribute"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# BusinessEvent Attribute
Specifies the method to be business type event publisher.

## Snippet support
Typing the shortcut `teventbus` will create the basic BusinessEvent attribute syntax when using the [!INCLUDE[d365al_ext_md](../../includes/d365al_ext_md.md)] in Visual Studio Code.  

## Syntax  
  
```  
[BusinessEvent(IncludeSender : Boolean)] 
```    
  
### Arguments   
*IncludeSender*  
Type: Boolean  
  
Specifies whether global methods in the object that contains the event publisher method are exposed to event subscriber methods that subscribe to the event.

**True** exposes the global methods in the object that contains the event publisher function to event subscriber functions; **false** does not. The default value is **false**.

When you set the argument to **true**, the signature of event subscriber methods that subscribe to the published event automatically include a VAR parameter for the published event object, as shown in the following example:

```
codeunit 50100 MyPublishingCodeunit
{
    [BusinessEvent(true)]
    procedure MyBusinessEvent()
    begin
    end;
}

codeunit 50101 MySubscribingCodeunit
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::MyPublishingCodeunit, 'MyBusinessEvent', '', true, true)]
    local procedure MySubscriber(sender: Codeunit MyPublishingCodeunit)
    begin
        // My subscriber code
    end;
}
```
  
## Remarks
For more information about the different event types, see [Event Types](../devenv-event-types.md).

## Example
This example publishes a business type event by using the OnAddressLineChanged method. The method takes a single text data type parameter. The IncludeSender argument is set to **false**.

```
[BusinessEvent(false)] 
procedure OnAddressLineChanged(line : Text[100]);
begin    
end;
```  
  
## See Also  
[Events in AL](../devenv-events-in-al.md)  
[Publishing Events](../devenv-publishing-events.md)   
[Raising Events](../devenv-raising-events.md)   
[Subscribing to Events](../devenv-subscribing-to-events.md)   
[Method Attributes](devenv-method-attributes.md)
