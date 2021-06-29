---
title: "EventSubscriberInstance Property"
ms.author: solsen
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# EventSubscriberInstance Property
> **Version**: _Available or changed with runtime version 1.0._

Specifies how event subscriber functions in a codeunit are bound to the codeunit instance and the events that they subscribe to.

## Applies to
-   Codeunit

## Property Value

|Value|Description|
|-----------|---------------------------------------|
|**StaticAutomatic**|Subscribers are automatically bound to the events that they subscribe to. |
|**Manual**|Subscribers are bound to an event only if the **BINDSUBSCRIPTION** method is called from the code that raises the event.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Syntax

```AL
EventSubscriberInstance = StaticAutomatic|Manual;
```

## Remarks

The bindings are always considered static on the event publisher side. For example, if you bind instance *A* of a given subscriber codeunit, all instances of publisher application objects will start calling the event subscribers. You can't design it so that a specific instance of publisher table *X* calls only a specific instance of subscriber codeunit *A*. You can, however, achieve the same by using/storing some global state on the subscriber.  

### StaticAutomatic binding

If the subscriber codeunit is defined as single instance (as specified by the [SingleInstance Property](devenv-singleinstance-property.md)), the first call to an event subscriber creates in instance of the codeunit. This instance is kept for the lifespan of the session.

If the codeunit isn't declared as single instance, each event subscriber will be run in its own codeunit instance. When an event gets raised, a codeunit instance is created for each event subscriber method that subscribes to the event. The individual codeunit instances are immediately disposed after its event subscriber is run.

**Note:**  With this setting, you can't call the [BINDSUBSCRIPTION Method](../methods-auto/session/session-bindsubscription-method.md) or [UNBINDSUBSCRIPTION Method](../methods-auto/session/session-unbindsubscription-method.md) for any events in this codeunit; otherwise, an error occurs.

### Manual binding

This setting enables you to control which event subscriber instances are called when an event is raised. With this setting, you can essentially activate event subscribers on demand. If the **BINDSUBSCRIPTION** method isn't called, then nothing will happen when the event is raised.

 The binding of event subscribers to events is manual. To establish the binding, you must call the **BINDSUBSCRIPTION** method to pass an instance of an event subscriber codeunit. Only then will the event subscribers be called.

You stop the event subscriber calls by either calling the **UNBINDSUBSCRIPTION** method or by letting the previously bound instance go out of scope. For example, you declare a local variable, call **BINDSUBSCRIPTION**, and then eventually exit the method that declares the local variable. All bindings on the instance are automatically unbound.

By controlling the instance of the subscriber codeunit, you control the lifespan. If you store the instance on a single instance codeunit global variable, you're effectively creating a binding that lasts the whole session. However, it's still only bound for the current session. Other sessions must also call **BINDSUBSCRIPTION** to establish the direct binding to the instance of the subscriber codeunit. 

**Important**: When you develop on a production solution, you can experience a runtime error if the event subscriber codeunit has been updated by a development operation. For example, you recompiled the codeunit. This situation causes the event subscription codeunit's metadata to become stale and prevents the event subscriber from being called. A message similar to the following message appears in the event log:

`A manually bound event subscriber is stale and will no longer be called. This can be caused by the subscriber object being updated by an operation in the development environment.` 


## <a name="example"></a>Example

This code example uses the EventSubscriberInstance property to manually bind an event subscriber to an event. The example uses events to display a message to the user if they use a '+' sign in the **Address** field on the **Customer Card** page.

The following code creates codeunit that publishes the `OnAddressLineChanged` event.

```AL
codeunit 50100 MyPublishers
{
    [IntegrationEvent(false, false)]
    procedure OnAddressLineChanged(line: Text[100]);
    begin
    end;
}
```

The following code declares the `CheckAddressLine` event subscriber in the event subscriber codeunit **50101 MySubscribers**. The event subscriber displays a message in the client when '+' is used in the **Address** field.

```AL
codeunit 50101 MySubscribers
{
    //Set the event subscribers to manual binding;
    EventSubscriberInstance = Manual;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"MyPublishers", 'OnAddressLineChanged', '', true, true)]
    procedure CheckAddressLine(line: Text[100]);
    begin
        if (STRPOS(line, '+') > 0) then begin
            MESSAGE('Can''t use a plus sign (+) in the address [' + line + ']');
        end;
    end;
}
```

The following code extends the **Customer Card** page to raise the `OnAddressLineChanged` event when the **Address** field is changed: 

```AL
pageextension 50100 MyCustomerExt extends "Customer Card"
{
    layout
    {
        modify(Address)
        {
            trigger OnBeforeValidate();
            var
                Publisher: Codeunit MyPublishers;
                Subscriber: Codeunit MySubscribers;
            begin
                // Bind the event to the MySubscribers codeunit
                BindSubscription(Subscriber);

                // Raise the event
                Publisher.OnAddressLineChanged(Address);
            end;
        }
    }
}
```

On the event publisher side, the bindings are always considered static. For example, if you bind instance *A* of a given subscriber codeunit, all instances of publisher application objects will start calling the event subscribers. You can't design it so that a specific instance of publisher table *X* calls only a specific instance of subscriber codeunit *A*. However, you can achieve the same by using/storing some global state on the subscriber.  

## See Also

[BindSubscription Method](../methods-auto/session/session-bindsubscription-method.md)  
[UnBindSubscription Method](../methods-auto/session/session-unbindsubscription-method.md)  
[Publishing Events](../devenv-publishing-Events.md)  
[Raising Events](../devenv-raising-Events.md)  
[Subscribing to Events](../devenv-subscribing-to-Events.md)  

