---
title: Agent SDK overview (preview)
description: Learn about the agent SDK for building AI agents in Dynamics 365 Business Central.
author: solsen
ms.author: solsen
ms.reviewer: solsen
ms.topic: concept-article
ms.collection:
  - get-started
  - bap-ai-copilot
ms.date: 01/21/2026
ms.update-cycle: 180-days
---

# Agent SDK (preview)

[This article is prerelease documentation and is subject to change.]

[!INCLUDE [ai-designer-preview](../includes/ai-designer-preview.md)]

The agent SDK provides the AL interfaces and codeunits needed to build custom AI agents in [!INCLUDE [prod_short](../includes/prod_short.md)]. This article provides an overview of the SDK and links to detailed documentation for each area.

> [!IMPORTANT]
> The agent SDK is currently enabled only for sandbox environments for evaluation purposes. Production environments don't support agent development at this time.

## Quick-start

To quickly get started with a template agent that you can customize to your needs; press <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>P</kbd> and start typing `AL: New Project` command in Visual Studio Code to choose the `Agent` template. This provides you with a skeleton of an implementation, which covers most of the topics discussed in this documentation.

## Core interfaces

To define an agent in AL, you need to extend the enum that defines the available types of agents and implement three core interfaces:

| Interface | Purpose |
|-----------|---------|
| `IAgentFactory` | Defines how agent instances are created and configured, including default settings, setup pages, and creation rules. |
| `IAgentMetadata` | Provides runtime metadata for individual agent instances, such as initials, setup pages, summary pages, and annotations. |
| `IAgentTaskExecution` | Controls how agents process and execute tasks, including message analysis, user intervention suggestions, and page context. |

Learn more in [Define and register an agent (preview)](ai-agent-sdk-define-register.md).

## Setup and configuration

Once you've defined your agent type, you need to create setup pages and configure agent instances:

- **Setup pages**: Create configuration dialogs using the `ConfigurationDialog` page type
- **Agent Setup codeunit**: Use helper methods for UI-based agent configuration
- **Agent configuration**: Set display names, profiles, localization, permissions, and access controls
- **Instructions**: Define static or dynamic instructions for your agent

Learn more in [Agent setup and configuration (preview)](ai-agent-sdk-configuration.md).

## Managing agent tasks

The SDK allows you to trigger and manage agent tasks programmatically:

- **Agent Task Builder API**: Create tasks from page actions, business events, or email triggers
- **Attachments**: Add documents for agents to process
- **Task lifecycle**: Monitor and control running tasks
- **Agent sessions**: Detect agent sessions and bind events for task duration
- **Cross-agent operations**: Create public APIs to allow other apps to interact with your agent

Learn more in [Managing agent tasks (preview)](ai-agent-sdk-tasks.md).

## Related information

[Define and register an agent (preview)](ai-agent-sdk-define-register.md)  
[Agent setup and configuration (preview)](ai-agent-sdk-configuration.md)  
[Managing agent tasks (preview)](ai-agent-sdk-tasks.md)  
[Overview (preview)](ai-agent-designer-landing-page.yml)  
[AI development toolkit (preview)](ai-agent-designer.md)   
[Integrate with the Tasks AL API (preview)](ai-agent-designer-tasks-api.md)  
[Create and activate (preview)](ai-agent-designer-create.md)  
[Write effective instructions (preview)](ai-agent-designer-effective-instructions.md)  
[Instruction keywords (preview)](ai-agent-designer-instruction-keywords.md)  
[Set up permissions and profiles (preview)](ai-agent-designer-permissions-profiles.md)  
[Run an agent (preview)](ai-agent-designer-run-agent.md)  
[Iterate and manage (preview)](ai-agent-designer-iterate.md)  
[Best practices for designing an agent (preview)](ai-agent-designer-faq.md)  
[Best practices (preview)](ai-agent-designer-best-practices.md)  
[Create a Sales Validation Agent (preview)](ai-agent-designer-sales-validation.md)  
[Transparency note: Business Central agent designer (preview)](transparency-note-agent-designer.md)
