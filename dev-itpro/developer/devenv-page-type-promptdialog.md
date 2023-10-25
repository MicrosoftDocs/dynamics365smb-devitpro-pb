---
title: The PromptDialog page type
description: Business Central
author: SusanneWindfeldPedersen
ms.author: solsen
ms.reviewer: 
ms.topic: overview
ms.collection: 
ms.date: 10/25/2023
ms.custom: bap-template
---

# The PromptDialog page type

With [!INCLUDE [prod_short](includes/prod_short.md)] runtime 12.2, you can add a new page type `PromptDialog`, which allows you to integrate Copilot capabilities into your custom scenarios. Use the `PromptDialog` to create generative AI experiences with the Copilot look and feel, which includes signature visuals, and built-in safety controls for customers. The `PromptDialog` page has a specific page syntax, which includes new area and action controls, as described in the code sample below. To get started, simply type `tpage` and pick the **Page of type Prompt Dialog** snippet.

## Example

```al
page 50100 MyCopilotPage
{
    PageType = PromptDialog;
    PromptMode = Prompt; // Specify the starting prompt mode. Default value is Prompt.
    IsPreview = true;
    SourceTable = TempInputData;

    // Mandatory properties
    SourceTableTemporary = true;
    Extensible = false;

    layout
    {
        area(Prompt) { /*The input to Copilot. Accepts any control.*/ }

        area(Content) { /*The output of Copilot. Accepts any contol.*/ }

        area(PromptOptions) { /*The input options. Only accepts option fields.*/ }
    }

    actions
    {
        area(SystemActions)
        {
            // Pre-defined system actions (Generate, Regenerate, Attach, Ok, Cancel). Can only use system actions on this page.
            systemaction(Generate)
            {
                trigger OnAction()
                begin
                    // The code triggering the Copilot interaction.
                end;
            }

            systemaction(Ok)
            {
                Caption = 'Accept the suggestion'; // The Caption and Tooltip of system actions can be modified.
            }
        }
    }

    trigger OnInit()
    begin
        // The prompt mode can be changed at runtime.
        // CurrPage.PromptMode := PromptMode::Generate;
    end;
}
```

## See also

[]()
