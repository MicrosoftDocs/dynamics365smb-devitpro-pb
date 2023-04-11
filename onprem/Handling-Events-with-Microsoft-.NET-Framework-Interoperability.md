---
title: "Handling Events with Microsoft .NET Framework Interoperability"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 3e1a62d7-124f-4acc-9c31-f48fe333c6e0
caps.latest.revision: 11
---
# Handling Events with Microsoft .NET Framework Interoperability
With Microsoft .NET Framework interoperability, a DotNet type variable of a [!INCLUDE[navnow](includes/navnow_md.md)] object can subscribe to events that are published by a .NET Framework class. In .NET Framework, an event enables an object to notify other objects when something occurs. Typical events in a graphical user interface might be the click of a button or the change of a field. The object that raises the event is the *publisher* and the object that handles the event is called the *subscriber*.  

 This topic discusses the following subjects:  

-   [Understanding How Events Work in .NET Interoperability](#HowWork)  

-   [Client-side and Server-side Events](#ClientSide)  

-   [Understanding Synchronous and Asynchronous Events](#Asynch)  

-   [Updating Event Triggers](#Updating)  

-   [Limitations on Events and Event Triggers](#Limitations)  

##  <a name="HowWork"></a> Understanding How Events Work in .NET Interoperability  
 You set up a DotNet variable to subscribe to events by setting the variable’s [WithEvents Property](WithEvents-Property.md) to **true**. The DotNet variable is exposed to all events that are published by the .NET Framework type that the variable references. For each event, [!INCLUDE[navnow](includes/navnow_md.md)] automatically adds a blank trigger in the C/AL code of the [!INCLUDE[navnow](includes/navnow_md.md)] object. You add C/AL code to the trigger to handle the event. When an instance of the .NET Framework type raises the event, the corresponding trigger in C/AL code is invoked and its code is run.  

 For more information, see [How to: Subscribe to Events in a .NET Framework Type](How-to--Subscribe-to-Events-in-a-.NET-Framework-Type.md).  

##  <a name="ClientSide"></a> Client-side and Server-side Events  
 You can configure a DotNet type variable to instantiate the .NET Framework type to target the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] or the [!INCLUDE[nav_server](includes/nav_server_md.md)]. As a result, events that are published by the .NET Framework type will also target either the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] \(client-side\) or the [!INCLUDE[nav_server](includes/nav_server_md.md)] \(server-side\).  

### Client-Side Events  
 Client-side events are supported on pages only. A page can subscribe to events from the following sources:  

-   DotNet variable that is defined as a global variable.  

-   Events published by a control add-in. For more information about events in control add-ins, see [Exposing Events and Calling Respective C/AL Triggers from a Windows Client Control Add-in](Exposing-Events-and-Calling-Respective-C-AL-Triggers-from-a-Windows-Client-Control-Add-in.md).  

##  <a name="Asynch"></a> Understanding Synchronous and Asynchronous Events  
 Events published by .NET Framework objects can be classified as *synchronous* or *asynchronous*. *Synchronous* events are raised immediately when something occurs in the running application code. Asynchronous events are raised after something occurs. An asynchronous event can be a timer event, which is implemented by the [System.Timers.Timer](https://go.microsoft.com/fwlink/?LinkID=262175) class, or an event that is raised by a network listener or other external source, which is handled by an event sink.  

### Considerations for Asynchronous Events  

-   Timer events and event sinks are only active as long as the [!INCLUDE[navnow](includes/navnow_md.md)] object that implements the DotNet variable is running. By using an asynchronous event, it is possible that [!INCLUDE[navnow](includes/navnow_md.md)] object closes before the event trigger is run. To avoid this condition, you can declare the DotNet variable in a single instance codeunit. Single instance codeunits remain instantiated until you close the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] or close the company database. For more information about single instance codeunits, see [Using Codeunits](Using-Codeunits.md).  

-   When asynchronous events are raised, they are added to the event queue of the .NET Framework, and processed when the connection between the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] and the [!INCLUDE[nav_server](includes/nav_server_md.md)] is idle. A connection is idle when no [!INCLUDE[navnow](includes/navnow_md.md)] objects are communicating over the connection. If there is a long process that is running over the connection, then you might experience a delay when you run event triggers.  

##  <a name="Updating"></a> Updating Event Triggers  
 Event triggers in C/AL code do not update automatically when events are changed or added to the .NET Framework assembly that is used by a DotNet variable. If you want to update event triggers in the [!INCLUDE[navnow](includes/navnow_md.md)] object to changes in the .NET Framework assembly, then you must delete existing triggers and subscribe to the events again.  

##  <a name="Limitations"></a> Limitations on Events and Event Triggers  
 Event triggers that are published by .NET Framework types have the following limitations:  

-   Events are only supported on global variables.  

-   Events must adhere to the delegation event model of the .NET Framework. For more information about this model, see [Events and Delegates](https://go.microsoft.com/fwlink/?LinkID=262176).  

-   Reference parameters in client-side events are not supported.  

-   Events cannot have parameters that are enumeration types.  

-   Return values on event triggers are not supported.  

## See Also  
 [How to: Subscribe to Events in a .NET Framework Type](How-to--Subscribe-to-Events-in-a-.NET-Framework-Type.md)   
 [Calling .NET Framework Members from C/AL](Calling-.NET-Framework-Members-from-C-AL.md)
