---
title: "Actions that have been published must not be deleted."
ms.author: solsen
ms.custom: na
ms.date: 06/19/2020
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
# AppSourceCop Rule AS0031
Actions that have been published must not be deleted.  

## Description
Actions that have been published must not be deleted, because it will break dependent extensions.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

Removing an action which has been published is not allowed because it will break dependent extensions which are referencing or modifying it.

> [!NOTE]  
> Renaming an action will also trigger this error. AppSourceCop will consider the renamed action as a new action, unrelated to the one defined in the previous version.

## How to fix this diagnostic

If the action was removed, revert the change by adding back the action and mark it as [Obsolete](../properties/devenv-obsoletestate-property.md).

If the action was renamed in order to change its display string in the web client, consider using the [Caption](../properties/devenv-caption-property.md) property instead.

If the action was renamed in order to comply with naming rules such as [AS0011](appsourcecop-as0011-identifiersmusthaveaffix.md), consider obsoleting the action and introducing a new one.

## Examples of errors for dependent extensions

The following examples show some of the compilation errors that will be reported on dependent extensions if an action is removed from one version to another.

Version 1.0 of the extension defines a page named MyPage that contains an action named MyAction. Version 2.0 does not define this action anymore.

### Example 1 - Extensions modify this action

If a dependent extension modifies this action in a page extension or customization, when compiling against version 2.0, this will lead to a compilation error similar to `The action 'MyAction' is not found in the target 'MyPage' (AL0271)`.

```
pageextension 50100 SomePageExtension extends MyPage
{
    actions
    {
        modify(MyAction)
        {
            Visible = true;
        }
    }
}
```

### Example 2 - Extensions referencing this action as an anchor for a change

If a dependent extension uses this action as an anchor for a change in a page extension or customization, when compiling against version 2.0, this will lead to a compilation error similar to `The action 'MyAction' is not found in the target 'MyPage' (AL0271)`.

```
pageextension 50100 SomePageExtension extends MyPage
{
    actions
    {
        addafter(MyAction)
        {
            action(SomeNewAction)
            {
            }
        }
    }
}
```

### Example 3 - Extensions moving this action

If a dependent extension is moving this action in a page extension or customization, when compiling against version 2.0, this will lead to a compilation error similar to `The action 'MyAction' is not found in the target 'MyPage' (AL0271)`.

```
pageextension 50100 SomePageExtension extends MyPage
{
    actions
    {
        movefirst(creation; MyAction)
    }
}
```

## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
