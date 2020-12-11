---
title: "EventSubscriber Attribute"
description: "The EventSubscriber attribute in AL for Business Central"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# EventSubscriber Attribute
Specifies the method to be an integration type event subscriber.

## Syntax  
  
```AL  
[EventSubscriber(ObjectType: ObjectType, ObjectId: Integer, EventName: Text, ElementName: Text, SkipOnMissingLicense: Boolean, SkipOnMissingPermission: Boolean)
```    
  
### Arguments  
*ObjectType*  
Type: Enumeration  
  
Specifies the type of object that publishes the event to subscribe to. Valid values include: `Codeunit`, `Page`, `Query`, `Report`, and `XMLPort`. The value will depend on the type of event: business, integration, and trigger.

- Business and integration events are published by event publisher methods in any of the valid object types. To subscribe to a business or integration type event, you specify the object that contains the event publisher method that defines the event.

- Trigger events are system events that are automatically declared and published in table and page object. To subscribe to a trigger event, you specify the `Table` or `Page`, depending on where the trigger published from.

*ObjectId*  
Type: Integer  

Specifies the object that publishes the event to subscribe to. You can specify the object by its ID (integer) or by its name using the syntax `<ObjectType>::<ObjectName>`, such as `Codeunit::MyEventPublisher`. Using the name is the recommended way.

*EventName*  
Type: Text  

Specifies the name of method that publishes the event in the object that is specified by the *ObjectId* parameter.

*ElementName*  
Type: Text

Specifies the table field that the trigger event pertains to. This argument only requires a value for database trigger events, that is, when the *ObjectType* is set to **table** and the *EventName* argument is a validate trigger event, such as `OnAfterValidateEvent`.

*SkipOnMissingLicense*  
Type: Boolean

Specifies whether to skip a call to this method if the user's [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] license does not cover the codeunit in which the method resides. This pertains to the user account that is running the current session.

**True** will ignore the method call, and the code execution will continue to the next subscriber; **false** will throw an error and the code execution stops. **false** is the default. 

*SkipOnMissingPermission*  
Type: Boolean

Specifies whether to skip a call to this method if the user does not have permission to the codeunit in which the method resides. This pertains to the user account that is running the current session. The permissions are defined by the permission sets on the user account in [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)].

**True** will ignore the method call, and the code execution will continue to the next subscriber; **false** will throw an error and the code execution stops. **false** is the default value.

## Example
This example publishes an integration type event by using the OnAddressLineChanged method. The method takes a single text data type parameter. The IncludeSender and GlobalVarAccess arguments are set to **false**.

```AL
codeunit 50105 MyEventPublisher
{
    [IntegrationEvent(false, false)]
    procedure OnAddressLineChanged(line : Text[100]);
    begin
    end;
}

codeunit 50106 MyEventSubscriber
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::MyEventPublisher, 'OnAddressLineChanged', '', true, true)]
    local procedure MyProcedure(line: Text[100])
    begin
    end;
}
``` 

## See Also

[AL Method Reference](../methods-auto/library.md)  
[Events in AL](../devenv-events-in-al.md)  
[Publishing Events](../devenv-publishing-events.md)   
[Raising Events](../devenv-raising-events.md)   
[Subscribing to Events](../devenv-subscribing-to-events.md)   
[Method Attributes](devenv-method-attributes.md)