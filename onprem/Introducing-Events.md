---
title: Introducing Events
description: Use Events to design the application to react to specific actions or behavior and enable a customized functionality from the application business logic.
ms.custom: na
ms.date: 10/24/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 0985b7bc-3184-4d04-b917-ffb0f58625f3
caps.latest.revision: 6
manager: edupont
---
# Introducing Events in Microsoft Dynamics NAV
You can use events to design the application to react to specific actions or behavior that occur. Events enable you to separate customized functionality from the application business logic. By using events in the application where customizations are typically made, you can lower the cost of code modifications and upgrades to the original application.  
  
-   Code modifications to customized functionality can be made without having to modify the original application.  
  
-   Changes to the original application code can be made with minimal impact on the customizations.  
  
 Events can be used for different purposes, such as generating notifications when certain behavior occurs or the state of an entity changes, distributing information, and integrating with external systems and applications. For example, in the [!INCLUDE[demolong](includes/demolong_md.md)], events are used for extensively for workflow and [!INCLUDE[crm](includes/crm_md.md)] integration.  
  
## How Events Work  
 The basic principal is that you program events in the application to run customized behavior when they occur. Events in [!INCLUDE[navnow](includes/navnow_md.md)] are modelled after Microsoft .NET Framework. There are three major participants involved in events: the *event*, a *publisher* and a *subscriber*.  
  
-   An *event* is the declaration of the occurrence or change in the application. An event is declared by a C/AL function, which is referred to as an *event publisher function*. An event publisher function is comprised of a signature only and does not execute any code.  
  
-   A *publisher* is the object that contains event publisher function that declares the event. The publisher exposes an event in the application to subscribers, essentially providing them with a hook-up point in the application.  
  
     Publishing an event does not actually do anything in the application apart from making the event available for subscription. The event must be raised for subscribers to respond. An event is raised by adding logic to the application that calls into the publisher to invoke the event \(the event publisher function\).  
  
     Partners or subsystems can then take advantage of the published event in their solutions. An ISV that delivers vertical solutions, and Microsoft itself, are the typical providers of published events.  
  
     There are three different event types: business, integration, and trigger events. For more information about each type, see [Event Types](Event-Types.md). Business and integration type events must be explicitly declared and published, which means that you must create event publisher functions and add them to objects manually. On the other hand, trigger events, which occur on table and page operations, are published and raised implicitly by the [!INCLUDE[navnow](includes/navnow_md.md)] runtime. Therefore, no coding is required to publish them.  
  
-   A *subscriber* listens for and handles a published event. A subscriber is a C/AL function that subscribes to a specific event publisher function and includes the logic for handling the event. When an event is raised, the subscriber function is a called and it code is run. A subscriber enables partners to hook into the core [!INCLUDE[navnow](includes/navnow_md.md)] application functionality without having to do traditional code modifications. Any [!INCLUDE[navnow](includes/navnow_md.md)] solution provider, which also includes Microsoft, can use event subscribers.  
  
 There can by multiple subscribers to a single event publisher function. However, a publisher has no knowledge of subscribers, if any. Subscribers can reside in different parts of the application than publishers.  
  
## How to Implement Events  
 Implementing events in [!INCLUDE[navnow](includes/navnow_md.md)] consists of the following tasks:  
  
1.  Publish the event.  
  
     For business and integration events, create and configure a function in an application object to be an event publisher function. For more information, see [Publishing Events](Publishing-Events.md).  
  
2.  Raise the event.  
  
     Add code that calls the event publisher function. For more information, see [Raising Events](Raising-Events.md).  
  
3.  Subscribe to the event.  
  
     At the consumer end, add one or more subscriber functions that subscribe to published events when they are raised. For more information, see [Subscribing to Events](Subscribing-to-Events.md).  
  
## See Also  
 [Event Types](Event-Types.md)   
 [Events in Microsoft Dynamics NAV](Events-in-Microsoft-Dynamics-NAV.md)