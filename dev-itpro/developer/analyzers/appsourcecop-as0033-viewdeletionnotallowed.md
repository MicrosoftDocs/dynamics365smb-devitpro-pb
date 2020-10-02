---
title: "Views that have been published must not be deleted."
ms.author: solsen
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Rule AS0033
Views that have been published must not be deleted.  

## Description
Views that have been published must not be deleted, because it will break dependent extensions.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks
Removing a view which has been published is not allowed because it will break dependent extensions which are referencing or modifying it.

> [!NOTE]  
> Renaming a view will also trigger this error. AppSourceCop will consider the renamed view as a new view, unrelated to the one defined in the previous version.

## How to fix this diagnostic

If the view was removed, revert the change by adding back the view and mark it as [Obsolete](../properties/devenv-obsoletestate-property.md).

If the view was renamed in order to change its display string in the web client, consider using the [Caption](../properties/devenv-caption-property.md) property instead.

If the view was renamed in order to comply with naming rules such as [AS0011](appsourcecop-as0011-identifiersmusthaveaffix.md), consider obsoleting the view and introducing a new one.

## Examples of errors for dependent extensions

The following examples show some of the compilation errors that will be reported on dependent extensions if a view is removed from one version to another.

Version 1.0 of the extension defines a list page named MyListPage that contains a view named MyView. Version 2.0 does not define this view anymore.

### Example 1 - Extensions modify this view

If a dependent extension modifies this view in a page extension or customization, when compiling against version 2.0, this will lead to a compilation error similar to `The view 'MyView' is not found in the target 'MyListPage' (AL0533)`.

```
pageextension 50100 SomePageExtension extends MyListPage
{
    views
    {
        modify(MyView)
        {
            Visible = true;
        }
    }
}
```

### Example 2 - Extensions referencing this view as an anchor for a change

If a dependent extension uses this view as an anchor for a change in a page extension or customization, when compiling against version 2.0, this will lead to a compilation error similar to `The view 'MyView' is not found in the target 'MyListPage' (AL0533)`.

```
pageextension 50100 SomePageExtension extends MyListPage
{
    views
    {
        addafter(MyView)
        {
            view(SomeNewView)
            {
            }
        }
    }
}
```

### Example 3 - Extensions moving this view

If a dependent extension is moving this view in a page extension or customization, when compiling against version 2.0, this will lead to a compilation error similar to `The view 'MyView' is not found in the target 'MyListPage' (AL0533)`.

```
pageextension 50100 SomePageExtension extends MyListPage
{
    views
    {
        movefirst(MyView)
    }
}
```

## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
