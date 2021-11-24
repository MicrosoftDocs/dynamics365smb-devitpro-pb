---
title: "Isolated events in AL"
description: Describes how isolated events work in Business Central. 
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

# Isolated Events in AL

You can define a business, integration, or internal event to be an *isolated* event. An isolated event ensures that the event publisher continues its code execution after calling an event - even if an error occurs in an event subscriber. If an event subscriber's code leads to an error, its transaction and associated changes will be rolled back. The execution continues to the next event subscriber, or it will be handed back to the event's caller.

## How isolated events work

Isolated events are implemented by separating each event subscriber into its own transaction. The transaction is created before invoking an event subscriber, then committed afterwards. The following diagram illustrates the flow.

:::image type="complex" source="media/isolated-events-flow.png" alt-text="Flow diagram of isolated events." border="false":::
    When an event is raised, the platform gets the first event subscriber. If the event is isolated, an isolated transaction starts, then the event subscriber is invoked. If an error occurs, the transaction is rolled back, and the flow is repeated for the next event subscriber. If there's no error, the transaction is committed and the flow is repeated for the next event subscriber. 
:::image-end:::

Read-only transactions are allowed to call isolated events directly, but write transactions must explicitly be committed before invoking an isolated event.

> [!IMPORTANT]
> Only changes done to tables that have the `TableType: Normal` will be automatically rolled back. Other state changes, like HTTP calls, changes to single instance codeunit's members, and so on, won't be rolled back.

## How to define an isolated event

The [BusinessEvent](attributes/devenv-businessevent-attribute.md), [IntegrationEvent](attributes/devenv-integrationevent-attribute.md), and [InternalEvent](attributes/devenv-internalevent-attribute.md) include the `Isolated` boolean argument, which is to `false` by default.

```al
[InternalEvent(IncludeSender: Boolean, Isolated: Boolean)]
```

To define an isolated event, set the `Isolated` argument, which is to `true`.

```al
[InternalEvent(true, true)]
```

## See Also

[Publishing Events](devenv-publishing-events.md)  
[Raising Events](devenv-raising-events.md)  
[Subscribing to Events](devenv-subscribing-to-events.md)  
[Developing Extensions Using the New Development Environment](devenv-dev-overview.md)  
