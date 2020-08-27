---
title: "Preprocessor Directives in AL"
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

# Preprocessor Directives in AL

In AL, like in other programming languages, preprocessor directives can be used to make code conditional, to suppress warnings, or to enable expand and collapse in code. Preprocessor directives can be divided into the following groups:

- Conditional directives (for example, if/else)
- Regions (enables expand/collapse)
- Pragmas (for example, to suppress code warnings)

Any code can be made conditional, including table fields. Symbols are defined in the `app.json` file or at the beginning of a source file. 

> [!NOTE]  
> There are currently no built-in symbols in AL.

The following conditional AL preprocessor directives are supported. For examples, see the [Examples](devenv-directives-in-al-md#Examples) section below.

|Conditional preprocessor directive |Description |
|-----------------------|------------|
|#if                    | Specifies the start of a conditional clause. The `#endif` clause ends it. Compiles the code between the directives if the specified symbol is defined. |
|#else                  | Specifies a compound conditional clause. If none of the preceding clauses evaluates to `true`, the compiler will evaluate code between `#else` and `#endif`. |
|#elif                  | Combines `else` and `if`. If `#elif` is `true` the compiler evaluates all code between `#elif` and the next conditional directive.|
|#endif                 | Specifies the end of a conditional clause that starts with `#if`. |
|#define                | Defines a symbol that can be used to specify conditions for a compilation. For example, `#define DEBUG`. The scope of the symbol is the file that it was defined in.|
|#undef                 | Undefines a symbol.  |

## Defining symbols

Symbols can be defined globally in the `app.json` file. A symbol can also be defined using the `#define` directive in code, but if symbols are defined in the `app.json` file, they can be used globally. The following example defines `DEBUG` as a global symbol. This can then be used from code as illustrated in the [Conditional code](devenv-directives-in-al.md#conditional-code) example below.

```
"preprocessorSymbols": [ "DEBUG" ],
```
<!-- where do I define what DEBUG means? -->

<!-- document this in the app.json file too, with the different options -->

## Region

|Region preprocessor directive| Description|
|-----------------------------|------------|
|#region                | Specifies a block of code that you can expand or collapse. |
|#endregion             | Specifies the end of a #region block of code. |

## Pragma

|Pragma preprocessor directive| Description|
|-----------------------------|------------|
|#pragma                | Gives the compiler special instructions for the compilation of the file in which it appears. The `#pragma` directive has a number of actions; such as `disable`, `restore`, and `enable`.|


## Examples

### Region support

```
#region Ugly code - let's skip this
    procedure UglyCode()
    begin
        // No one should look at this
    end;
#endregion
```

## Warning suppression

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

## Conditional code

```
#if DEBUG
    trigger OnOpenPage()
    begin
        Message('Only in debug versions');
    end;
#endif

```

## See Also

[Development in AL](devenv-dev-overview.md)  
[AL Development Environment](devenv-reference-overview.md)