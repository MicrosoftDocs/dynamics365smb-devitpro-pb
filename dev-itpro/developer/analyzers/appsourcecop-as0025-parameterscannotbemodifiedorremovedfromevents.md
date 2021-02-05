---
title: "Parameters cannot be modified, renamed, or removed from events."
ms.author: solsen
ms.custom: na
ms.date: 10/01/2020
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
# AppSourceCop Rule AS0025
Parameters cannot be modified, renamed, or removed from events.  

## Description
Parameters cannot be modified, renamed, or removed from Business type and Integration type events, because it will break dependent extensions.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

Events defined in an extension can be referenced from dependent extensions, which can raise them, subscribe to them, or both.

The rules [AS0023](appsourcecop-as0023-returntypecannotbemodifiedinpublicapi.md), [AS0024](appsourcecop-as0024-parameterscannotberemovedoraddedinexternalprocedures.md), and [AS0026](appsourcecop-as0026-parametertypesubtypecannotbemodifiedinpublicapi.md) validate against breaking changes in public methods, which includes public events. They are then validating the scenarios around events being raised from dependent extensions.

This rule validates that changes on the parameters of `Business` type and `Integration` type do not break dependent extensions which subscribe to these events. As an event subscriber can use the parameters passed by the event and references them by name, removing parameters, modifying their type, and renaming them can break dependent extensions.

> [!NOTE]  
> Dependent extensions can subscribe to these events, even if the events are marked with the `local` or `internal` access modifiers. The access modifier only limits the ability to raise the event. 

## Code examples triggering the rule

In the following examples, the version 1.0 of the extension defines a Business type event whose accessibility is not public. This means that this event can be subscribed to from other extensions, but cannot be raised from other extensions.

Version 1.0 of the extension:
```AL
codeunit 50100 MyCodeunit
{
    [BusinessEvent(false)]
    local procedure MyEvent(i: Integer)
    begin
    end;
}
```

### Example 1 - Removing parameters

Version 2.0 of the extension:
```AL
codeunit 50100 MyCodeunit
{
    [BusinessEvent(false)]
    local procedure MyEvent()
    begin
    end;
}
```

In the version 2.0, the parameter `i` of the event has been removed. If a dependent extension subscribed to this event and used `i`, this will lead to a compilation error similar to `The member referenced by event subscriber 'MyProcedure' parameter 'i' is not found. (AL0282)`.

For example, the following extension compiles when depending on version 1.0, but fails to compile with version 2.0:
```AL
codeunit 50120 AnotherCodeunit
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::MyCodeunit, 'MyEvent', '', false, false)]
    local procedure MyProcedure(i: Integer)
    begin
        // Subscriber logic
    end;
}
```

### Example 2 - Modifying parameters

The dependent extension remains the same as in example 1.

Version 2.0 of the extension:
```AL
codeunit 50100 MyCodeunit
{
    [BusinessEvent(false)]
    local procedure MyEvent(i: Boolean)
    begin
    end;
}
```

In version 2.0, the type of the parameter `i` has changed from Integer to Boolean. If a dependent extension subscribed to this event and used `i`, this will lead to a compilation error similar to `The type of the parameter 'i' on the event subscriber 'MyProcedure' does not match the expected type 'Integer'. (AL0284)`.

### Example 3 - Renaming parameters

The dependent extension remains the same as in example 1.

Version 2.0 of the extension:
```AL
codeunit 50100 MyCodeunit
{
    [BusinessEvent(false)]
    local procedure MyEvent(j: Integer)
    begin
    end;
}
```

In version 2.0, the parameter `i` has been renamed to `j`. If a dependent extension subscribed to this event and used `i`, this will lead to a compilation error similar to `The member referenced by event subscriber 'MyProcedure' parameter 'i' is not found. (AL0282)`.

## Code examples not triggering the rule

For `local` or `internal` events, it is allowed to add parameters to the event.

Version 1.0 of the extension:
```AL
codeunit 50100 MyCodeunit
{
    [BusinessEvent(false)]
    local procedure MyEvent(i: Integer)
    begin
    end;
}
```

Version 2.0 of the extension:
```AL
codeunit 50100 MyCodeunit
{
    [BusinessEvent(false)]
    local procedure MyEvent(i: Integer; j: Integer)
    begin
    end;
}
```

In version 2.0, the signature of the event has changed. However, it does not break dependent extensions because event subscribers do not have to use all the parameters defined in the event.


## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  