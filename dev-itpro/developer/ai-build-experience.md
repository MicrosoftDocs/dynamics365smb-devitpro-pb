---
title: Concept article template #Required; page title displayed in search results. Don't enclose in quotation marks.
description: Concept description #Required; article description that's displayed in search results. Don't enclose in quotation marks. Do end with a period.
author: rhanajoy #Required; your GitHub user alias, with correct capitalization.
ms.author: rhcassid #Required; your Microsoft alias; optional team alias.
ms.reviewer: kfend #Required; Microsoft alias of content publishing team member.
ms.topic: conceptual #Required; don't change.
ms.collection: get-started #Required; If this isn't a getting started article, don't remove the attribute, but leave the value blank. The values for this attribute will be updated over time.
ms.date: 11/04/2023
ms.custom: bap-template #Required; don't change.
---

<!--Remove all the comments in this template before you sign-off or merge to the main branch.-->

<!--This template provides the basic structure of a concept article. See [Write a concept article](write-a-concept-article.md) in the contributor guide. To provide feedback on this template contact [bace feedback team](mailto:templateswg@microsoft.com).-->

<!--H1 - Required. This should match the title you entered in the metadata. Set expectations for what the content covers, so customers know the content meets their needs. Should NOT begin with a verb.-->
# Build the AI experience 

In this article, you learn how to create the user interface for your AI solution that provides users with a copilot experience that is similar across Business Central. The main component of the implementation is a [PromptDialog])type page. This page type is a multi-functional page type that creates a unified Copilit experience for entering data, generating AI-powered content, and saving or discarding results.

## Design flow

The essential UI flow for a Copilot experience is a follows:

|In UI|In AL code|||
|-|-|-|-|
|1|User starts the Copilot experience, for example, by selecting an action on a page.|Promptdialog type page is run. |||
|2|A page opens where users then provide input, for example, like descriptive text |The `prompt` area of the Promptdialog page defines what the user can input, which typically consists of one or more editable fields|||
|3|User selects a button to start generating content with Copilot|A system action |A system action starts the AI generation process||
|4|The AI-generated content is returned and displayed page|The `content` area of the Promptdialog page defines the layout of AI-generated content on the page.|
|5|User select to save or discard the results bu using actions at the bottom of the page |A system action for saving and one for discarding work with a trigger respect the user's choice, and close the page- ||  


<!--
1. User opens the Promptdialog page to start the experience, for example, be selecting an action on another page.
1. The page opens to display a prompt area, where users can provide input, for example, text.
1. User starts the generation by AI by selecting a system action called Generate.
1. Resulting AI-generated content is returned and displayed in the Promptdialog page, arranged as defined by the page layout.
1. The user can review 
1. 
1. -->

## Launch experience

With this task, you add code to run the PromptDialog page. This is similar to the way you start any page. The following code uses an action: 

```al
action(GenerateCopilot)
{
    Caption = 'Draft with Copilot';
    Image = Sparkle;

    trigger OnAction()
    begin
        Page.RunModal(Page::"Copilot Job Proposal");
    end;
}
```

Set the [Image property](properties/devenv-image-property.md) to `Sparkle`, which is the recognized image across Microsoft products used to indicate that the action is associated with Copilot. 

## Build the PromptDialog page

The basic 

1. Create a page of the type PromptDialog.
1. Add the prompt area where users add text that's used by AI to generate results.
1. Add a system action to generate results with Copilot.
1. Add a content area to display the results
1. Add a data caption expression to the page.
1. Add save and discard

```al
page 54320 "Copilot Job Proposal"
{
    Caption = 'Draft new job with Copilot';
    PageType = PromptDialog;
    Extensible = false;
    IsPreview = true;
    DataCaptionExpression = UserInput;

layout
{
    area(Prompt) 
    {
        field(ProjectDescription; UserInput)
        {
            ShowCaption = false;
            MultiLine = true;
        }
    }
    area(Content)
    {
        field("Job Short Description"; JobDescription)
        {
        }
        field("Job Full Details"; JobFullDescription)
        {
        }
        field(CustomerNameField; CustomerName)
        {
        }
        part(ProposalDetails; "Copilot Job Proposal Subpart")
        {
        }
    }

    area(PromptOptions)
        {
            field(Tone; Tone) {}
            field(TextFormat; TextFormat) {}
            field(Emphasis; Emphasis){}
        }
}
actions
{
    area(SystemActions)
    {
        systemaction(Generate)
        {
            Caption = 'Generate';
            trigger OnAction()
            begin
                RunGeneration();
            end;
        }
    }
        systemaction(Regenerate)
        {
            Caption = 'Regenerate';
            ToolTip = 'Regenerate the Job proposed by Dynamics 365 Copilot.';
            trigger OnAction()
            begin
                RunGeneration();
            end;
        }
        systemaction(OK)
        {
            Caption = 'Keep it';
            ToolTip = 'Save the proposed Job.';
        }
        systemaction(Cancel)
        {
            Caption = 'Throw it away';
            ToolTip = 'Throw away the proposed Job.';
        }
}

trigger OnQueryClosePage(CloseAction: Action): Boolean
var
    SaveCopilotJobProposal: Codeunit "Save Copilot Job Proposal";
begin
    if CloseAction = CloseAction::OK then
        SaveCopilotJobProposal.Save(CustomerNo, CopilotJobProposal);
end;
}
```



## Next steps

<!--Remove all the comments in this template before you sign-off or merge to the main branch.-->
