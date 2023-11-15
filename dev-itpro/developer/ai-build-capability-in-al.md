---
title: Build an AI capability in AL
description: Concept description #Required; article description that's displayed in search results. Don't enclose in quotation marks. Do end with a period.
author: rhanajoy #Required; your GitHub user alias, with correct capitalization.
ms.author: rhcassid #Required; your Microsoft alias; optional team alias.
ms.reviewer: 
ms.topic: conceptual
ms.collection: get-started
ms.date: 11/15/2023
ms.custom: bap-template
---

# Build an AI capability in AL

This article explains how to integrate with Azure OpenAI Service through the AI module of [!INCLUDE [prod_short](includes/prod_short.md)]. It covers how to register the capability and how to use the AI module to call the Azure OpenAI Service.

<!-- Covers our System app module for AI including which models, how to get set up with AOAI key/endpoints, prompting, registering capabilities, simple sample code, link out to bigger example extension. Basically Darricks’ BCLE content.-->


## Overview of the AI module

The AI module of [!INCLUDE [prod_short](includes/prod_short.md)] integrates with Azure OpenAI Service and provides a set of AL objects that you can use to build AI capabilities. The AI module is designed for LLMs and supports text generation like GPT-3, chatbots, and embeddings. It doesn't support image generation like DALL-E or transcribing speech to text like Whisper. 

The AI module is available in the System Application, in the System.AI namespace. For reference documentation, see 

It can be used in any AL extension. The AI module provides the following capabilities:

- Ease of control and viewing the copilot capabilities in the environment
- Telemetry
- Tracking a capability’s registration/usages/errors and more

## Prerequisites

To build an AI capability in AL, you need the following:
Azure OpenAI Resource URL
https://[resourcename].openai.azure.com/
Deployment Name
MyGPT3.5
Azure OpenAI API key

- 

## Building an AI capability



<!--add your content here-->

<!--Next steps - Required. Provide at least one next step and no more than three. Include some context so the customer can determine why they would click the link.-->
## Next steps
