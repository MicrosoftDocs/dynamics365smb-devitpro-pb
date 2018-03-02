---
title: "Subscribing to Events"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: c6dc97ae-c2db-48a4-971e-3e032ff63c74
caps.latest.revision: 11
manager: edupont
---
# Subscribing to Events
To handle events, you design event subscribers. Event subscribers determine what actions to take in response to an event that has been raised. An event subscriber is a C/AL function that subscribes to, or listens for, a specific event that is declared by an event publisher function. The event subscriber includes code that defines the business logic to handle the event. When the published event is raised, the event subscriber is called and its code is run.  

 Subscribing to an event tells the runtime that the subscriber function must be called whenever the publisher function is run, either by code \(as with business and integration events\) or by the system \(as with trigger events\). The runtime establishes the link between an event raised by the publisher and its subscribers by looking for event subscriber functions.  

 There can be multiple subscribers to the same event from various locations in the application code. When an event is raised, the subscriber functions are run one at a time in random order. You cannot specify the order in which the subscriber functions are called.  

 Be aware that changing the state may not only impact the publishing code but other subscribers as well.  

> [!NOTE]  
>  Subscriber functions cannot access the sender and or access global variables.  

## Creating an Event Subscriber Function  
 You create an event subscriber function just like other functions except that you specify properties that set up the subscription to an event publisher. The procedure is slightly different for database and page trigger events than business and integration events because business and integration events are raised by event publisher functions in application code. Trigger events are predefined system events that are raised automatically on tables and pages  

 For an explanation about the different types, see [Event Types](Event-Types.md).  

#### To create an event subscriber function for business and integration events  

1.  Decide which codeunit to use for the event subscriber function.  

     You can create a new codeunit or use and existing one..  

2.  Set the **EventSubscriberInstance** property of the codeunit to specify how event subscriber functions in the codeunit are bound to codeunit instance. For more information, see [EventSubscriberInstance Property](EventSubscriberInstance-Property.md).  

3.  Add a C/AL function to the codeunit.  

     We recommend that you give the function a name that indicates what the subscriber does, and has the format *\[Action\]\[Event\]*. *\[Action\]* is text that describes what the function does and *\[Event\]* is the name of the event publisher function to which it subscribes. For more information about naming, see [Best Practices with Microsoft Dynamics NAV Events](Best-Practices-with-Microsoft-Dynamics-NAV-Events.md).  

4.  Set the function's [Event Property](Event-Property.md) to **Subscriber**.  

5.  Set the function's [EventPublisherObject Property](EventPublisherObject-Property.md) to the object that contains the event publisher function that declares the event that you want to subscribe to.

6.  Set the function's [EventFunction Property](EventFunction-Property.md) to the event publisher function that declares the event that you want to subscribe to.  

7.  If you are prompted whether to overwrite the edited functions signature, choose the **Yes** button.  

     The function signature will automatically be updated to include any the parameters from the event publisher function settings.  

    > [!NOTE]  
    >  The parameter list is determined by the publisher function. With business events, you cannot deviate from the parameters that are defined in the publisher function. Integration events are not as restricted and you can deviate from the parameters that are defined in the publisher function.  

8.  Add code to the function for handing the event.  

#### To create an event subscriber function for a database and page trigger event  

1.  Decide which codeunit to use for the event subscriber function.  

     You can create a new codeunit or use and existing one.  

2.  Set the **EventSubscriberInstance** property of the codeunit to specify how event subscriber functions in the codeunit are bound to codeunit instance. For more information, see [EventSubscriberInstance Property](EventSubscriberInstance-Property.md).  

3.  Add a C/AL function to the codeunit.  

     We recommend that you give the function a name that indicates what subscriber does, and has the format *\[Action\]\[Event\]*. *\[Action\]* is text that describes what the function does and *\[Event\]* is the name of the event publisher function to which it subscribes. For more information about naming, see [Best Practices with Microsoft Dynamics NAV Events](Best-Practices-with-Microsoft-Dynamics-NAV-Events.md).  

4.  Set the function [Event Property](Event-Property.md) to **Subscriber**.  

5.  Set the function [EventPublisherObject Property](EventPublisherObject-Property.md) specify the table or page that contains trigger event that you want to subscribe to.  

6.  Set the function [EventFunction Property](EventFunction-Property.md) to the event that you want to subscribe to.  

     You choose from the trigger events defined on the table that is specified by the **EventPublisherObject** property.  

7.  When prompted to overwrite the edited functions signature, choose the **Yes** button.  

     The function signature will automatically be updated to include any the parameters from the event publisher function settings.  

8.  For database trigger events, if you set the [EventFunction Property](EventFunction-Property.md) to **OnBeforeValidEvent** or **OnAfterValidEvent** event, you must set the [EventPublisherElement Property](EventPublisherElement-Property.md) to the table field on which you want to subscribe the event.  

9. There are few other properties related event subscriber functions that you can set. For more information, see the following topics:  

    -   [EventSubscriberInstance Property](EventSubscriberInstance-Property.md)  

    -   [OnMissingLicense Property](OnMissingLicense-Property.md)  

    -   [OnMissingPermission Property](OnMissingPermission-Property.md)  

10. Add code to the function for handing the event.  

 For step-by-step instructions about how to create a subscriber, see [Walkthrough: Publishing, Raising, and Subcribing to an Event in Microsoft Dynamics NAV](Walkthrough--Publishing--Raising--and-Subcribing-to-an-Event-in-Microsoft-Dynamics-NAV.md).  

## See Also  
 [Publishing Events](Publishing-Events.md)   
 [Raising Events](Raising-Events.md)   
 [Introducing Events](Introducing-Events.md)   
 [Events in Microsoft Dynamics NAV](Events-in-Microsoft-Dynamics-NAV.md)
