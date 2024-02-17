---
title: Customize generate mode caption in copilot
description: Learn how to change the caption progress bar shown in the UI of the prompt dialog page in generate mode.
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

# Customize generate mode caption in copilot

In this article, you learn how to change the caption shown in the UI of the prompt dialog page in generate mode.
By default, the caption of PromptDialog page when it's in the generate mode is **Generating**, as illustrated in the following figure:

[![Shows a screenshot of the default generate mode of the PromptDialog type page](media/promptdialog-generate-mode.png)](media/promptdialog-generate-mode.png#lightbox)

The caption functions as a kind of progress bar for the user. Customizing the caption enables you to give users more specific feedback about what copilot is doing or how it's progressing. This feedback is especially useful if the Copilot consists of multiple steps or takes a long time.

## How to change the caption

You customize the caption by using the [Dialog.Open()](methods-auto/dialog/dialog-open-method.md) or [Dialog.Update()](methods-auto/dialog/dialog-update-method.md) methods. 

<!--The following code snippet changes the caption to **Creating a draft for you...** by calling `Dialog.Open()` from the `RunGenration()` procedure, which is run from the `systemaction(Generate)` and `systemaction(Regenerate)`actions:-->

<!--
```al
systemaction(Generate)
{
    trigger OnAction()
    var
        ProgressDialog: Dialog;
    begin
        ProgressDialog.Open('Creating a draft for you...');
    end;
}
```


```al
local procedure RunGeneration()
var
    GenerateModeProgress: Dialog;
    ...
begin
    GenerateModeProgress.Open('Creating a draft for you...');
    ...
end

```
-->

There are various ways to use the `Dialog.Open()`and `Dialog.Update()` to change the generate mode's caption. For example, you can call the methods directly from the `OnAction()` trigger of `Generate` and `Regenerate` actions. Or you can call the methods from the procedure that generates the results (for purposes of this article, the `RunGeneration()` procedure).

## Example: Directly from the OnAction() trigger

```al
systemaction(Generate)
{
    trigger OnAction()
    var
        GenerateModeProgress: Dialog;
    begin
        GenerateModeProgress.Open('Creating a draft for you...');
    end;
}

systemaction(Regenerate)
{
    trigger OnAction()
    var
        GenerateModeProgress: Dialog;
    begin
        GenerateModeProgress.Open('Revising the draft...');
    end;
}

```

## Example: Using the RunGeneration() procedure

The following code snippets use the `OnAction()` trigger together with the `RunGeneration()` procedure
to change the caption to **Creating a draft for you...** when generating the first draft with copilot and **Revising the draft for you...** when regenerating a draft.

```al
systemaction(Generate)
{
    Caption = 'Generate';

    trigger OnAction();
    begin
        RunGenerate(CopilotGeneratingTxt);
    end;
}
systemaction(Regenerate)
{
    Caption = 'Regenerate';
    trigger OnAction()
    begin
        RunGenerate(CopilotRegeneratingTxt);
    end;
}
```

```al
local procedure RunGenerate(ProgressTxt: Text)
begin
    GenerateModeProgress.Open(ProgressTxt);
    //GenerateModeProgress.Open('Creating a draft for you...');
    generatedOutput := 'This is the output for: ' + userInput;

end;

var
    GenerateModeProgress: Dialog
```

The following figure shows the customized generate mode caption in the UI for the **Generate** action is selected:

[![Shows a screenshot of the custom caption of generate mode in the UI](media/promptdialog-generate-mode-custom.png)](media/promptdialog-generate-mode-custom.png#lightbox)

For a more complex example, refer to `RunGeneration()` procedure in the `CopilotJobProposal.Page`of the [Advanced_SuggestJob sample on GitHub](https://github.com/microsoft/BCTech/blob/002affcf1520a710c270257d6547e25a9a223e85/samples/AzureOpenAI/Advanced_SuggestJob/DescribeJob/CopilotJobProposal.Page.al).

## Next steps

- [Design copilot prompt mode](copilot-design-prompt-mode.md)
- [Design copilot content mode](copilot-design-content-mode.md)
- [Launch copilot](copilot-launch-experience.md) 
