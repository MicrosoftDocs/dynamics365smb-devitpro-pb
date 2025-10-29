---
title: Iterate and manage an AI Playground Agent (preview)
description: Learn how you can use AI Playground Agent in Business Central.
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
> This article is primarily intended for product owners, domain experts, consultants, and developers who want to experiment with AI capabilities in [!INCLUDE [prod_short](../includes/prod_short.md)] using the AI Playground Agent.

## Understanding Agent Decision-Making
 
- Agents act based on instructions and the data available at each decision point.
- Review both instructions and context to diagnose agent behavior.
- Only decision points in logs reflect moments where instructions/context could affect choices.

## Troubleshooting Tools and Logs

- Use the Agent Tasks page and Agent Task Log for high-level and detailed troubleshooting.
- Log entries show what the agent saw, available tools, and related messages/logs.

### Agent Task Log

Used for troubleshooting the agents behavior. The log captures the interactions between users and the agent, including the prompts sent to the agent and the responses received. This information can be invaluable for diagnosing issues and understanding how the agent is performing.

Drill into every step by clicking the line in the log. You can see the full prompt sent to the agent and the response it generated. This can help you identify any misunderstandings or errors in the agent's behavior.

## Debugging Common Scenarios

- Check for missing actions or fields in page content if navigation or editing fails.
- Simplify pages or customize descriptions to reduce confusion.

## Customizing Agent Profiles and UI

- Customize agent profiles and page descriptions using AL code.
- Export and package tailored profiles for your agent.

## Debugging Agent Code

- Use Visual Studio Code to debug agent sessions and AL code.

## Handling Content Violation Errors

- Rephrase flagged instructions or review context for problematic keywords.

## Agent’s Perception of the UI

- The agent sees the UI as JSON; log entries capture this view for troubleshooting.

<!-->
## 8. Q&A and Advanced Scenarios

- Tools are available based on page type; extend capabilities via AL code if needed.
- Log entries include factboxes and page settings that may influence agent actions. -->

## Related information
