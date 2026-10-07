---
title: Pragma Warning Directive in AL
description: Learn how to use the pragma warning directive in AL to suppress and restore configurable compiler warnings in Microsoft Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.date: 10/05/2026
ms.topic: concept-article
ms.author: solsen
ms.reviewer: solsen
---

# Control AL compiler warnings with pragma directives

[!INCLUDE[2020_releasewave2](../../includes/2020_releasewave2.md)]

The `#pragma warning disable` directive suppresses specified compiler warnings from its location until a matching `#pragma warning restore` directive or the end of the file. If you omit the warning list, the directive applies to all configurable warnings.

> [!IMPORTANT]  
> Suppress warnings only when you can't address their cause. A warning can become an error in a later release and break your extension.

## Syntax

```AL
#pragma warning disable warning-list  
```

```AL
#pragma warning restore warning-list  
```

## Parameters

*warning-list*

A comma-separated list of warning IDs or numeric warning codes, such as `AL0468, AL0604`.

When you don't specify warning IDs, `disable` suppresses all configurable warnings from that point forward. `restore` clears the pragma warning state and returns all warnings to their default or project-configured reporting state.

> [!NOTE]  
> To find warning IDs, build your AL project in Visual Studio Code and check the **Output** window. Learn more about code analysis in [Using the code analysis tool](../devenv-using-code-analysis-tool.md).

## Example

The following example illustrates how the specific rule `AL0468` is temporarily turned off for a specific field definition.

```AL
table 50110 MyTable
{
    fields
    {
        #pragma warning disable AL0468
        field(1; TableWithLongIdentifierThatExceedsOurMax; Integer) { }
        #pragma warning restore AL0468
    }
}
```

## Related information

[Development in AL](../devenv-dev-overview.md)  
[AL development environment](../devenv-reference-overview.md)  
[Pragma directive in AL](devenv-directive-pragma.md)  
[Conditional directives](devenv-directives-in-al.md#conditional-directives)  
[Deprecating explicit and implicit with statements](../devenv-deprecating-with-statements-overview.md)
