---
title: AI Playground Agent overview
description: Learn how you can use AI Playground Agent in Business Central.
author: solsen
ms.author: solsen
ms.reviewer: solsen
ms.topic: concept-article
ms.collection:
  - get-started
  - bap-ai-copilot
ms.date: 09/10/2025
ms.update-cycle: 180-days
---

# AI Playground Agent overview (preview)

<!-- split into more articles, use this as a starting point. Live in devitpro, linking from app repo 

Overview (existing ai-playground-agent.md)
    Purpose & audience
    When to use / when not to use
    Lifecycle summary (Create → Iterate → Graduate)
    High-level concepts: Instructions, Tasks, Permissions, Profile
    Limitations (preview)
    Next steps links
Create and manage a Playground agent (ai-playground-agent-create.md)
    Prerequisites
    Create (step list + field table)
    Activate / Deactivate
    Edit (what requires deactivation)
    Delete / cleanup
    Lifecycle tips
Configure instructions, tasks, and permissions (ai-playground-agent-configure.md)
    Instructions (guidelines + good/bad example)
    Tasks (definition, when they run, adding/modifying)
    Permissions & least privilege (including profiles & page customization flags)
    User access (who can interact)
    Monitoring (Agent Task Log basics)
    Graduating to AL extension (short hand-off checklist)
Best practices for prototyping with AI Playground (ai-playground-agent-best-practices.md)
    Best practices for instructions, tasks, and permissions
-->

[This article is prerelease documentation and is subject to change.]

The AI Playground agent is a prototyping tool that allows developers and partners to experiment with AI capabilities in [!INCLUDE [prod_short](../includes/prod_short.md)]. It's available in sandbox environments and designed for testing and learning purposes, providing a safe environment to explore AI functionalities without affecting production data.

## Purpose and audience

The AI Playground agent is designed for:

- **Developers and partners** who want to prototype AI-powered features before building them in AL extensions
- **Solution architects** evaluating AI integration possibilities for their Business Central solutions  
- **IT professionals** exploring automation scenarios with AI assistance
- **Product teams** validating AI use cases and gathering requirements

The tool helps you understand how AI can interact with Business Central's user interface and data, allowing you to test various AI functionalities such as automating tasks, answering questions, and integrating AI into workflows.

## When to use and when not to use

### When to use AI Playground Agent

Use the AI Playground agent when you want to:

- **Prototype AI features** before investing in AL development
- **Test AI interactions** with Business Central's UI and data  
- **Validate use cases** and gather requirements for AI-powered solutions
- **Experiment with prompts** and AI behavior in a controlled environment
- **Demonstrate AI capabilities** to stakeholders or customers
- **Learn AI integration patterns** for Business Central

### When not to use AI Playground Agent

Don't use the AI Playground agent when:

- **Production environments** are involved (sandbox only)
- **Compliance or security evaluation** is the primary goal
- **Performance testing** with real-world data volumes is needed
- **Final implementation** is ready (graduate to AL extension instead)
- **End-user training** is the main objective (use production-ready Copilot features)

## Agent lifecycle summary

The typical AI Playground agent follows this lifecycle:

1. **Create** → Set up the agent with basic identity and profile
2. **Configure** → Define instructions, permissions, and tasks  
3. **Activate** → Enable the agent for testing
4. **Iterate** → Test, refine instructions, and adjust permissions
5. **Graduate** → Export learnings to build a production AL extension
6. **Clean up** → Deactivate and remove the prototype agent

Each phase has specific requirements and limitations that guide your development process.

## High-level concepts

Understanding these key concepts helps you work effectively with AI Playground agents:

### Instructions

Instructions are natural language descriptions that define your agent's purpose and behavior. Think of them as detailed prompts that guide how the agent interprets requests and interacts with the Business Central interface. Well-written instructions include context, clear expectations, and specific guidance about the agent's role.

### Tasks

Tasks are specific actions that the agent can perform based on your instructions. They represent concrete scenarios or workflows that the agent should handle. Tasks can only be added when the agent is active, and they help structure how the agent responds to different types of requests.

### Permissions

The agent operates with explicit permission sets that control what data and actions it can access. This follows the principle of least privilege—grant only the permissions necessary for the agent's intended functionality. Permission sets can only be modified when the agent is deactivated.

### Profile

The agent is assigned a profile (role) that determines which UI elements it can see and interact with. You can create custom profiles specifically for agents, using page customization properties to control visibility of actions, layouts, views, and operations like insert/delete.

## Prerequisites

Before you can use the AI Playground agent, ensure that you have the following prerequisites in place:

- Enable the Copilot and agent capabilities in [!INCLUDE [prod_short](../includes/prod_short.md)]
- Appropriate permissions to access and use the AI Playground Agent in [!INCLUDE [prod_short](../includes/prod_short.md)]
- A sandbox environment for testing and experimentation

## Limitations (preview)

As a preview feature, the AI Playground agent has several important limitations:

### Environment restrictions

- **Sandbox only**: Available exclusively in sandbox environments—never in production
- **No production data**: Don't use for testing with real customer or business data
- **Preview functionality**: Features and behavior may change without notice

### Operational constraints

- **State dependencies**: Permission changes require deactivation; task changes require activation
- **Permission inheritance**: Agents can't have more permissions than their creating user
- **UI interaction limits**: Agents see only what their assigned profile allows
- **No page search**: Agents can't use the search functionality in the interface

### Development considerations

- **Prototype only**: Not suitable for production implementations or compliance evaluation
- **Manual telemetry**: No automatic logging—capture prompts and responses manually during testing
- **Temporary nature**: Designed for experimentation, not long-term solutions

## Getting started

Ready to try the AI Playground agent? The process involves enabling the feature, creating your agent, and configuring it for your specific use case.

To use the AI Playground Agent, you must first enable Copilot and agent capabilities in [!INCLUDE [prod_short](../includes/prod_short.md)]. Learn more in [Configure Copilot and agent capabilities](/dynamics365/business-central/enable-ai).

When the AI Playground Agent is enabled, you'll see the <!-- insert icon --> icon in the top navigation menu of the role center. Now, you can create and configure your AI Playground agent. Learn more in [Create and manage a Playground agent (preview)](./ai-playground-agent-create.md).

## Related information

[Configure Copilot and agent capabilities](/dynamics365/business-central/enable-ai)  
[Create and manage a Playground agent (preview)](ai-playground-agent-create.md)  
[Configure instructions, tasks, and permissions for AI Playground (preview)](ai-playground-agent-configure.md)  
[Best practices for prototyping with AI Playground (preview)](ai-playground-agent-best-practices.md)