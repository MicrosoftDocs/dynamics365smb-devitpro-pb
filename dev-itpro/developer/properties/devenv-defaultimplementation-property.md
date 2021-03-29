---
title: "DefaultImplementation Property"
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
# DefaultImplementation Property
> **Version**: _Available or changed with runtime version 5.0._

Specifies the default implementer for the enum value if there is no explicit implementer set for the value. 

## Applies to
-   Enum Type

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Syntax

```al
DefaultImplementation = Interface = InterfaceImplementation;

```

## Example

The following example illustrates different implementations of the `IFoo` interface. `SomeEnum` has `DefaultImplementation` set to catch the case where some extension uses an enum value that does not implement the `IFoo` interface.

```al
pageextension 50130 CustListExt extends "Customer List"
{

    trigger OnOpenPage()
    var
        ifoo: Interface IFoo;
        e: enum SomeEnum;
    begin
        e := SomeEnum::Yes;
        ifoo := e;
        ifoo.Foo(); // => YesFooImpl specified in Implementation on Yes value

        e := SomeEnum::No;
        ifoo := e;
        ifoo.Foo(); // => DefaultFooImpl specified in DefaultImplementation

        e := 2; // No enum value matches this.
        ifoo := e;
        ifoo.Foo(); // => UnknownFooImpl specified in UnknownImplementation
    end;
}

interface IFoo
{
    procedure Foo();
}

codeunit 50145 ErrorFooImpl implements IFoo
{
    procedure Foo()
    begin
        Message('Bad FOO')
    end;
}

codeunit 50146 DefaultFooImpl implements IFoo
{
    procedure Foo()
    begin
        Message('Default FOO')
    end;
}

codeunit 50147 YesFooImpl implements IFoo
{
    procedure Foo()
    begin
        Message('Yes FOO')
    end;
}

enum 50135 SomeEnum implements IFoo
{
    Extensible = true;
    UnknownValueImplementation = IFoo = ErrorFooImpl;
    DefaultImplementation = IFoo = DefaultFooImpl;

    value(0; Yes)
    {
        Implementation = IFoo = YesFooImpl;
    }
    value(1; No)
    {
        // Nothing specified. Using defaults
    }
}

```

## Remarks

Adding a new interface to an existing, extensible enum, requires that all extensions of that enum provide an implementations for the interface, which is a breaking change. Providing a default implementation by using the `DefaultImplementation` property can be used to make such new additions non-breaking.

Related to `DefaultImplementation` is the `UnknownValueImplementation` property, used for handling unknown enum values. For more information, see [UnknownValueImplementation Property](devenv-defaultimplementation-property.md).


## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  