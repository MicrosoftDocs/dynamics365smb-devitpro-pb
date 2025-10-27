---
title: Configure instructions, tasks, and permissions for an AI Playground Agent (preview)
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

# Configure instructions, tasks, and permissions for an AI Playground Agent (preview)

[This article is prerelease documentation and is subject to change.]

> This article is primarily intended for product owners, domain experts, consultants, and developers who want to experiment with AI capabilities in [!INCLUDE [prod_short](../includes/prod_short.md)] using the AI Playground Agent.

To get an agent up and running effectively, you need to configure its instructions, tasks, and permissions appropriately. 

### Writing effective instructions

At the core of defining agents is expressing goals and instructions in natural language. Writing instructions for AI Playground agents is similar to crafting prompts for large language models (LLMs), so you can apply general prompt-writing guidelines to improve instruction quality. You can even use LLM-based tools like Copilot to help optimize your instructions.

#### Key principles for agent instructions

**Structure and brevity**:

- **Introduce structure** in your instructions using clear sections and formatting
- **Write as few instructions as possible** while maintaining clarity—concise instructions often perform better
- Use **emphasis** (bold text, UPPERCASE) to highlight important points
- Apply **numbering** to create logical flow and priorities

**Formatting for clarity**:

- Use bullet points or numbered lists for multi-step processes
- Bold key terms and critical requirements
- Structure instructions with clear headings when appropriate
- Keep sentences short and direct

**Agent-specific considerations**:

- Include **specific keywords or phrasing** to help the agent utilize available tools in the agent runtime effectively
- Review the UI that the agent has access to based on its profile before writing instructions
- Tailor instructions to match what the agent can see and do
- Reference specific field names, page titles, and actions that align with the agent's profile

#### When instructions aren't enough

If you're having difficulty achieving accuracy with your agent:

- **Consider changing or adding new functionality** to better support the agent's tasks
- **Optimize the UI** that the agent interacts with
- **Improve error messages and tooltips** to provide clearer guidance
- **Enhance page instructions** to help the agent be more successful

Test your instructions thoroughly to ensure they lead to the desired behavior, and iterate based on the agent's actual performance.

<!-- Add example of good instructions, like shown in the partner video. Link to best practices for prompting -->

### Defining tasks 

## Related information

[Configure Copilot and agent capabilities](/dynamics365/business-central/enable-ai)  
[AI Playground Agent overview (preview)](ai-playground-agent.md)  
[Create and manage an AI Playground Agent (preview)](ai-playground-agent-create.md)  