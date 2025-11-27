---
title: Instruction keywords
description: 
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

# Instruction keywords

[This article is prerelease documentation and is subject to change.]

[!INCLUDE [ai-playground-preview](../includes/ai-playground-preview.md)]

When writing instructions for your playground agent, you can use specific keywords and phrasing to help the agent understand how to utilize the tools available in the agent runtime effectively. These keywords guide the agent's behavior, ensuring it follows best practices and handles tasks as intended.

Learn more about what instructions and tasks are in [Configure Instructions and Tasks for a Playground Agent (preview)](ai-agent-playground-configure.md).

## Agent history

Similar to a chat completion API, the agent retains a history of all actions that have taken place in the current session. This history helps the agent understand the context of the conversation and make informed decisions based on previous interactions. The agent stores:

- Every action performed by the agent.
- Any search run on a list page, along with the results returned.

The agent *doesn't* store:

- The state of every page it has visited. To do this, you must *explicitly* instruct the agent to save the state.

## Common instruction keywords

Here are some common keywords and phrases you can use in your agent's instructions:

|Keyword/Phrase|Description| Example |
|--------------|-----------|---------|
|**Then ask for assistance**|Instructs the agent to seek help if needed during task execution.| |
|**Request a review**|Instructs the agent to ask for a review of its work before finalizing. The task will continue after the user confirms. Note: All outgoing messages require a review.| |
|**Reply**| Instructs the agent to respond to a message or query.| |
|**Write an email**|Instructs the agent to compose and send an email. All outgoing messages require a review.| |
|**Memorize**| Instructs the agent to store specific values. These values can later be referenced.| |
|**Set field**| Instructs the agent to set a specific field value.| |
|**Use lookup**| Instructs the agent to use a specific lookup.| |
|**Invoke action**| Instructs the agent to invoke a specific action.| |


## Related information

[Configure Copilot and agent capabilities](/dynamics365/business-central/enable-ai)  
[Transparency Note: Agent playground (preview)](transparency-note-agent-playground.md)  
[Agent playground overview (preview)](ai-agent-playground.md)  
[Create and activate a playground agent (preview)](ai-agent-playground-create.md)  
[Set up playground agent permissions and profiles (preview)](ai-agent-playground-permissions-profiles.md)  
[Best practices for prototyping with the Agent playground (preview)](ai-agent-playground-best-practices.md)
