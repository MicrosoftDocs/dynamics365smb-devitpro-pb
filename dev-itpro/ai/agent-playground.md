---
title: Agent Playground Overview
description: Discover the Agent playground, a tool for testing AI capabilities in Business Central by building playground agents. Prototype, validate, and refine AI-powered solutions.
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

# Agent playground overview (preview)

[This article is prerelease documentation and is subject to change.]

[!INCLUDE [ai-playground-preview](../includes/ai-playground-preview.md)]

The Agent playground is a prototyping environment that allows developers and partners to experiment with AI capabilities in [!INCLUDE [prod_short](../includes/prod_short.md)] by building playground agents. It's available in sandbox environments and designed for testing and learning purposes, providing a safe environment to explore AI functionalities without affecting production data.

## Purpose and audience

The Agent playground is primarily designed for teams who want to prototype AI-powered capabilities by configuring playground agents:

- **Product owners** who want to prototype AI-powered features before building them in AL extensions
- **Domain experts** evaluating AI integration possibilities for their [!INCLUDE [prod_short](../includes/prod_short.md)] solutions  
- **Consultants** exploring automation scenarios with AI assistance for client solutions
- **Developers** validating AI use cases and gathering requirements for custom implementations

The playground helps you understand how AI can interact with [!INCLUDE [prod_short](../includes/prod_short.md)] user interface and data, allowing you to test various AI functionalities such as automating tasks, answering questions, and integrating AI into workflows through playground agents.

## When to use and when not to use

### When to use the Agent playground

Use the Agent playground when you want to:

- **Prototype AI features** before investing in AL development
- **Test AI interactions** with [!INCLUDE [prod_short](../includes/prod_short.md)] UI and data  
- **Validate use cases** and gather requirements for AI-powered solutions
- **Experiment with prompts** and AI behavior in a controlled environment
- **Demonstrate AI capabilities** to stakeholders or customers
- **Learn AI integration patterns** for [!INCLUDE [prod_short](../includes/prod_short.md)]

### When not to use the Agent playground

Don't use the Agent playground when:

- **Production environments** are involved (sandbox only)
- **Compliance or security evaluation** is the primary goal
- **Final implementation** is ready (graduate to AL extension instead)
- **End-user training** is the main objective (use production-ready Copilot features)

## Agent lifecycle summary

A typical playground agent follows this lifecycle:

1. **Create** - Set up the agent with basic identity and profile
1. **Configure** - Define instructions, permissions, and tasks
1. **Activate** - Enable the agent for testing
1. **Iterate** - Test, refine instructions, and adjust permissions
1. **Graduate** - Export learnings to build production solutions using AL extensions
1. **Clean up** - Deactivate and remove the prototype agent

Each phase has specific requirements and limitations that guide your development process.

:::image type="content" source="../media/ai-playground-lifecycle.png" alt-text="Playground agent lifecycle":::

## High-level concepts

Understanding the following key concepts helps you work effectively with playground agents.

## Prerequisites

Before you can use the Agent playground, ensure that you have the following prerequisites in place:

- Enable the Copilot and agent capabilities in [!INCLUDE [prod_short](../includes/prod_short.md)]. Learn more in [Configure Copilot and agent capabilities](/dynamics365/business-central/enable-ai).
- Appropriate permissions to access and use the Agent playground in [!INCLUDE [prod_short](../includes/prod_short.md)].
- A sandbox environment for testing and experimentation (can include customer data such as sandbox copies of production data).
- Set up the [!INCLUDE [prod_short](../includes/prod_short.md)] environment for billing agent capabilities in the [!INCLUDE [prod_short](../includes/prod_short.md)] Admin Center.  
Agents use Microsoft Copilot Studio messages when activated, which your company is charged for. Learn more in [Manage consumption-based billing](../administration/tenant-admin-center-manage-consumption-billing.md).

### Instructions and tasks

Instructions are natural language descriptions that define your agent's purpose and behavior. Think of them as detailed prompts that guide how the agent interprets requests and interacts with the [!INCLUDE [prod_short](../includes/prod_short.md)] interface. Well-written instructions include context, clear expectations, and specific guidance about the agent's role.

Tasks are specific actions that the agent can perform based on your instructions. They represent concrete scenarios or workflows that the agent should handle. Tasks can only be added when the agent is active, and they help structure how the agent responds to different types of requests.

Learn more about instructions and tasks in [Configure instructions and tasks for a playground agent (preview)](agent-playground-configure.md).

### Supported languages

This feature currently supports only English as language. While this feature can be used in other languages, it might not function as intended. Language quality might vary based on the user's interaction or system settings, which might affect accuracy and the user experience.

Learn more about geographic and language availability at [Copilot international availability](https://releaseplans.microsoft.com/availability-reports/?report=copilotproductreport).

### Permissions and profiles

The agent operates with explicit permission sets that control what data and actions it can access. This follows the principle of least privilege—grant only the permissions necessary for the agent's intended functionality. Permission sets can only be modified when the agent is deactivated.

The agent is assigned to a profile (role) that determines which UI elements it can see and interact with. You can create custom profiles specifically for agents, using page customization properties to control visibility of actions, layouts, views, and operations like insert/delete.

Learn more in [Set up playground agent permissions and profiles (preview)](agent-playground-permissions-profiles.md).

## Limitations (preview)

As a preview feature, the Agent playground has several important limitations:

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

<!-- 
## Future development path

While the Agent playground provides a prototype experience for testing AI capabilities, the agent development SDK allows developers and partners to package custom agents as deployable apps. This SDK includes:

- Instructions, integrations, and configuration packaged in AL extensions
- Testing frameworks for agent development
- Deployment capabilities for production environments

The agent development SDK provides a graduation path from playground prototypes to production-ready AI solutions. Learn more in [Graduating a playground agent (preview)](./agent-playground-graduate.md).
-->

## Getting started

Ready to try the Agent playground? The process involves enabling the feature, creating your playground agent, and configuring it for your specific use case. Learn more in [Create and activate a playground agent (preview)](./agent-playground-create.md).

## Related information

[Configure Copilot and agent capabilities](/dynamics365/business-central/enable-ai)  
[Transparency Note: Agent playground (preview)](transparency-note-agent-playground.md)  
[Create and activate a playground agent (preview)](agent-playground-create.md)  
[Configure instructions and tasks for a playground agent (preview)](agent-playground-configure.md)  
[Set up playground agent permissions and profiles (preview)](agent-playground-permissions-profiles.md)  
[Best practices for prototyping with the Agent playground (preview)](agent-playground-best-practices.md)