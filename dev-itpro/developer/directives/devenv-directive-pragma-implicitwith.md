---
title: Pragma ImplicitWith Directive in AL
description: Learn how the pragma implicitwith directive controls implicit record contexts in AL and supports code migration in Microsoft Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.date: 10/05/2026
ms.topic: concept-article
ms.author: solsen
ms.reviewer: solsen
---

# Control implicit with contexts by using a pragma

[!INCLUDE[2020_releasewave2](../../includes/2020_releasewave2.md)]

The `#pragma implicitwith` directive controls whether the compiler creates an implicit `with` context. Place the directive before an object declaration. By using `#pragma implicitwith disable`, unqualified references that rely on an implicit record no longer resolve and must be qualified, for example with `Rec.`. The setting applies to following object declarations until another `#pragma implicitwith` directive changes or restores it.

In the `app.json` file, you can set the `NoImplicitWith` flag to disable implicit `with` when you rewrite all code. Learn more about configuring compiler features in [JSON files](../devenv-json-files.md#appjson-file).

> [!NOTE]  
> By using [!INCLUDE[prod_short](../../includes/prod_short.md)] 2022 release wave 2, the **AL: Go!** template adds `NoImplicitWith` to the `features` property in the generated `app.json` file. This setting disables implicit `with` contexts and requires affected references to be qualified.

> [!IMPORTANT]  
> The compiler warns that implicit `with` will be removed in the future. Treat this directive as a temporary migration aid and qualify affected references. Learn more in [Deprecating explicit and implicit with statements](../devenv-deprecating-with-statements-overview.md).

## Syntax

```AL
#pragma implicitwith enable
```

```AL
#pragma implicitwith disable
```

```AL
#pragma implicitwith restore
```

`enable` enables implicit-with binding, even when `NoImplicitWith` is set globally. `disable` disables implicit-with binding. `restore` returns to the setting specified by the extension's compiler features.

## Example

Learn more about updating affected code in [Deprecating explicit and implicit with statements](../devenv-deprecating-with-statements-overview.md).

## Related information

[Development in AL](../devenv-dev-overview.md)  
[AL development environment](../devenv-reference-overview.md)  
[Pragma directive in AL](devenv-directive-pragma.md)  
[Conditional directives](devenv-directives-in-al.md#conditional-directives)  
[Deprecating explicit and implicit with statements](../devenv-deprecating-with-statements-overview.md)
