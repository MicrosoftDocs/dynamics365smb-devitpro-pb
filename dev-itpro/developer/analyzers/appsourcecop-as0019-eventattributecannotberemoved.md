---
title: "Event attributes cannot be removed"
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
# AppSourceCop Rule AS0019
Event attributes cannot be removed  

## Description
Removing Event attributes such as IntegrationEvent or BusinessEvent is not allowed.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

Removing the event attribute on Business and Integration type events is not allowed, because it will break dependent extensions which are subscribing to them.
It is allowed to remove the InternalEvent attribute, as InternalEvents can only be subscribed to from within the same module.

## Example of invalid code:

In the following examples, the version 1.0 of the extension defines a Business type event whose accessibility is not public. This means that this event cannot be raised from other extensions, but it can still be subscribed to from other extensions.

Version 1.0 of the extension:
```
codeunit 50100 MyCodeunit
{
    [BusinessEvent(false)]
    local procedure MyEvent(i: Integer)
    begin
    end;
}
```

Version 2.0 of the extension:
```
codeunit 50100 MyCodeunit
{
    local procedure MyEvent()
    begin
    end;
}
```

In the version 2.0, the event attribute has been renamed. If a dependent extension subscribed to this event, this will lead to a compilation error similar to `Object member 'MyEvent' is not an event. (AL0281)`.

For example, the following extension compiles when depending on version 1.0, but fails to compile with version 2.0:
```
codeunit 50120 AnotherCodeunit()
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