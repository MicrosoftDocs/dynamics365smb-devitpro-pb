---
title: "UnknownValueImplementation Property"
ms.author: solsen
ms.custom: na
ms.date: 01/26/2021
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
# UnknownValueImplementation Property
> **Version**: _Available or changed with runtime version 7.0._

Specifies the implementers used for ordinal values that are not included in the defined list of enum values.

## Applies to
-   Enum Type

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Syntax

```al
UnknownValueImplementation = 

```

## Example

```al
pageextension 50130 CustListE extends "Customer List"
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
    UnknownImplementation = IFoo = ErrorFooImpl;
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

Enums can be used to select an interface implementation. However, due to the plugable nature, an enum extension (and its corresponding interface implementation) could have been uninstalled from the tenant, while the setting for the enum is kept, now pointing to an "unknown" value.

Instead of having app code add validation logic for handling this scenario, the platform should catch when an invalid enum value is provided, and allow for an extensible way to handle that

This is related to, but not the same as, fallback to default value (which is used when no enum value is provided)

## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  