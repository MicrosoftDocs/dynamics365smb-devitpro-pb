---
title: Preprocessor directives in AL
description: The different types of preprocessor directives in AL; conditional, regions, and pragmas and preprocessorSymbols setting.
author: SusanneWindfeldPedersen
ms.date: 11/17/2025
ms.topic: concept-article
ms.author: solsen
ms.reviewer: solsen
---

# Preprocessor directives in AL

[!INCLUDE[2020_releasewave2](../../includes/2020_releasewave2.md)]

In AL, like in other programming languages, preprocessor directives can be used to make code conditional, to suppress warnings, or to enable the ability to expand and collapse in code. Preprocessor directives can be divided into the following groups. For more information about each type, use the links provided in the following section.

- [Conditional directives](devenv-directives-in-al.md#conditional-directives)
- [Regions](devenv-directive-region.md)
- [Pragmas](devenv-directive-pragma.md)

Any code can be made conditional, including table fields, and checked using a conditional directive. To check code using a conditional directive, you must define a symbol to check. A symbol returns a boolean value: `true` or `false`. Symbols can be defined at the beginning of a source file, where the scope of the specific symbol is in the file in which it is defined. You can also define symbols in the `app.json` file, and then the scope is global for the extension.

> [!NOTE]  
> Built-in symbols are currently not supported in AL. Symbols must be defined in a specific file or in the `app.json` file.

> [!NOTE]  
> User personalization and profile configuration (including profile copy) are not meant to work with directives, which means that they are ignored by the platform in the cases of #pragma, #region, #endregion and fail with an error when they are not supported for #if, #elif, #define, etc.

## Conditional directives

The following conditional preprocessor directives are supported in AL.

|Conditional preprocessor directive |Description |
|-----------------------|------------|
|#if                    | Specifies the beginning of a conditional clause. The `#endif` clause ends it. Compiles the code between the directives if the specified symbol being checked is defined. <br><br>  Inside the `#if` directive, you can use logical operators to create complex conditions. The supported logical operators are shown in the [next section](#logical-operators-in-conditional-directives). |
|#else                  | Specifies a compound conditional clause. If none of the preceding clauses evaluate to `true`, the compiler will evaluate code between `#else` and `#endif`. |
|#elif                  | Combines `else` and `if`. If `#elif` is `true` the compiler evaluates all code between `#elif` and the next conditional directive.|
|#endif                 | Specifies the end of a conditional clause that begins with `#if`. |
|#define                | Defines a symbol that can be used to specify conditions for a compilation. For example, `#define DEBUG`. The scope of the symbol is the file that it was defined in.|
|#undef                 | Undefines a symbol. |

### Logical operators in conditional directives

The operators `and`, `or`, and `not` are supported in conditional directives. `and` evaluates to `true` if both operands are true, `or` evaluates to `true` if at least one of the operands is true, and `not` negates the value of the operand.

## Defining and using preprocessor symbols

Preprocessor symbols in AL are boolean flags that are either defined (evaluating to `true`) or undefined (evaluating to `false`). Unlike some other languages, you can't assign specific values to symbols - they're simply on or off.

### Defining symbols globally in app.json

Symbols can be defined globally in the `app.json` file, making them available throughout your extension. The following example defines `DEBUG` and `PROD` as global symbols:

```json
{
  "preprocessorSymbols": [ "DEBUG", "PROD" ]
}
```

When symbols are defined in `app.json`, they're automatically set to `true` for the entire extension.

### Defining symbols in code

You can also define symbols locally within a specific file using the `#define` directive. The symbol will only be available in that file:

```AL
#define TESTING
#define FEATURE_ENABLED

codeunit 50100 MyCodeunit
{
    trigger OnRun()
    begin
#if TESTING
        Message('This code runs when TESTING is defined');
#endif
    end;
}
```

### Undefining symbols

You can undefine a symbol using `#undef`, which sets it to `false` from that point forward in the file:

```AL
#define DEBUG
// DEBUG is true here

#undef DEBUG
// DEBUG is now false here
```

### How symbols evaluate

- A **defined** symbol (either in `app.json` or via `#define`) evaluates to `true`
- An **undefined** symbol (never defined, or after `#undef`) evaluates to `false`
- Use `not` to check if a symbol is undefined: `#if not DEBUG`

Learn more in [JSON Files](../devenv-json-files.md).

## Examples

### Example 1: Simple conditional compilation

```AL
#define DEBUG

codeunit 50100 MyCodeunit
{
    trigger OnRun()
    begin
#if DEBUG
        Message('Only in debug versions');
#endif
    end;
}
```

### Example 2: Using symbols from app.json

If you define symbols in `app.json`:

```json
{
  "preprocessorSymbols": [ "PREMIUM_FEATURES" ]
}
```

You can then use them throughout your code:

```AL
table 50100 MyTable
{
    fields
    {
        field(1; "Basic Field"; Code[20]) { }
        
#if PREMIUM_FEATURES
        field(2; "Premium Field"; Code[20]) { }
#endif
    }
}
```

### Example 3: Multiple conditions with logical operators

```AL
#define DEBUG
#define TESTING

codeunit 50101 ConditionalCode
{
    trigger OnRun()
    begin
#if DEBUG and TESTING
        Message('Both DEBUG and TESTING are defined');
#elif DEBUG or TESTING
        Message('At least one is defined');
#else
        Message('Neither DEBUG nor TESTING is defined');
#endif
    end;
}
```

### Example 4: Environment-specific code

```AL
page 50100 MyPage
{
    trigger OnOpenPage()
    begin
#if CLOUD
        // Cloud-specific logic
        SetupCloudConnection();
#elif ONPREM
        // On-premises specific logic
        SetupOnPremConnection();
#else
        // Default behavior
        SetupStandardConnection();
#endif
    end;
}
```

### Example 5: Using not operator

```AL
#define PRODUCTION

codeunit 50102 FeatureToggle
{
    trigger OnRun()
    begin
#if not PRODUCTION
        // This code only runs when PRODUCTION is NOT defined
        EnableExperimentalFeatures();
#endif

#if PRODUCTION
        // This code only runs when PRODUCTION IS defined
        EnableStableFeatures();
#endif
    end;
}
```

## Related information

[Development in AL](../devenv-dev-overview.md)  
[AL development environment](../devenv-reference-overview.md)  
[Conditional directives](devenv-directives-in-al.md#conditional-directives)  
[Region directive in AL](devenv-directive-region.md)  
[Pragma directive in AL](devenv-directive-pragma.md)  
[Deprecating explicit and implicit with statements](../devenv-deprecating-with-statements-overview.md)  
[Best practices for deprecation of code in the Base App](../devenv-deprecation-guidelines.md)  
[ObsoleteState property](../properties/devenv-obsoletestate-property.md)  
[ObsoleteReason property](../properties/devenv-obsoletereason-property.md)  
[ObsoleteTag property](../properties/devenv-obsoletetag-property.md)  
[Obsolete attribute](../attributes/devenv-obsolete-attribute.md)  
