---
title: Concept topic template #Required; page title displayed in search results. Don't enclose in quotation marks.
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

<!--Introductory paragraph - Required. Lead with a light intro that describes what the article covers. Answer the fundamental "What is X and how will learning this help me accomplish Y?" question. A good lead is a sentence in the form, "X is a (type of) Y that does Z." Keep this paragraph short.-->
<!--add your intro paragraph here-->

<!--H2s - Required. Give each H2 a heading that sets expectations for the content that follows. Follow H2 headings with a sentence about how the section contributes to the whole.-->
## Section heading

1. Launch the experience
2. The promptdialogpage opens
1. User enters propmts
1. Generates content
1. Results shown
1. 
1. 

## Launch experience

With this task, you add code to run the PromptDialog page. This is similar to the way you start any page. The following code uses an action: 

```al
action(GenerateCopilot)
{
    Caption = 'Describe To Copilot';
    Image = Sparkle;

    trigger OnAction()
    begin
        Page.RunModal(Page::"Copilot Job Proposal");
    end;
}
```

Set the image property to Sparkle to indicate that the action is associated with Copilot. The Sparkle image is a recognized image across Microsoft products.

## Build the PromptDialog page

1. Create a page of the type PromptDialog.
1. Add the prompt area where users add text used by AI to generate results.
1. Add a system action to generate results with Copilot.
1. 

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
}
```

## Next steps

<!--Remove all the comments in this template before you sign-off or merge to the main branch.-->
