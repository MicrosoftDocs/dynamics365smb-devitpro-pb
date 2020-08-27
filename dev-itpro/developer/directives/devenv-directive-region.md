---
title: "Region Directive in AL"
description: 
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

The `#region` directive is used to mark a block of code that you can expand or collapse. This can, for example, be useful for larger files for better readability or for focusing on code that you're currently working on. The `#endregion` specifies the end of a `#region` block of code.

## Syntax

## Example

```
#region Ugly code - let's not look at this
    procedure UglyCode()
    begin
        // No one should look at this
    end;
#endregion
```

## Remarks

A `#region` block must be terminated with a `#endregion` directive.

A `#region` block cannot overlap with a `#if` block. However, a `#region` block can be nested in a `#if` block, and a `#if` block can be nested in a `#region` block.

## See Also

[Development in AL](devenv-dev-overview.md)  
[AL Development Environment](devenv-reference-overview.md)