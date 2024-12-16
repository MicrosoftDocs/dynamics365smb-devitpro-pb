---
title: "AppSourceCop Error AS0029"
description: "Pages and PageExtensions that have been published must not be deleted."
ms.author: solsen
ms.date: 09/27/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
ai-usage: ai-assisted
ms.custom:
 - ai-gen-docs-bap
 - ai-seo-date: 10/01/2024
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Error AS0029
Pages and PageExtensions that have been published must not be deleted, since dependent extensions may break

## Description
Pages and PageExtensions that have been published must not be deleted.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

It's not allowed to remove pages which have been published unless they have been marked as [Obsolete](../properties/devenv-obsoletestate-property.md). This will break dependent extensions which:

- are referencing this page from code,
- are extending the page using a page extension,
- are customizing the page using page customizations.

> [!NOTE]  
> If a page coming from a dependency has been removed, AppSourceCop allows the removal of page extensions extending it even if these page extensions have not been previously marked as [Obsolete](../properties/devenv-obsoletestate-property.md).

## How to fix this diagnostic?

In order to fix this diagnostic, the removal of the page extension must be reverted. The page extension should also be marked as [Obsolete](../properties/devenv-obsoletestate-property.md) instead, so that the page extension can be removed in a future version.

## Examples not triggering the rule

### Example 1 - Removing an obsolete page extension

Version 1.0 of the extension:
```AL
pageextension 50100 MyCustomerCardExt extends "Customer Card"
{
    // Some changes on the page.
}
```

Version 2.0 of the extension:
```AL
pageextension 50100 MyCustomerCardExt extends "Customer Card"
{
    ObsoleteState = Pending;

    // Some changes on the page.
}
```

Once dependent extensions have been updated to not reference the page extension anymore, the page extension can be removed.

Version 3.0 of the extension:
```AL
// Page extension has been removed
```

### Example 2 - Removing a page extension targeting a removed page

Version 1.0 of the extension:
```AL
pageextension 50100 MyCustomerCardExt extends "Customer Card"
{
    // Some changes on the page.
}
```

Let's consider that between version 1.0, the dependency defining "Customer Card" has removed the page. Removing the page extension is then allowed.

Version 2.0 of the extension:
```AL
// Page extension has been removed
```

## Examples of errors for dependent extensions

The following examples show some of the compilation errors that will be reported on dependent extensions if a page is removed from one version to another.

Version 1.0 of the extension defines a page named MyPage. Version 2.0 does not define this page anymore.

### Example 1 - Extensions referencing this page using a variable

If a dependent extension references this page from code, when compiling against version 2.0, this will lead to a compilation error similar to `Page 'MyPage' is missing (AL0185)`.

```AL
codeunit 50100 SomeCodeunit
{
    procedure SomeProcedure()
    var
        p: Page MyPage;
    begin
    end;
}
```

### Example 2 - Extensions running this page from code

If a dependent extension runs this page from code, when compiling against version 2.0, this will lead to a compilation error similar to `'Page' does not contain a definition for 'MyPage' (AL0132)`.

```AL
codeunit 50100 SomeCodeunit
{
    procedure SomeProcedure()
    begin
        Page.Run(Page::MyPage);
    end;
}
```

### Example 3 - Extensions running this page from an action

If a dependent extension references this page from an action, when compiling against version 2.0, this will lead to a compilation error similar to `Page 'MyPage' is missing (AL0185)`.

```AL
    action(ActionName)
    {
        RunObject = page MyPage;
    }
```

### Example 4 - Extensions extending or customizing this page

If a dependent extension extends or customizes this page, when compiling against version 2.0, this will lead to a compilation error similar to `The target Page MyPage for the extension object is not found (AL0247)`.

```AL
pageextension 50100 MyExtension extends MyPage
{
    // Some additional changes on the page.
}
```

## Related information

[AppSourceCop Analyzer](appsourcecop.md)  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
