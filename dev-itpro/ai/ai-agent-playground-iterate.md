---
title: Iterate and manage an agent (preview)
description: Learn how to iterate and manage an agent created in the agent playground in Business Central. Discover tools, logs, and customization options to optimize agent behavior.
author: solsen
ms.author: solsen
ms.reviewer: solsen
ms.topic: concept-article
ms.collection: bap-ai-copilot
ms.date: 12/05/2025
ms.update-cycle: 180-days
---

# Iterate and manage an agent (preview)

[This article is prerelease documentation and is subject to change.]

[!INCLUDE [ai-playground-preview](../includes/ai-playground-preview.md)]

## Understand agent decision-making

When iterating and managing an agent, it's important to understand how the agent makes decisions:

- Agents act based on instructions and the context available at each decision point.
- Review both instructions and context to diagnose agent behavior.

Learn more about writing effective instructions in [Write effective instructions for a playground agent (preview)](ai-agent-playground-effective-instructions.md) and best practices in [Best practices for prototyping with the Agent playground (preview)](ai-agent-playground-best-practices.md).

## Troubleshooting tools and logs

For effective troubleshooting, use the following tools:

- Use the **Agent Tasks** page and **Agent Task Log** in [!INCLUDE [prod_short](../developer/includes/prod_short.md)] for high-level and detailed troubleshooting.
- Drill into individual log entries to see what the agent identified as the best action, available tools, and related messages/logs.

### Agent Task Log

The **Agent Task Log** in [!INCLUDE [prod_short](../developer/includes/prod_short.md)] is used for troubleshooting the agent's behavior. It's an activity log for a specific task, which captures all the actions that the agent took, its interactions with user messages and important events in the lifecycle of a task. This information can be valuable for diagnosing issues and understanding how the agent is performing.

Drill into every step by clicking **View details**. You can see information about the context of the specific entry. This can help you identify any misunderstandings or errors in the agent's behavior.

### Log entry details

The details of a log entry contain the context that the agent took into account when making a decision.

#### Decision or not?

Some entries correspond to moments when the agent had to decide to take an action. These are identified by the **decision point** field. The agent takes into account its instructions and the context to decide on an action. The **description** of the log entry contains the action that was decided. Changing the instructions can only affect these specific points.

Other entries correspond either to user interactions like user interventions or messages arriving or to system actions, like stopping a task because it violated a system constraint.

#### What the agent saw

This section is a representation of the page as the agent saw it when making a decision. It encodes what elements were visible on the page and the metadata that it knows about them. It can answer questions like:

- Was an action present?
- Was a field editable?
- Was a field visible?

It also encodes what values were available on the page at the time of the decision. This helps with questions like below:

- What date was selected in the "Date" field?
- Which customer was being processed?
- What was the description of the item being processed?

#### What tools the agent had

When the agent makes a decision, it can select from a list of available tools to call. This list is provided in the form of descriptions. It can be used to inform how the agent's instructions should be crafted. To nudge the agent towards a specific tool, these descriptions can be used as a starting point. It also serves as a list of capabilities of what the agents can do.

#### Messages

One or more messages can be added to a task during its execution. The agent uses all messages received up to a specific point to make decisions on what to do next.

#### Memorized data

You can see what data the agent had memorized up to that point.

#### Page stack

Agents have to navigate [!INCLUDE [prod_short](../developer/includes/prod_short.md)] in a manner similar to a real user. They have to open pages via actions and navigation links and then close them to proceed to the previous page they arrived from. The page stack shows which pages were opened during the moment of the decision.

#### Agent settings

Agents can be configured with settings on how to format dates, currency, and other information. These are displayed in the agent settings section.

## Debug common scenarios

- Review the task log to get a high-level understanding of the task
- Check for missing actions or fields in page content if navigation or editing fails.
- Simplify pages or customize tooltips to reduce confusion for the agent.
- Use Visual Studio Code to debug agent sessions and AL code.
- Use debugging strategies for AL related issues. Learn more in [Debugging in AL](../developer/devenv-debugging.md).

## The agent's perception of the UI

Fine tune the agent's access and interface, including:

- Customize agent profiles and page descriptions using AL code.
- Export and package tailored profiles for your agent.

You can simulate the agent's view by assigning the profile to your user and navigating through [!INCLUDE [prod_short](../developer/includes/prod_short.md)].

## Handle content violation errors

Agents come with protections against content that might be deemed harmful towards users. This protection is applied to instructions,
messages, and the content that they interact with. Sometimes content might be incorrectly classified as a content violation. To go around that, rephrase the agent instructions or review the relevant page content and messages for problematic keywords.

## Export or import an agent configuration

As part of iterating to improve your agent, you can export and import the agent's configuration from the Agent playground to your local machine. The exported configuration includes:

- **Identity**: The name and display name of an agent
- **Instructions**: The detailed guidelines that define how the agent should behave.
- **Permissions**: The access rights the agent requires to function correctly.
- **Profile**: The name of the profile that should be used. The profile itself should be exported separately.

To export the configuration, do the following:

1. On the **Agents (preview)** page, choose the agent that you want to export.
2. Choose **Export agent**.
3. The exported agent appears in your **Downloads** window in .xml format. 

To import the configuration, do the following:

<!-- check with newest UI before publishing -->

1. On the **Agents (preview)** page, choose the agent that you want to import.
2. Choose **Import agent**.
3. Select if the agent should be a new agent or replace an existing agent - if the name already exists.
4. Continue to import the agent
5. Activate it

## Related information

[Overview](ai-agent-playground-landing-page.yml)  
[Agent playground (preview)](ai-agent-playground.md)  
[Create and activate (preview)](ai-agent-playground-create.md)  
[Write effective instructions (preview)](ai-agent-playground-effective-instructions.md)  
[Instruction keywords (preview)](ai-agent-playground-instruction-keywords.md)  
[Integrate with the Tasks AL API (preview)](ai-agent-playground-tasks-api.md)  
[Set up permissions and profiles (preview)](ai-agent-playground-permissions-profiles.md)  
[Run a playground agent (preview)](ai-agent-playground-run-agent.md)  
[Best practices (preview)](ai-agent-playground-best-practices.md)  
[Transparency note: Business Central agent playground](transparency-note-agent-playground.md)  
