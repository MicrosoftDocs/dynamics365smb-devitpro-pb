---
title: "Events in Microsoft Dynamics 365 Business Central"
description: Events is a programming concept that can ease application upgrade and limit the code modifications in customized applications during platform changes. 
author: jswymer
ms.author: solsen
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

Implement isolated events by separating each event subscriber in their own isolated transaction, which is created and committed before and after invoking an event subscriber. Read-only transactions are allowed to call isolated events directly but write transactions must explicitly be committed before invoking an isolated event.




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
