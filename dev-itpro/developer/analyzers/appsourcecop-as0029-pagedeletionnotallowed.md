---
title: "Pages and PageExtensions that have been published must not be deleted, since dependent extensions may break"
ms.author: solsen
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Rule AS0029
Pages and PageExtensions that have been published must not be deleted, since dependent extensions may break  

## Description
Pages and PageExtensions that have been published must not be deleted.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

It is not allowed to remove pages which have been published. This will break dependent extensions which:
- are referencing this page from code,
- are extending the page using a page extension,
- are customizing the page using page customizations.

## How to fix this diagnostic

Revert the change by adding the page back and marking it as [Obsolete](../properties/devenv-obsoletestate-property.md).

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

## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
