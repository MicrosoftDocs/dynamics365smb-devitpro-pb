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


<!-- split into more articles, using this as a starting point. Live in devitpro, linking from app repo -->

[This article is prerelease documentation and is subject to change.]

> This article is intended for developers and partners who want to experiment with AI capabilities in [!INCLUDE [prod_short](includes/prod_short.md)] using the AI Playground agent.

The AI Playground agent is a tool that allows you to create prototypes to experiment with AI capabilities in [!INCLUDE [prod_short](includes/prod_short.md)]. It's available in sandbox environments and is designed for testing and learning purposes. It provides an environment where you can test and explore AI capabilities without affecting your production data. You can create an AI Playground agent to test various AI functionalities, such as automating tasks and integrating AI into your workflows. The agent can be given specific instructions and tasks to see how it performs in different scenarios. The agent is considered a user in [!INCLUDE [prod_short](includes/prod_short.md)], so it can be assigned permission sets to control what data and actions it can access.

## Prerequisites

Before you can use the AI Playground agent, ensure that you have the following prerequisites in place:

- Enable the Copilot and agent capabilities in [!INCLUDE [prod_short](includes/prod_short.md)]
- Appropriate permissions to access and use the AI Playground Agent in [!INCLUDE [prod_short](includes/prod_short.md)]


## Set up AI Playground Agent

The **Agents (preview)** page is where you create and manage your AI Playground agents. The list shows all the agents that have been created in your environment.

To create a new AI Playground agent, follow these steps:

### Create an AI Playground agent

In the **Agents (preview)** page, choose **Playground**, and then **Create**. 
This opens a **Create Agent**, where you can define the agent's **Name**, **User Display Name**, **Initials**, and **Type**.
In **Name**, enter a unique name for the agent. This name is used to identify the agent in the system.
The **User Display Name** is the name that will be shown to users when they interact with
The **Initials** is used in the UI to represent the agent, such as in chat interfaces.
The **Type** should be set to **Playground Agent** for AI Playground agents.
Choose **OK**, and the **Agent Card** opens.

**Agent User Settings** page available from the **Agent Card** and it shows the settings for the agent user, such as language and time zone. These settings can be adjusted to match the preferences of the users who will interact with the agent.


#### The agent and the UI

The AI Playground agent can interact with the UI it sees. For example, it can't access page search. The agent is assigned a profile just like any other user and this is the key to controlling its access. For the **Profile (Role)**, to ensure that you don't expose too much of the UI, it is recommended to build a custom profile for the agent in the same way as you would build a custom profile for a user.


Properties on page customization object:

ClearActions: Boolean - If set to true, all actions on the page are removed for the agent.
ClearLayout: Boolean - If set to true, the layout of the page is simplified for the agent.
ClearViews: Boolean - If set to true, all views on the page are removed for the agent.
DeleteAllowed: Boolean - If set to false, the delete action isn't allowed for the agent.
InsertAllowed: Boolean - If set to false, the insert action isn't allowed for the agent.    

Once you have built and published a profile, you can assign it to the agent in the **Profile** field on the **Agent Card**.


The **Agent Card** is where you define the agent's purpose and the tasks it will perform.

The profile of the agent is default the Playground agent (Copilot) type. This can be changed, but you must be aware that changing the type will change what the agent has access to.

An agent is also by default in the **Disabled** state. You must activate the agent to use it, but you can only activate it after you have defined its purpose and tasks.

In the **Instructions** field, provide a clear and concise description of what you want the agent to do. This serves as the prompt that guides the agent's behavior. For example, you might instruct the agent to "Help users find customer information quickly."

Under **Agent Permission Sets**, you add the permissions that the agent should have. This allows you to define what data and actions it can access. This is important for ensuring that the agent operates within the boundaries of your organization's data security policies. Permission sets can only be added when the agent is in the **Disabled** state. If you need to modify the permissions later, you must first deactivate the agent. The agent can't have more permissions than the user creating it.

Under **User Access**, you can define who in your organization can interact with the agent. This helps control the usage of the agent. The default user is the one who created the agent, but you can add more users if needed.


Agent tasks are specific actions that the agent can perform based on the instructions you provided. You can define multiple tasks for the agent to handle different scenarios. Tasks can only be added when the agent is in the **Active** state. If you need to modify the tasks later, you must first deactivate the agent.

### Instructions and tasks

Instructions are written in natural language and should clearly describe the agent's purpose.

<!-- Add example of good instructions, like shown in the partner video. Link to best practices for prompting -->

## Turn on AI Playground Agent

The AI Playground Agent is available in sandbox environments. To use the AI Playground Agent, you must first enable the Copilot and agent capabilities in [!INCLUDE [prod_short](includes/prod_short.md)]. Learn more in [Configure Copilot and agent capabilities](/dynamics365/business-central/enable-ai).

When the AI Playground Agent is enabled, you will see the <insert icon> icon in the top navigation menu of the role center.


## Agent Task Log

Used for troubleshooting the agents behavior. The log captures the interactions between users and the agent, including the prompts sent to the agent and the responses received. This information can be invaluable for diagnosing issues and understanding how the agent is performing.

Drill into every step by clicking the line in the log. You can see the full prompt sent to the agent and the response it generated. This can help you identify any misunderstandings or errors in the agent's behavior.

## Activate AI Playground Agent


Activate the AI Playground agent for your company.

1. In the navigation bar at the upper right of the role center, select <icon> AI Playground Agent > Activate.
1. On the Configure the AI Playground Agent page, select OK to activate the agent.


## Testing the AI Playground Agent

## Best practices

When creating and using an AI Playground agent, consider the following best practices:

Bold instructions and markdown format. Other best practices to be added from the slide deck. 

Include link to best practices article.

<!--

Content gaps to address before publication:
Clarify audience: developers/partners (not end users); add sentence early. DONE

Add “When to use / when not to use” decision list.

Replace placeholder <insert icon>/<icon> with correct UI token or remove until icon name confirmed.

Expand “Set up” section with structured steps:
Open Agents (Preview) page
Choose Playground > Create
Fill fields (clarify each: Name vs User Display Name vs Initials vs Type)
Add Instructions (purpose; include example)
(Optional) Add Permission Sets (must deactivate to modify)
Define Tasks (describe what a task is; example)
Activate (state transition)
Add table: Field | Description | Editable after activation? (Yes/No)
Add section “Tasks” (concept + execution model + limits if any).
Add section “Permissions model” (least privilege, risks of over-broad sets).
Add section “Lifecycle”: Create → Iterate (Deactivate/Edit) → Export knowledge to AL → Delete.
Add “Limitations (preview)” (sandbox only, no production data, not for compliance evaluation).
Add “Telemetry” (recommend capturing prompts & responses manually during prototype).
Add “Next steps” linking to build-capability / function calling / testing pages.


Front matter: consider ms.topic: how-to if you shift to procedural, or keep concept + spin off creation page for how-to.


-->


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