---
title: "An argument in an event attribute cannot be changed to false"
ms.author: solsen
ms.custom: na
ms.date: 04/03/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Rule AS0021
An argument in an event attribute cannot be changed to false  

## Description
An argument in an event attribute cannot be changed to false.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

This rule verifies that events that are available from other extensions such as [Business](../methods/devenv-business-attribute) type events or [Integration](../methods/devenv-integration-attribute) type events do not stop exposing their sender or their global variables.

This does not apply to [Internal](../methods/devenv-internal-attribute) type events as they are not exposed to dependent extensions.

## Examples of invalid code:

### Example 1: A business type event stops exposing its sender

Version 1.0 of the extension:
```
codeunit 50100 MyCodeunit
{
    [BusinessEvent(true)]
    procedure MyEvent()
    begin
    end;
}
```

Version 2.0 of the extension:
```
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
```
codeunit 50120 AnotherCodeunit()
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::MyCodeunit, 'MyEvent', '', true, true)]
    local procedure MyProcedure(sender: Codeunit MyCodeunit)
    begin
        // Subscriber logic
    end;
}

```

### Example 2: An integration type event stops exposing global variables

Version 1.0 of the extension:
```
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
```
codeunit 50100 MyCodeunit
{
    [IntegrationEvent(true, false)]
    procedure MyEvent()
    begin
    end;

    var
        myGlobalVariable: Integer;
}
```

In the newer version, the global variables exposed by `MyEvent` are not accessible to subscribers anymore. If a dependent extension relies on global variables, this will lead to a compilation error similar to `The member referenced by event subscriber 'MyProcedure' parameter 'myGlobalVariable' is not found (AL0282)`.

For example, the following extension compiles when depending on version 1.0, but fails to compile with version 2.0:
```
codeunit 50120 AnotherCodeunit()
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::MyCodeunit, 'MyEvent', '', true, true)]
    local procedure MyProcedure(myGlobalVariable: Integer)
    begin
        // Subscriber logic
    end;
}

```

## Example of valid code:

### Example 1: An event does not change overtime

Version 1.0 of the extension:
```
codeunit 50100 MyCodeunit
{
    [BusinessEvent(false)]
    procedure MyEvent()
    begin
    end;
}
```

Version 2.0 of the extension:
```
codeunit 50100 MyCodeunit
{
    [BusinessEvent(false)]
    procedure MyEvent()
    begin
    end;
}
```

The event remains the same from on version to the other.

### Example 2: An event starts exposing it sender

Version 1.0 of the extension:
```
codeunit 50100 MyCodeunit
{
    [BusinessEvent(false)]
    procedure MyEvent()
    begin
    end;
}
```

Version 2.0 of the extension:
```
codeunit 50100 MyCodeunit
{
    [BusinessEvent(true)]
    procedure MyEvent()
    begin
    end;
}
```

In the newer version of the extension, the sender becomes exposed through the business type event. 

## How to fix this diagnostic?

In order to fix this diagnostic, the changes on the event attribute must be reverted. The event should be marked as obsolete, and a new event should be introduced.
It is advised to keep on raising the obsoleted event in order to not break the runtime behavior of dependent extensions while they haven't uptaken yet the new event.

### Example: Stopping to expose the sender in a business type event

Version 1.0 of the extension:
```
codeunit 50100 MyCodeunit
{
    [BusinessEvent(true)]
    local procedure MyEvent()
    begin
    end;
}
```

Version 2.0 of the extension:
```
codeunit 50100 MyCodeunit
{
    [Obsolete('Use MyNewEvent() instead. This event will be removed in version 3.0.', '2.0')]
    [BusinessEvent(true)]
    local procedure MyEvent()
    begin
    end;
    
    [BusinessEvent(true)]
    local procedure MyNewEvent()
    begin
    end;

    local procedure RaiseEvents()
    begin
        MyEvent();
        MyNewEvent();
    end;
}
```

Once dependent extensions have been updated to use the new event, the obsolete event can be removed.

Version 3.0 of the extension:
```
codeunit 50100 MyCodeunit
{  
    [BusinessEvent(true)]
    local procedure MyNewEvent()
    begin
    end;

    local procedure RaiseEvents()
    begin
        MyNewEvent();
    end;
}
```

## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  