---
title: "Raising Events"
description: This article describes how to modify the application to raise an event in Dynamics 365 Business Central. 
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# Raising Events

After an event has been published by an event publisher method, you can modify the application to raise the event where it is needed. Subscribers of an event will not react on the event until it is raised in the application.  

To raise an event, you add logic in AL code of the application to call the event publisher method that declares the event. The procedure for calling the event publisher method is the same as calling any other method in AL.  

When the code that calls the event publisher method is run, all event subscriber methods that subscribe to the event are run. If there are multiple subscribers, the subscriber methods are run one at a time in no particular order. You cannot specify the order in which the subscriber methods are called.   

If there are no subscribers to the published event, then the line of code that calls the event publisher method is ignored and not executed.  

## Snippet support
Typing the shortcut `teventsub` will create the basic event subscriber syntax when using the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] in Visual Studio Code. 

> [!TIP]  
> Typing the keyboard shortcut **Ctrl+Space** displays IntelliSense to help you fill in the attribute arguments and to discover which events are available to use.

## Example

This example uses a page extension object **50100 MyCustomerExt** to modify the page **21 Customer Card** so that an event is raised when a user changes the **Address** field. This example assumes that the event has already been published by the event publisher method `OnAddressLineChanged` in a separate codeunit called **50100 MyPublishers**.

> [!NOTE]  
> This example is part of a larger, simple scenario where when users change the address of a customer on the page **21 Customer Card**, you want to check that the address does not include a plus sign (+). If it does, you want to return a message to the user. For a description of this scenario and all the code involved, see [Event Example](devenv-events-example.md).

In the code that follows, the page extension object modifies the `OnBeforeValidate` trigger of the **Customer Card** page to raise the event `OnAddressLineChanged` which includes the new value of the **Address** field.

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
            begin
                Publisher.OnAddressLineChanged(Rec.Address);
            end;
        }
    }
}
```

To learn about how the event used in this example is published, see [Publishing Events Example](devenv-publishing-events.md#example). 

The next step would be to subscribe to the event to handle to condition. To see an example of how to subscribe to this event, see [Subscribing to Events Example](devenv-subscribing-to-events.md#example-1).  

## See Also

[Publishing Events](devenv-publishing-events.md)   
[Subscribing to Events](devenv-subscribing-to-events.md)   
[Events in AL](devenv-events-in-al.md)   
