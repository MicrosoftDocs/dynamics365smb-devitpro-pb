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

The AI Playground Agent is a prototyping tool that allows developers and partners to experiment with AI capabilities in [!INCLUDE [prod_short](../includes/prod_short.md)]. It's available in sandbox environments and designed for testing and learning purposes, providing a safe environment to explore AI functionalities without affecting production data.

:::image type="content" source="ai-playground-agent-workflow.svg" alt-text="TEST":::

## Purpose and audience

The AI Playground Agent is primarily designed for:

- **Product owners** who want to prototype AI-powered features before building them in AL extensions
- **Domain experts** evaluating AI integration possibilities for their [!INCLUDE [prod_short](../includes/prod_short.md)] solutions  
- **Consultants** exploring automation scenarios with AI assistance for client solutions
- **Developers** validating AI use cases and gathering requirements for custom implementations

The tool helps you understand how AI can interact with [!INCLUDE [prod_short](../includes/prod_short.md)] user interface and data, allowing you to test various AI functionalities such as automating tasks, answering questions, and integrating AI into workflows.

## When to use and when not to use

### When to use AI Playground Agent

Use the AI Playground Agent when you want to:

- **Prototype AI features** before investing in AL development
- **Test AI interactions** with [!INCLUDE [prod_short](../includes/prod_short.md)] UI and data  
- **Validate use cases** and gather requirements for AI-powered solutions
- **Experiment with prompts** and AI behavior in a controlled environment
- **Demonstrate AI capabilities** to stakeholders or customers
- **Learn AI integration patterns** for [!INCLUDE [prod_short](../includes/prod_short.md)]

### When not to use AI Playground Agent

Don't use the AI Playground Agent when:

- **Production environments** are involved (sandbox only)
- **Compliance or security evaluation** is the primary goal
- **Performance testing** with real-world data volumes is needed
- **Final implementation** is ready (graduate to AL extension instead)
- **End-user training** is the main objective (use production-ready Copilot features)

## Agent lifecycle summary

The typical AI Playground Agent follows this lifecycle:

1. **Create** → Set up the agent with basic identity and profile
2. **Configure** → Define instructions, permissions, and tasks  
3. **Activate** → Enable the agent for testing
4. **Iterate** → Test, refine instructions, and adjust permissions
5. **Graduate** → Export learnings to build production solutions using AL extensions or the agent development SDK
6. **Clean up** → Deactivate and remove the prototype agent

Each phase has specific requirements and limitations that guide your development process.

:::image type="content" source="ai-playground-lifecycle.svg" alt-text="AI Playground Agent lifecycle":::


## High-level concepts

Understanding these key concepts helps you work effectively with AI Playground agents:

### Instructions and tasks

Instructions are natural language descriptions that define your agent's purpose and behavior. Think of them as detailed prompts that guide how the agent interprets requests and interacts with the [!INCLUDE [prod_short](../includes/prod_short.md)] interface. Well-written instructions include context, clear expectations, and specific guidance about the agent's role. 

Tasks are specific actions that the agent can perform based on your instructions. They represent concrete scenarios or workflows that the agent should handle. Tasks can only be added when the agent is active, and they help structure how the agent responds to different types of requests. 

Learn more about instructions and tasks in [Configure instructions and tasks for AI Playground Agent (preview)](ai-playground-agent-configure.md).

### Permissions and profiles

The agent operates with explicit permission sets that control what data and actions it can access. This follows the principle of least privilege—grant only the permissions necessary for the agent's intended functionality. Permission sets can only be modified when the agent is deactivated. 

The agent is assigned to a profile (role) that determines which UI elements it can see and interact with. You can create custom profiles specifically for agents, using page customization properties to control visibility of actions, layouts, views, and operations like insert/delete.

Learn more in [Set up AI Playground Agent permissions and profiles (preview)](ai-playground-agent-permissions-profiles.md).

## Prerequisites

Before you can use the AI Playground Agent, ensure that you have the following prerequisites in place:

- Enable the Copilot and agent capabilities in [!INCLUDE [prod_short](../includes/prod_short.md)]
- Appropriate permissions to access and use the AI Playground Agent in [!INCLUDE [prod_short](../includes/prod_short.md)]
- A sandbox environment for testing and experimentation

## Limitations (preview)

As a preview feature, the AI Playground Agent has several important limitations:

### Environment restrictions

- **Sandbox only**: Available exclusively in sandbox environments—never in production
- **Sandbox data**: Can be used with customer data in sandbox environments (including sandbox copies of production data)
- **Preview functionality**: Features and behavior might change without notice

### Operational constraints

- **State dependencies**: Permission changes require deactivation; task changes require activation
- **Permission inheritance**: Agents can't have more permissions than their creating user
- **UI interaction limits**: Agents see only what their assigned profile allows
- **No page search**: Agents can't use the search functionality in the interface

### Development considerations

- **Prototype only**: Not suitable for production implementations or compliance evaluation
- **Manual telemetry**: No automatic logging—capture prompts and responses manually during testing
- **Temporary nature**: Designed for experimentation, not long-term solutions

## Future development path

While the AI Playground Agent provides a prototype experience for testing AI capabilities, the agent development SDK allows developers and partners to package custom agents as deployable apps. This SDK includes:

- Instructions, integrations, and configuration packaged in AL extensions
- Testing frameworks for agent development
- Deployment capabilities for production environments

The agent development SDK provides a graduation path from playground prototypes to production-ready AI solutions.

## Getting started

Ready to try the AI Playground Agent? The process involves enabling the feature, creating your agent, and configuring it for your specific use case.

To use the AI Playground Agent, you must first enable Copilot and agent capabilities in [!INCLUDE [prod_short](../includes/prod_short.md)]. Learn more in [Configure Copilot and agent capabilities](/dynamics365/business-central/enable-ai).

When the AI Playground Agent is enabled, you see the <!-- insert icon --> icon in the top navigation menu of the role center. Now, you can create and configure your AI Playground Agent. Learn more in [Create and manage a Playground agent (preview)](./ai-playground-agent-create.md).

## Related information

[Configure Copilot and agent capabilities](/dynamics365/business-central/enable-ai)  
[Create and manage an AI Playground Agent (preview)](ai-playground-agent-create.md)  
[Configure instructions, tasks, and permissions for an AI Playground Agent (preview)](ai-playground-agent-configure.md)  
[Best practices for prototyping with AI Playground Agent (preview)](ai-playground-agent-best-practices.md)