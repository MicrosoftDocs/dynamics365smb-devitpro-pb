---
title: Overview topic template #Required; page title displayed in search results. Don't enclose in quotation marks.
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

Azure OpenAI Service offers powerful, generative AI models that our partners can now leverage to deliver a rich ecosystem of AI-powered extensions for Business Central. The Developer Tools for Copilot is a toolkit that provides AL developers a quick and convenient way to leverage the Azure OpenAI Service from AL code. Using the toolkit, developers can enhance their extensions and solutions with generative AI that's seamlessly integrated into the Business Central user experience and can be delivered as a natural part of their add-ons or customizations.

Using the toolkit has the following benefits:

- Design solutions in accordance with Responsible AI principles. 
- Unified Copilot experience.
- Common guard rails​
- Quicker to market

## Features

The toolkit offers the following features:

- AI module in the system application 

   The System.AI namespace in the system application enables extensions to connect to Azure OpenAI Service and use models such as GPT from your AL code.

- PromptDialog page type

   The PromptDialog page provides the user-interface for creating generative AI experiences, It gives users an unified experience with copilot across Business Central, including signature visuals, and built-in safety controls for customers.
- Manage your subscription: Bring your own Azure AI key that powers your AI story.

- Guides and code samples 
- Monitoring and usage tracking in Power BI.
- 
## Data governance

Azure OpenAI Service is currently available in select countries and regions. Customers and partners connecting to Azure OpenAI service within their region won't require any additional setup, configuration or consent. When connecting to Azure OpenAI service outside of the environment's region, admins must first consent to data movement across regions before any Copilot features can be used in Business Central.

From Update 23.1, environments deployed within the EU boundary won't be required to consent to data movement, but environment administrators can opt out at any time.

<!--add your content here-->

<!--Next steps Required. Provide at least one next step and no more than three. Include some context so the customer can determine why they would click the link.-->
## Next steps

<!--Remove all the comments in this template before you sign-off or merge to the main branch.-->
