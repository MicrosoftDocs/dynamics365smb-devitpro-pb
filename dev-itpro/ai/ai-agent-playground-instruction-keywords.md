---
title: Instruction keywords for an agent (preview)
description: Learn about the instruction keywords you can use to guide the behavior of your playground agent in Business Central.
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

# Instruction keywords for a playground agent (preview)

[This article is prerelease documentation and is subject to change.]

[!INCLUDE [ai-playground-preview](../includes/ai-playground-preview.md)]

When writing instructions for your playground agent, you can use specific keywords and phrasing to help the agent understand how to utilize the tools available in the agent runtime effectively. These keywords guide the agent's behavior, ensuring it follows best practices and handles tasks as intended.

Learn more about what instructions and tasks are in [Write effective instructions for a playground agent (preview)](ai-agent-playground-effective-instructions.md).

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
|**Then ask for assistance**|Instructs the agent to seek help if needed during task execution.| "If you encounter an error, then ask for assistance." |
|**Request a review**|Instructs the agent to ask for a review of its work before finalizing. The task will continue after the user confirms. Note: All outgoing messages require a review.| "When the sales order is created, request a review before posting." |
|**Reply**| Instructs the agent to respond to a message or query.| "When the sales order is created, reply with the confirmation." |
|**Write an email**|Instructs the agent to compose and send an email. All outgoing messages require a review.| "When the sales order is created, write an email to the customer with the confirmation." |
|**Memorize**| Instructs the agent to store specific values. These values can later be referenced.| "Memorize the customer's credit limit for future reference." |
|**Set field**| Instructs the agent to set a specific field value.| "Set the 'Status' field to 'Approved'." |
|**Use lookup**| Instructs the agent to use a specific lookup.| "Use lookup to select the appropriate payment terms." |
|**Invoke action**| Instructs the agent to invoke a specific action.| "Invoke the 'Post' action to finalize the sales order." |


## Related information

[Overview](ai-agent-playground-landing-page.yml)  
[Agent playground (preview)](ai-agent-playground.md)  
[Create and activate (preview)](ai-agent-playground-create.md)   
[Instruction keywords (preview)](ai-agent-playground-instruction-keywords.md)  
[Integrate with the Tasks AL API (preview)](ai-agent-playground-tasks-api.md)  
[Set up permissions and profiles (preview)](ai-agent-playground-permissions-profiles.md)  
[Run a playground agent (preview)](ai-agent-playground-run-agent.md)  
[Iterate and manage (preview)](ai-agent-playground-iterate.md)  
[Best practices (preview)](ai-agent-playground-best-practices.md)  
[Transparency note: Business Central agent playground](transparency-note-agent-playground.md)  
