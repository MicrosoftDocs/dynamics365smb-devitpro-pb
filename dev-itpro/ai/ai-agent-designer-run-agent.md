---
title: Run an agent (preview)
description: Learn how to trigger an agent in Business Central. Optimize agent behavior with structured guidelines and clear steps.
author: solsen
ms.author: solsen
ms.reviewer: solsen
ms.topic: concept-article
ms.collection:
  - get-started
  - bap-ai-copilot
ms.date: 01/12/2026
ms.update-cycle: 180-days
---

# Run an agent (preview)

[This article is prerelease documentation and is subject to change.]

[!INCLUDE [ai-designer-preview](../includes/ai-designer-preview.md)]

To get an agent up and running effectively, you need to configure its instructions, tasks, and permissions appropriately. Learn more about how to write effective instructions in [Write effective instructions for an agent (preview)](ai-agent-designer-effective-instructions.md).

## Defining tasks

A task represents a specific unit of work that the agent needs to perform. Each task is associated with a set of instructions that guide the agent on how to complete it.

### How to trigger your agent

There are two ways to trigger a task for your agent:

1. Manually via the **Agent Tasks** page in [!INCLUDE [prod_short](../includes/prod_short.md)] through the **Run task** action. If you haven't defined a task, you can create one on the fly by providing the necessary details in the task creation dialog. Learn more about creating tasks in [Create and activate an agent (preview)](ai-agent-designer-create.md).
2. Through the **Tasks AL API** which allows for integrating both with UI elements such as actions and with events such as receiving an email or a sales order posting. Learn more in [Integrate with the Tasks AL API](ai-agent-designer-tasks-api.md).

When creating a task, you can specify an extra message that gets passed to the agent to complement the general instructions with specific details for that particular task. Each task you create appears in the agent's task queue, where the agent picks it up and processes it according to its instructions. Tasks can be stopped and restarted as needed.

## Testing and continuous improvement

Once your agent is set up and tasks are being created, it's important to monitor its performance and make adjustments as necessary. Use the insights gained from task executions to refine your agent's instructions and improve its effectiveness over time. Learn more about continuously improving your agent in [Iterate and manage an agent (preview)](ai-agent-designer-iterate.md).

## Related information

[Overview (preview)](ai-agent-designer-landing-page.yml)  
[AI development toolkit (preview)](ai-development-toolkit-overview.md)   
[Create and activate (preview)](ai-agent-designer-create.md)  
[Write effective instructions (preview)](ai-agent-designer-effective-instructions.md)  
[Instruction keywords (preview)](ai-agent-designer-instruction-keywords.md)  
[Integrate with the Tasks AL API (preview)](ai-agent-designer-tasks-api.md)  
[Attachment capabilities and limitations (preview)](ai-agent-designer-attachments.md)  
[Set up permissions and profiles (preview)](ai-agent-designer-permissions-profiles.md)  
[Iterate and manage (preview)](ai-agent-designer-iterate.md)  
[Best practices for designing an agent (preview)](ai-agent-designer-faq.md)  
[Best practices (preview)](ai-agent-designer-best-practices.md)  
[Create a Sales Validation Agent (preview)](ai-agent-designer-sales-validation.md)  
[Transparency note: Business Central AI development toolkit (preview)](transparency-note-ai-development-toolkit.md)  