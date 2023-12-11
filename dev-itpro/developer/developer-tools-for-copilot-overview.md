---
title: What are the developer tools for copilot?
description: Get an overview of the toolkit from Business Central for building copilots in your extensions.
author: jswymer
ms.author: jswymer
ms.reviewer: jswymer 
ms.topic: overview
ms.collection: get-started
ms.date: 12/07/2023
ms.custom: bap-template 
---

# What are the developer tools for copilot?

Azure OpenAI Service offers robust, generative AI models that our partners can now utilize to foster a rich ecosystem of AI-powered extensions for Business Central. Developer tools for copilot make up a specialized toolkit that allows AL developers to easily integrate Azure OpenAI Service into AL code. This toolkit enables developers to enrich their extensions and solutions with generative AI, creating a seamless integration into the Business Central user experience, and allowing for a straightforward implementation into their add-ons or customizations.

## Benefits 

The advantages of using this toolkit include:
- Designing solutions that adhere to Responsible AI principles.
- Creating a unified Copilot experience.
- Accelerating time to market.

With Business Central's flexible development platform, developers can implement AI from scratch using any AI platform, model, or API. However, building upon the toolkit provides numerous benefits to both partners and customers. 

|Stakeholder|Benefits|
|-|-|
|Partners|<ul><li>Quicker path to delivering generative AI to your customers in production.</li><li>Attractive visual design with signature Microsoft Copilot experience that is seamless in Business Central's UI. </li><li>Build upon Microsoft's expertise in responsible AI to improve the safety of your features. </li><li>Reduced time and effort to bring your idea to market, resulting in new monetization and compete opportunities.</li><li>Rapidly build prototypes to validate ideas within your team or with customers.</li></ul>|
|Customers|<ul><li>Seamlessness and consistency of experience across copilot capabilities from different software vendors.</li><li>Safer Business Central capabilities, developed responsibly  </li><li>Centralized place to discover and control generative AI features from Microsoft and partners. </li></ul>|

## Intent

The following table outlines the primary intended uses and characteristics of the developer tools for copilot:

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

## Data governance

Azure OpenAI Service is currently available in select countries/regions. Customers and partners connecting to Azure OpenAI service within their region don't need any extra setup, configuration, or consent. However, when connecting to Azure OpenAI service outside the environment's region, administrators must first approve data movement across regions before any Copilot features can be utilized in Business Central.

Starting from update 23.1, environments deployed within the EU boundary won't require consent to data movement. Nevertheless, environment administrators retain the option to opt out at any time.


## Next steps

[Get set up with Azure OpenAI Service](ai-dev-tools-get-started.md)
