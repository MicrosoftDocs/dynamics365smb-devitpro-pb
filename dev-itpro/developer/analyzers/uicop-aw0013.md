---
title: "UICop Warning AW0013"
description: "Promoted actions defined in a hidden group are still rendered on the promoted section of the command bar, but this behavior might change and these promoted actions might be hidden in the future."
ms.author: solsen
ms.custom: na
ms.date: 07/06/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# UICop Warning AW0013
Groups containing promoted actions should not be hidden.

## Description
Promoted actions defined in a hidden group are still rendered on the promoted section of the command bar, but this behavior might change and these promoted actions might be hidden in the future. If you want to see these actions on the promoted side, remove the Visible property on the group and add 'PromotedOnly = true' on the promoted actions. If you do not want to see these actions on the promoted side, removed the Promoted property on the promoted actions.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Code example triggering the rule

The following code triggers a diagnostic from this rule because `MyGroup` is hidden, but `MyPromotedAction` is [Promoted](..\properties\devenv-promoted-property.md).

```al
page 50100 MyPage
{
    actions
    {
        area(Creation)
        {
            group(MyGroup)
            {
                Visible = false;

                action(MyPromotedAction)
                {
                    Promoted = true;
                }

                action(MyAction)
                {
                }
            }
        }
    }
}
```

Promoted actions are currently rendered on the promoted side of the action bar, based on the Visible property set on the action without considering their actual visibility on the right side of the action bar. 

`MyPromotedAction` doesn't have the visible property set, so it's visible by default and the promoted action will be rendered on the promoted side of the action bar. However, since `MyGroup` is not visible, `MyPromotedAction` will not be visible on the left side of the action bar.

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
        area(Creation)
        {
            group(MyGroup)
            {
                action(MyPromotedAction)
                {
                    Promoted = true;
                }

                action(MyAction)
                {
                }
            }
        }
    }
}
```

There's no impact on the promoted side of the action as promoted actions remain visible. However, promoted actions and non-promoted actions become visible on the right side of the action bar.  

You should then use this approach if you want the group and its actions to be visible.

### 2. Make the action group visible and adjust the properties of actions

```al
page 50100 MyPage
{
    actions
    {
        area(Creation)
        {
            group(MyGroup)
            {
                action(MyPromotedAction)
                {
                    Promoted = true;
                    PromotedOnly = true;
                }

                action(MyAction)
                {
                    Visible = false;
                }
            }
        }
    }
}
```

There's no impact on the promoted side of the action as promoted actions remain visible. There's also no impact on the right side since promoted actions are promoted only and non-promoted actions remain hidden.  

You should then use this approach if you want to keep the current behaviour.

### 3. Demote the actions in the group

```al
page 50100 MyPage
{
    actions
    {
        area(Creation)
        {
            group(MyGroup)
            {
                Visible = false;

                action(MyPromotedAction)
                {
                }

                action(MyAction)
                {
                }
            }
        }
    }
}
```

There's no impact on the right side of the action bar since all actions remain hidden by the group. However, the promoted actions do not appear on the promoted side of the action bar anymore.  

You should then use this approach if you didn't expect `MyPromotedAction` to appear on the promoted side of the action bar and wants to hide it completely. 

## See Also  
[UICop Analyzer](uicop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
