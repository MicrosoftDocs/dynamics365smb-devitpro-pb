---
title: "EventSubscriberInstance Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---

# EventSubscriberInstance Property

Specifies how event subscribers in a codeunit are bound the events that they subscribe to. An event subscriber listens for a specific event to be raised. For an event subscriber to react to a raised event, you must *bind* it to the event. If the event subscriber is bound to the event, the event subscriber code is run when the event gets raised.

## Applies to  

- Codeunits  

## Property Value  

|Value|Description|  
|-----------|-----------------|  
|**Static-Automatic**|Subscribers are automatically bound to the events that they subscribe to. When an event is raised, all event subscribers in the codeunit that subscribe to the event are run. This setting is default.<br /><br /> If the subscriber codeunit is defined as single instance (as specified by the [SingleInstance Property](devenv-singleinstance-property.md)), the first call to an event subscriber creates in instance of the codeunit. This instance is kept for the lifespan of the session.<br /><br /> If the codeunit isn't declared as single instance, each event subscriber will be run in its own codeunit instance. When an event gets raised, a codeunit instance is created for each event subscriber method that subscribes to the event. The individual codeunit instances are immediately disposed after its event subscriber is run.<br /><br />**Note:**  With this setting, you can't call the [BINDSUBSCRIPTION Method](../methods-auto/session/session-bindsubscription-method.md) or [UNBINDSUBSCRIPTION Method](../methods-auto/session/session-unbindsubscription-method.md) for any events in this codeunit; otherwise, an error occurs. |  
|**Manual**|Subscribers are bound to an event only if the BINDSUBSCRIPTION method is called from the code that raises the event. This setting enables you to control which event subscriber instances are called when an event is raised. With this setting, you can essentially activate event subscribers on demand. If the BINDSUBSCRIPTION method isn't called, then nothing will happen when the event is raised.<br /><br /> The binding of event subscribers to events is manual. To establish the binding, you must call the BINDSUBSCRIPTION method to pass an instance of an event subscriber codeunit. Only then will the event subscribers be called.<br /><br /> You stop the event subscriber calls by either calling the UNBINDSUBSCRIPTION method or by letting the previously bound instance go out of scope. For example, you declare a local variable, call BINDSUBSCRIPTION, and then eventually exit the method that declares the local variable. All bindings on the instance are automatically unbound.<br /><br />By controlling the instance of the subscriber codeunit, you control the lifespan. If you store the instance on a single instance codeunit global variable, you're effectively creating a binding that lasts the whole session. However, it's still only bound for the current session. Other sessions must also call BINDSUBSCRIPTION to establish the direct binding to the instance of the subscriber codeunit. <br /><br />**Important**: When you develop on a production solution, you can experience a runtime error if the event subscriber codeunit has been updated by a development operation. For example, you recompiled the codeunit. This situation causes the event subscription codeunit's metadata to become stale and prevents the event subscriber from being called. A message similar to the following message appears in the event log:<br /><br />`A manually bound event subscriber is stale and will no longer be called. This can be caused by the subscriber object being updated by an operation in the development environment.` |  

<!--


|Value|Description|  
|-----------|-----------------|  
|**Static-Automatic**|Subscribers are automatically bound to the events that they subscribe to. When an event is raised, all event subscribers in the coduenit that subscribe to the event are run. This is the default value.<br /><br /> **Binding – Scope**<br /><br /> All bindings are for the current tenant group. When [!INCLUDE[navxapp](../includes/navxapp_md.md)]s are not used, tenant group 0 is used, which is the same as a static binding cross all current and future sessions in the system.<br /><br /> If the event subscription is part of a [!INCLUDE[navxapp](../includes/navxapp_md.md)], it will be a static binding cross all current and future sessions within the tenant group(s) that has the [!INCLUDE[navxapp](../includes/navxapp_md.md)] installed and enabled. **Note:**  With this setting, you can't call the [BINDSUBSCRIPTION Method](../methods-auto/session/session-bindsubscription-method.md) or [UNBINDSUBSCRIPTION Method](../methods-auto/session/session-unbindsubscription-method.md) for any events in this codeunit; otherwise, an error occurs. <br /><br /> **Instances**<br /><br /> All codeunit instances are controlled by the system. If the subscriber codeunit is defined as single instance (as specified by the [SingleInstance Property](devenv-singleinstance-property.md)), the first call to a subscriber method will create the instance and it will be kept for the lifespan of the session.<br /><br /> If the codeunit isn't declared as single instance, a new instance will automatically be created just before the call to the subscriber method, and immediately disposed afterwards – each subscriber method call will be run on its own instance.|  
|**Manual**|Subscribers are bound to an event only by calling the BINDSUBSCRIPTION method. This enables you to control which event subscriber instances are called when an event is raised. If the BINDSUBSCRIPTION method isn't called, then nothing will happen when the event is raised.<br /><br /> **Bindings – Scope**<br /><br /> The binding of event subscribers to events is completely manual. To establish the binding, you must call the BINDSUBSCRIPTION method to pass an instance of a subscriber codeunit. Only then will the event subscriber methods be called.<br /><br /> You can stop (or unbind) the subscriber method calls by either calling the UNBINDSUBSCRIPTION method or by letting the previously bound instance go out of scope. For example, you declare a local variable, call BINDSUBSCRIPTION, and then eventually exit the method that declares the local variable. All bindings on the instance are automatically unbound.<br /><br /> **Instances**<br /><br /> By controlling the instance of the subscriber codeunit, you control the lifespan. If you store the instance on a single instance codeunit global variable, you're effectively creating a binding that lasts the whole session. However, it's still only bound for your session. Other sessions must also call BINDSUBSCRIPTION to establish the direct binding to the instance of the subscriber codeunit. <br /><br />**Important**: If you're developing on a production solution, be aware that with a manually bound subscriber function, you can experience a runtime error if the event subscriber object has been updated by an operation done during development environment, such as recompiling the object. This causes the event subscription object's metadata to become stale and prevents the event subscriber function from being called. A message similar to the following appears in the event log:<br /><br />`A manually bound event subscriber is stale and will no longer be called. This can be caused by the subscriber object being updated by an operation in the development environment.` |  >

-->
## Syntax

```AL
EventSubscriberInstance = StaticAutomatic|Manual;
```

## Remarks

The bindings are always considered static on the event publisher side. For example, if you bind instance *A* of a given subscriber codeunit, all instances of publisher application objects will start calling the event subscribers. You can't design it so that a specific instance of publisher table *X* calls only a specific instance of subscriber codeunit *A*. You can, however, achieve the same by using/storing some global state on the subscriber.  

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

On the event publisher side, the bindings are always considered static. For example, if you bind instance *A* of a given subscriber codeunit, all instances of publisher application objects will start calling the event subscribers. You can't design it so that a specific instance of publisher table *X* calls only a specific instance of subscriber codeunit *A*. However, you can achieve the same by using/storing some global state on the subscriber.  

## See Also

[BindSubscription Method](../methods-auto/session/session-bindsubscription-method.md)  
[UnBindSubscription Method](../methods-auto/session/session-unbindsubscription-method.md)  
[Publishing Events](../devenv-publishing-Events.md)  
[Raising Events](../devenv-raising-Events.md)  
[Subscribing to Events](../devenv-subscribing-to-Events.md)  

