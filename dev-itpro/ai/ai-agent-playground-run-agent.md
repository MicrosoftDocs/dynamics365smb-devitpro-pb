---
title: Run a Playground Agent (preview)
description: Learn how to trigger a playground agent in Business Central. Optimize agent behavior with structured guidelines and clear steps.
author: solsen
ms.author: solsen
ms.reviewer: solsen
ms.topic: concept-article
ms.collection:
  - get-started
  - bap-ai-copilot
ms.date: 12/05/2025
ms.update-cycle: 180-days
---

# Run an agent created in the playground (preview)

[This article is prerelease documentation and is subject to change.]

[!INCLUDE [ai-playground-preview](../includes/ai-playground-preview.md)]

To get an agent up and running effectively, you need to configure its instructions, tasks, and permissions appropriately. Learn more about how to write effective instructions in [Write effective instructions for a playground agent (preview)](ai-agent-playground-effective-instructions.md).

## Defining tasks

A task represents a specific unit of work that the agent needs to perform. Each task is associated with a set of instructions that guide the agent on how to complete it.

### How to trigger your agent

There are two ways to trigger a task for your agent:

1. Manually via the **Agent tasks** page in [!INCLUDE [prod_short](../includes/prod_short.md)] through the **Create task** action.
2. Through the **Tasks AL API** which allows for integrating both with UI elements such as actions and with events such as receiving an email or a sales order posting. Learn more in [Integrate with the Tasks AL API](ai-agent-playground-tasks-api.md).

When creating a task, you can specify an extra message that gets passed to the agent to complement the general instructions with specific details for that particular task. Each task you create appears in the agent's task queue, where the agent picks it up and processes it according to its instructions. Tasks can be stopped and restarted as needed.

## Testing and continuous improvement

Once your agent is set up and tasks are being created, it's important to monitor its performance and make adjustments as necessary. Use the insights gained from task executions to refine your agent's instructions and improve its effectiveness over time. Learn more about continuously improving your playground agent in [Iterate and manage a playground agent (preview)](ai-agent-playground-iterate.md).

## Related information

[Overview (preview)](ai-agent-playground-landing-page.yml)  
[Agent playground (preview)](ai-agent-playground.md)  
[Create and activate (preview)](ai-agent-playground-create.md)  
[Write effective instructions (preview)](ai-agent-playground-effective-instructions.md)  
[Instruction keywords (preview)](ai-agent-playground-instruction-keywords.md)  
[Integrate with the Tasks AL API (preview)](ai-agent-playground-tasks-api.md)  
[Set up permissions and profiles (preview)](ai-agent-playground-permissions-profiles.md)  
[Iterate and manage (preview)](ai-agent-playground-iterate.md)  
[Best practices (preview)](ai-agent-playground-best-practices.md)  
[Transparency note: Business Central agent playground](transparency-note-agent-playground.md)  
