---
title: Configure instructions, tasks, and permissions for AI Playground Agent(preview)
description: Learn how you can use AI Playground Agent in Business Central.
author: solsen
ms.author: solsen
ms.reviewer: solsen
ms.topic: concept-article
ms.collection:
  - get-started
  - bap-ai-copilot
ms.date: 09/10/2025
ms.update-cycle: 180-days
---

# Configure instructions, tasks, and permissions for AI Playground Agent (preview)

[This article is prerelease documentation and is subject to change.]

> This article is primarily intended for product owners, domain experts, consultants, and developers who want to experiment with AI capabilities in [!INCLUDE [prod_short](../includes/prod_short.md)] using the AI Playground agent.

To get an agent up and running effectively, you need to configure its instructions, tasks, and permissions appropriately. 

### Writing effective instructions

Think of instructions as something you would give to a human assistant. You'd want to give some context, explain the task clearly, and set expectations for the output. Writing instructions for an AI model is similar. Clarity, specificity, context, and structure are the four main points to consider. Here are some general tips for writing effective instructions:

- Be clear and specific: avoid vague instructions.
- Include context: describe the situation or data the model should consider.
- Set expectations: Tell the model what kind of output you want. For example, a summary, list, or an explanation.
- Use examples: Show the model what a good response looks like.
- Iterate and refine: Test and improve your prompt based on results.

With the AI Playground Agent, you must give it instructions in natural language that clearly describe its purpose. These instructions guide the agent on using the UI and data it has access to. The more precise and detailed your instructions are, the better the agent can perform its tasks. Before you write the instructions, review the UI that the agent will have access to based on its profile. This helps you understand what the agent can see and do, allowing you to tailor your instructions accordingly. Test these instructions thoroughly to ensure they lead to the desired behavior.

<!-- Add example of good instructions, like shown in the partner video. Link to best practices for prompting -->

### Defining tasks 

## Related information

[Configure Copilot and agent capabilities](/dynamics365/business-central/enable-ai)  
[AI Playground Agent overview (preview)](ai-playground-agent.md)  
[Create and manage a Playground agent (preview)](ai-playground-agent-create.md)  