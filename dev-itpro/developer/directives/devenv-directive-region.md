---
title: "Region Directive in AL"
description: "The region directive in AL for Business Central"
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 08/19/2020
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Region Directive in AL

[!INCLUDE[2020_releasewave2](../../includes/2020_releasewave2.md)]

## Region

The `#region` directive is used to mark a block of code that you can expand or collapse. This can, for example, be useful for larger files for better readability or for focusing on code that you are currently working on. The `#endregion` specifies the end of a `#region` block of code.

## Syntax

```
#region code
```

```
#endregion
```

## Remarks

A `#region` block must be terminated with a `#endregion` directive.

A `#region` block cannot overlap with an `#if` block. However, a `#region` block can be nested in an `#if` block, and an `#if` block can be nested in a `#region` block.

## Example

In this example the `#region` directive makes a code block that is up for refactoring collapsible.

```
#region Ugly code - let's not look at this
    procedure UglyCode()
    begin
        // No one should look at this
    end;
#endregion
```

## See Also

[Development in AL](../devenv-dev-overview.md)  
[AL Development Environment](../devenv-reference-overview.md)  
[Pragma Directive in AL](devenv-directive-pragma.md)  
[Deprecating Explicit and Implicit With Statements](../devenv-deprecating-with-statements-overview.md)