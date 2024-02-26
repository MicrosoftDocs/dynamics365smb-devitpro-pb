---
title: The PromptDialog object
description: Business Central
author: SusanneWindfeldPedersen
ms.author: solsen
ms.reviewer: 
ms.topic: overview
ms.collection:
  - bap-ai-copilot
ms.date: 02/21/2024
ms.custom: bap-template
---

# The PromptDialog object

With [!INCLUDE [prod_short](includes/prod_short.md)] runtime 12.1, you can add a new page type `PromptDialog`, which allows you to integrate copilot capabilities into your custom scenarios. Use the `PromptDialog` to create generative AI experiences with the copilot look and feel, which includes signature visuals, and built-in safety controls for customers. The `PromptDialog` page has a specific page syntax, which includes new area and action controls, as described in the code sample in this article.

## Snippet support

Typing the shortcut `tpage` and then choose the **Page of type Prompt Dialog**, which creates the basic layout for a `PromptDialog` page object when using the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] in Visual Studio Code.

## Properties of the PromptDialog page type

The `PromptDialog` page type has some specific properties that characterize the dialog and must be set for this specific experience.

|Property|Description|
|--------|-----------|
|`PageType` | The `PageType` property must be set to `PromptDialog` for this specific page type.|
|`PromptMode` |The `PromptMode` property value is by default `Prompt`, which is the starting prompt mode. The `PromptMode` property can be changed at runtime. The other options are; <br> - `Generate`, which triggers generating the output of the copilot interaction, and <br>- `Content`, which shows the output of the copilot interaction.<br> You can programmatically set this property by setting the variable `CurrPage.PromptMode` before the page is opened.|
|`IsPreview` | The `IsPreview` property adds a specific note in the UI to indicate that the feature is in preview. It's by default set to `false`.|
|`Image`| To identify and ensure consistency in the UI for a generative AI experience, the `Image` property for the action invoking it, should be set to `Sparkle`. If there are multiple copilot options to choose from in the UI, the `Image` property can be set to `Image = SparkleFilled;` to make a specific action more prominent. To view a list of images, see [Available icons](https://aka.ms/bcicons). |

To find links to the properties related to the `PromptDialog` page type, see the [See also](devenv-page-type-promptdialog.md#see-also) section in this article.

## Areas of the PromptDialog page type

The `PromptDialog` page type has the following area types that characterize the dialog.

|Area |Description|
|-----|-----------|
|`Prompt` | The `Prompt` area is the input to copilot, and accepts any control, except repeater controls.|
|`Content` | The `Content` area is the output of copilot, and accepts any control, except repeater controls.|
|`PromptOptions` | The `PromptOptions` area is the input options, and only accepts option fields.|


### Actions in the PromptDialog page

Unlike other page types, `PromptDialog` pages can only specify two action areas; `SystemActions` and `PromptGuide`. 

|Action|Description|
|------|-----------|
|`SystemActions` | The `SystemActions` area only allow you to define a fixed set of actions called system actions, which are only supported by this page type. These system actions are `Generate`, `Regenerate`, `Attach`, `Ok` and `Cancel`.|
|`PromptGuide` | The `PromptGuide` action area represents a list of predefined text prompt "guides", which users can select to use as input to generate content, rather than creating their own prompt from scratch. The prompt guide menu is only rendered in the web client when the `PromptMode` of the `PromptDialog` page is set to `Prompt`.|

<!-- image here -->

## Example

The following example describes a page, which is a PromptDialog page, set with the `PromptDialog` option. The `Extensible = false;` is a mandatory setting, to ensure that the page isn't extended so that customers can trust the AI experience implemented.

Use the `IsPreview` property to indicate to your customers that you're using the feature in preview, and that the feature might change in the future as you gather feedback. The `IsPreview` property adds a specific note in the UI to indicate that the feature is in preview. It's by default set to `false`. 

The page calls the `RunGeneration` procedure, which *you must implement yourself*. This is where you call the copilot API, and get the results back. The `RunGeneration` method is called when the user clicks the **Generate** action. The **Generate** action is a system action that can be used on this page type and it's used to trigger the copilot interaction. The **Generate** action is also used to regenerate the suggestion, if the user wants to change the input to copilot.

For an example on how to implement the `RunGeneration` procedure, see [BCTech samples AzureOpenAI](https://github.com/microsoft/BCTech/blob/002affcf1520a710c270257d6547e25a9a223e85/samples/AzureOpenAI/Basic_ItemSubstitution/PromptDialog/ItemSubstAIProposal.Page.al#L111). 

For an example on building an AI capability, see [Build the copilot capability in AL](ai-build-capability-in-al.md).

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
            // This is also the reason why you can't have a physical SourceTable in a PromptDialog page (you either use a temporary table, or no table).

            systemaction(Generate)
            {
                Caption = 'Generate'; 
                ToolTip = 'Generate using copilot';

                trigger OnAction()
                begin
                    // The code triggering the copilot interaction. This is where you call the Copilot API, and get the results back. You must implement this logic yourself. 
                    RunGeneration();
                end;
            }

            // Adds an action to allow attaching a file, which is used as input for the copilot interaction.

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
                    // The code triggering the copilot interaction. This is where you call the Copilot API, and get the results back. You must implement this logic yourself. 
                    RunGeneration();
                end;
            }      
        }
        area(Prompting)
        {
            action(OrderFromDescription)
            {
                Caption = ‘Order from description’;
                trigger OnAction()
                    UserInput := 'The prompt is set in the NL field';
                    // Update the page to show the inserted prompt. 
                    CurrPage.Update();
                begin
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
[PromptMode property](properties/devenv-promptmode-property.md)  
[Image property](properties/devenv-image-property.md)  
[IsPreview property](properties/devenv-ispreview-property.md)  
[SourceTable property](properties/devenv-sourcetable-property.md)  
[SourceTableTemporary property](properties/devenv-sourcetabletemporary-property.md)  
[Extensible property](properties/devenv-extensible-property.md)  
