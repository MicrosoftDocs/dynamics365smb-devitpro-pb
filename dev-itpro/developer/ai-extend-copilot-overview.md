---
title: What is a copilot?
description: Learn what is considered to be a copilot.
author: jswymer
ms.author: jswymer 
ms.reviewer: jswymer
ms.topic: conceptual 
ms.collection: get-started #Required; If this isn't a getting started article, don't remove the attribute, but leave the value blank. The values for this attribute will be updated over time.
ms.date: 11/05/2023
ms.custom: bap-template 
---

# What is a copilot?

At Microsoft, the term *copilot* refers to a category of large language model-based, generative AI interaction. A copilot empowers users to be smarter, more productive, more creative, and more connected to the people and things around them.

This article explains the essential characteristics of a copilot and what your offering must include to be considered a copilot in Business Central. By using the developer tools for copilot, you can meet the necessary criteria.

## LLM-based

A copilot experience is an interactive, chat-based generative AI agent built on a large language model (LLM) or other state-of-the-art foundational model. This means that the copilot uses advanced natural language processing to understand user input and generate responses that are tailored to the user's specific needs

## Responds to natural language to empower users to achieve tasks

One of the key features of a copilot is its ability to respond to natural language input from users. Copilot should help users accomplish complex tasks that would otherwise require substantial cognitive load, creativity, and time. For example, copilot can assist users with the following tasks:
<!--
   - Generate content
   - Command product functionality
   - Provide answers and summaries
   - Provide suggestions and notifications
   - Enhance collaboration
-->
   - Simplify or solve complex tasks
   - Prioritize and plan tasks
   - Support communication and relationships with people
   - Get better, more in-depth, or more nuanced insights
   - Get quicker insights for immediate tasks
   - Understand relationships, patterns, and trends
   - Be proactively alerted of important tasks or insights

<!--3. If this experience will support extensibility: does it use the plugins standard for interoperability—defined by OpenAI and used by Bing Chat, Microsoft 365 Chat, Azure OpenAIService, and others?-->

## Manages generative AI risks through human-in-the-loop pattern

While copilot can be a powerful tool for productivity and creativity, it's important to manage the risks associated with generative AI. AI might suggest actions with undesirable or harmful side effects due to inadequate or erroneous input, incorrect interpretation of input, or flawed inference. Also, AI might provide incorrect, offensive, or inappropriate statements and claims.

Copilot must mitigate or reduce these risks by incorporating human oversight, also known as human-in-the-loop (HITL), into the experience. To reduce the risk of undesirable or harmful side effects, copilot supports the following:

- A preview of AI-generated results before taking action on the user's behalf.
- When showing generated information, copilot indicates that the information is AI-generated and states the confidence level, allowing users to make informed decisions. 
- Users have the option to completely discard or undo the results.
- Users can provide feedback about the quality of the results.


## Next steps

[Get setup with Azure OpenAI Service](ai-dev-tools-get-started.md)
