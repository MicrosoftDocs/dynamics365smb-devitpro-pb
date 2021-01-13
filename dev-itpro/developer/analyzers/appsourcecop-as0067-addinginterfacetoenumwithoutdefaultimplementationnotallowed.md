---
title: "Adding an interface to an enum that has been published must have a default implementation."
ms.author: solsen
ms.custom: na
ms.date: 10/01/2020
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
# AppSourceCop Rule AS0067
Adding an interface to an enum that has been published must have a default implementation.  

## Description
Adding an interface to an enum that has been published must have a default implementation, because dependent enum extensions don't implement the new interface and may break.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

When an extensible enum implements an interface, the AL compiler validates that all its enum values implement this interface. This applies to enum values defined in the enum itself and to the ones defined in enum extensions. When an extensible enum that was part of the previous version of this extension implements a new interface, a default interface implementation must be specified using the [Default Implementation](../properties/devenv-defaultimplementation-property.md) property because dependent extensions extending this enum won't be implementing the interface explicitly.

## How to fix this diagnostic?

Add the [Default Implementation](../properties/devenv-defaultimplementation-property.md) to the enum that implements a new interface.

## Code example triggering the rule

In the following examples, the version 1.0 of the extension defines an extensible enum which does not implement any interface.

Version 1.0 of the extension:

```AL
enum 50100 MyEnum
{
    Extensible = true;

    value(0; MyValue) { }
}
```

Version 2.0 of the extension:

```AL
interface MyInterface
{
    procedure MyProcedure();
}

codeunit 50100 MyImplementation implements MyInterface
{
    procedure MyProcedure();
    begin
    end;
}

enum 50100 MyEnum implements MyInterface
{
    Extensible = true;

    value(0; MyValue)
    {
        Implementation = MyInterface = MyImplementation;
    }
}
```

In version 2.0, the enum implements am interface. If a dependent extension extends this enum, this will lead to a compilation error similar to `Value 'MyExtValue' does not implement interface 'MyInterface' and there is no default implementation for the mentioned interface. (AL0596)`.

For example, the following extension compiles when depending on version 1.0, but fails to compile with version 2.0:

```AL
enumextension 50100 MyEnumExtension extends MyEnum
{
    value(50100; MyExtValue) { }
}
```

## Code example not triggering the rule

Version 1.0 of the extension:

```AL
enum 50100 MyEnum
{
    Extensible = true;

    value(0; MyValue) { }
}
```

Version 2.0 of the extension:

```AL
interface MyInterface
{
    procedure MyProcedure();
}

codeunit 50100 MyImplementation implements MyInterface
{
    procedure MyProcedure();
    begin
    end;
}

enum 50100 MyEnum implements MyInterface
{
    Extensible = true;
    DefaultImplementation = MyInterface = MyImplementation;

    value(0; MyValue)
    {
        Implementation = MyInterface = MyImplementation;
    }
}
```

In version 2.0, the enum specifies a default implementation which will prevent compilation errors for dependent extensions extending this enum.

## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  