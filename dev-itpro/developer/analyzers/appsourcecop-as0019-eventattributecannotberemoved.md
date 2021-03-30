---
title: "Event attributes cannot be removed"
ms.author: solsen
ms.custom: na
ms.date: 04/01/2021
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
# AppSourceCop Rule AS0019
Event attributes cannot be removed

## Description
Removing Event attributes such as IntegrationEvent or BusinessEvent is not allowed because it will break dependent extensions that have subscribed to this event.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks
Removing the event attribute on Business and Integration type events is not allowed, because it will break dependent extensions which are subscribing to them. It is allowed to remove the `InternalEvent` attribute, as InternalEvents can only be subscribed to from within the same module.

> [!NOTE]
> Internal events are also available for the modules specified in the `internalsVisibleTo` property in your [app.json](../devenv-json-files.md) file.

## Code examples triggering the rule

In the following examples, the version 1.0 of the extension defines a Business type event whose accessibility is not public. This means that this event cannot be raised from other extensions, but it can still be subscribed to from other extensions.

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
    local procedure MyEvent()
    begin
    end;
}
```

In version 2.0, the event attribute has been renamed. If a dependent extension subscribed to this event, this will lead to a compilation error similar to `Object member 'MyEvent' is not an event. (AL0281)`.

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

## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
