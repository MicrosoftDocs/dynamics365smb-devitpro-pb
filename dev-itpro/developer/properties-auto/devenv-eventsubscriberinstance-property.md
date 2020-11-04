---
title: "EventSubscriberInstance Property"
ms.author: solsen
ms.custom: na
ms.date: 11/04/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# EventSubscriberInstance Property
Specifies how event subscriber functions in a codeunit are bound to the codeunit instance and the events that they subscribe to.

## Applies to
-   Codeunit

## Property Value

|Value|Description|
|-----------|---------------------------------------|
|StaticAutomatic|Subscribers are automatically bound to the events that they subscribe to. |
|Manual|Subscribers are bound to an event only if the **BINDSUBSCRIPTION** method is called from the code that raises the event.|
[//]: # (IMPORTANT: END>DO_NOT_EDIT)
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

