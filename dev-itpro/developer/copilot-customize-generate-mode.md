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

# Customize generate mode caption of the prompt dialog page

In this article, you learn how to change the caption shown in the UI when copilot is retrieving generated results from the Azure Open AI service. The UI is defined by the generate mode of the prompt dialog page. Its purpose is to give users feedback about what's happening with copilot. The caption functions as a kind of progress bar for the user. By default, the caption of PromptDialog page when it's in the generate mode is **Generating**, as illustrated in the following figure:

[![Shows a screenshot of the default generate mode of the PromptDialog type page](media/promptdialog-generate-mode.png)](media/promptdialog-generate-mode.png#lightbox)

Customizing the caption enables you to give users more specific feedback about what copilot is doing or how it's progressing. This feedback is especially useful if the Copilot consists of multiple steps or takes a long time.

## How to change the caption

You customize the caption by using the [Dialog.Open()](methods-auto/dialog/dialog-open-method.md) or [Dialog.Update()](methods-auto/dialog/dialog-update-method.md) methods.

There are different ways to use the `Dialog.Open()`and `Dialog.Update()` to change the generate mode's caption. Refer to the following examples for inspiration.

## Example: From the OnAction() trigger

The following code example illustrates how to change the generate mode caption directly from the `OnAction()` trigger of `Generate` and `Regenerate` actions. The code snippets use the `OnAction()` trigger to change the caption to:

- **Creating a draft for you...** when generating the first draft with copilot.
- **Revising the draft for you...** when regenerating a draft.

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

The following figures illustrate the customized captions in the UI:

[![Shows a screenshot of the custom caption of generate mode in the UI](media/promptdialog-generate-mode-custom.png)](media/promptdialog-generate-mode-custom.png#lightbox)

[![Shows a screenshot of the revising custom caption of generate mode in the UI](media/generate-mode-caption-revising.png)](media/generate-mode-caption-revising.png#lightbox)

## Example: From the RunGeneration() procedure

This example changes the generate mode caption by calling the `Dialog.Open()` method from the procedure that generates the results (for purposes of this article, the `RunGeneration()`). 

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
    ...

end;
```

```al
var
    GenerateModeProgress: Dialog;
    CopilotGeneratingTxt: Label 'Creating a draft for you...';
    CopilotRegeneratingTxt: Label 'Revising the draft...';
```

For a more comprehensive example, go to [Advanced_SuggestJob sample on GitHub](https://github.com/microsoft/BCTech/blob/002affcf1520a710c270257d6547e25a9a223e85/samples/AzureOpenAI/Advanced_SuggestJob/DescribeJob/CopilotJobProposal.Page.al).


## Next steps

- [Design copilot prompt mode](copilot-design-prompt-mode.md)
- [Design copilot content mode](copilot-design-content-mode.md)
- [Launch copilot](copilot-launch-experience.md) 
