---
title: Events Discoverability
description: Using the Event Recorder, you can record the events that are published and raised while performing the actions of your scenario.
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# Discoverability of Events 

You subscribe to events to extend application and interact with the base application and other extensions. This topic describes how to discover events that you can subscribe to without writing the code manually. Using the **Event Recorder**, you can record the events that are published and raised while performing the actions of your scenario. For example, record the events raised when you post a purchase order and identify the events that you need for your extension. You can retrieve the events in the form of AL snippet code and use them in Visual Studio Code directly. 

## Using the Event Recorder
You can launch the event recorder session from [!INCLUDE[d365_bus_central_md](includes/d365_bus_central_md.md)]. It can be accessed in the following two ways:

- In [!INCLUDE[d365_bus_central_md](includes/d365_bus_central_md.md)], search for **Event Recorder**.
- In Visual Studio Code, use the `Ctrl+Shift+P` keys and select the **Open Event Recorder** command to open the **Event Recorder** page in the [!INCLUDE[d365_bus_central_md](includes/d365_bus_central_md.md)] web client.

> [!NOTE]  
> The event recorder captures all events that are raised in the same session. If the actions performed by the user are in another session, then the event recorder will not capture them.

### How to record events

The following steps describe how to record events when you are on the **Event Recorder** page.

1. On the **Event Recorder** page, in the upper right corner, choose **Open this page in a new window**.
2. Then on the **Event Recorder** page, choose **Record Events**, and then choose the **Start** button.
3. In the original window, perform all the actions that you want to record while the event recorder session is on.
    For example, post a purchase order.
4. After you have performed the actions of your scenario, navigate back to the window that has the **Event Recorder** page open and click the **Stop** button to finish recording.  
    All the events raised while performing the actions of your scenario are recorded and can be viewed on as shown below.
    ![Event recorder](media/view-events-event-recorder.png)
5. Choose **Get AL Snippet** to get the event subscription code in AL.
You can use the AL snippet code in Codeunits to subscribe to those events.

> [!NOTE]  
> The recorded events are not saved. When you refresh the page, the recorded events disappear.

For more information on how to subscribe to events, see [Subscribing to Events](devenv-subscribing-to-events.md).

## Recorded Events

All the recorded events display in the order they were called. The Event Recorder page provides information on the events that were raised including the details whether the raised events were trigger events or custom events. The custom events are either Business Events or Integration Events. For more information, see [Event Types](devenv-event-types.md).

You can identify the Event types, additionally, you can discover which object types and methods raised the events with the details like calling methods, object types, and object names. For more information about Events, see [Events in AL](devenv-events-in-al.md).
  
## See Also
[Events in AL](devenv-events-in-al.md)  
[Publishing Events](devenv-publishing-events.md)  
[Raising Events](devenv-raising-events.md)  
[Subscribing to Events](devenv-subscribing-to-events.md)  
[Debugging in AL](devenv-debugging.md)  
[Developing Extensions](devenv-dev-overview.md)  