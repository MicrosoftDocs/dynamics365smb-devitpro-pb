---
title: Iterate and manage an AI Playground Agent (preview)
description: Learn how to iterate and manage an AI Playground Agent in Business Central. Discover tools, logs, and customization options to optimize agent behavior.
author: solsen
ms.author: solsen
ms.reviewer: solsen
ms.topic: concept-article
ms.collection: bap-ai-copilot
ms.date: 12/2052025
ms.update-cycle: 180-days
---

# Iterate and manage an AI playground agent (preview)

[This article is prerelease documentation and is subject to change.]

[!INCLUDE [ai-playground-preview](../includes/ai-playground-preview.md)]

## Understand agent decision-making

When iterating and managing an AI playground agent, it's important to understand how the agent makes decisions:

- Agents act based on instructions and the data available at each decision point.
- Review both instructions and context to diagnose agent behavior.
- Only decision points in logs reflect moments where instructions/context could affect choices.

Learn more about writing effective instructions in [Configure instructions and tasks for an AI playground agent (preview)](ai-playground-agent-configure.md) and best practices in [Best practices for prototyping with an AI playground agent (preview)](ai-playground-agent-best-practices.md).

## Troubleshooting tools and logs

For effective troubleshooting, use the following tools:

- Use the **Agent Tasks** page and **Agent Task Log** in [!INCLUDE [prod_short](../developer/includes/prod_short.md)] for high-level and detailed troubleshooting.
- Log entries show what the agent identified, available tools, and related messages/logs.

### Agent Task Log

The **Agent Task Log** in [!INCLUDE [prod_short](../developer/includes/prod_short.md)] is used for troubleshooting the agent's behavior. The log captures the interactions between users and the agent, including the prompts sent to the agent and the responses received. This information can be valuable for diagnosing issues and understanding how the agent is performing.

Drill into every step by clicking the line in the log. You can see the full prompt sent to the agent and the response it generated. This can help you identify any misunderstandings or errors in the agent's behavior.

## Debug common scenarios

Use debugging strategies for common issues. Learn more in [Debugging in AL](../developer/devenv-debugging.md).

- Check for missing actions or fields in page content if navigation or editing fails.
- Simplify pages or customize descriptions to reduce confusion.
- Use Visual Studio Code to debug agent sessions and AL code.

## Customize agent profiles and UI

Fine tune the agent's access and interface, including:

- Customize agent profiles and page descriptions using AL code.
- Export and package tailored profiles for your agent.

## Handle content violation errors

- Rephrase flagged instructions or review context for problematic keywords.

## The agent's perception of the UI

- The agent sees the UI as JSON; log entries capture this view for troubleshooting.

## Export an agent configuration

As part of iterating to improve your agent, you can export and import the agent's configuration from the AI playground to your local machine. The exported configuration includes:

- **Instructions**: The detailed guidelines that define how the agent should behave.
- **Tasks**: The specific actions the agent can perform.
- **Permissions**: The access rights the agent requires to function correctly.

To export the configuration, do the following:

1. On the **Agents (preview)** page, choose the agent that you want to export.
1. Choose **Show more options** and then choose **Export agent**.
1. The exported agent appears in your **Downloads** window. 

<!-->
To import the configuration, do the following:

1. 
-->

## Related information

[Configure Copilot and agent capabilities](/dynamics365/business-central/enable-ai)  
[Transparency Note: AI playground agent (preview)](transparency-note-ai-playground-agent.md)  
[Create and activate an AI playground agent (preview)](ai-playground-agent-create.md)  
[Configure instructions and tasks for an AI playground agent (preview)](ai-playground-agent-configure.md)  
[Set up AI playground agent permissions and profiles (preview)](ai-playground-agent-permissions-profiles.md)  
[Best practices for prototyping with AI playground agent (preview)](ai-playground-agent-best-practices.md)
