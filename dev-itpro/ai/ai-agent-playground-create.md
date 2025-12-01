---
title: Create and activate an agent using the agent playground (preview)
description: Learn how to create and activate an agent in Business Central to automate tasks, integrate AI, and enhance your workflows.
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

# Create and activate a playground agent (preview)

[This article is prerelease documentation and is subject to change.]

[!INCLUDE [ai-playground-preview](../includes/ai-playground-preview.md)]

You can create an agent in the Agent playground to test various AI functionalities, such as automating tasks and integrating AI into your workflows. An agent can be given specific instructions and tasks to see how it performs in different scenarios. The agent is considered as a user in [!INCLUDE [prod_short](../includes/prod_short.md)], so it can be assigned permission sets to control what data and actions it can access.

Learn more about the Agent playground in [Agent playground overview (preview)](ai-agent-playground.md).

## Prerequisites

Before you can create an agent in the agent playground, ensure that you have the following prerequisites in place:

- Enable the Copilot and agent capabilities in [!INCLUDE [prod_short](../includes/prod_short.md)]. Learn more in [Configure Copilot and agent capabilities](/dynamics365/business-central/enable-ai).
- Appropriate permissions to access and use the Agent playground in [!INCLUDE [prod_short](../includes/prod_short.md)]. This must include the "AGENT - ADMIN" and the "AGENT - DIAGNOSTICS" permission sets assigned to your user.
- A sandbox environment for testing and experimentation (can include customer data such as sandbox copies of production data)
- Billing setup for agent capabilities in your tenant. Learn more in [Manage consumption billing for agents (preview)](../administration/tenant-admin-center-manage-consumption-billing.md).

## Getting started

Creating an agent involves several key phases: design, configuration, and testing. You start by defining your agent's identity and purpose, then specify its behavior through natural language instructions. The agent needs appropriate permissions and user profiles to interact with your [!INCLUDE [prod_short](../includes/prod_short.md)] environment safely and effectively.

The development process is iterative by design. You can continuously refine your agent's instructions, adjust what is has access to via its profile and permissions, and test different scenarios until it performs as expected. The Agent playground provides tools to monitor the agent's reasoning and actions, making it easy to identify areas for improvement and validate that the agent meets your requirements.

## Turn on the Agent playground capability

The Agent playground capability is on if the :::image type="content" source="../media/ai-playground-icon-new.png" alt-text="Playground agent create new"::: **Agent** icon appears in the top navigation menu of the role center.

If the icon isn't present, turn it on from the **Copilot & agent capabilities** page, like other Copilot features in [!INCLUDE [prod_short](../includes/prod_short.md)]. The Agent playground is listed under Production ready previews. Learn more in [Configure Copilot and AI agent capabilities](/dynamics365/business-central/enable-ai).

Next, configure, and activate the agent to get started.

### Configure a playground agent

The **Create agent (preview)** wizard allows you to configure your playground agent by setting up its instructions, profile, and permissions. The wizard is also where you enable the agent for use, once it's set up.

1. In the navigation bar at the upper right of the role center, select :::image type="content" source="../media/ai-playground-icon-new.png" alt-text="Playground agent create new"::: **Agent** > **Create**.
1. In the **Custom Agents Wizard** dialog, choose whether to create a blank agent or use a template.  
  - To create a blank agent, choose **Create agent from scratch**, and then choose **Next**.
  - To use a template, choose **SALES VALIDATION**, and then choose **Next**. The template provides a starting point with predefined instructions and tasks focused on sales order validation. The next steps describe how to customize the agent further.
1. On the **Create agent (preview)** wizard, enter a **Name** and **Display Name** for the agent. The **Initials** field value is suggested based on the **Display Name**, but can be modified.
:::image type="content" source="../media/ai-playground-agent-setup.png" alt-text="Playground agent setup":::
1. In the **Description** field, provide an optional description for the agent.
1. Under **Instructions for the agent**, use the **Edit instructions** option to provide a clear and concise description of what you want the agent to do.  
This serves as the prompt that guides the agent's behavior. Learn more in [Write effective instructions for a playground agent (preview)](ai-agent-playground-effective-instructions.md).
1. Choose the arrow to go to the next page of the wizard.
1. Under **Profile (role)**, use the **Setup profile** option to select the profile that determines what UI elements the agent can see and interact with.  
You can create custom profiles specifically for agents, using page customization properties to control visibility of actions, layouts, views, and operations like insert/delete. Learn more in [Set up playground agent permissions and profiles (preview)](ai-agent-playground-permissions-profiles.md).
1. Under **Permissions**, use **Manage permissions** to add the permissions that the agent should have.  
This allows you to define what data and actions it can access. This is important for ensuring that the agent operates within the boundaries of your organization's data security policies. Learn more in [Set up playground agent permissions and profiles (preview)](ai-agent-playground-permissions-profiles.md).
1. Use the arrow to go to the previous page of the wizard.
1. Turn on the **Active** toggle.
1. Select **Update** to complete the setup.

The Agent icon changes to :::image type="content" source="../media/ai-playground-icon.png" alt-text="Playground agent icon"::: after configured, indicating the agent is active and ready to handle tasks.

### Accessing agent settings after creation

You can access and modify the settings of an existing playground agent either from the icon :::image type="content" source="../media/ai-playground-icon.png" alt-text="Playground agent icon"::: or by navigating to the **Agents (preview)** page and selecting the agent you want to configure.

In the **Agents (preview)** page, choose the agent, and either open the **Agent Card (preview)** , or use the **Setup** while standing on the agent to modify and the **Create agent (preview)** wizard opens.

In the Copilot chat pane for the specific agent, choose the :::image type="content" source="../media/ai-playground-settings-icon.png" alt-text="Playground agent settings icon"::: icon to open a **Configure agent (preview)** wizard.

### Understanding agent states

An agent is by default in the **Disabled** state. You must activate the agent to use it, but you can only activate it after you have defined its purpose and tasks. Working on the setup, you can switch the agent between **Disabled** and **Active** states as needed.

> [!NOTE]
> To modify the permissions of an agent, you must first deactivate it.

## Related information

[Overview (preview)](ai-agent-playground-landing-page.yml)  
[Agent playground (preview)](ai-agent-playground.md)  
[Write effective instructions (preview)](ai-agent-playground-effective-instructions.md)  
[Instruction keywords (preview)](ai-agent-playground-instruction-keywords.md)  
[Integrate with the Tasks AL API (preview)](ai-agent-playground-tasks-api.md)  
[Set up permissions and profiles (preview)](ai-agent-playground-permissions-profiles.md)  
[Run a playground agent (preview)](ai-agent-playground-run-agent.md)  
[Iterate and manage (preview)](ai-agent-playground-iterate.md)  
[Best practices (preview)](ai-agent-playground-best-practices.md)  
[Transparency note: Business Central agent playground](transparency-note-agent-playground.md)  