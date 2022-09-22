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
From Business Central 2022 Wave 2, promoted actions defined in a hidden group are rendered on the promoted side of the action bar only if the 'Modern Action Bar' feature is disabled for the environment. If you want to always see these actions on the promoted side, remove the Visible property on the group. If you do never want to see these actions on the promoted side, remove the Promoted property on the promoted actions.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

For Business Central 2022 Wave 1 (version 20) and earlier, promoted actions defined in a hidden group were rendered on the promoted side of the action bar, but hidden in non-promoted side of the action bar.

From Business Central 2022 Wave 2 (version 21), promoted actions defined in a hidden group are rendered on the promoted side of the action bar only if the 'Modern Action Bar' feature is disabled for the environment.

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

Promoted actions are currently rendered on the promoted section of the command bar based on the Visible property set on the action, without considering their actual visibility in the default section of the command bar.

`MyPromotedAction` doesn't have the visible property set, so it's visible by default and the promoted action will be rendered in the promoted section of the command bar. However, since `MyGroup` is not visible, `MyPromotedAction` will also not be visible in the default section of the command bar.

> [!NOTE]  
> For versions of Business Central before 2022 Wave 2 (version 21), a similar behavior could be achieved by using the [PromotedOnly](..\properties\devenv-promotedonly-property.md) property on `MyPromotedAction`. From version 21, the platform handles the duplicity of promoted actions.

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

There's no impact on the promoted section of the command bar as promoted actions remain visible. However, promoted actions and non-promoted actions become visible in the default section of the command bar.  

Use this approach if you want the group and its actions to be visible.

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

There's no impact on the promoted section of the command bar as promoted actions remain visible. There's also no impact on the default section of the command bar since promoted actions are promoted only and non-promoted actions remain hidden.  

Use this approach if you want to keep the current behaviour.

> [!IMPORTANT]
> The behavior of the [PromotedOnly](..\properties\devenv-promotedonly-property.md) property changes with Business Central 2022 Wave 2 since the platform handles the duplicity of promoted actions.

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

There's no impact on the default section of the command bar since all actions remain hidden by the group. However, the promoted actions do not appear in the promoted section of the command bar anymore.  

Use this approach if you didn't expect `MyPromotedAction` to appear in the promoted section of the command bar and you want to hide it completely. 

## See Also  
[UICop Analyzer](uicop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
