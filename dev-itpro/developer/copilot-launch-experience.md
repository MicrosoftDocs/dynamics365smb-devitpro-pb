---
title: Launch copilot experience
description: Learn how to add an action in the UI that users select to start the copilot experience.
author: jswymer
ms.author: jswymer
ms.reviewer: jswymer
ms.topic: how-to
ms.collection:
  - get-started
  - bap-ai-copilot
ms.date: 02/17/2024
ms.custom: bap-template
---

# Launch copilot experience

In this article, you learn how to add an action in the UI that users select to start the copilot experience. This task is done similar to the way you add an action that opens any page. Except in this case, you target the prompt dialog page for your copilot. You also apply a specific image so that users can easily recognize that the action is related to a copilot feature.

## Add an action for your copilot

The following code illustrates how to add an action that opens the prompt dialog page for copilot:  

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

## Promote copilot using prompt action 

You can create a prompt action to promote your Copilot on pages and encourage users to use it. A prompt action is a standard action that appears under the ![Shows the copilot action icon icon](media/promptdialog-copilot-action-icon.png) in the action bar. Users select the action to run the Copilot. They can also select the **Show in page** action to float the Copilot actions on the page for easy access.  

![Shows the copilot action icon clip](media/promptdialog-launch-floating.png)

Prompt actions are only supported on `List`, `ListPage`, `StandardDialog`, and `WorkSheet` page types. To create a prompt action, add an action area called `area(Prompting)` to the page and an `action` that runs the prompt dialog page. 

```al
...
actions
{
    area(Prompting)
    {
        action(MyPromptAction)
        {
            ApplicationArea = All;
            Caption = 'Run my Copilot';
            RunObject = page "Copilot Job Proposal";
        }
    }
}
...
```

Here's an example if you're extending a list page:

```al
...

actions
{
    addlast(Prompting)
    {
        action(MyPromptAction)
        {
            ApplicationArea = All;
            Caption = 'Run my Copilot';
            RunObject = page "Copilot Job Proposal";
        }
    }
}
...
```

[Learn more about prompting using a floating action bar](devenv-page-prompting-floating-actionbar.md).

## Next steps

- [Design copilot prompt mode](copilot-design-prompt-mode.md)
- [Design copilot content mode](copilot-design-content-mode.md)
- [Customize copilot generate mode](copilot-customize-generate-mode.md)
