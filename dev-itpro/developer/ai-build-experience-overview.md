---
title: How-to topic template #Required; page title displayed in search results. Don't enclose in quotation marks.
description: How-to description #Required; article description that's displayed in search results. Don't enclose in quotation marks. Do end with a period.
author: rhanajoy #Required; your GitHub user alias, with correct capitalization.
ms.author: rhcassid #Required; your Microsoft alias; optional team alias.
ms.reviewer: kfend #Required; Microsoft alias of content publishing team member.
ms.topic: how-to #Required; don't change.
ms.collection: get-started #Required; If this isn't a getting started article, don't remove the attribute, but leave the value blank. The values for this attribute will be updated over time.
ms.date: 11/22/2023
ms.custom: bap-template #Required; don't change.
---

<!--Remove all the comments in this template before you sign-off or merge to the main branch.-->

<!--This template provides the basic structure of a how-to article. See [Write a how-to topic](write-a how-to.md) in the contributor guide. To provide feedback on this template contact [bace feedback](mailto:templateswg@microsoft.com).-->

<!--H1. Required. Pick an H1 that clearly conveys the task the user will complete.-->
# Designing and developing generative AI experiences for your extensions

Creating a Copilot in Business Central extension involves three main tasks: getting set up with Azure OpenAI, using the AI module in the Business Central system application, and designing the Copilot user interface. With these steps completed, you'll be well on your way to creating a powerful and effective Copilot that can assist users with generating content and making their work easier and more efficient.

<--! image-->

Let's take a closer look at each of these tasks.

## Getting set up with Azure OpenAI

As a prerequisite to get started with creating a Copilot in Business Central, you first need to apply for access to Azure OpenAI Service. Once you've been approved, you can create an Azure OpenAI resource in the Azure Portal. From this resource, you'll need to grab your API key and deployment name.
Using the AI module in the Business Central system application

## Using the AI module in the Business Central system application

In this phase, use the AI module in the Business Central system application to add AL code that will retrieve AI-generated content from the Azure OpenAI service. This involves adding code to the OnRun() trigger of your page or codeunit to call the Azure OpenAI service and retrieve the generated content.

### Designing the Copilot user interface

Finally, you'll need to design the Copilot user interface. This is done by using a PromptDialog page, which enables users to input their requirements, start the generation process, review the output, and save it. The PromptDialog page can be customized to suit the needs of your specific extension and can include fields for user input, buttons for initiating the generation process, and fields for displaying the generated content.



