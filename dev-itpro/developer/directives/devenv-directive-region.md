---
title: Region directive in AL
description: The region directive in AL for Business Central.
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 03/19/2024
ms.topic: conceptual
ms.author: solsen
---

# Region directive in AL

[!INCLUDE[2020_releasewave2](../../includes/2020_releasewave2.md)]

## Region

The `#region` directive is used to mark a block of code that you can expand or collapse. This can, for example, be useful for larger files for better readability or for focusing on code that you're currently working on. The `#endregion` specifies the end of a `#region` block of code. 

> [!NOTE]  
> On the first line of the `#region` a text comment can be added to describe the purpose of the block of code, see the following example.

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
#region Ugly code - let's not look at this
    procedure UglyCode()
    begin
        // No one should look at this
    end;
#endregion
```

## See also

[Development in AL](../devenv-dev-overview.md)  
[AL development environment](../devenv-reference-overview.md)  
[Pragma directive in AL](devenv-directive-pragma.md)  
[Conditional directives](devenv-directives-in-al.md#conditional-directives)  
[Deprecating explicit and implicit with statements](../devenv-deprecating-with-statements-overview.md)