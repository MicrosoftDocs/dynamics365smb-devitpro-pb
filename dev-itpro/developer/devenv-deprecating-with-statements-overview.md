---
title: "Deprecating Explicit and Implicit With Statements"
ms.custom: na
ms.date: 09/03/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# Deprecating Explicit and Implicit With Statements

The extensibility model and the AL programming language is a successor to the C/AL language. And the `with` statement has up until now been supported in AL.

Using the `with` statement might make code harder to read, but it can also prevent code in Business Central online from being upgraded without changes to the code or even worse - upgraded but with changed behavior.

## Explicit with - simple example

The following example illustrates code written using the `with` statement; referred to in this context as the explicit `with`.

```
codeunit 50140 MyCodeunit
{
    procedure DoStuff()
    var
        Customer: Record Customer;
    begin
        with Customer do begin
            // Do some work on the Customer record.
            Name := 'Foo';

            if IsDirty() then 
                Modify();
        end;
    end; 

    local procedure IsDirty(): Boolean;
    begin
        exit(false);
    end;
}
```

The `DoStuff()` procedure processes work on the Customer record and calls a local procedure `IsDirty()` to check whether to update the record or not. Looking at the code above it looks like it does nothing since `IsDirty()` returns `false` - assuming that the `IsDirty()` call in line 11 is in fact calling the local `IsDirty()` procedure.

In [!INCLUDE[prodshort](includes/prodshort.md)] online your code is recompiled when the platform and application are upgraded. The recompilation ensures that it is working and it regenerates the runtime artifacts to match the new platform. Breaking changes without due warning are not allowed, but the use of the `with` statement makes it impossible, as Microsoft, to make even additive changes in a completely non-breaking way. This problem is not isolated to changes made by Microsoft, any additive change has the potential to break a `with` statement in consuming code.

## Symbol lookup

Considering the above code sample again, what would happen to that code if `IsDirty` was added to the base application between two releases? To understand that we need to take a look at how compilers turn syntax into symbols. When the AL compiler meets the `IsDirty` call it must bind the syntax name to a procedure symbol.

When the AL compiler searches for the symbol `IsDirty()` in the sample above it will search in following order:

1. Customer table
    - User-defined members on the Customer table and Customer table extensions
    - Platform-defined members, for example, `FindFirst()` or `Modify()`.
2. MyCodeunit codeunit
    - User-defined members, for example, `IsDirty()`
    - Platform-defined members
3. Globally defined members

The first time the search for `IsDirty` finds the name IsDirty, it will not continue to the next top-level group. That means that if a procedure named `IsDirty` is introduced in the Customer table (platform or application) that procedure will be found instead of the procedure in `MyCodeunit`.

The solution for the *explicit* `with` is to stop using it. Using the `with` statement can make your code vulnerable to upstream changes. The example below illustrates how to rewrite the [Simple Example](devenv-deprecating-with-statements-overview.md#explicit-with-simple-example):

``` 
// Safe version
codeunit 50140 MyCodeunit
{
    procedure DoStuff()
    var
        Customer: Record Customer;
    begin
        // Do some work on the Customer record.
        Customer.Name := 'Foo';

        if IsDirty() then 
            Customer.Modify();
    end; 

    local procedure IsDirty(): Boolean;
    begin
        exit(false);
    end;
} 
```




## See Also

[AL Development Environment](devenv-reference-overview.md)  
[Developing Extensions in AL](devenv-dev-overview.md)  
[Directives in AL](directives/devenv-directives-in-al.md)  
[Pragma Directive](directives/devenv-directive-pragma.md)  
[Pragma ImplicitWith](directives/devenv-directive-pragma-implicitwith.md)  