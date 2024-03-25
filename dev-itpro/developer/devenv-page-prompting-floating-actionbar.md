---
title: Prompting using a floating action bar
description: Learn how to create prompt actions to promote AI capabilities in Business Central.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.reviewer: 
ms.topic: overview
ms.collection:
  - bap-ai-copilot
ms.date: 03/21/2024
ms.custom: bap-template
---

# Prompting using a floating action bar

With [!INCLUDE [prod_short](includes/prod_short.md)] 2024 release wave 1 and runtime 13, you can create prompt actions to promote AI capabilities in [!INCLUDE [prod_short](includes/prod_short.md)]. A prompt action is a standard action that is rendered in a floating action bar on your pages, and it nudges users to use relevant Copilot built-in features.

:::image type="content" source="media/floating-bar.png" alt-text="Example of a floating action bar for Copilot feature":::

To create a prompt action, you must create a new area in the `actions` section of the page object. The area must be set to `area(Prompting)`. You can then create a new action in the area and run a `PromptDialog` object that you want to activate when the action is clicked. Only objects of the `PromptDialog` page type can be run from a prompting area.

> [!NOTE]
> The floating action bar will only show if you have linked a `RunObject` property to the action.

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

The user will see a floating action bar on the page. When the users selects **Hide**, the floating action bar will be placed in the action bar instead. It can easily be brought back by clicking **Show in page**.

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

## See also

[The PromptDialog page type](devenv-page-type-promptdialog.md)  
[Prompting using a prompt guide](devenv-page-promptguide.md)   