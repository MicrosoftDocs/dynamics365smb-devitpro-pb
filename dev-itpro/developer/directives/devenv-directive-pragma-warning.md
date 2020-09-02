---
title: "Pragma Warning Directive in AL"
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

# Pragma Warning Directive

[!INCLUDE[2020_releasewave2](../../includes/2020_releasewave2.md)]

The `#pragma warning` instruction can enable or disable certain warnings. This can be used as a solution to avoid getting warnings on, for example, string length on fields that you cannot change. With the `#pragma warning disable` statement you disable the emit of the warning for a specific location in code, and with `#pragma warning restore` you restore the warning back to it's original state. If you do not `restore` the `disable` instruction is valid for the rest of the file.

## Syntax

```
#pragma warning disable warning-list  
#pragma warning restore warning-list  
```

## Parameters

*warning-list* 
A comma-separated list of warning numbers.

When no warning numbers are specified, `disable` disables all warnings and `restore` enables all warnings.

> [!NOTE]  
> To find warning numbers in AL, build your project in Visual Studio Code and then look for the warning numbers in the **Output** window.


## Example

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