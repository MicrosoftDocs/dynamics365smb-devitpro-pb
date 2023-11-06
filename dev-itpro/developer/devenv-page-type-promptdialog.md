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

With [!INCLUDE [prod_short](includes/prod_short.md)] runtime 12.1, you can add a new page type `PromptDialog`, which allows you to integrate copilot capabilities into your custom scenarios. Use the `PromptDialog` to create generative AI experiences with the copilot look and feel, which includes signature visuals, and built-in safety controls for customers. The `PromptDialog` page has a specific page syntax, which includes new area and action controls, as described in the code sample below.

## Snippet support

Typing the shortcut `tpage` and then choose the **Page of type Prompt Dialog** will create the basic layout for a `PromptDialog` page object when using the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] in Visual Studio Code.

## Properties of the PromptDialog page type

The `PromptDialog` page type has a number of specific properties that characterizes the dialog. The `PageType` property must be set to `PromptDialog`. The `PromptMode` property value is by default `Prompt`, which is the starting prompt mode. The `PromptMode` property can be changed at runtime. The other options are `Generate`, which will trigger generating the output of the copilot interaction, and `Content`, which will show the output of the copilot interaction.

## Areas of the PromptDialog page type

The `PromptDialog` page type has three areas, which are `Prompt`, `Content`, and `PromptOptions`. The `Prompt` area is the input to copilot, and accepts any control. The `Content` area is the output of copilot, and accepts any control. The `PromptOptions` area is the input options, and only accepts option fields.

## Example

The following example describes a page, which is a PromptDialog page, set with the `PromptDialog` option. The `Extensible = false;` is a mandatory setting, to ensure that the page is not extended so that customers can trust the AI experience implemented.

Use the `IsPreview` property to indicate to your customers that you're using the feature in preview, and that the feature might change in the future as you gather feedback. The `IsPreview` property is by default set to `false`.


```al
page 50100 MyCopilotPage
{
    Caption = 'Draft new job with Copilot';

    // Show the natural language user input as caption
    DataCaptionExpression = UserInput;

    PageType = PromptDialog;
    PromptMode = Prompt; // Specify the starting prompt mode. Default value is Prompt.
    IsPreview = true;
    SourceTable = TempInputData;

    // Mandatory properties
    SourceTableTemporary = true;
    Extensible = false;

    layout
    {
        area(Prompt) 
        { 

            /*The input to copilot. Accepts any control.*/ 

            field(ProjectDescription; UserInput)
            {    
                ShowCaption = false;
                MultiLine = true;
            }
        }

        area(Content) 
        { 
            /*The output of copilot. Accepts any control.*/ 

            field("Job Short Description"; JobDescription)
            {...}

            field("Job Full Details"; JobFullDescription)
            {...}

            field(CustomerNameField; CustomerName)
            {...}        
    
            part(ProposalDetails; "Copilot Job Proposal Subpart")        
            [...]
        }

        area(PromptOptions) { /*The input options. Only accepts option fields.*/ }
    }

    actions
    {
        area(SystemActions)
        {
            // Pre-defined system actions (Generate, Regenerate, Attach, Ok, or Cancel). Can only use system actions on this page.
            systemaction(Generate)
            {
                Caption = 'Generate'; 
                trigger OnAction()
                begin
                    // The code triggering the copilot interaction.
                    RunGeneration();
                end;
            }

            systemaction(Ok)
            {
                Caption = 'Keep it'; // The Caption and Tooltip of system actions can be modified.
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

[Page types and layouts](devenv-page-types-and-layouts.md)  
[Page object](devenv-page-object.md)  
