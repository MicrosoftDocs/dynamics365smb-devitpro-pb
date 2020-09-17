---
title: "Preprocessor Directives in AL"
description: "The different types of directives in AL; conditional, regions, and pragmas."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 08/19/2020
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Preprocessor Directives in AL

[!INCLUDE[2020_releasewave2](../../includes/2020_releasewave2.md)]

In AL, like in other programming languages, preprocessor directives can be used to make code conditional, to suppress warnings, or to enable expand and collapse in code. Preprocessor directives can be divided into the following groups. For more information about each type, use the links provided below.

- [Conditional directives](devenv-directives-in-al.md#conditional-directives)
- [Regions](devenv-directive-region.md)
- [Pragmas](devenv-directive-pragma.md)

Any code can be made conditional, including table fields, and checked using a conditional directive. To check code using a conditional directive, you must define a symbol to check. A symbol returns a boolean value; `true` or `false`. Symbols can be defined at the beginning of a source file and the scope of the specific symbol is the file that it is defined within. You can also define symbols in the `app.json` file, and then the scope is global for the extension.

> [!NOTE]  
> Built-in symbols are currently not supported in AL. Symbols must be defined in a specific file or in the `app.json` file.

## Conditional directives

The following conditional preprocessor directives are supported in AL.

|Conditional preprocessor directive |Description |
|-----------------------|------------|
|#if                    | Specifies the beginning of a conditional clause. The `#endif` clause ends it. Compiles the code between the directives if the specified symbol being checked is defined.|
|#else                  | Specifies a compound conditional clause. If none of the preceding clauses evaluates to `true`, the compiler will evaluate code between `#else` and `#endif`. |
|#elif                  | Combines `else` and `if`. If `#elif` is `true` the compiler evaluates all code between `#elif` and the next conditional directive.|
|#endif                 | Specifies the end of a conditional clause that begins with `#if`. |
|#define                | Defines a symbol that can be used to specify conditions for a compilation. For example, `#define DEBUG`. The scope of the symbol is the file that it was defined in.|
|#undef                 | Undefines a symbol. |

## Defining symbols

Symbols can be defined globally in the `app.json` file. A symbol can also be defined using the `#define` directive in code, but if symbols are defined in the `app.json` file, they can be used globally. The following example defines `DEBUG` as a global symbol. This can then be used from code as illustrated in the [Conditional code](devenv-directives-in-al.md#conditional-code) example below. A symbol has a boolean value, that means it evaluates to `true` or `false`.

```
"preprocessorSymbols": [ "DEBUG" ]
```

For more information, see [JSON Files](../devenv-json-files.md).

## Example

```
#if DEBUG
    trigger OnOpenPage()
    begin
        Message('Only in debug versions');
    end;
#endif

```

## See Also

[Development in AL](../devenv-dev-overview.md)  
[AL Development Environment](../devenv-reference-overview.md)  
[Conditional directives](devenv-directives-in-al.md#conditional-directives)  
[Region Directive in AL](devenv-directive-region.md)  
[Pragma Directive in AL](devenv-directive-pragma.md)  
[Deprecating Explicit and Implicit With Statements](../devenv-deprecating-with-statements-overview.md)