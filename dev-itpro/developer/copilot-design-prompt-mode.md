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

# Design the copilot prompt mode

In this task, you define the screen of the PromptDialog page where users can add input that the AI generation logic uses for producing results. The prompt area is optional because not all AI designs required it. Also, you might need a prompt mode, but it doesn't have to be the first mode presented to the user in the copilot experience.

## Add the prompt area

The prompt area is where users can provide input to the AI generation. The prompt area supports natural language input (like free text fields) and structured input (like field groups and page parts). The example uses a single field that allows the user to type natural language text in an unstructured format.

[![Shows the prompt area of the PromptDialog type page](media/promptdialog-prompt-mode-prompt-area.svg)](media/promptdialog-prompt-mode-prompt-area.svg#lightbox)

The prompt area is defined by adding an `area` control to the `layout` of the page, similar to way you'd add content areas on other page types. Except you use the syntax `area(Prompt)`:

```al
layout
{
    area(Prompt) 
    {
        field(input; UserInput)
        {
            ShowCaption = false;
            MultiLine = true;
        }
    }
}
```

Within `area(Prompt)`, you can add one or more fields, groups, and page parts. `Prompt` supports all `area()` controls except the`repeater` control.

> [!NOTE]
> The code example is a special case where the first field on the PromptDialog page is shown as a multiline input with `ShowCaption=false`. In this case, the page caption serves as the caption for the input field. For accessibility and usability reasons, other fields on the page should continue to have their captions visible.

## Add a generate action

In this task, you add action to the PromptDialog page that users select to start generating output with Copilot and AI. 

[![Shows a screenshot that highlights the generate action in the prompt mode of the PromptDialog type page](media/promptdialog-prompt-mode-generate.svg)](media/promptdialog-prompt-mode-generate.svg#lightbox)

The `PromptDialog` page type supports several *system actions* that appear as buttons in the UI. You add these actions in the `actions` control on the page like you would any other action. Except you define the system actions by first adding an `area(SystemActions)` control, then using the `systemaction()`control to define the specific action. In this case, you use a `systemaction(Generate)` control. 

```al
actions
{
    area(SystemActions)
    {
        systemaction(Generate)
        {
            Caption = 'Generate';
            trigger OnAction()
            begin
                // The code triggering the copilot interaction. This is where you call the Copilot API, and get the results back. You must implement this yourself. 
                RunGeneration();
            end;
        }
        ...
    }
}
```

Use the [OnAction()](triggers-auto/action/devenv-onaction-action-trigger.md) to call generative AI code, in this case the `RunGeneration()` procedure. This trigger is invoked when the user selects the button or when the page is opened in generate mode.

The code of the `RunGeneration` procedure, you must implement yourself. This procedure is where you call the copilot API, and get the results back.

For an example on how to implement the `RunGeneration` procedure, see [BCTech samples AzureOpenAI](https://github.com/microsoft/BCTech/blob/002affcf1520a710c270257d6547e25a9a223e85/samples/AzureOpenAI/Basic_ItemSubstitution/PromptDialog/ItemSubstAIProposal.Page.al#L111). 

For an example on building an AI capability, see [Build the copilot capability in AL](ai-build-capability-in-al.md).

## Add a file attachment action

In this task, you add action to the PromptDialog page that enables users to select a file to upload in the prompt area. The content of the file can provide input to the AI generation.

[![Shows a screenshot that highlights the file attachment action in the prompt mode of the PromptDialog type page](media/promptdialog-prompt-mode-attach.svg)](media/promptdialog-prompt-mode-attach.svg#lightbox)

Like the system action for generating AI, there's also a system action for attaching a file. In this case, you use a `systemaction(Attach)` control.

```al
actions
{
    area(SystemActions)
    {
        systemaction(Attach)
        {
            Caption = 'Attach a file';
            ToolTip = 'Attach a file describing the job.';
            trigger OnAction()
            var
                InStr: InStream;
                Filename: Text;
            begin
                UploadIntoStream(‘Select a file...', '', ‘All files (*.*)|*.*', Filename, InStr);
                if not (Filename = '') then begin
                ...
            end;
        end;
        }
    }
}
```

## Add preference options

In this task, you add actions to the PromptDialog page that enable users to set style preferences to influence the AI-generated output. The options appear as buttons in the UI to the right of the system actions.

[![Shows a screenshot that highlights the preference option actions in the prompt mode of the PromptDialog type page](media/promptdialog-prompt-mode-options.svg)](media/promptdialog-prompt-mode-options.svg#lightbox)

You add the options by using in a `area(PromptOptions)` control with the `actions` control. Each option is defined by a field using the `field` control. Only fields of the [option data type](methods-auto/option/option-data-type.md) are supported.

```al
actions
{
    area(PromptOptions) 
    {          
        field(tone; Tone)
        {
        }
        field(format; Format)
        {
        }
        field(emphasis; Emphasis)
        {
        }
    }
}
```

## Next steps

- [Design copilot content mode](copilot-design-content-mode.md)
- [Customize copilot generate mode](copilot-customize-generate-mode.md)
- [Launch copilot](copilot-launch-experience.md)