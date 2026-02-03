---
title: Iterate and manage an agent (preview)
description: Learn how to iterate and manage an agent designed in Business Central. Discover tools, logs, and customization options to optimize agent behavior.
author: solsen
ms.author: solsen
ms.reviewer: solsen
ms.topic: concept-article
ms.collection: bap-ai-copilot
ms.date: 01/12/2026
ms.update-cycle: 180-days
---

# Iterate and manage an agent (preview)

[This article is prerelease documentation and is subject to change.]

[!INCLUDE [ai-designer-preview](../includes/ai-designer-preview.md)]

## Understand agent decision-making

When iterating and managing an agent, it's important to understand how the agent makes decisions:

- Agents act based on instructions and the context available at each decision point.
- Review both instructions and context to diagnose agent behavior.

Learn more about writing effective instructions in [Write effective instructions for an agent (preview)](ai-development-toolkit-instructions.md) and best practices in [Best practices for designing an agent (preview)](ai-development-toolkit-best-practices.md).

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

#### What the agent had access to

This section is a representation of the page as the agent had access to when making a decision. It encodes what elements were visible on the page and the metadata that it knows about them. It can answer questions like:

- Was an action present?
- Was a field editable?
- Was a field visible?

It also encodes what values were available on the page at the time of the decision. This helps with questions like below:

- What date was selected in the "Date" field?
- Which customer was being processed?
- What was the description of the item being processed?

#### What tools the agent had

When the agent makes a decision, it can select from a list of available tools to call. This list is provided in the form of descriptions. It can be used to inform how the agent's instructions should be crafted. To nudge the agent towards a specific tool, these descriptions can be used as a starting point. It also serves as a list of capabilities of what the agents can do.

Learn more in [Instruction keywords for an agent (preview)](ai-development-toolkit-instruction-keywords.md).

#### Messages

One or more messages can be added to a task during its execution. The agent uses all messages received up to a specific point to make decisions on what to do next.

#### Memorized data

You can see what data the agent had memorized up to that point.

#### Page stack

Agents have to navigate [!INCLUDE [prod_short](../developer/includes/prod_short.md)] in a manner similar to a real user. They have to open pages via actions and navigation links and then close them to proceed to the previous page they arrived from. The page stack shows which pages were opened during the moment of the decision.

#### Agent settings

Agents can be configured with settings on how to format dates, currency, and other information. Some of these settings are page and record specific, which means that for the same agent and the same page, the values can be different depending on the records displayed. These settings are displayed in **Tasks and page settings**.

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

## Manage instruction versions

As you iterate on your agent's instructions, the system maintains a version history of your changes. This allows you to:

- **Review previous versions** - View the history of instruction changes to understand what worked and what didn't
- **Revert to earlier versions** - Roll back to a previous version if new instructions don't perform as expected
- **Compare versions** - Analyze differences between instruction versions to identify what changes impacted agent behavior

To access instruction version history:

1. Open the agent setup, for example from the **Agents (preview)** page.
2. In the **Agent - Instructions** section, use the **Get earlier version** button to view and restore previous versions.
3. Test the restored version to validate it meets your requirements.

This capability is useful when:

- Experimenting with different instruction approaches
- A new version introduces unexpected behavior
- You want to understand which instruction changes led to improved performance
- Multiple team members are collaborating on agent instructions

## Related information

[Overview (preview)](ai-development-toolkit-landing-page.yml)  
[AI development toolkit (preview)](ai-development-toolkit-overview.md)   
[Create and activate (preview)](ai-development-toolkit-agent-create..md)  
[Write effective instructions (preview)](ai-development-toolkit-instructions.md)  
[Instruction keywords (preview)](ai-development-toolkit-instruction-keywords.md)  
[Integrate with the Tasks AL API (preview)](ai-development-toolkit-tasks-api.md)  
[Attachment capabilities and limitations (preview)](ai-development-toolkit-attachments.md)  
[Set up permissions and profiles (preview)](ai-development-toolkit-permissions-profiles.md)  
[Run an agent (preview)](ai-development-toolkit-run-agent.md)  
[Best practices for designing an agent (preview)](ai-development-toolkit-faq.md)  
[Best practices (preview)](ai-development-toolkit-best-practices.md)  
[Create a Sales Validation Agent (preview)](ai-development-toolkit-sales-validation.md)  
[Transparency note: Business Central AI development toolkit (preview)](transparency-note-ai-development-toolkit.md)  