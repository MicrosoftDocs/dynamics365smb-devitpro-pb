---
title: "Parameters cannot be removed from events"
ms.author: solsen
ms.custom: na
ms.date: 04/01/2020
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
# AppSourceCop Rule AS0025
Parameters cannot be removed from events  

## Description
Parameters cannot be removed from events.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

Depending on their declaration, events defined in an extension can be referenced from dependent extensions, which can raise these events and/or subscribe to them. 
This rule validates that the changes made to the event parameters do not break dependent extensions.

## Modifying parameters on events that can be raised from other extensions.

Events which can be raised from other extensions must not change signature. It is not possible to add, modify or remove parameters, as it would break the caller.

Events which can be raised from other extensions are events which satisfies the following conditions:
- they are declared in objects whose accessibility is set to `public` or left as default, 
- they are not marked with an access modifier (like `local` or `internal`). 

For more information, see [Access Property](..\properties/devenv-access-property). 

### Examples of invalid conversion

In the following examples, the version 1.0 of the extension defines an Internal type event whose accessibility is public. This means that this event can be raised from other extensions, but cannot be subscribed to from other extensions.

Version 1.0 of the extension:
```
codeunit 50100 MyCodeunit
{
    [InternalEvent(false)]
    procedure MyEvent(i: Integer)
    begin
    end;
}
```

#### Example 1: Removing parameters

Version 2.0 of the extension:
```
codeunit 50100 MyCodeunit
{
    [InternalEvent(false)]
    procedure MyEvent()
    begin
    end;
}
```

In the newer version, the parameter i of the event has been removed. If a dependent extension raises this event, this will lead to a compilation error similar to `No overload for method 'MyEvent' takes 1 argument. (AL0126)`.

For example, the following extension compiles when depending on version 1.0, but fails to compile with version 2.0:
```
codeunit 50120 AnotherCodeunit()
{
    procedure RaiseEvent()
    begin
        MyEvent(5);
    end;
}
```

#### Example 2: Adding new parameters

The dependent extension remain the same as in example 1.

Version 2.0 of the extension:
```
codeunit 50100 MyCodeunit
{
    [BusinessEvent(false)]
    procedure MyEvent(i: Integer; j: Integer)
    begin
    end;
}
```

In the newer version, a new parameter j has been added to the event. If a dependent extension raises this event, this will lead to a compilation error similar to `There is no argument given that corresponds to the required formal parameter 'j' of 'MyEvent(Integer, Integer)' (AL0135)`.

#### Example 3: Modifying parameters

The dependent extension remain the same as in example 1.

Version 2.0 of the extension:
```
codeunit 50100 MyCodeunit
{
    [BusinessEvent(false)]
    procedure MyEvent(i: Text[50])
    begin
    end;
}
```

In the newer version, the type of the parameter i has changed from Integer to Text[50]. If a dependent extension raises this event, this will lead to a compilation error similar to `Argument 1: cannot convert from 'Integer' to 'Text[50]' (AL0133)`.


## Modifying events that can be subscribed to from other extensions

Business type events and Integration type events can be subscribed to from dependent extensions. As an event subscriber can use the parameters passed by the event, removing parameters, modifying their type, or renaming them can break dependent extensions which subscribe to this event.

### Examples of invalid changes:

In the following examples, the version 1.0 of the extension defines a Business type event whose accessibility is not public. This means that this event can be subscribed to from other extensions, but cannot be raised from other extensions.

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

#### Example 1: Removing parameters

Version 2.0 of the extension:
```
codeunit 50100 MyCodeunit
{
    [BusinessEvent(false)]
    local procedure MyEvent()
    begin
    end;
}
```

In the newer version, the parameter i of the event has been removed. If a dependent extension subscribes to this event, this will lead to a compilation error similar to `The member referenced by event subscriber 'MyProcedure' parameter 'i' is not found. (AL0282)`.

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

#### Example 2: Renaming parameters

The dependent extension remain the same as in example 1.

Version 2.0 of the extension:
```
codeunit 50100 MyCodeunit
{
    [BusinessEvent(false)]
    local procedure MyEvent(i: Text[50])
    begin
    end;
}
```

In the newer version, the type of the parameter i has changed from Integer to Text[50]. If a dependent extension raises this event, this will lead to a compilation error similar to `The type of the parameter 'i' on the event subscriber 'MyProcedure' does not match the expected type 'Integer'. (AL0284)`.

#### Example 3: Modifying parameters

The dependent extension remain the same as in example 1.

Version 2.0 of the extension:
```
codeunit 50100 MyCodeunit
{
    [BusinessEvent(false)]
    local procedure MyEvent(i: Text[50])
    begin
    end;
}
```

In the newer version, the signature of the event has changed. If a dependent extension raises this event, this will lead to a compilation error similar to `The type of the parameter 'i' on the event subscriber 'MyProcedure' does not match the expected type 'Integer'. (AL0284)`.

### Examples of valid changes:

#### Example 1: Adding new parameters

Version 2.0 of the extension:
```
codeunit 50100 MyCodeunit
{
    [BusinessEvent(false)]
    local procedure MyEvent(i: Integer; j: Integer)
    begin
    end;
}
```

In the newer version, the signature of the event has changed. However, it does not break dependent extensions because event subscriber do not have to use all the parameters defined in the event in order to compile.

## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  