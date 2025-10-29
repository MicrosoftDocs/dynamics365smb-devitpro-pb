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

## Set up AI Playground Agent

The **Agents (preview)** page is where you create and manage your AI Playground agents. The list shows all the agents in your environment.

To create a new AI Playground Agent, follow these steps:

### Create an AI Playground Agent

1. In the **Agents (preview)** page, choose **Playground**, and then **Create**. 
This opens a **Create Agent**, where you can define the agent's **Name**, **User Display Name**, **Initials**, and **Type**.
1. In **Name**, enter a unique name for the agent. This name is used to identify the agent in the system.
1. The **User Display Name** is the name that is shown to users when they interact with
1. The **Initials** is used in the UI to represent the agent, such as in chat interfaces.
1. The **Type** should be set to **Playground Agent** for AI Playground agents.
1. Choose **OK**, and the **Agent Card** opens.

**Agent User Settings** page available from the **Agent Card** and it shows the settings for the agent user, such as language and time zone. These settings can be adjusted to match the preferences of the users who interact with the agent.

An agent is also by default in the **Disabled** state. You must activate the agent to use it, but you can only activate it after you have defined its purpose and tasks.

In the **Instructions** field, provide a clear and concise description of what you want the agent to do. This serves as the prompt that guides the agent's behavior. Learn more in [Configure instructions and tasks for an AI Playground Agent (preview)](ai-playground-agent-configure.md).

Under **Agent Permission Sets**, you add the permissions that the agent should have. This allows you to define what data and actions it can access. This is important for ensuring that the agent operates within the boundaries of your organization's data security policies. Permission sets can only be added when the agent is in the **Disabled** state. If you need to modify the permissions later, you must first deactivate the agent. The agent can't have more permissions than the user creating it.

Under **User Access**, you can define who in your organization can interact with the agent. This helps control the usage of the agent. The default user is the one who created the agent, but you can add more users if needed.

Agent tasks are specific actions that the agent can perform based on the instructions you provided. You can define multiple tasks for the agent to handle different scenarios. Tasks can only be added when the agent is in the **Active** state. If you need to modify the tasks later, you must first deactivate the agent.


## Activate AI Playground Agent

Once you have created and configured your AI Playground Agent, you need to activate it before it can start handling tasks. To activate the AI Playground Agent for your company, follow these steps:

1. In the navigation bar at the upper right of the role center, select <!-- insert icon --> AI Playground Agent > Activate.
1. On the Configure the AI Playground Agent page, select OK to activate the agent.

When the AI Playground Agent is enabled, you see the <!-- insert icon --> icon in the top navigation menu of the role center.

## Related information

[Configure Copilot and agent capabilities](/dynamics365/business-central/enable-ai)  
[AI Playground Agent overview (preview)](ai-playground-agent.md)  
[Configure instructions and tasks for an AI Playground Agent (preview)](ai-playground-agent-configure.md)  
[Set up AI Playground Agent permissions and profiles (preview)](ai-playground-agent-permissions-profiles.md)  
[Best practices for prototyping with AI Playground Agent (preview)](ai-playground-agent-best-practices.md)