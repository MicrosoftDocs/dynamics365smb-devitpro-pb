---
title: "Compiler Information AL0925"
description: "Interface '{0}' provides a default implementation for method '{1}'."
ms.author: solsen
ms.date: 08/31/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Compiler Information AL0925

[!INCLUDE[banner_preview](../includes/banner_preview.md)]

Interface '{0}' provides a default implementation for method '{1}'. Override it to customize the behavior.

## Description
An interface method has a default implementation and is not implemented by the codeunit. You can override it to provide a custom implementation. Implement it to avoid missing out on a new feature.  

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

When an interface method has a default implementation (a body), implementing codeunits are not required to override it. The default implementation is used as a fallback. This informational diagnostic lets you know that optional methods exist and provides an opportunity to override them with custom behavior tailored to your needs.

This diagnostic has `Information` severity and does not prevent compilation. It serves as a notification to help implementors discover new optional functionality added to interfaces they implement.

## How to fix it

If you want to provide custom behavior, add an explicit implementation of the method in your codeunit. If the default behavior is sufficient, you can safely ignore this diagnostic or suppress it with a pragma.

## Example of code that triggers AL0925

Given an interface in a dependency module:

```al
interface ILogger
{
    procedure LogError(message: Text);

    procedure LogWarning(message: Text);
    begin
        // Default: treat warnings as errors
        LogError(message);
    end;
}
```

The following codeunit triggers AL0925 because it does not override `LogWarning`:

```al
codeunit 50100 MyLogger implements ILogger
{
    procedure LogError(message: Text);
    begin
        // Error logging logic
    end;

    // Info AL0925: ILogger defines optional method 'LogWarning' with a default
    // implementation that is not overridden.
}
```

## Example of how to fix it

Override the optional method to provide custom behavior.

```al
codeunit 50100 MyLogger implements ILogger
{
    procedure LogError(message: Text);
    begin
        // Error logging logic
    end;

    procedure LogWarning(message: Text);
    begin
        // Custom warning logging logic - separate from errors
    end;
}
```

Alternatively, if the default behavior is acceptable, suppress the diagnostic:

```al
#pragma warning disable AL0925
codeunit 50100 MyLogger implements ILogger
#pragma warning restore AL0925
{
    procedure LogError(message: Text);
    begin
        // Error logging logic
    end;
}
```

## Related information
[Getting started with AL](../devenv-get-started.md)  
[Developing extensions](../devenv-dev-overview.md)  
[Interfaces in AL](../devenv-interfaces-in-al.md)  
[Compiler Warning AL0924](diagnostic-al924.md)  
