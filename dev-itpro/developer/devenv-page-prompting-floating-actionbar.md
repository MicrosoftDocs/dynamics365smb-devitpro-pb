---
title: Prompting using a floating action bar
description: Learn how to create prompt actions to promote AI capabilities in Business Central.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.topic: overview
ms.collection:
  - bap-ai-copilot
ms.date: 09/25/2024
ms.reviewer: solsen
---

# Prompting using a floating action bar

> [!NOTE]
> With [!INCLUDE [prod_short](includes/prod_short.md)] 2024 release wave 2 and runtime 14, you can also use prompt actions on Card, Document, and ListPlus page types to nudge users to use your Copilot features on such pages. The required AL code follows the same model as when adding Copilot prompt actions to list pages.

Since [!INCLUDE [prod_short](includes/prod_short.md)] 2024 release wave 1 and runtime 13, you can create prompt actions to promote AI capabilities in [!INCLUDE [prod_short](includes/prod_short.md)]. A prompt action associates an action directly with Copilot. Prompt actions draw users' attention to tasks that Copilot can assist with on the page. Copilot might display these prompt actions elsewhere such as in the Copilot pane when asked for assistance.

A prompt action is a standard action that is rendered with more prominence than other actions in the UI. Depending on the page on which it is shown, it could be shown as a floating action bar or in another highly prominent space on the page.

The following image shows an example of a Copilot prompt action.

:::image type="content" source="media/floating-bar.svg" alt-text="Example of a floating action bar for Copilot feature":::

To create a floating action bar with one or more prompt actions, you must create a new area in the `actions` section of the page object. The area must be set to `area(Prompting)`. You can then create one or more new actions in the area and run a `PromptDialog` object that you want to activate when the action is clicked. Only objects of the `PromptDialog` page type can be run from a prompting area.

> [!NOTE]
> The floating action bar only shows if you've specified a `RunObject` property to the page.

The following example shows the syntax for how to create a prompt action that runs the **Copilot Marketing Text** page. This piece of AL code can be added to a page where you want to promote the **Copilot Marketing Text** functionality. When the action is clicked, the **Copilot Marketing Text** page is opened in a dialog.

```al
...
actions
{
    area(Prompting)
    {
        action(MyPromptAction)
        {
            Caption = 'Copilot Marketing Text';
            RunObject = page "Copilot Marketing Text";
        }
    }
}
...
```

> [!NOTE]
> The user sees a floating action bar on the page that this code is implemented on. If the user selects **Hide**, the floating action bar is placed in the action bar instead. It can easily be brought back by clicking **Show in page**.

The next code is part of a code sample taken from the [aka.ms/BCTech](https://aka.ms/BCTech) repo; the [Job Planning Lines Copilot](https://github.com/microsoft/BCTech/blob/master/samples/AzureOpenAI/Advanced_SuggestJob/SuggestResource/JobPlanningLinesCopilot.PageExt.al) page extension. This code sample illustrates how to create two prompt actions that run the `SuggestResourceCopilotAction` and `SuggestItemCopilotAction` actions. The `SuggestResourceCopilotAction` action is used to suggest a resource to be assigned to a job planning line, and the `SuggestItemCopilotAction` action is used to suggest an item to be assigned to a job planning line. The `SuggestResourceWithAI` and `SuggestItemWithAI` functions aren't implemented in this code sample. 

```al
...
actions
    {
        addlast(Prompting)
        {
            action(SuggestResourceCopilotAction)
            {
                Caption = 'Suggest resource';
                ToolTip = 'Asks Copilot which resource can be assigned to the job planning line. You will have to confirm the suggestion from Copilot.';
                Visible = Rec.Type = Rec.Type::Resource;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    SuggestResourceWithAI(Rec);
                end;
            }
        }
        addlast(Prompting)
        {
            action(SuggestItemCopilotAction)
            {
                Caption = 'Suggest item';
                ToolTip = 'Asks Copilot which item can be assigned to the job planning line. You will have to confirm the suggestion from Copilot.';
                Visible = Rec.Type = Rec.Type::Item;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Message('not implemented');
                end;
            }
        }
    }
...
```

## Related information

[The PromptDialog page type](devenv-page-type-promptdialog.md)  
[Prompting using a prompt guide](devenv-page-promptguide.md)  
[Error handling in prompt dialogs](devenv-page-prompt-error-handling.md)