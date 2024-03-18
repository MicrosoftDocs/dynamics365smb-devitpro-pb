---
title: Prompting using a prompt guide
description: Business Central
author: SusanneWindfeldPedersen
ms.author: solsen
ms.reviewer: 
ms.topic: overview
ms.collection:
  - bap-ai-copilot
ms.date: 03/15/2024
ms.custom: bap-template
---

# Prompting using a a prompt guide

The prompt guide is a new feature in [!INCLUDE [prod_short](includes/prod_short.md)] 2024 release wave 1 and runtime 13 of the AL Language extension for Visual Studio Code. You can implement the prompt guide when you're developing `PromptDialog` pages for [!INCLUDE [prod_short](includes/prod_short.md)]. The prompt guide helps users by providing one or more predefined text prompts to use as input to generate content, rather than having to write that up themselves.

A prompt guide is implemented by using a specific action area on `PromptDialog` pages, called `PromptGuide`. The `PromptGuide` area is then defined by a list of predefined prompts that are shown to the user when the `PromptDialog` page is opened. The user can select a prompt from the list, and the selected prompt is then used as input to generate content. You define these predefined prompts as questions or statements that the user can select from. Examples of predefined prompts could be "How can I...?" or "Show me the latest..." to inspire the user to ask for help or to get the latest information.

<!-- image -->

The syntax of the `PromptGuide` area is as illustrated in the following example. The PromptGuide is an area specific to the PromptDialog page type, and it's defined in the `actions` section of the page object. The `PromptGuide` area is defined by a list of predefined prompts that are shown to the user when the `PromptDialog` page is opened. The user can select a prompt from the list, and the selected prompt is then used as input to generate content.

```al
actions
{
    area(PromptGuide)
    {
        action(MyPromptAction)
        {
            Caption = 'How can I...?';
            ToolTip = 'Ask Copilot for help with a specific task.';
        }
    }
}
```

For a complete example of how to implement a prompt guide, see [The PromptDialog page type](devenv-page-type-promptdialog.md). For nudging users to use relevant Copilot built-in features, see [Prompting using a floating action bar](devenv-page-prompting-floating-actionbar.md).

## See also

[The PromptDialog page type](devenv-page-type-promptdialog.md)  
[Prompting using a floating action bar](devenv-page-prompting-floating-actionbar.md)  
