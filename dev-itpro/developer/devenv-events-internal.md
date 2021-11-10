---
title: "Events in Microsoft Dynamics 365 Business Central"
description: Describes internal events and how to use isolated events in Business Central. 
author: jswymer
ms.author: jswymer
ms.custom: na
ms.date: 11/11/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
---

# Internal Events in AL

Internal events are events that can only be subscribed to from within the same module.


## Isolated events

An isolated event ensures that the event publisher continues its code execution after calling an event. If an event subscriber’s code leads to an error, its transaction and associated changes will be rolled back. The execution will continue with the next event subscriber or execution will be handed back to the event's caller.

> [!NOTE]
> Only changes done to tables that have the `TableType: Normal` will be automatically rolled back. Other state changes, like HTTP calls, changes to single instance codeunit's members, and so on, won't be rolled back. 

Implement isolated events by separating each event subscriber in their own isolated transaction, which is created and committed before and after invoking an event subscriber. Read-only transactions are allowed to call isolated events directly but write transactions must explicitly be committed before invoking an isolated event. The following diagram illustrates the flow.

:::image type="complex" source="media/isolated-events-flow.png" alt-text="Flow diagram of isolated events." border="false":::
    When an event is raised, the platform gets the first event subscriber. If the event is an isolated event, an isolated transaction starts, then the event subscriber is invoked. Otherwise, the event subscriber is invoked in the same transaction. If an error occurs for an isolated event, the transaction is rolled back, and the flow is repeated for the next event subscriber. If there's no error, the transaction is committed and the flow is repeated for the next event subscriber. 
:::image-end:::

## See Also

[Publishing Events](devenv-publishing-events.md)  
[Raising Events](devenv-raising-events.md)  
[Subscribing to Events](devenv-subscribing-to-events.md)  
[Developing Extensions Using the New Development Environment](devenv-dev-overview.md)  

<!--NAV
[Debugging Events](devenv-debugging-events.md)  
[Best Practices with Microsoft Dynamics 365 Business Central](devenv-events-best-practices.md)  
 [Walkthrough: Publishing, Raising, and Subcribing to an Event in Microsoft Dynamics NAV](Walkthrough--Publishing--Raising--and-Subcribing-to-an-Event-in-Microsoft-Dynamics-NAV.md)  
[Walkthrough: Implementing New Workflow Events and Responses](Walkthrough--Implementing-New-Workflow-Events-and-Responses.md)  -->
