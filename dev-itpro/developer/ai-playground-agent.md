---
title: AI Playground Agent overview
description: Learn how you can use AI Playground Agent in Business Central
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

[This article is prerelease documentation and is subject to change.]

The AI Playground agent is a tool that allows you to create prototypes to experiment with AI capabilities in [!INCLUDE [prod_short](includes/prod_short.md)]. It's available in sandbox environments and is designed for testing and learning purposes. It provides an environment where you can test and explore AI capabilities without affecting your production data. You can create an AI Playground agent to test various AI functionalities, such as automating tasks and integrating AI into your workflows. The agent can be given specific instructions and tasks to see how it performs in different scenarios.

## Prerequisites

Before you can use the AI Playground agent, ensure that you have the following prerequisites in place:

- Enable the Copilot and agent capabilities in [!INCLUDE [prod_short](includes/prod_short.md)]
- Appropriate permissions to access and use the AI Playground Agent in [!INCLUDE [prod_short](includes/prod_short.md)].

## Turn on AI Playground Agent

The AI Playground Agent is available in sandbox environments. To use the AI Playground Agent, you must first enable the Copilot and agent capabilities in [!INCLUDE [prod_short](includes/prod_short.md)]. Learn more in [Configure Copilot and agent capabilities](/dynamics365/business-central/enable-ai).

When the AI Playground Agent is enabled, you will see the <insert icon> icon in the top navigation menu of the role center.

## Set up AI Playground Agent

The **Agents (preview)** page is where you create and manage your AI Playground agents. The list shows all the agents that have been created in your environment.

To create a new AI Playground agent, choose **Playground**, and then **Create**. This opens a **Create Agent**, where you can define the agent's **Name**, **User Display Name**, **Initials**, and **Type**. purpose and the tasks it will perform. The 

The Agent Card is where you define the agent's purpose and the tasks it will perform. 




## Activate AI Playground Agent


Activate the AI Playground agent for your company.

1. In the navigation bar at the upper right of the role center, select <icon> AI Playground Agent > Activate.
1. On the Configure the AI Playground Agent page, select OK to activate the agent.


<!--
Steps
(?) Search for Agents (Preview) and choose the link
(?) On the Agents (Preview) card, 
Choose Playground, and then choose Create
Enter Name, User Display Name, Initials, and choose the Type of agent - set to Playground Agent

PA Agent must be active to add new tasks.
PA Agent must be inactive to add permissions to it.

(?) Choose OK to create the agent.

Agent Card
Prefilled information from earlier step
State - Disabled by default
Playground - Instructions this is where you write the prompt that you want the agent to act on. Good, working example!
What to be aware of

Agent Permission Sets
Add the necessary permissions for the Agent to perform the task described in the instructions. 

Set up Agent tasks - what are these, how are they best defined - trigger the flow? How many can you add? Good example needed. I can enter more, how are these processed?


-->

## Related information

[Configure Copilot and agent capabilities](/dynamics365/business-central/enable-ai)