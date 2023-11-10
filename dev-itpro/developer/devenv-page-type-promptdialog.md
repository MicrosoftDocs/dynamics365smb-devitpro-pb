---
title: The PromptDialog object
description: Business Central
author: SusanneWindfeldPedersen
ms.author: solsen
ms.reviewer: 
ms.topic: overview
ms.collection: 
ms.date: 11/10/2023
ms.custom: bap-template
---

# The PromptDialog object

With [!INCLUDE [prod_short](includes/prod_short.md)] runtime 12.1, you can add a new page type `PromptDialog`, which allows you to integrate copilot capabilities into your custom scenarios. Use the `PromptDialog` to create generative AI experiences with the copilot look and feel, which includes signature visuals, and built-in safety controls for customers. The `PromptDialog` page has a specific page syntax, which includes new area and action controls, as described in the code sample in this article.

## Snippet support

Typing the shortcut `tpage` and then choose the **Page of type Prompt Dialog** creates the basic layout for a `PromptDialog` page object when using the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] in Visual Studio Code.

## Properties of the PromptDialog page type

The `PromptDialog` page type has many specific properties that characterize the dialog. The `PageType` property must be set to `PromptDialog`. The `PromptMode` property value is by default `Prompt`, which is the starting prompt mode. The `PromptMode` property can be changed at runtime. The other options are `Generate`, which triggers generating the output of the copilot interaction, and `Content`, which shows the output of the copilot interaction. You can programmatically set this property by setting the variable `CurrPage.PromptMode` before the page is opened. 

To find links to the properties related to the `PromptDialog` page type, see the [See also](devenv-page-type-promptdialog.md#see-also) section in this article.

## Areas of the PromptDialog page type

The `PromptDialog` page type has three areas, which are `Prompt`, `Content`, and `PromptOptions`. The `Prompt` area is the input to copilot, and accepts any control, except repeater controls. The `Content` area is the output of copilot, and accepts any control, except repeater controls. The `PromptOptions` area is the input options, and only accepts option fields.

## Example

The following example describes a page, which is a PromptDialog page, set with the `PromptDialog` option. The `Extensible = false;` is a mandatory setting, to ensure that the page isn't extended so that customers can trust the AI experience implemented.

Use the `IsPreview` property to indicate to your customers that you're using the feature in preview, and that the feature might change in the future as you gather feedback. The `IsPreview` property adds a specific note in the UI to indicate that the feature is in preview. It's by default set to `false`. 


```al
page 50100 MyCopilotPage
{
    Caption = 'Draft new job with Copilot';

    // Show the natural language user input as caption
    DataCaptionExpression = UserInput;

    PageType = PromptDialog; 
    PromptMode = Prompt; // Specify the starting prompt mode. Default value is Prompt.
    IsPreview = true;

    // You can have a source table for a PromptDialog page, as long as the source table is temporary. This is optional, though. 
    // The meaning of this source table is slightly different than for the other page types. In a PromptDialog page, the source table should represent an
    // instance of a copilot suggestion, that can include both the user inputs and the Copilot results. You should insert a new record each time the user
    // tries to regenerate a suggestion (before the page is closed and the suggestion saved). This way, the Business Central web client will show a new
    // history control, that allows the user to go back and forth between the different suggestions that Copilot provided, and choose the best one to save.
    
    SourceTable = TempInputData;
    SourceTableTemporary = true;
    
    Extensible = false; // Mandatory setting to ensure that the page isn't extended so that customers can trust the AI experience implemented.

    layout
    {
        // In PromptDialog pages, you can define a PromptOptions area. Here you can add different settings to tweak the output that Copilot will generate.
        // These settings must be defined as page fields, and must be of type Option or Enum. You cannot define groups in this area.

        // The Prompt area is where the user can provide input for your Copilot feature. The PromptOptions area should contain fields that have a limited set of options,
        // whereas the Prompt area can contain more structured and powerful controls, such as free text controls and subparts with grids.

        area(Prompt) 
        { 

            /* The input to copilot. Accepts any control, except repeater controls. */ 

            field(ProjectDescription; UserInput)
            {    
                ShowCaption = false;
                MultiLine = true;
            }
        }
    
        // The Content area is the output of the Copilot feature. This can contain fields or parts, so that you can have all the flexibility you need to
        // show the user the suggestion that your Copilot feature generated.

        area(Content) 
        { 
            /* The output of copilot. Accepts any control, except repeater controls. */ 

            field("Job Short Description"; JobDescription)
            {...}

            field("Job Full Details"; JobFullDescription)
            {...}

            field(CustomerNameField; CustomerName)
            {...}        
    
            part(ProposalDetails; "Copilot Job Proposal Subpart")        
            [...]
        }

        area(PromptOptions) 
        { 
            /*The input options. Only accepts option fields.*/ 
            
            field(Tone; Tone)  {}
    
            field(TextFormat; TextFormat)  {}
        
            field(Emphasis; Emphasis)  {}

        }
    }

    actions
    {
        area(SystemActions)
        {
            // Pre-defined system actions (Generate, Regenerate, Attach, Ok, or Cancel). Can only use system actions on this page.

            // You can have custom behavior for the main system actions in a PromptDialog page, such as generating a suggestion with copilot, regenerate, or discard 
            // the suggestion. When you develop a Copilot feature, remember: the user should always be in control (the user must confirm anything Copilot suggests 
            // before any change is saved).
            // This is also the reason why you cannot have a physical SourceTable in a PromptDialog page (you either use a temporary table, or no table).

            systemaction(Generate)
            {
                Caption = 'Generate'; 
                ToolTip = 'Generate using copilot';

                trigger OnAction()
                begin
                    // The code triggering the copilot interaction.
                    RunGeneration();
                end;
            }

            systemaction(Ok)
            {   
                // The Caption and Tooltip of system actions can be modified.
                Caption = 'Keep it'; 
                ToolTip = 'Save the job proposal';
            }

            systemaction(Cancel)
            {
                // The Caption and Tooltip of system actions can be modified.
                Caption = 'Throw away'; 
                ToolTip = 'Throw away the job proposal and start over';
            }

            systemaction(Regenerate)
            {    
                Caption = 'Regenerate';
                ToolTip = 'Regenerate the job proposal';
                
                trigger OnAction()
                begin
                    RunGeneration();
                end;
            }
        }
    }

    // Respect the user's choice
    trigger OnQueryClosePage(CloseAction: Action): Boolean 
    var SaveCopilotJobProposal: Codeunit "Save Copilot Job Proposal";
    begin
        if CloseAction = CloseAction::OK then
            SaveCopilotJobProposal.Save(CustomerNo, CopilotJobProposal);
    end;


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
[PageType property](properties/devenv-pagetype-property.md)  
[PromptMode property](properties/devenv-romptmode-property.md)  
[IsPreview property](properties/devenv-ispreview-property.md)  
[SourceTable property](properties/devenv-sourcetable-property.md)  
[SourceTableTemporary property](properties/devenv-sourcetabletemporary-property.md)  
[Extensible property](properties/devenv-extensible-property.md)  
