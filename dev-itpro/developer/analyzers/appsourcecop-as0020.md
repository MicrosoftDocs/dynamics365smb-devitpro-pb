---
title: "AppSourceCop Rule AS0020"
description: "The event attribute type cannot be changed because it might break dependent extensions."
ms.author: solsen
ms.custom: na
ms.date: 07/07/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Rule AS0020
The type of events cannot be changed.

## Description
The event attribute type cannot be changed because it might break dependent extensions.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks
As part of your extension, you can [publish events](../devenv-publishing-events.md) that will be available for other extensions [to subscribe to](../devenv-subscribing-to-events.md).
In AL, you can define events of the following types:
- [BusinessEvent](../methods/devenv-business-attribute.md)
- [IntegrationEvent](../methods/devenv-integration-attribute.md)
- [InternalEvent](../methods/devenv-internal-attribute.md)

This rule verifies that the conversion of an event from one version to another does not potentially break dependent extensions.

### Converting business events

It is not allowed to convert a business type event to an integration type event or to an internal type event.

Business type events define a formal contract that carries an implicit promise not to change in the future. Integration type events do not carry the same promise and can be changed over time. It is then not allowed to convert a business type event to an integration type event.

As a business type event defines an event that can be subscribed to by other dependent extensions, it is not allowed to convert it to an internal event. This would break dependent extensions which are subscribing to this event.

### Converting integration events

It is not allowed to convert an integration type event to an internal event.

It is allowed to convert an integration type event to a business type event when the following two conditions are met:
- the integration event did not expose any global variables, and
- the integration event does not stop exposing the sender to its subscribers (see [AS0021](appsourcecop-as0021.md)).

As an integration type event defines an event that can be subscribed to by other dependent extensions, it is not allowed to convert it to an internal events. This would break dependent extensions which are subscribing to this event.

### Converting internal events

Internal events can only be subscribed to from within the same module. It is then allowed to turn them into business or integration type events.

## Examples of valid event type conversion

### Example 1 - Converting an integration type event to a business type event

Version 1.0 of the extension:
```AL
codeunit 50100 MyCodeunit
{
    [IntegrationEvent(true, false)]
    procedure MyEvent()
    begin
    end;
}
```

Version 2.0 of the extension:
```AL
codeunit 50100 MyCodeunit
{
    [BusinessEvent(true)]
    procedure MyEvent()
    begin
    end;
}
```

In the newer version of the extension, the sender remains exposed through the business type event. The conversion is valid.

### Example 2 - Converting an internal event to an integration event

Version 1.0 of the extension:
```AL
codeunit 50100 MyCodeunit
{
    [InternalEvent(true)]
    procedure MyEvent()
    begin
    end;
}
```

Version 2.0 of the extension:
```AL
codeunit 50100 MyCodeunit
{
    [IntegrationEvent(true, false)]
    procedure MyEvent()
    begin
    end;
}
```

The event `MyEvent` now becomes available for other extensions.

## Examples of nonvalid event type conversions

### Example 1 - Conversion of a business type event to an internal type event

Version 1.0 of the extension:
```AL
codeunit 50100 MyCodeunit
{
    [BusinessEvent(false)]
    procedure MyEvent()
    begin
    end;
}
```

Version 2.0 of the extension:
```AL
codeunit 50100 MyCodeunit
{
    [InternalEvent(false)]
    procedure MyEvent()
    begin
    end;
}
```

In the newer version, the sender exposed by `MyEvent` is not accessible to subscribers anymore. If a dependent extension relies on it, this will lead to a compilation error similar to `'MyEvent' is inaccessible due to its protection level (AL0161)`.

For example, the following extension compiles when depending on version 1.0, but fails to compile with version 2.0:
```AL
codeunit 50120 AnotherCodeunit
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::MyCodeunit, 'MyEvent', '', true, true)]
    local procedure MyProcedure()
    begin
        // Subscriber logic
    end;
}

```

### Example 2 - Conversion of an integration type event that exposed variables to a business type event

Version 1.0 of the extension:
```AL
codeunit 50100 MyCodeunit
{
    [IntegrationEvent(true, true)]
    procedure MyEvent()
    begin
    end;

    var
        myGlobalVariable: Integer;
}
```

Version 2.0 of the extension:
```AL
codeunit 50100 MyCodeunit
{
    [BusinessEvent(true)]
    procedure MyEvent()
    begin
    end;

    var
        myGlobalVariable: Integer;
}
```

In the newer version, the global variables exposed by `MyEvent` are not accessible to subscribers anymore. If a dependent extension relies on global variables, this will lead to a compilation error similar to `The member referenced by event subscriber 'MyProcedure' parameter 'myGlobalVariable' is not found (AL0282)`.

For example, the following extension compiles when depending on version 1.0, but fails to compile with version 2.0:
```AL
codeunit 50120 AnotherCodeunit
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::MyCodeunit, 'MyEvent', '', true, true)]
    local procedure MyProcedure(myGlobalVariable: Integer)
    begin
        // Subscriber logic
    end;
}

```

### Example 3 - Conversion of an integration type event to a business type event that stops exposing its sender

Version 1.0 of the extension:
```AL
codeunit 50100 MyCodeunit
{
    [IntegrationEvent(true, false)]
    procedure MyEvent()
    begin
    end;
}
```

Version 2.0 of the extension:
```AL
codeunit 50100 MyCodeunit
{
    [BusinessEvent(false)]
    procedure MyEvent()
    begin
    end;
}
```

In the newer version, the sender exposed by `MyEvent` is not accessible to subscribers anymore. If a dependent extension relies on it, this will lead to a compilation error similar to `The member referenced by event subscriber 'MyProcedure' parameter 'sender' is not found (AL0282)`.

For example, the following extension compiles when depending on version 1.0, but fails to compile with version 2.0:
```AL
codeunit 50120 AnotherCodeunit
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::MyCodeunit, 'MyEvent', '', true, true)]
    local procedure MyProcedure(sender: Codeunit MyCodeunit)
    begin
        // Subscriber logic
    end;
}

```

## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
