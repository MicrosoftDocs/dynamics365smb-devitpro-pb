---
title: Coding agents in AL (preview)
description: Learn about the development tools for building AI agents in Dynamics 365 Business Central.
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

# Coding agents in AL (preview)

[This article is prerelease documentation and is subject to change.]

[!INCLUDE [ai-designer-preview](../includes/ai-designer-preview.md)]

In AL, you find interfaces and codeunits designed for building custom AI agents in [!INCLUDE [prod_short](../includes/prod_short.md)]. This article provides an overview of these tools and links to detailed documentation for each area.

> [!IMPORTANT]
> This capability is currently enabled only for sandbox environments for evaluation purposes. Production environments don't support agent development at this time.

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

The API for building agents provides codeunits to trigger and manage agent tasks programmatically:

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
[Overview (preview)](ai-development-toolkit-landing-page.yml)  
[AI development toolkit (preview)](ai-development-toolkit-overview.md)   
[Integrate with the Tasks AL API (preview)](ai-development-toolkit-tasks-api.md)  
[Create and activate (preview)](ai-development-toolkit-agent-create..md)  
[Write effective instructions (preview)](ai-development-toolkit-instructions.md)  
[Instruction keywords (preview)](ai-development-toolkit-instruction-keywords.md)  
[Set up permissions and profiles (preview)](ai-development-toolkit-permissions-profiles.md)  
[Run an agent (preview)](ai-development-toolkit-run-agent.md)  
[Iterate and manage (preview)](ai-development-toolkit-iterate.md)  
[Best practices for designing an agent (preview)](ai-development-toolkit-faq.md)  
[Best practices (preview)](ai-development-toolkit-best-practices.md)  
[Create a Sales Validation Agent (preview)](ai-development-toolkit-sales-validation.md)  
[Transparency note: Business Central AI development toolkit (preview)](transparency-note-ai-development-toolkit.md)
