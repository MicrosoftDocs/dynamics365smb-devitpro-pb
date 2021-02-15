---
title: "Event example"
description: This article shows a simple example of how to use events in Business Central.
ms.custom: na
ms.date: 01/22/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: jswymer
---

# Event Example

This article includes a simple code example to explain how to use Business Central events. The example uses an event to verify a customer's address. When a user changes the address of a customer on the page **21 Customer Card**, an event is used to check that the address doesn't include a plus sign (+). If it does, a message is displayed in the client. In this example, you'll add code that:

- Publishes an event that is raised when the **Address** field on **Customer Card** is changed.
- Raises the event from the **Customer Card** page
- Subscribes to the event to check the address value and return a message to the user if it contains a plus sign.


```AL
// The following code creates codeunit that publishes the `OnAddressLineChanged` event.

codeunit 50100 MyPublishers
{
    [IntegrationEvent(false, false)]
    procedure OnAddressLineChanged(line: Text[100])
    begin
    end;
}

// The following code extends the Customer Card page to raise the `OnAddressLineChanged` event
// when the Address field is changed.
pageextension 50100 MyCustomerExt extends "Customer Card"
{
    layout
    {
        modify(Address)
        {
            trigger OnBeforeValidate();
            var
                Publisher: Codeunit MyPublishers;
            begin
                Publisher.OnAddressLineChanged(Address);
            end;
        }
    }
}

// The following code creates an event subscriber codeunit.
// It declares the `CheckAddressLine` event subscriber that listens for OnAddressLineChanged event.
// The event subscriber displays a message in the client when '+' is used in the **Address** field.

codeunit 50101 MySubscribers
{
    //Set the event subscribers to bind automatically to the event
    EventSubscriberInstance = StaticAutomatic;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"MyPublishers", 'OnAddressLineChanged', '', true, true)]
    procedure CheckAddressLine(line: Text[100]);
    begin
        if (STRPOS(line, '+') > 0) then begin
            MESSAGE('Can''t use a plus sign (+) in the address [' + line + ']');
        end;
    end;
}
```

> [!TIP]
> This example binds the event subscriber automatically to the event. You can also bind the event subscriber manually, by setting the EventSubscriberInstance property. For more information, including an example, see [EventSubscriberInstance property](properties/devenv-eventsubscriberinstance-property.md#example).


## See Also  
 [Publishing Events](devenv-publishing-events.md)   
[Raising Events](devenv-raising-events.md)   
[Subscribing to Events](devenv-subscribing-to-events.md)   
[Events [!INCLUDE[d365fin_md](includes/d365fin_md.md)]](devenv-events-in-al.md)   
