---
title: "Promoted Action Changes"
description: The promoted action framework has been redesigned with Dynamics 365 Business Central 2022 release wave 2. 
ms.custom: na
ms.date: 09/02/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
author: SusanneWindfeldPedersen
--- 

# Promoted Action Changes

[!INCLUDE [2022_releasewave2](../includes/2022_releasewave2.md)]

With [!INCLUDE [prod_short](includes/prod_short.md)] 2022 release wave 2, we introduce a new syntax for defining promoted actions. The new syntax groups the promoted actions in a separate section, so that the code is easier to scan. And on the UI, the new syntax improves the personalization experience, by adding options for promoting actions. 

## Behavioral changes 

|New Behavior (v21)| Previous Behavior (v20|
|------------------|------------------------|
|During personalization, if you hide a base action, all `actionref`s will also be hidden. | During personalization, if you clicked "Remove" on a base action, it would disappear, which was equivalent to making the action set to `PromotedOnly = true`; it would only show up in the promoted section. |
|If base actions are inside a hidden group, then the `actionref`s will be also hidden, even if the base actions themselves are visible. |Promoted actions had an implicit copy of the `Visible` property of the base actions, which made them unrelated to the parents of the base actions. Due to this behavior, this was not an issue in v20.<br>**Note:** This behavior is maintained when the feature flag **Modern Action Bar** on the **Feature Management** page is set to *Disabled*.  |
| Promoted categories are never merged into the **Manage** system group anymore. However, if there's a custom group called Manage, the merge is done.| If you renamed one of the promoted categories to Manage, then they were merged into the **Manage** system group.<br>If there are multiple promoted categories that are renamed to Manage, then actions inside were all merged into the Manage system group. This could, for example, happen if there were multiple extensions that renames different promoted categories to Manage.|
|When all actions inside a group has an `actionref`, then the group is no longer rendered. This condition is applied recursively. For example, if every action is promoted, then there'll be no **Actions** group visible on the right-hand side. **Note:** In a future release `actionrefs` will be treated by PromotedOnly by default in the future.
|Promoted actions were rendered on the right-hand side unless `PromotedOnly` was set. If every action had `PromotedOnly = true`, then the **Actions** group would also not render.|
|||




<!--
```al
...
area(Promoted)
        {
            // Not rendered as a split button when the feature flag is OFF
            group(Category_New) // This is a promoted action category.
            {
                Caption = 'New';
                ShowAs = SplitButton;

                actionref(TestAction1_Promoted; TestAction1)
                {
                }

                actionref(TestAction2_Promoted; TestAction2)
                {
                }
            }

            // Rendered as a split button (whether feature flag is ON or OFF)
            group(Test)
            {
                ShowAs = SplitButton;

                actionref(TestAction1_Promoted2; TestAction1)
                {
                }

                actionref(TestAction2_Promoted2; TestAction2)
                {
                }
            }
        }
```

-->

## 

## See also