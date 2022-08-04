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

You can define a business, integration, or internal event to be an *isolated* event. An isolated event ensures the event publisher continues its code execution after calling an event. If an event subscriber's code causes an error, its transaction and associated table changes will be rolled back. The execution continues to the next event subscriber, or it will be handed back to the event's caller.

## How isolated events work

Isolated events are implemented by separating each event subscriber into its own transaction. The transaction is created before invoking an event subscriber, then committed afterwards. The following diagram illustrates the flow.

:::image type="complex" source="media/isolated-events-flow.png" alt-text="Flow diagram of isolated events." border="false":::
    When an event is raised, the platform gets the first event subscriber. When the event is isolated, an isolated transaction starts, then the event subscriber is invoked. If an error occurs, the transaction is rolled back, and the flow is repeated for the next event subscriber. Otherwise, the transaction is committed and the flow is repeated for the next event subscriber. 
:::image-end:::

> [!NOTE]  
> Read-only transactions are allowed to call isolated events directly, but **write transactions should explicitly be committed before invoking an isolated event. Otherwise, the isolated event will be invoked like an normal event, that is, errors inside an event subscriber will cause the entire operation to fail**.

### Rollback

Only changes done via Modify/Delete/Insert calls on records of type `TableType: Normal` will be automatically rolled back. Other state changes, like HTTP calls, variable alterations, changes to single instance codeunit's members, won't be rolled back.

For example, if an integer variable that's passed by VAR is modified by a failing event subscriber, its changes will persist.

### Extension installation and upgrade

When the operation is installing, uninstalling, or upgrading extensions, isolated events aren't run isolated. The events run normally instead. 

The reason for this behavior is that these operations require that all operations within them are done in one transaction. So explicit Commit calls can't be made during the operations.

## How to define an isolated event

The [BusinessEvent](attributes/devenv-businessevent-attribute.md), [IntegrationEvent](attributes/devenv-integrationevent-attribute.md), and [InternalEvent](attributes/devenv-internalevent-attribute.md) attributes include the `Isolated` boolean argument, for example:

```al
[InternalEvent(IncludeSender: Boolean, Isolated: Boolean)]
```

To define an isolated event, set the `Isolated` argument, which is to `true`, for example:

```al
[InternalEvent(true, true)]
```

## Example

```al
codeunit 50145 IsolatedEventsSample
{
    trigger OnRun()
    var
        Counter: Integer;
        cust : Record Customer;
    begin
        // Precondition: Customer table isn't empty.
        if (cust.IsEmpty) then
            Error('Customer table is empty.');

        MyIsolatedEvent(Counter);

        // Code only reaches this point because the above event is isolated and error thrown in FailingEventSubscriber is caught.
        if (Counter <> 2) then
            Error('Both event subscribers should have incremented the counter.');

        // Post-condition: Customer table hasn't been truncated.
        if (cust.IsEmpty) then
            Error('Customer table was truncated, failing event subscriber was not rolled back.');
    end;

    [InternalEvent(false, true)]
    local procedure MyIsolatedEvent(var Counter: Integer)
    begin
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::IsolatedEventsSample, 'MyIsolatedEvent', '', false, false)]
    local procedure FailingEventSubscriber(var Counter: Integer)
    var
        cust: Record Customer;
    begin
        Counter += 1; // Change will persist even after throwing. Only database changes will be rolled back.

        cust.DeleteAll(); // Database changes will be rolled back upon error.

        Error('Fail!');

        // Code below won't be reached!
        Counter += 1;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::IsolatedEventsSample, 'MyIsolatedEvent', '', false, false)]
    local procedure IncreasingEventSubscriber(var Counter: Integer)
    begin
        Counter += 1;
    end;
}
```

## See Also

[Publishing Events](devenv-publishing-events.md)  
[Raising Events](devenv-raising-events.md)  
[Subscribing to Events](devenv-subscribing-to-events.md)  
[Developing Extensions Using the New Development Environment](devenv-dev-overview.md)  
