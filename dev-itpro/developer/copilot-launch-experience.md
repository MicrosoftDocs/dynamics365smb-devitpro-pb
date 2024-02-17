---
title: How-to topic template #Required; page title displayed in search results. Don't enclose in quotation marks.
description: How-to description #Required; article description that's displayed in search results. Don't enclose in quotation marks. Do end with a period.
author: rhanajoy #Required; your GitHub user alias, with correct capitalization.
ms.author: rhcassid #Required; your Microsoft alias; optional team alias.
ms.reviewer: kfend #Required; Microsoft alias of content publishing team member.
ms.topic: how-to #Required; don't change.
ms.collection: get-started #Required; If this isn't a getting started article, don't remove the attribute, but leave the value blank. The values for this attribute will be updated over time.
ms.date: 02/17/2024
ms.custom: bap-template #Required; don't change.
---

# Launch copilot experience

With this task, you add code to run the PromptDialog page. This task is done similar to the way you start any page. The following code uses an action: 

```al
action(GenerateCopilot)
{
    Caption = 'Draft with Copilot';
    Image = Sparkle;

    trigger OnAction()
    begin
        Page.RunModal(Page::"My copilot");
    end;
}
```

Set the [Image property](properties/devenv-image-property.md) to either `Sparkle` ![Shows the copilot sparkle icon](media/copilot-sparkle.png)
or `SparkleFilled` ![Shows the copilot sparkle filled icon](media/copilot-sparkle-filled.png). These images are recognized across Microsoft products to indicate that the action is associated with copilot.

In general, use the `Sparkle` icon. Reserve the `SparkleFilled` icon for special cases where you want to emphasize a specific copilot. For example, if there's multiple copilot actions on a page, you might want to emphasize one copilot action over the others.  

## Next steps

<!--Remove all the comments in this template before you sign-off or merge to the main branch.-->
