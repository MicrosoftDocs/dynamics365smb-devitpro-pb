---
title: AI Development Toolkit Overview
description: Discover the AI Development Toolkit for testing AI capabilities in Business Central by building agents. Prototype, validate, and refine AI-powered solutions.
author: solsen
ms.author: solsen
ms.reviewer: solsen
ms.topic: concept-article
ms.collection:
  - get-started
  - bap-ai-copilot
ms.date: 01/12/2026
ms.update-cycle: 180-days
---

# AI development toolkit overview (preview)

[This article is prerelease documentation and is subject to change.]

[!INCLUDE [ai-designer-preview](../includes/ai-designer-preview.md)]

The [!INCLUDE [prod_short](../includes/prod_short.md)] AI development toolkit provides an environment that allows developers and partners to experiment with AI capabilities in [!INCLUDE [prod_short](../includes/prod_short.md)] by building agents. It's available in sandbox environments and designed for testing and learning purposes, providing a safe environment to explore AI functionalities without affecting production data.

## Purpose and audience

Building proof-of-concept agents is primarily designed for teams who want to prototype AI-powered capabilities by configuring agents. The ability to design agents is part of the AI development toolkit, which is intended for:

- **Product owners** who want to prototype AI-powered features before building them in AL extensions
- **Domain experts** evaluating AI integration possibilities for their [!INCLUDE [prod_short](../includes/prod_short.md)] solutions  
- **Consultants** exploring automation scenarios with AI assistance for client solutions
- **Developers** validating AI use cases and gathering requirements for custom implementations

Building and designing agents helps you understand how AI can interact with the [!INCLUDE [prod_short](../includes/prod_short.md)] user interface and data, which allows you to test various AI functionalities such as automating tasks, answering questions, and integrating AI into workflows through agents.

## When to use and when not to use

### When to use the AI development toolkit

Use the AI development toolkit when you want to:

- **Prototype AI features** before investing in AL development
- **Test AI interactions** with [!INCLUDE [prod_short](../includes/prod_short.md)] UI and data  
- **Validate use cases** and gather requirements for AI-powered solutions
- **Experiment with prompts** and AI behavior in a controlled environment
- **Demonstrate AI capabilities** to stakeholders or customers
- **Learn AI integration patterns** for [!INCLUDE [prod_short](../includes/prod_short.md)]

### When not to use the AI development toolkit

Don't use the AI development toolkit when:

- **Production environments** are involved (sandbox only)
- **Compliance or security evaluation** is the primary goal
- **Final implementation** is ready (graduate to AL extension instead)
- **End-user training** is the main objective (use production-ready Copilot features)

## Agent lifecycle summary

A typical agent follows this lifecycle:

1. **Create** - Set up the agent with basic identity and profile
1. **Configure** - Define instructions and permissions
1. **Activate** - Enable the agent for testing, add tasks
1. **Iterate** - Test, refine instructions, and adjust permissions
1. **Graduate** - Export learnings to build production solutions using AL extensions
1. **Clean up** - Deactivate and remove the prototype agent

Each phase has specific requirements and limitations that guide your development process.

:::image type="content" source="../media/ai-designer-lifecycle.png" alt-text="Agent lifecycle":::

## High-level concepts

Understanding the following key concepts helps you work effectively with agents.

## Prerequisites

Before you can design agents in [!INCLUDE [prod_short](../includes/prod_short.md)], ensure that you have the following prerequisites in place:

- Enable the **Custom Agent** capability in [!INCLUDE [prod_short](../includes/prod_short.md)]. Learn more in [Configure Copilot and agent capabilities](/dynamics365/business-central/enable-ai).
- Appropriate permissions to access and use the design capabilities in [!INCLUDE [prod_short](../includes/prod_short.md)].  
  - "AGENT - ADMIN" gives permission to design agents.  
  - "AGENT - DIAGNOSTICS" gives access to extra troubleshooting data.
- A sandbox environment for testing and experimentation from version 27.2 (can include customer data such as sandbox copies of production data).
- Billing setup for agent capabilities in your tenant. Learn more in [Manage consumption billing for agents (preview)](../administration/tenant-admin-center-manage-consumption-billing.md).

### Instructions and tasks

Instructions are natural language descriptions that define your agent's purpose and behavior. Think of them as detailed prompts that guide how the agent interprets requests and interacts with the [!INCLUDE [prod_short](../includes/prod_short.md)] interface. Well-written instructions include context, clear expectations, and specific guidance about the agent's role. Learn more in [Write effective instructions for an agent (preview)](ai-development-toolkit-instructions.md).

Tasks are a way to trigger the agent. Tasks can only be added when the agent is active, and they help structure how the agent responds to different types of requests. Learn more about tasks in [Run an agent (preview)](ai-development-toolkit-run-agent.md).

### Supported languages

This feature currently supports only English as language. While this feature can be used in other languages, it might not function as intended. Language quality might vary based on the user's interaction or system settings, which might affect accuracy and the user experience.

Learn more about geographic and language availability at [Copilot international availability](https://releaseplans.microsoft.com/availability-reports/?report=copilotproductreport).

### Permissions and profiles

The agent operates with explicit permission sets that control what data and actions it can access. This follows the principle of least privilege; grant only the permissions necessary for the agent's intended functionality. The agent is assigned to a profile (role) that determines which UI elements it can see and interact with. To reduce contextual noise and increase accuracy, it's highly recommended to create custom profiles specifically for agents, using page customization properties to control visibility of actions, layouts, views, and operations like insert/delete.

Learn more in [Set up agent permissions and profiles (preview)](ai-development-toolkit-permissions-profiles.md).

## Limitations (preview)

As a preview feature, the AI development toolkit has several important limitations:

### Environment restrictions

- **Sandbox only**: Available exclusively in sandbox environments; never in production
- **Sandbox data**: Can be used with customer data in sandbox environments (including sandbox copies of production data)
- **Preview functionality**: Features and behavior might change without notice

### Operational constraints

- **Permission inheritance**: Agents can't have more permissions than their creating user
- **UI interaction limits**: Agents see only what their assigned profile allows
- **Single list per page**: Agents can only interact with one list on any given page. If a page has multiple sublists (for example, sales lines and notes in a factbox), the agent can only access one of them
- **No Tell me**: Agents can't use **Tell me** to find specific information. Navigation is limited to available actions and links

## Getting started

Ready to try design an agent? The process involves enabling the feature, creating your agent, and configuring it for your specific use case. Learn more in [Create and activate an agent (preview)](./ai-development-toolkit-agent-create..md).

## Related information

[Overview (preview)](ai-development-toolkit-landing-page.yml)  
[Create and activate (preview)](ai-development-toolkit-agent-create..md)  
[Write effective instructions (preview)](ai-development-toolkit-instructions.md)  
[Instruction keywords (preview)](ai-development-toolkit-instruction-keywords.md)  
[Integrate with the Tasks AL API (preview)](ai-development-toolkit-tasks-api.md)  
[Attachment capabilities and limitations (preview)](ai-development-toolkit-attachments.md)  
[Set up permissions and profiles (preview)](ai-development-toolkit-permissions-profiles.md)  
[Run an agent (preview)](ai-development-toolkit-run-agent.md)  
[Iterate and manage (preview)](ai-development-toolkit-iterate.md)  
[Best practices for designing an agent (preview)](ai-development-toolkit-faq.md)  
[Best practices (preview)](ai-development-toolkit-best-practices.md)  
[Create a Sales Validation Agent (preview)](ai-development-toolkit-sales-validation.md)  
[Transparency note: Business Central AI development toolkit (preview)](transparency-note-ai-development-toolkit.md)
