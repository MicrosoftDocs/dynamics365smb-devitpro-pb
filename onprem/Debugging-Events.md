---
title: "Debugging Events"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 93329fe8-f6f9-4af2-99da-590aab2cd84f
caps.latest.revision: 4
manager: edupont
---
# Debugging Events
You can debug events to help you find and correct errors. Debugging events is similar to debugging other C/AL code in an application, where the basic concept is the breakpoint. To debug an event, you can add multiple breakpoints on event-related lines of code that cover each phase of the event, as described in the following list:  
  
|Event Phase|Breakpoint|Description|  
|-----------------|----------------|-----------------|  
|On publishing an event|Add a breakpoint in the event publisher function that declares an event. Although an event publisher function does not contain any code, except comments, you can add a breakpoint on a non-code line.<br /><br /> For more information about publishing and event, see [Publishing Events](Publishing-Events.md).|This enables you to step into the event handler code in event subscriber functions that subscribe to the event, without executing code that raises an event.|  
|On raising an event|Add a breakpoint on the line of code that calls the event publisher function which raises the event.|This enables you to step into event handler code in event subscriber functions from where the events are raised.<br /><br /> For more information about raising an event, see [Raising Events](Raising-Events.md).|  
|On subscribing to an event|Add breakpoints on lines of code in the event subscriber function that subscribes to a raised event.|This enables you to step through code that handles an event.<br /><br /> For more information about publishing and event, see [Subscribing to Events](Subscribing-to-Events.md).|  
  
 For more information about debugging and breakpoints, see [Debugging](Debugging.md).  
  
## See Also  
 [Events in Microsoft Dynamics NAV](Events-in-Microsoft-Dynamics-NAV.md)   
 [Event Errors](Event-Errors.md)