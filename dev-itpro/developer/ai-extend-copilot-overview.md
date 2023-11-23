---
title: Is your offering a copilot?
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

At Microsoft, *copilot* refers to a category of large language model-based, generative AI interaction. A copilot empowers people to be smarter, more productive, more 
creative, and connected to the people and things around them.

This article explains the essential characteristics of a copilot, which your offering must include to be considered a copilot in Business Central. Using the developer tools for copilot  helps you meet the criteria. 

## LLM-based

The experience is an interactive, chat-based generative AI agent built on a large language model (LLM) or other state-of-the-art foundational model.

## Responds to natural language to empower users to achieve tasks

The experience responds to natural language to empower users to achieve tasks that would otherwise require substantial cognitive load or creativity, and time. Examples of ways AI and copilot can support users:

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

AI might suggest actions with undesirable or harmful side effects due to inadequate or erroneous input, incorrect interpretation of input, or flawed inference. AI mights provide incorrect, offensive, or inappropriate statements and claims due to inadequate or erroneous input, incorrect. Copilot must mitigate or reduce these risks. Human oversight, also known as human-in-the-loop (HITL), is essential to reducing these risks.  

- When taking action on user's behalf, copilot provides a preview AI generated results.
- When showing generated information, copilot indicates that the information is AI generated amd states the confidence level; allowing users to make information decisions.
- Users have way to completely discard, or undo, the results. 
- Users can provide feedback about the quality of the results. 


## Next steps

[Get setup with Azure OpenAI Service](ai-dev-tools-get-started.md)
