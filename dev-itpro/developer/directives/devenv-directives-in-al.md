---
title: AL Preprocessor Directives Overview
description: Learn how to use conditional, region, and pragma preprocessor directives and define symbols in AL for Microsoft Dynamics 365 Business Central extensions.
author: SusanneWindfeldPedersen
ms.date: 10/05/2026
ms.topic: concept-article
ms.author: solsen
ms.reviewer: solsen
---

# Use preprocessor directives in AL

[!INCLUDE[2020_releasewave2](../../includes/2020_releasewave2.md)]

Use AL preprocessor directives to compile code conditionally, suppress compiler warnings, and organize code into collapsible regions. AL supports the following groups of directives:

- [Conditional directives](devenv-directives-in-al.md#conditional-directives)
- [Regions](devenv-directive-region.md)
- [Pragmas](devenv-directive-pragma.md)

Any code can be made conditional, including table fields. A conditional directive evaluates a Boolean expression. The expression can contain defined or undefined symbols, the Boolean literals `true` and `false`, parentheses, and supported operators. A defined symbol evaluates to `true`, and an undefined symbol evaluates to `false`. Symbols defined in a source file have file scope. Symbols defined in the `app.json` file are available throughout the extension.

> [!NOTE]  
> Built-in symbols are currently not supported in AL. Symbols must be defined in a specific file or in the `app.json` file.

> [!NOTE]  
> Personalization and profile configuration ignore `#pragma`, `#region`, and `#endregion` directives. Unsupported conditional directives, such as `#if`, `#elif`, and `#define`, cause an error.

## Conditional directives

The following conditional preprocessor directives are supported in AL.

| Conditional preprocessor directive | Description |
|------------------------------------|-------------|
| `#if` | Starts a conditional clause. The `#endif` directive ends it. Includes the following code when its expression evaluates to `true`. |
| `#else` | Includes its code when no preceding branch in the conditional block evaluates to `true`. |
| `#elif` | Evaluates another expression when no earlier branch in the conditional block was selected. If the expression evaluates to `true`, its code is included until the next conditional directive. |
| `#endif` | Ends the conditional clause that begins with `#if`. |
| `#define` | Defines a symbol for use in conditional compilation. The symbol has file scope. For example, `#define DEBUG`. |
| `#undef` | Undefines a symbol. |

### Logical operators in conditional directives

Conditional expressions support `and`, `or`, `not`, equality (`=`), inequality (`<>`), and parentheses. `and` evaluates to `true` if both operands are true, `or` evaluates to `true` if at least one operand is true, and `not` negates the value of the operand.

## Defining and using preprocessor symbols

Preprocessor symbols in AL are boolean flags that are either defined (evaluating to `true`) or undefined (evaluating to `false`). Unlike some other languages, you can't assign specific values to symbols - they're simply on or off.

### Defining symbols globally in app.json

Symbols can be defined globally in the `app.json` file, making them available throughout your extension. The following example defines `DEBUG` and `PROD` as global symbols:

```json
{
  "preprocessorSymbols": [ "DEBUG", "PROD" ]
}
```

When you define symbols in `app.json`, they're available in every source file. A local `#undef` directive can make an `app.json` symbol undefined from that point forward in one file.

### Defining symbols in code

You can define symbols locally within a specific file by using the `#define` directive. Place `#define` and `#undef` directives before the first AL token in the file. Their effect is local to that file.

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

You can undefine a symbol by using `#undef`, which makes the symbol undefined from that point forward in the file.

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

Learn more about defining extension-wide symbols in [JSON files](../devenv-json-files.md).

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

### Example 4: Using custom build symbols

The compiler doesn't define environment symbols automatically. For each build configuration, add the appropriate custom symbol to `preprocessorSymbols` in `app.json`. The following cloud configuration defines `CLOUD`. For an on-premises configuration, replace `CLOUD` with `ONPREM`.

```json
{
  "preprocessorSymbols": [ "CLOUD" ]
}
```

```AL
codeunit 50103 EnvironmentSpecificCode
{
    trigger OnRun()
    begin
#if CLOUD
        Message('Run cloud-specific logic.');
#elif ONPREM
        Message('Run on-premises-specific logic.');
#else
        Message('Run default logic.');
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
        Message('Enable experimental features.');
#endif

#if PRODUCTION
        Message('Enable stable features.');
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
