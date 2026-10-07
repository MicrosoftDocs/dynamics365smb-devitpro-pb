---
title: Region Directives for Organizing AL Code
description: Learn how to use the region directive in AL to organize code into collapsible blocks and improve readability in Microsoft Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.date: 10/05/2026
ms.topic: concept-article
ms.author: solsen
ms.reviewer: solsen
---

# Organize AL code with region directives

[!INCLUDE[2020_releasewave2](../../includes/2020_releasewave2.md)]

## Organize code into regions

Use the `#region` directive to mark a block of code that you can expand or collapse. Regions can improve readability in large files and help you focus on the code you're currently editing. The `#endregion` directive specifies the end of a `#region` block.

> [!NOTE]  
> Add a comment after the `#region` directive to describe the code block, as shown in the following example.

## Syntax

```AL
#region [comment]
    code
```

```AL
#endregion
```

## Remarks

A `#region` block must be terminated with a `#endregion` directive.

A `#region` block can't overlap with an `#if` block. However, a `#region` block can be nested in an `#if` block, and an `#if` block can be nested in a `#region` block.

## Example

In this example, the `#region` directive makes a code block that is up for refactoring collapsible.

```AL
#region Refactoring candidate
    procedure CalculateLegacyValue()
    begin
        // Refactor this implementation.
    end;
#endregion
```

## Related information

[Development in AL](../devenv-dev-overview.md)  
[AL development environment](../devenv-reference-overview.md)  
[Pragma directive in AL](devenv-directive-pragma.md)  
[Conditional directives](devenv-directives-in-al.md#conditional-directives)  
[Deprecating explicit and implicit with statements](../devenv-deprecating-with-statements-overview.md)
