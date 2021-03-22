---
title: "Subscribing to Events"
description: This article describes how to design event subscribers in Dynamics 365 Business Central. 
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
 
# Subscribing to Events
To handle events, you design event subscribers. Event subscribers determine what actions to take in response to an event that has been raised. An event subscriber is a method that listens for a specific event that is raised by an event publisher. The event subscriber includes code that defines the business logic to handle the event. When the published event is raised, the event subscriber is called and its code is run.  

Subscribing to an event tells the runtime that the subscriber method must be called whenever the publisher method is run, either by code (as with business and integration events) or by the system (as with trigger events). The runtime establishes the link between an event raised by the publisher and its subscribers, by looking for event subscriber methods.  

There can be multiple subscribers to the same event from various locations in the application code. When an event is raised, the subscriber methods are run one at a time in no particular order. You can't specify the order in which the subscriber methods are called.  

## Creating an event subscriber method  
You create an event subscriber method just like other methods except that you specify properties that set up the subscription to an event publisher. The procedure is slightly different for database and page trigger events than business and integration events. Business and integration events are raised by event publisher methods in application code. Trigger events are predefined system events that are raised automatically on tables and pages.  

For an explanation about the different types, see [Event Types](devenv-event-types.md).  

### To create an event subscriber method
1.  Decide which codeunit to use for the event subscriber method.  

     You can create a new codeunit or use an existing one.  

2.  Add an AL method to the codeunit.  

     We recommend that you give the method a name that indicates what the subscriber does, and has the format *[Action][Event]*. *[Action]* is text that describes what the method does. *[Event]* is the name of the event publisher method to which it subscribes. <!-- For more information about naming, see [Best Practices with Events](devenv-events-best-practices.md).  -->

3. Add code to the method for handling the event. 

4.  Decorate the event subscriber method with the [EventSubscriber attribute](methods/devenv-eventsubscriber-attribute.md).

    ```AL
    [EventSubscriber(ObjectType::<Event Publisher Object Type>, <Event Publisher Object>, '<Published Event Name>', '<Published Event Element Name>', <SkipOnMissingLicense>, <SkipOnMissingPermission>)]
    ```

    Set the arguments according to the following table. For optional arguments, if you don't want to set a value, use an empty value (`''`). In this case, the default value, if any, is used. 

    |Argument|Description|Optional|
    |--------|------------|-------|
    |`<Event Publisher Object Type>`|Specify the type of object that publishes the event. This argument can be `Codeunit`, `Page`, `Report`, `Table`, or `XMLPort`. |no|
    |`<Event Publisher Object>`|Specify the object that publishes the event. You can set this argument to the ID, such as `50100`, or the recommended way is to use the object name by using the syntax `<Object Type>::"<Object Name>"`, such as `Codeunit::"MyPublishers"`, or for database triggers `Database::"Customer"`.|no|
    |`<Published Event Name>`|Specify the name of method that publishes the event in the object that is specified by the `<Event Publisher Object>` parameter. |no|
    |`<Published Event Element Name>`|Specifies the table field that the trigger event pertains to. This argument only requires a value for database trigger events, that is, when the `<Event Publisher Object Type>` is set to `Table` and the `<Published Event Name>` argument is a validate trigger event, such as `OnAfterValidateEvent`.|no|
    |`<SkipOnMissingLicense>`|Set to `true` to skip the event subscriber method call if the user's license doesn't cover the event subscriber codeunit. If `false`, an error is thrown and the code execution stops. `false` is the default.|yes|
    |`<SkipOnMissingPermission>`|Set to `true` to skip the event subscriber method call if the user doesn't have the correct permissions the event subscriber codeunit. If `false`, an error is thrown and the code execution stops. `false` is the default.  |yes|
   
    > [!TIP]  
    > There are couple things that can make defining an event subscriber method easier. You can use the `teventsub` snippet to get started. Then, typing the keyboard shortcut `Ctrl + space` displays IntelliSense to help you fill the attribute arguments and discover which events are available. Or, use the Shift+Alt+E keyboard shortcut to look up the event you want to subscribe to and insert the code.

5. Optionally, set the codeunit's **EventSubscriberInstance** property to specify how the event subscriber method will be bound to the instance of this codeunit.

    For more information, see [EventSubscriberInstance Property](properties/devenv-eventsubscriberinstance-property.md).

## Example 1
This example creates the codeunit **50101 MySubscribers** to subscribe to an event that has been published by the event publisher method called `OnAddressLineChanged` in the codeunit **50100 MyPublishers**. The event is raised by a change to the **Address** field on page **21 Customer Card**. This example assumes:

- The codeunit **50100 MyPublishers** with the event publisher method `OnAddressLineChanged` already exists. For an example, see [Publishing Event Example](devenv-publishing-events.md#example).
- The code for raising the `OnAddressLineChanged` event has been added to the **Customer Card** page.  For an example, see [Raising Event Example](devenv-raising-events.md#example).

The following code creates a codeunit called **50101 MySubscribers** that includes an event subscriber method, called `CheckAddressLine`. The method includes code for handling the published event.

```AL
codeunit 50101 MySubscribers
{
    EventSubscriberInstance = StaticAutomatic;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"MyPublishers", 'OnAddressLineChanged', '', true, true)]
    procedure CheckAddressLine(line : Text[100]);
    begin
        if (STRPOS(line, '+') > 0) then begin
            MESSAGE('Can''t use a plus sign (+) in the address [' + line + ']');
        end;
    end;
}
```

> [!NOTE]  
> This example is part of a larger, simple scenario where when users change the address of a customer on the page **21 Customer Card**, you want to check that the address does not include a plus sign (+). If it does, you want to return a message to the user. For a description of this scenario and all the code involved, see [Event Example](devenv-events-example.md).

## Example 2
This example achieves the same as example 1, except it subscribes to the page trigger event `OnBeforeValidateEvent` on the `Address` field instead. By using the page trigger, you avoid creating an event publisher and adding code to raise the event. The event is raised automatically by the system.

```AL
codeunit 50101 MySubscribers
{
    EventSubscriberInstance = StaticAutomatic;

    [EventSubscriber(ObjectType::Page, Page::"Customer Card", 'OnBeforeValidateEvent', 'Address', true, true)]
    local procedure CheckAddressLine(var Rec : Record Customer)
    begin
        if (STRPOS('Rec.Address', '+') > 0) then begin
            MESSAGE('Can''t use a plus sign (+) in the address [' + 'Address' + ']');
        end;
    end;
}
```

## See Also  
 [Publishing Events](devenv-publishing-events.md)   
 [Raising Events](devenv-raising-events.md)   
 [Event Types](devenv-event-types.md)   
 [Events in AL](devenv-events-in-al.md)  
 [EventSubscriberInstance Property](properties/devenv-eventsubscriberinstance-property.md)  
 [EventSubscriber Attribute](methods/devenv-eventsubscriber-attribute.md)  


