---
title: Create and manage an AI Playground Agent (preview)
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

# Create and manage an AI Playground Agent (preview)

[This article is prerelease documentation and is subject to change.]

> This article is primarily intended for product owners, domain experts, consultants, and developers who want to experiment with AI capabilities in [!INCLUDE [prod_short](../includes/prod_short.md)] using the AI Playground Agent.

You can create an AI Playground Agent to test various AI functionalities, such as automating tasks and integrating AI into your workflows. The Agent can be given specific instructions and tasks to see how it performs in different scenarios. The Agent is considered as a user in [!INCLUDE [prod_short](../includes/prod_short.md)], so it can be assigned permission sets to control what data and actions it can access.

## Prerequisites

Before you can use the AI Playground Agent, ensure that you have the following prerequisites in place:

- Enable the Copilot and agent capabilities in [!INCLUDE [prod_short](../includes/prod_short.md)]. Learn more in [Configure Copilot and agent capabilities](/dynamics365/business-central/enable-ai).
- Appropriate permissions to access and use the AI Playground Agent in [!INCLUDE [prod_short](../includes/prod_short.md)].
- A sandbox environment for testing and experimentation (can include customer data such as sandbox copies of production data)

## Getting started

To get started, navigate to the Agent Builder Playground in your [!INCLUDE [prod_short](../includes/prod_short.md)] sandbox environment. Start by creating a new agent and giving it a clear name and description that reflect its purpose. Next, define the agent's instructions in natural language. These instructions should articulate the agent's goals, the tasks it should perform, and any constraints or considerations it must respect. 

After you define the behavior, assign a user profile that determines which UI elements and data entities the agent can interact with. Finally, configure the permissions that govern its execution, ensuring that the agent operates within safe and predictable boundaries.

Once your agent is configured, you can test it by triggering sample goals and observing its behavior in the timeline view. This timeline view provides a detailed record of the agent's reasoning steps, actions, and outcomes, allowing you to verify that it behaves as intended. If adjustments are needed, you can refine the instructions, modify permissions, or update the user profile and retest. The playground's iterative design makes it easy to experiment and improve until you achieve the desired results.

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

#### The agent and the UI

The AI Playground Agent can interact with the UI it sees. For example, it can't access page search. The agent is assigned to a profile just like any other user and this is the key to controlling its access. For the **Profile (Role)**, to ensure that you don't expose too much of the UI, it's recommended to build a custom profile for the agent in the same way as you would build a custom profile for a user.

On the page customization object, you can set specific flags to control what the agent can see and do on that page. The following flags are available:

| Property | Data type | Description |
|----------|-----------|-------------|
| `ClearActions` | Boolean | If set to true, all actions on the page are removed for the agent.|
| `ClearLayout`  | Boolean | If set to true, the layout of the page is simplified for the agent. |
| `ClearViews`   | Boolean | If set to true, all views on the page are removed for the agent. |
| `DeleteAllowed`| Boolean | If set to false, the delete action isn't allowed for the agent. |
| `InsertAllowed`| Boolean | If set to false, the insert action isn't allowed for the agent. |

Once you have built and published a profile, you can assign it to the agent in the **Profile** field on the **Agent Card**.

The **Agent Card** is where you define the agent's purpose and the tasks it performs.

> [!NOTE]
> The profile of the agent is set as default to the Playground Agent (Copilot) type. This can be changed, but changing the type changes what the agent has access to.

An agent is also by default in the **Disabled** state. You must activate the agent to use it, but you can only activate it after you have defined its purpose and tasks.

In the **Instructions** field, provide a clear and concise description of what you want the agent to do. This serves as the prompt that guides the agent's behavior. For example, you might instruct the agent to "Help users find customer information quickly."

Under **Agent Permission Sets**, you add the permissions that the agent should have. This allows you to define what data and actions it can access. This is important for ensuring that the agent operates within the boundaries of your organization's data security policies. Permission sets can only be added when the agent is in the **Disabled** state. If you need to modify the permissions later, you must first deactivate the agent. The agent can't have more permissions than the user creating it.

Under **User Access**, you can define who in your organization can interact with the agent. This helps control the usage of the agent. The default user is the one who created the agent, but you can add more users if needed.

Agent tasks are specific actions that the agent can perform based on the instructions you provided. You can define multiple tasks for the agent to handle different scenarios. Tasks can only be added when the agent is in the **Active** state. If you need to modify the tasks later, you must first deactivate the agent.

## Turn on AI Playground Agent

The AI Playground Agent is available in sandbox environments. To use the AI Playground Agent, you must first enable the Copilot and agent capabilities in [!INCLUDE [prod_short](../includes/prod_short.md)]. Learn more in [Configure Copilot and agent capabilities](/dynamics365/business-central/enable-ai).

When the AI Playground Agent is enabled, you see the <!-- insert icon --> icon in the top navigation menu of the role center.

## Agent Task Log

Used for troubleshooting the agents behavior. The log captures the interactions between users and the agent, including the prompts sent to the agent and the responses received. This information can be invaluable for diagnosing issues and understanding how the agent is performing.

Drill into every step by clicking the line in the log. You can see the full prompt sent to the agent and the response it generated. This can help you identify any misunderstandings or errors in the agent's behavior.

## Activate AI Playground Agent

Once you have created and configured your AI Playground Agent, you need to activate it before it can start handling tasks. To activate the AI Playground Agent for your company, follow these steps:

1. In the navigation bar at the upper right of the role center, select <!-- insert icon --> AI Playground Agent > Activate.
1. On the Configure the AI Playground Agent page, select OK to activate the agent.

## Related information

[Configure Copilot and agent capabilities](/dynamics365/business-central/enable-ai)  
[AI Playground Agent overview (preview)](ai-playground-agent.md)  
[Configure instructions, tasks, and permissions for an AI Playground Agent (preview)](ai-playground-agent-configure.md)  