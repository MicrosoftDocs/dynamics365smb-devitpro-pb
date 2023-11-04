---
title: Overview article template #Required; page title displayed in search results. Don't enclose in quotation marks.
description: Overview description #Required; article description that's displayed in search results. Don't enclose in quotation marks. Do end with a period.
author: rhanajoy #Required; your GitHub user alias, with correct capitalization.
ms.author: rhcassid #Required; your Microsoft alias; optional team alias.
ms.reviewer: kfend #Required; Microsoft alias of content publishing team member.
ms.topic: overview #Required; don't change.
ms.collection: get-started #Required; If this isn't a getting started article, don't remove the attribute, but leave the value blank. The values for this attribute will be updated over time.
ms.date: 11/04/2023
ms.custom: bap-template #Required; don't change.
---

<!--Remove all the comments in this template before you sign-off or merge to the main branch.-->

<!--This template provides the basic structure of a service/product overview article. See [Write an overview](write-an-overview.md) in the contributor guide. To provide feedback on this template contact [bace feedback team](mailto:templateswg@microsoft.com).-->

<!--H1. Required. Set expectations for what the content covers, so customers know the content meets their needs. H1 format is # What is {subject}?-->
# What is Developer Tools for Copilot?

Azure OpenAI Service offers robust, generative AI models that our partners can now utilize to foster a rich ecosystem of AI-powered extensions for Business Central. Developer Tools for Copilot is a specialized toolkit that allows AL developers to easily integrate Azure OpenAI Service into AL code. This toolkit enables developers to enrich their extensions and solutions with generative AI, creating a seamless integration into the Business Central user experience, and allowing for a natural implementation into their add-ons or customizations.

The advantages of using this toolkit include:
- Designing Solutions that adhere to Responsible AI principles.
- Creating a unified Copilot experience.
- Accelerating time to market.

## Intent

The following table outlines the primary intended uses and characteristics of the Developer Tools for Copilot:

|Characteristic|Intended use|
|-|-|
|Deployment|Business Central online|
|AI|Generative AI to assist human with complex cognitive tasks|
|Interaction mode |Non-conversational, integrated into business functionality with input and output. Human review required|

## Features

The toolkit introduces the following features:

- AI module in the system application

   The System.AI namespace in the system application allows extensions to connect to Azure OpenAI Service and utilize models such as GPT from your AL code.

- PromptDialog page type

   The PromptDialog page facilitates the user-interface for crafting generative AI experiences, providing users with a unified experience across Business Central, including signature visuals, and built-in safety controls for customers.

- Management

   Apply your own Azure AI key to tell your unique AI story.

- Comprehensive guides and code samples

- Effective monitoring through Power BI
- 
## Data governance

Azure OpenAI Service is currently available in select countries/regions. Customers and partners connecting to Azure OpenAI service within their region don't need any extra setup, configuration, or consent. However, when connecting to Azure OpenAI service outside the environment's region, administrators must first approve data movement across regions before any Copilot features can be utilized in Business Central.

Starting from Update 23.1, environments deployed within the EU boundary won't require consent to data movement. Nevertheless, environment administrators retain the option to opt out at any time.

<!--add your content here-->

<!--Next steps Required. Provide at least one next step and no more than three. Include some context so the customer can determine why they would click the link.-->
## Next steps

<!--Remove all the comments in this template before you sign-off or merge to the main branch.-->
