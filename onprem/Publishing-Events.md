---
title: "Publishing Events"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 6a519146-cc83-4f9b-8e2d-78994c40cf5b
caps.latest.revision: 11
manager: edupont
---
# Publishing Events
The first phase of implementing an event is publishing the event. Publishing an event exposes it in the application. This provides hook up points for subscribers to register to the event, and eventually handle the event if it is raised. An event is published by adding C/AL function that is specifically set up as an event publisher.  

-   Business and integration events require that you manually create an event publisher function for each event that you want to publish. An event publisher function declares the event in the application and makes it available for subscription; however, it does not raise the event. After an event is published, you can raise it in your application, as needed, from where event subscribers can react and handle the event.  

-   Trigger events, on the other hand, do not require that you create publisher functions. Trigger events are by predefined event publisher functions that are called automatically at runtime. This means that trigger events are readily available to subscribers by default.  

## Creating an Event Publisher Function to Publish Business and Integration Events  
 You create an event publisher function the same way you create any function in C/AL, except that there are specific properties that you set to make it an event publisher. Additionally, an event publisher function has the following requirements and restrictions that you must follow, otherwise you not able to compile your code changes:  

-   An event publisher function cannot include any code except comments.  

-   An event publisher function cannot have a return value, variables, or text constants.  

 The following procedure provides an outline of the tasks that are involved in creating an event publisher function for declaring an event. The tasks are performed from the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)]. For detailed step-by-step instructions for the tasks, see [Walkthrough: Publishing, Raising, and Subscribing to an Event in Microsoft Dynamics NAV](Walkthrough--Publishing--Raising--and-Subcribing-to-an-Event-in-Microsoft-Dynamics-NAV.md).  

#### To create an event publisher function  

1.  Decide where you want to include the event publisher function.  

    You can include an event publisher function in the C/AL code of any object type, such as codeunit, page, or table. You can create a new object or use and existing object.  

    >[!IMPORTANT]  
    >If you include the event publisher function in a page object, the page must have a source table. Otherwise, you cannot successfully create an event subscriber function to subscribe to the event.

2.  Add a C/AL function to the object.  

     We recommend that you give the function a name that has the format *On\[Event\]*, where *\[Event\]* is text that indicates what occurred, such as OnCancelCustomerApprovalRequest.  

3.  Set the function [Event Property](Event-Property.md) to **Publisher** and the [EventType Property](EventType-Property.md) to either **Business** or **Integration**.  

4.  Set the function [EventType Property](EventType-Property.md) to **Business** or **Integration**.  

     For more information, see [Event Types](Event-Types.md).  

5.  If you want to make the event available to event subscribers that are defined in the other objects than publisher function object, set the [Local Property](Local-Property.md) to **No**.  

6.  If you want to make global functions in the object available to event subscribers, set the [IncludeSender Property](IncludeSender-Property.md) to **Yes**.  

7.  Add parameters to the function as needed.  

     You can include as many parameters of any type as necessary.  

     Make sure to expose enough information as parameters to enable subscriber functions to add value to the application. On the other hand, especially with business events, do not expose unnecessary parameters that may constrain you from changing or extending functionally in the future.  

 You can now add code to the application that raises the event by calling the publisher function. You can also create subscriber functions that handle the event when it is raised.  

## See Also  
 [Raising Events](Raising-Events.md)   
 [Subscribing to Events](Subscribing-to-Events.md)   
 [Events in Microsoft Dynamics NAV](Events-in-Microsoft-Dynamics-NAV.md)
