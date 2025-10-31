---
title: Iterate and manage an AI Playground Agent (preview)
description: Learn how to iterate and manage an AI Playground Agent in Business Central. Discover tools, logs, and customization options to optimize agent behavior.
author: solsen
ms.author: solsen
ms.reviewer: solsen
ms.topic: concept-article
ms.collection:
  - get-started
  - bap-ai-copilot
ms.date: 10/23/2025
ms.update-cycle: 180-days
---

# Iterate and manage an AI Playground Agent (preview)

[This article is prerelease documentation and is subject to change.]

[!INCLUDE [ai-playground-preview](../includes/ai-playground-preview.md)]

## Understand agent decision-making

- Agents act based on instructions and the data available at each decision point.
- Review both instructions and context to diagnose agent behavior.
- Only decision points in logs reflect moments where instructions/context could affect choices.

## Troubleshooting tools and logs

- Use the **Agent Tasks** page and **Agent Task Log** for high-level and detailed troubleshooting.
- Log entries show what the agent identified, available tools, and related messages/logs.

### Agent Task Log

The **Agent Task Log** is used for troubleshooting the agent's behavior. The log captures the interactions between users and the agent, including the prompts sent to the agent and the responses received. This information can be valuable for diagnosing issues and understanding how the agent is performing.

Drill into every step by clicking the line in the log. You can see the full prompt sent to the agent and the response it generated. This can help you identify any misunderstandings or errors in the agent's behavior.

## Debug common scenarios

- Check for missing actions or fields in page content if navigation or editing fails.
- Simplify pages or customize descriptions to reduce confusion.

## Customize agent profiles and UI

- Customize agent profiles and page descriptions using AL code.
- Export and package tailored profiles for your agent.

## Debug agent code

- Use Visual Studio Code to debug agent sessions and AL code.

## Handle content violation errors

- Rephrase flagged instructions or review context for problematic keywords.

## The agent's perception of the UI

- The agent sees the UI as JSON; log entries capture this view for troubleshooting.

<!-->
## 8. Q&A and Advanced Scenarios

- Tools are available based on page type; extend capabilities via AL code if needed.
- Log entries include factboxes and page settings that may influence agent actions. -->

## Related information

[Configure Copilot and agent capabilities](/dynamics365/business-central/enable-ai)  
[Create and activate an AI Playground Agent (preview)](ai-playground-agent-create.md)  
[Configure instructions and tasks for an AI Playground Agent (preview)](ai-playground-agent-configure.md)  
[Set up AI Playground Agent permissions and profiles (preview)](ai-playground-agent-permissions-profiles.md)  
[Best practices for prototyping with AI Playground Agent (preview)](ai-playground-agent-best-practices.md)
