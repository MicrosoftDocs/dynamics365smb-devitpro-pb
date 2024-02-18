---
title: Design content mode of prompt dialog page
description: Learn how to define the screen of a copilot prompt dialog page that displays the AI-generated output.
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

# Design content mode of prompt dialog page

In this article, you learn how to define the copilot screen that displays the AI-generated output. The screen is defined by the content mode of the PromptDilod page. It enables users to review output, then choose to regenerate, save, or discard it. The following figure illustrates an example of the content mode for a copilot.

![Shows a screenshot of the content mode of the PromptDialog type page](media/promptdialog-content-mode.svg)

If the PromptDialog page has a prompt area (`area(Prompt)`), then an edit prompt ![Shows the prompt edit icon](media/prompt-edit.png) button appears in the upper-left corner of the page when it's in the content mode. Users can select the edit prompt button to open the [prompt mode](copilot-design-prompt-mode.md) where they can provide new input or modify input.

The content mode UI consists of several elements, which are described in the sections that follow.

## Add a content area

In this task, you define the area of the content that displays results of the AI generation.

[![Shows a screenshot of the content mode of the PromptDialog type page](media/promptdialog-content-mode-output-area.svg)](media/promptdialog-content-mode-output-area.svg#lightbox)

To define this area, you add an `area(Content)` control to the `layout`, then add one or more data fields. You can structure and arrange fields in groups and page parts. Like the `Prompt` area, the `Content` area supports all controls except  `repeater`.

```al
layout
{
    area(Content)
    {
        field(generatedOutput; Output)
        {
            ShowCaption = false;
            MultiLine = true;
        }
    }
}
```

## Add a save and discard action

In this task, you add actions to the content mode that enable users to save or discard the AI-generated proposal. Don't save AI-generated proposals to the database until the user chooses to do so. In accordance with responsible AI, to respect the user's choice.

[![Shows a screenshot of the save and discard actions in the content mode of the PromptDialog type page](media/promptdialog-content-mode-save.svg)](media/promptdialog-content-mode-save.svg#lightbox)

There are two system actions that control the behavior: `systemaction(OK)` for saving and `systemaction(Cancel)` for discarding. These actions appear in the UI by default without you having to add any code where `systemaction(OK)` has the caption **Keep it** and `systemaction(Cancel)` has the caption **Discard**. However, you do have to add code that handles the content based on which action the user chooses. 

1. This step is optional and only required if you want use captions other than **Keep it** and **Discard**. In the `actions` control, add a system action `OK` for saving proposals and `Cancel` for discarding proposals.

    ```al
    actions
    {
        area(SystemActions)
        {
            systemaction(OK)
            {
                Caption = 'Save';
                ToolTip = 'Save the proposal.';
             }
            systemaction(Cancel)
            {
                Caption = 'Cancel';
                ToolTip = 'Throw away the proposal.';
            }
        }
    }
    ```

    Use the Caption property to specify the text that you want to use for the actions. Choose text that is concise but best communicates what the action does. For example, if the OK action inserts a row in list, then perhaps **Insert** is a better than **Keep it**. 

1. Add the code that saves or discards the proposal using either the [OnQueryClosePage](triggers-auto/page/devenv-onqueryclosepage-page-trigger.md) or the value returned from the [RunModal](methods-auto/page/page-runmodal--method.md).

    ```al
    trigger OnQueryClosePage(CloseAction: Action): Boolean
    var
        SaveCopilotJobProposal: Codeunit "Save Copilot Job Proposal";
        begin
            if CloseAction = CloseAction::OK then
                SaveCopilotJobProposal.Save(CustomerNo, CopilotJobProposal);
        end;
    ```

## Add a regenerate action

In this task, you add an action to the PromptDialog page that enables users to generate the results again directly from the content mode.

[![Shows a screenshot of the regenerate action in the content mode of the PromptDialog type page](media/promptdialog-content-mode-regen.svg)](media/promptdialog-content-mode-regen.svg#lightbox)

To include this action, add a `systemaction(Regenerate)` control to `area(SystemActions)`.

```al
actions
{
    area(SystemActions)
    {

        systemaction(Regenerate)
        {
            Caption = 'Regenerate';

            trigger OnAction()
            begin
                RunGenerate();
            end;
        }
    }
}

```

## Customize the caption in content mode

By default, the `Caption` property of the PromptDialog page determines UI caption in prompt and content modes of the PromptDialog page. By using the [DataCaptionExpression property](properties/devenv-datacaptionexpression-property.md), you can change the caption dynamically. This property enables you to display a different caption in the content than in the prompt mode.

[![Shows the caption next to the edit button in PromptDialog type page](media/promptdialog-content-mode-caption.svg)](media/promptdialog-content-mode-caption.svg#lightbox)

A useful pattern for the caption is to use the prompt input that was provided before the AI generation is done. The Business Central's marketing text suggestions with Copilot uses the pattern.

The following code adds the `DataCaptionExpression` property to our example to set the caption to the text the user provides in the prompt area:

```al
page 50100 "My copilot"
{
    Caption = 'Draft with my copilot';
    PageType = PromptDialog;
    Extensible = false;
    PromptMode = Prompt;
    IsPreview = true;
    DataCaptionExpression = UserInput;
...
}
```

## Enable proposal history capability

A user might get more than one generated output when using copilot. This situation can happen when copilot provides several versions of an output from start, or when the user chooses to regenerate the output. It can be beneficial to provide users with a way to scroll back and forth through a history of the different proposals. To accommodate this capability, you can set up version carousel at the top of the PromptDialog page.

[![Shows the version control in content mode of the PromptDialog type page](media/promptdialog-content-mode-versions.svg)](media/promptdialog-content-mode-versions.svg#lightbox)

This capability requires that the PromptDialog page uses a temporary source table. Unlike with other page types, the source table represents an instance of a copilot proposal. It can include both user inputs and the AI-generated results.

You should design the capability to insert a new record each time content is generated. When in place, the control appears on the PromptDialog page whenever the source table contains multiple records. After the user closes the copilot, for example by saving or discarding the results, the version history is deleted.

```al
page 50100 "My copilot"
{
    Caption = 'Draft with copilot';
    PageType = PromptDialog;
    Extensible = false;
    PromptMode = Prompt;
    IsPreview = true;
    DataCaptionExpression = UserInput;
    SourceTable = TempInputData;
    SourceTableTemporary = true;
...
}
```  

## Next steps

- [Design copilot prompt mode](copilot-design-prompt-mode.md)
- [Customize copilot generate mode](copilot-customize-generate-mode.md)
- [Launch copilot](copilot-launch-experience.md)