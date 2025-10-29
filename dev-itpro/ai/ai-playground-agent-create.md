---
title: Create and activate an AI Playground Agent (preview)
description: Learn how you can use AI Playground Agent in Business Central.
author: solsen
ms.author: solsen
ms.reviewer: solsen
ms.topic: concept-article
ms.collection:
  - get-started
  - bap-ai-copilot
ms.date: 10/23/2025
ms.update-cycle: 180-days
---

# Create and activate an AI Playground Agent (preview)

[This article is prerelease documentation and is subject to change.]

[!INCLUDE [ai-playground-preview](../includes/ai-playground-preview.md)]

You can create an AI Playground Agent to test various AI functionalities, such as automating tasks and integrating AI into your workflows. The Agent can be given specific instructions and tasks to see how it performs in different scenarios. The Agent is considered as a user in [!INCLUDE [prod_short](../includes/prod_short.md)], so it can be assigned permission sets to control what data and actions it can access.

## Prerequisites

Before you can use the AI Playground Agent, ensure that you have the following prerequisites in place:

- Enable the Copilot and agent capabilities in [!INCLUDE [prod_short](../includes/prod_short.md)]. Learn more in [Configure Copilot and agent capabilities](/dynamics365/business-central/enable-ai).
- Appropriate permissions to access and use the AI Playground Agent in [!INCLUDE [prod_short](../includes/prod_short.md)].
- A sandbox environment for testing and experimentation (can include customer data such as sandbox copies of production data)

## Getting started

Creating an AI Playground Agent involves several key phases: design, configuration, and testing. You'll start by defining your agent's identity and purpose, then specify its behavior through natural language instructions. The agent needs appropriate permissions and user profiles to interact with your [!INCLUDE [prod_short](../includes/prod_short.md)] environment safely and effectively.

The development process is iterative by design. You can continuously refine your agent's instructions, adjust its permissions, and test different scenarios until it performs as expected. The playground environment provides tools to monitor the agent's reasoning and actions, making it easy to identify areas for improvement and validate that the agent meets your requirements.

## Set up an AI Playground Agent

The **Agents (preview)** page is where you create and manage your AI Playground agents. The list shows all the agents in your environment. To create a new AI Playground Agent, follow these steps:

### Create an AI Playground Agent

1. In the **Agents (preview)** page, choose **Playground**, and then **Create agent**. 
This opens a **Create Agent (preview)**, where you can define the agent's **Type**, **Name**, **Display Name**, and **Initials**.
1. The **Type** should be set to **Agent** for AI Playground agents.
1. In **Name**, enter a unique name for the agent. This name is used to identify the agent in the system.
1. The **Display Name** is the name that is shown to users when they interact with the agent.
1. The **Initials** is used in the UI to represent the agent, such as in chat interfaces.
1. Choose **OK**, and the **Create agent (preview)** dialog opens.

### Configure an AI Playground Agent

The **Create agent (preview)** dialog allows you to configure your AI Playground Agent by setting up its instructions, profile, and permissions. The dialog is also where you enable the agent for use, once it's set up.

Under **Instructions for the agent**, use the **Edit instructions** option to provide a clear and concise description of what you want the agent to do. This serves as the prompt that guides the agent's behavior. Learn more in [Configure instructions and tasks for an AI Playground Agent (preview)](ai-playground-agent-configure.md).

Under **Profile (role)**, use the **Setup profile** option to select the profile that determines what UI elements the agent can see and interact with. You can create custom profiles specifically for agents, using page customization properties to control visibility of actions, layouts, views, and operations like insert/delete. Learn more in [Set up AI Playground Agent permissions and profiles (preview)](ai-playground-agent-permissions-profiles.md).

Under **Permissions**, use **Manage permissions** to add the permissions that the agent should have. This allows you to define what data and actions it can access. This is important for ensuring that the agent operates within the boundaries of your organization's data security policies. Learn more in [Set up AI Playground Agent permissions and profiles (preview)](ai-playground-agent-permissions-profiles.md).

## Activate an AI Playground Agent

Once you have created and configured your AI Playground Agent, you need to activate it before it can start handling tasks. To activate the AI Playground Agent for your company, follow these steps:

1. In the navigation bar at the upper right of the role center, select <!-- insert icon --> AI Playground Agent > Activate.
1. On the Configure the AI Playground Agent page, select OK to activate the agent.

When the AI Playground Agent is enabled, you see the <!-- insert icon --> icon in the top navigation menu of the role center.

### Accessing agent settings after creation

You can access and modify the settings of an existing AI Playground Agent either from the Copilot chat pane or by navigating to the **Agents (preview)** page and selecting the agent you want to configure. 

In the **Agents (preview)** page, choose the agent, and either open the **Agent Card (preview)** , or use the **Setup** while standing on the agent to modify and the **Create agent (preview)** dialog opens.

In the Copilot chat pane for the specific agent, choose the settings icon (<!-- insert icon -->) to open a **Configure agent (preview)** dialog.

### Understanding agent states

An agent is also by default in the **Disabled** state. You must activate the agent to use it, but you can only activate it after you have defined its purpose and tasks. Working on the setup, you can switch the agent between **Disabled** and **Active** states as needed. To modify the permissions of an agent, you must first deactivate it.

## Related information

[Configure Copilot and agent capabilities](/dynamics365/business-central/enable-ai)  
[AI Playground Agent overview (preview)](ai-playground-agent.md)  
[Configure instructions and tasks for an AI Playground Agent (preview)](ai-playground-agent-configure.md)  
[Set up AI Playground Agent permissions and profiles (preview)](ai-playground-agent-permissions-profiles.md)  
[Best practices for prototyping with AI Playground Agent (preview)](ai-playground-agent-best-practices.md)