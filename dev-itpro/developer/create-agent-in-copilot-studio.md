---
title: Create Agents with Copilot Studio
description: Learn how to create conversational agents with Copilot Studio that integrate with Business Central data and automate business processes through natural language interactions.
author: rhanajoy #Required; your GitHub user alias, with correct capitalization.
ms.author: jswymer
ms.reviewer: jswymer
ms.topic: how-to
ms.collection: 
ms.date: 10/20/2025
ms.custom: bap-template
---
# Create agents with Copilot Studio

Copilot Studio is a graphical, low-code tool for building agents and agent flows. You can use it to create conversational agents that understand and act on your business processes and data model in Business Central. Agents present Business Central data (customers, orders, invoices, and inventory) and business logic to users via natural language. Agents automate tasks such as creating sales orders, checking credit, or posting payments, and trigger approvals or flows.

Business Central provides two model‑aware tools that agents can use to interact directly with Business Central environments: Business Central MCP server and Business Central Connector for Power Platform. These tools let agents read and write records, call custom APIs exposed by AL extensions, and apply server‑side business logic such as pricing, discounts, and validation rules. <!--By exposing model context and server capabilities, the tools enable agents to automate processes, perform secure data operations, and integrate with existing Business Central workflows.-->

[![Shows how data virtualization works between Business Central and Dataverse](../developer/media/dataverse-virtual-tables.svg)](../developer/media/dataverse-virtual-tables.svg#lightbox)

You can publish agents into the following targets:ons, while respecti

- **Teams**
- **Dynamics 365**
- **Microsoft 365 apps**
- **Power Apps/Pages**
- **Custom web channels**

Governance (including Entra ID authentication, data loss prevention, and environment policies) ensures secure, auditable access.

## Prerequisites

Copilot Studio user license with Copilot Credits for use. Learn more in [Copilot Studio licensing](/microsoft-copilot-studio/billing-licensing).

<!--
## Create agent

1. Sign in to [Copilot Studio](https://copilotstudio.microsoft.com/).
1. In the left-side navigation pane, select **Agents** > **New agent**.
1. On the **Start building your agent** page, use  **Describe** and **Configure** tabs to name and describe the agent. This step is optional, because you can switch to this Configure view at any time later.
1. Select **Create**.

After the agent is created, refere to the next sections to add the Dynamics 365 Business Central MCP server or Dynamics 365 Business Central Connectore as tools of the agent.-->

## Add the Business Central MCP server as a tool to an agent

After an agent is created, you can add the Business Central MCP server to an agent as a tool access server tools and resources.  MCP server is connected to Copilot Studio, you can add the server to an agent as a tool, and access server tools and resources.
You can use the Dynamics 365 ERP MCP server to create agents in Microsoft Copilot Studio. The server provides tools for actions in Dynamics 365 Finance and Dynamics 365 Supply Chain Management.

To add the tools to your agent, follow these steps.

## Add the Business Central connector action as a tool to an agent

1. Sign in to [Copilot Studio](https://copilotstudio.microsoft.com/).
1. In the left-side navigation pane, select **Agents**.
1. Select the agent you want to modify or select **New agent** to create a new agent.

   Learn more about creating agents in [Create an agent in Copilot Studio](/microsoft-copilot-studio/authoring-first-bot?tabs=web#create-an-agent).
In the agent, on the Tools tab, select Add a tool.
In the Add tool dialog, select the Model Context Protocol filter, and search for Dynamics 365 ERP MCP.
Create a connection to the server.
Select Add to agent.


Connect to Dataverse using an MCP server in Microsoft Copilot Studio
Go to Power App and select your environment from the top right environment selector.
From the left navigation pane, select Agents > Create new agent. If the item isn’t in the side panel pane, select …More and then select the item you want.
Select Create.
Scroll down to the Tools section and select + Add tool.
Select Model Context Protocol, and then select Dataverse MCP Server.
If there's no existing Dataverse connection, you're prompted to do so.
Select Add to agent.

Select Model Context Protocol, and then select Dataverse MCP Server.
If there's no existing Dataverse connection, you're prompted to do so.
Select Add to agent.

## Add the Business Central connector action as a tool to an agent

1. Sign in to [Copilot Studio](https://copilotstudio.microsoft.com/).
1. In the left-side navigation pane, select **Agents**.
1. Select the agent you want to modify or select **New agent** to create a new agent.

   Learn more about creating agents in [Create an agent in Copilot Studio](/microsoft-copilot-studio/authoring-first-bot?tabs=web#create-an-agent).
1. On the agent page, in the **Tools** tab, select **+ Add a tool**.
1. Under the **Search for tool** box, select **Connector**, then type and enter "Dynamics 365 Business Central" in the search box to display the available connector actions.
1. Select the connector action you want to add to the agent. The **Add tool** pane opens.
1. If the **Connection** box displays the `Not connected`, select the box and then choose **Create new connection**.
1. Sign in to Business Central with a valid account.
1. Select **Add and configure**. You're taken back to the **Tools** tab, where you can configure the action.
1. Make the needed changes, then select **Save** when done.
