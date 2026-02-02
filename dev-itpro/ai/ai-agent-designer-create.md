---
title: Create and activate an agent (preview)
description: Learn how to create and activate an agent in Business Central to automate tasks, integrate AI, and enhance your workflows.
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

# Create and activate an agent (preview)

[This article is prerelease documentation and is subject to change.]

[!INCLUDE [ai-designer-preview](../includes/ai-designer-preview.md)]

You can create an agent to test various AI functionalities, such as automating tasks and integrating AI into your workflows. An agent can be given specific instructions and tasks to see how it performs in different scenarios. The agent is considered as a user in [!INCLUDE [prod_short](../includes/prod_short.md)], so it can be assigned permission sets to control what data and actions it can access.

Learn more in [AI development toolkit overview (preview)](ai-agent-designer.md).

## Prerequisites

Before you can create an agent, ensure that you have the following prerequisites in place:

- Enable the **Custom Agent** capability in [!INCLUDE [prod_short](../includes/prod_short.md)]. Learn more in [Configure Copilot and agent capabilities](/dynamics365/business-central/enable-ai).
- Appropriate permissions to design an agent in [!INCLUDE [prod_short](../includes/prod_short.md)]. This must include the "AGENT - ADMIN" and the "AGENT - DIAGNOSTICS" permission sets assigned to your user.
- A sandbox environment for testing and experimentation from version 27.2 (can include customer data such as sandbox copies of production data)
- Billing setup for agent capabilities in your tenant. Learn more in [Manage consumption billing for agents (preview)](../administration/tenant-admin-center-manage-consumption-billing.md).

## Getting started

Creating an agent involves several key phases: design, configuration, and testing. You start by defining your agent's identity and purpose, then specify its behavior through natural language instructions. The agent needs appropriate permissions and user profiles to interact with your [!INCLUDE [prod_short](../includes/prod_short.md)] environment safely and effectively.

The development process is iterative by design. You can continuously refine your agent's instructions, adjust what it has access to via its profile and permissions, and test different scenarios until it performs as expected. The agent designer provides tools to monitor the agent's reasoning and actions, making it easy to identify areas for improvement and validate that the agent meets your requirements.

## Turn on the design capability

The design capability is on if the :::image type="content" source="../media/ai-designer-icon-new.png" alt-text="Create new agent"::: **Agent** icon appears in the top navigation menu of the role center.

If the icon isn't present, turn it on from the **Copilot & agent capabilities** page, like other Copilot features in [!INCLUDE [prod_short](../includes/prod_short.md)]. The design capability is listed under **Production ready previews**. Learn more in [Configure Copilot and AI agent capabilities](/dynamics365/business-central/enable-ai).

Next, configure, and activate the agent to get started.

### Configure an agent

The **Create agent** wizard allows you to configure your agent by setting up its instructions, profile, and permissions. The wizard is also where you enable the agent for use, once it's set up.

1. In the navigation bar at the upper right of the role center, select :::image type="content" source="../media/ai-designer-icon-new.png" alt-text="Create new agent"::: **Agent** > **Create**.
1. In the **Create agent** wizard, choose whether to create a blank agent or use a template.  
  - To create a blank agent, choose **Create agent from scratch**, and then choose **Next**.
  - To use a template, choose **Sales Validation**, choose **Next**, and then choose **Create agent**. The template provides a starting point with predefined instructions and tasks focused on sales order validation. The next steps describe how to customize the agent further. Learn more in [Create a Sales Validation Agent (preview)](ai-agent-designer-sales-validation.md).
1. On the **Create agent (preview)** wizard, enter a **Name** and **Display Name** and **Initials** field values are now suggested based on the **Name**, but can be modified.
:::image type="content" source="../media/ai-designer-agent-setup.png" alt-text="Agent designer setup":::
1. In the **Description** field, provide an optional description for the agent.
1. Choose the arrow to go to the next page of the wizard.
1. Under **Profile (role)**, use the **Setup profile** option to select the profile that determines what UI elements the agent can see and interact with.  
You can create custom profiles specifically for agents, using page customization properties to control visibility of actions, layouts, views, and operations like insert/delete. Learn more in [Set up agent permissions and profiles (preview)](ai-agent-designer-permissions-profiles.md).
1. Under **Permissions**, use **Manage permissions** to add the permissions that the agent should have.  
This allows you to define what data and actions it can access. This is important for ensuring that the agent operates within the boundaries of your organization's data security policies. Learn more in [Set up agent permissions and profiles (preview)](ai-agent-designer-permissions-profiles.md)
1. Under **Instructions for the agent**, use the **Edit instructions** option to provide a clear and concise description of what you want the agent to do. This serves as the prompt that guides the agent's behavior. Learn more in [Write effective instructions for an agent (preview)](ai-agent-designer-effective-instructions.md).
1. Under **Optimize agent instructions**, use the **Go to task playground** option to go to the **Agent task playground** page, where you can refine the agent's instructions and create a task to run the agent. Learn more in [Iterate and manage an agent (preview)](ai-agent-designer-iterate.md). If you want to skip this step for now, you can return to it later after activating the agent. If you choose to go to the task playground, you must complete the setup of the agent first.
1. Turn on the **Active** toggle.
1. Select **Update** to complete the setup.

The agent icon changes to :::image type="content" source="../media/ai-designer-icon.png" alt-text="Agent design icon"::: after configured, indicating the agent is active and ready to handle tasks.

### Accessing agent settings after creation

You can access and modify the settings of an existing agent either from the icon :::image type="content" source="../media/ai-designer-icon.png" alt-text="Agent design icon"::: or by navigating to the **Agents (preview)** page and selecting the agent you want to configure.

In the **Agents (preview)** page, choose the agent, and either open the **Agent Card** , or use the **Setup** while standing on the agent to modify and the **Create agent (preview)** wizard opens.

In the Copilot chat pane for the specific agent, choose the :::image type="content" source="../media/ai-designer-settings-icon.png" alt-text="Agent design settings icon"::: icon to open a **Configure agent (preview)** wizard.

### Understanding agent states

An agent is by default in the **Disabled** state. You must activate the agent to use it, but you can only activate it after you have defined its purpose and tasks. Working on the setup, you can switch the agent between **Disabled** and **Active** states as needed.

## Related information

[Overview (preview)](ai-agent-designer-landing-page.yml)  
[AI development toolkit (preview)](ai-agent-designer.md)   
[Write effective instructions (preview)](ai-agent-designer-effective-instructions.md)  
[Instruction keywords (preview)](ai-agent-designer-instruction-keywords.md)  
[Integrate with the Tasks AL API (preview)](ai-agent-designer-tasks-api.md)  
[Attachment capabilities and limitations (preview)](ai-agent-designer-attachments.md)  
[Set up permissions and profiles (preview)](ai-agent-designer-permissions-profiles.md)  
[Run an agent (preview)](ai-agent-designer-run-agent.md)  
[Iterate and manage (preview)](ai-agent-designer-iterate.md)  
[Best practices for designing an agent (preview)](ai-agent-designer-faq.md)  
[Best practices (preview)](ai-agent-designer-best-practices.md)  
[Create a Sales Validation Agent (preview)](ai-agent-designer-sales-validation.md)  
[Transparency note: Business Central AI development toolkit (preview)](transparency-note-agent-designer.md)  