---
title: "UICop Warning AW0014"
description: "ActionRefs whose target actions are defined in a hidden group are still rendered on the promoted section of the command bar, but this behavior might change and these action refs might be hidden in the future."
ms.author: solsen
ms.custom: na
ms.date: 06/15/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# UICop Warning AW0014
Groups containing ActionRef targets should not be hidden.

## Description
Actionrefs whose target actions are defined in a hidden group are still rendered on the promoted section of the command bar, but this behavior might change and these actionrefs might be hidden in the future. If you want to see these actions in the default section of the command bar, remove the Visible property on the group. If you do not want to see these actions on the promoted section of the command bar, remove the actionrefs.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Code example triggering the rule

The following code triggers a diagnostic from this rule because `MyGroup` is hidden, but `MyPromotedAction` is the target of an ActionRef.

```al
page 50100 MyPage
{
    actions
    {
        area(Promoted)
        {
            actionref(MyActionRef; MyPromotedAction)
            {
            }
        }
        area(Creation)
        {
            group(MyGroup)
            {
                Visible = false;

                action(MyPromotedAction)
                {
                }
            }
        }
    }
}
```

The visibility of actionrefs depend on the visibility of their target actions. If the target action's Visible property is set to false, then the actionref is hidden too.

However, actionrefs actions are currently rendered on the promoted section of the command bar based on the Visible property set on the action and on the actionref, without considering the actual visibility of their target action in the default section of the command bar.

`MyPromotedAction` doesn't have the visible property set, so it's visible by default and the promoted action will be rendered in the promoted section of the command bar. However, since `MyGroup` is not visible, `MyPromotedAction` will also not be visible in the default section of the command bar.

> [!NOTE]  
> A similar behavior can be achieved by using the [PromotedOnly](..\properties\devenv-promotedonly-property.md) property on `MyPromotedAction`.

## How to fix this diagnostic?

There are three ways to fix this diagnostic depending on what you want to achieve:

### 1. Make the action group visible

```al
page 50100 MyPage
{
    actions
    {
        area(Promoted)
        {
            actionref(MyActionRef; MyPromotedAction)
            {
            }
        }
        area(Creation)
        {
            group(MyGroup)
            {
                action(MyPromotedAction)
                {
                }
            }
        }
    }
}
```

There's no impact on the promoted section of the command bar as the actionref remains visible. However, promoted actions and non-promoted actions become visible in the default section of the command bar.  

Use this approach if you want the group and its actions to be visible.

### 2. Remove the actionrefs for the actions in the group

```al
page 50100 MyPage
{
    actions
    {
        area(Creation)
        {
            Visible = false;

            group(MyGroup)
            {
                action(MyPromotedAction)
                {
                }
            }
        }
    }
}
```

There's no impact on the default section of the command bar since all actions remain hidden by the group. However, the actionref does not appear in the promoted section of the command bar anymore. Use this approach if you didn't expect `MyPromotedAction` to appear in the promoted section of the command bar and you want to hide it completely. 

Remark, in order to be compliant with the breaking change validation from the [AppSourceCop](appsourcecop.md), the following change is recommended:

```al
page 50100 MyPage
{
    actions
    {
        area(Promoted)
        {
            actionref(MyActionRef; MyPromotedAction)
            {
                Visible = false;
                ObsoleteState = Pending;
                ObsoleteReason = 'Will be removed in a future version';
            }
        }
        area(Creation)
        {
            Visible = false;

            group(MyGroup)
            {
                action(MyPromotedAction)
                {
                }
            }
        }
    }
}
```




## See Also  
[UICop Analyzer](uicop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  