---
title: "Directives in AL"
description: 
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 04/08/2020
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Directives in AL

Anything can be made conditional, also table fields. Symbols can be defined in the manifest or in the beginning of a source file. There are currently no built-in symbols.

<!-- There is a server side check-in that create ParseOptions from manifest and it when parsing up syntax trees. -->

The following AL preprocessor directives are supported. For examples, see the [Examples](devenv-directives-in-al-md#Examples) section below.

|Preprocessor directive |Description |
|-----------------------|------------|
|#if                    | Specifies the start of a conditional clause. The #endif clause ends it. Compiles the code between the directives if the specified symbol is defined. |
|#else                  | Specifies a compound conditional clause. If none of the preceding clauses evaluates to `true`, the compiler will evaluate code between #else and #endif. |
|#elif                  | Combines `else` and `if`. If `#elif` is `true` the compiler evaluates all code between `#elif` and the next conditional directive.|
|#endif                 |  |
|#define                |  |
|#undef                 |  |
|#warning               |  |
|#error                 |  |
|#line                  |  |
|#region                |  |
|#endregion             |  |
|#pragma                |  |
|#disable               |  |
|#restore               |  |
|#enable                |  |

## Examples

### Region support

#region Ugly stuff - not written by me, of course
    procedure UglyCode()
    begin
        // No one should look at this
    end;
#endregion

## Warning suppression

table 50110 MyTable
{
    fields
    {
#pragma warning disable AL0468         
        field(1; TableWithLongIdentifierThatExceedsOurMax; Integer) { }
#pragma warning restore        
    }
}

## Conditional code

#if DEBUG
    trigger OnOpenPage()
    begin
        Message('Only in debug versions');
    end;
#endif

