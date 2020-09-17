---
title: "Pragma Warning Directive in AL"
description: "The pragma warning instruction on the pragma directive in AL"
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 08/19/2020
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Pragma Warning Directive

[!INCLUDE[2020_releasewave2](../../includes/2020_releasewave2.md)]

The `#pragma warning` instruction can disable certain warnings. This can be used as a solution to avoid getting warnings on, for example, string length on fields that you cannot change. With the `#pragma warning disable` statement you disable the emit of the warning for a specific location in code, and with `#pragma warning restore` you restore the warning back to it's original state. If you do not `restore`, the `disable` instruction is valid for the rest of the file.

> [!IMPORTANT]  
> It is important to be aware that most warnings are there for a reason, and suppressing them could lead to sudden impact if warnings are changed to errors, such as obsoletes. 

## Syntax

```
#pragma warning disable warning-list  
```

```
#pragma warning restore warning-list  
```

## Parameters

*warning-list* 
A comma-separated list of warning numbers.

When no warning numbers are specified, `disable` disables all warnings and `restore` enables all warnings.

> [!NOTE]  
> To find warning numbers in AL, build your AL project in Visual Studio Code and then look for the warning numbers in the **Output** window.

## Example

The following example illustrates how the specific rule `AL0468` is temporarily turned off for a specific field definition.

```
table 50110 MyTable
{
    fields
    {
        #pragma warning disable AL0468
        field(1; TableWithLongIdentifierThatExceedsOurMax; Integer) { }
        #pragma warning restore
    }
}
```

## See Also

[Development in AL](../devenv-dev-overview.md)  
[AL Development Environment](../devenv-reference-overview.md)  
[Deprecating Explicit and Implicit With Statements](../devenv-deprecating-with-statements-overview.md)
