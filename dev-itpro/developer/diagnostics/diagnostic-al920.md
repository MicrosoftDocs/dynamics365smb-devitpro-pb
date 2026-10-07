---
title: "Compiler Warning (future error) AL0920"
description: "The method '{0}' cannot be used as the implementation for the interface method '{1}' because it is not public."
ms.author: solsen
ms.date: 10/01/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Compiler Warning (future error) AL0920

[!INCLUDE[banner_preview](../includes/banner_preview.md)]

The method '{0}' cannot be used as the implementation for the interface method '{1}' because it is not public.

> [!IMPORTANT]
> This warning will become an error with Business Central 2027 release wave 1.  

## Description
Interface implementations must be publicly accessible because interfaces can be invoked across module boundaries. Non-public methods will not be dispatched correctly at runtime.  

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This diagnostic is currently a warning but will become an error in a future version (runtime 17.0 / Spring 2027). Interface methods are called through an interface variable, which can be passed across module boundaries. If the implementing method is `local` or `internal`, the runtime cannot always dispatch the call correctly.

> [!IMPORTANT]
> This warning will become error [AL0921](diagnostic-al921.md) in a future runtime version. Update your code now to avoid a breaking change.

## How to fix it

Change the accessibility of the implementing method to `public` by removing the `local` or `internal` access modifier.

## Example of code that triggers AL0920

```al
interface IMyInterface
{
    procedure Calculate(): Integer;
}

codeunit 50100 MyCodeunit implements IMyInterface
{
    // This triggers AL0920 because the method is local,
    // but it implements an interface method that must be public.
    internal procedure Calculate(): Integer;
    begin
        exit(42);
    end;
}
```

## Example of how to fix it

Make the implementing method public.

```al
interface IMyInterface
{
    procedure Calculate(): Integer;
}

codeunit 50100 MyCodeunit implements IMyInterface
{
    procedure Calculate(): Integer;
    begin
        exit(42);
    end;
}
```

## Related information
[Getting started with AL](../devenv-get-started.md)  
[Developing extensions](../devenv-dev-overview.md)  
[Interfaces in AL](../devenv-interfaces-in-al.md)  
[Compiler Error AL0921](diagnostic-al921.md)  

