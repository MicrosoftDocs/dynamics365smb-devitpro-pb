---
title: Instruction keywords for an agent (preview)
description: Learn about the instruction keywords you can use to guide the behavior of your agent in Business Central.
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

# Instruction keywords for an agent (preview)

[This article is prerelease documentation and is subject to change.]

[!INCLUDE [ai-designer-preview](../includes/ai-designer-preview.md)]

When writing instructions for your agent, you can use specific keywords and phrasing to help the agent understand how to utilize the tools available in the agent runtime effectively. These keywords guide the agent's behavior, ensuring it follows best practices and handles tasks as intended.

Learn more about what instructions and tasks are in [Write effective instructions for an agent (preview)](ai-agent-designer-effective-instructions.md).

## Agent history

Similar to a chat completion API, the agent retains a history of all actions that took place in the current session. This history helps the agent understand the context of the conversation and make informed decisions based on previous interactions. The agent stores:

- Every action performed by the agent.
- Any search run on a list page, along with the results returned.

The agent *doesn't* store:

- The state of every page it visited. To do this, you must *explicitly* instruct the agent to save the state.

## Common instruction keywords

Here are some common keywords and phrases you can use in your agent's instructions:

|Keyword/Phrase|Description| Example |
|--------------|-----------|---------|
|**Ask for assistance**|Instructs the agent to seek help if needed during task execution.| "If you encounter an error, then ask for assistance." |
|**Request a review**|Instructs the agent to ask for a review of its work before finalizing. The task will continue after the user confirms.| "When the sales order is created, request a review before posting." |
|**Reply**| Instructs the agent to respond to a message or query. Note: All outgoing messages require a review.| "When the sales order is created, reply with the confirmation." |
|**Write an email**|Instructs the agent to compose and send an email. All outgoing messages require a review.| "When the sales order is created, write an email to the customer with the confirmation." |
|**Memorize**| Instructs the agent to store specific values. These values can later be referenced.| "Memorize the customer's credit limit for future reference." |
|**Set field**| Instructs the agent to set a specific field value.| "Set the 'Status' field to 'Approved'." |
|**Use lookup**| Instructs the agent to use a specific lookup.| "Use lookup to select the appropriate payment terms." |
|**Invoke action**| Instructs the agent to invoke a specific action.| "Invoke the 'Post' action to finalize the sales order." |

## Related information

[Overview (preview)](ai-agent-designer-landing-page.yml)  
[AI development toolkit (preview)](ai-agent-designer.md)   
[Create and activate (preview)](ai-agent-designer-create.md)   
[Instruction keywords (preview)](ai-agent-designer-instruction-keywords.md)  
[Integrate with the Tasks AL API (preview)](ai-agent-designer-tasks-api.md)  
[Attachment capabilities and limitations (preview)](ai-agent-designer-attachments.md)  
[Set up permissions and profiles (preview)](ai-agent-designer-permissions-profiles.md)  
[Run an agent (preview)](ai-agent-designer-run-agent.md)  
[Iterate and manage (preview)](ai-agent-designer-iterate.md)  
[Best practices for designing an agent FAQ (preview)](ai-agent-designer-faq.md)  
[Best practices (preview)](ai-agent-designer-best-practices.md)  
[Create a Sales Validation Agent (preview)](ai-agent-designer-sales-validation.md)  
[Transparency note: Business Central agent designer (preview)](transparency-note-agent-designer.md)  
