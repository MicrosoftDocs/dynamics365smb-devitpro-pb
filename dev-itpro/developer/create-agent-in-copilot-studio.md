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
# Create agents for Business Central with Copilot Studio

Copilot Studio is a graphical, low-code tool for building agents and agent flows. You can use it to create conversational agents that understand and act on your business processes and data model in Business Central. Agents present Business Central data (customers, orders, invoices, and inventory) and business logic to users via natural language. Agents can automate tasks such as creating sales orders, checking credit, or posting payments, and trigger approvals or flows.

Business Central provides two model‑aware tools that agents can use to interact directly with Business Central environments: Business Central MCP server and Business Central Connector for Power Platform. These tools let agents read and write records, call custom APIs exposed by AL extensions, and apply server‑side business logic such as pricing, discounts, and validation rules. <!--By exposing model context and server capabilities, the tools enable agents to automate processes, perform secure data operations, and integrate with existing Business Central workflows.-->

[![Shows how agents work between Business Central and Coplito Studio](../developer/media/integrate-copilot-studio.svg)](../developer/media/integrate-copilot-studio.svg#lightbox)

You can publish agents into the following targets:

- **Teams**
- **Dynamics 365**
- **Microsoft 365 apps**
- **Power Apps/Pages**
- **Custom web channels**

Governance (including Entra ID authentication, data loss prevention, and environment policies) ensures secure, auditable access.

## Prerequisites

You have a Copilot Studio user license with available Copilot Credits capacity for use. Learn more in [Copilot Studio licensing](/microsoft-copilot-studio/billing-licensing).

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

## Add Business Central connector actions as a tools to an agent

You can use the Business Central connector actions, like Create Record or List Companies, in your agent by adding them as *tools*. Tools are the building blocks that enable your agent to interact with external systems, in this case, Business Central. For example, if you want to create an agent that allows you list, create, and update items in Business Central, add the Create Record, Create Record , Create Record actions as tools to the agent.

1. Sign in to [Copilot Studio](https://copilotstudio.microsoft.com/).
1. In the left-side navigation pane, select **Agents**.
1. Select the agent you want to modify or select **New agent** to create a new agent.

   Learn more about creating agents in [Create an agent in Copilot Studio](/microsoft-copilot-studio/authoring-first-bot?tabs=web#create-an-agent).
1. On the agent page, in the **Tools** tab, select **+ Add a tool**.
1. Under the **Search for tool** box, select **Connector**, then type and enter "Dynamics 365 Business Central" in the search box to display the available connector actions.
1. Select the connector action you want to add to the agent. For example, The **Add tool** pane opens.
1. If the **Connection** box displays the `Not connected`, select the box and then choose **Create new connection**.
1. Sign in to Business Central with a valid account.
1. Select **Add and configure**. You're taken back to the **Tools** tab, where you can configure the action.
1. Make the needed changes, then select **Save** when done.


## Create agent that uses Business Central connector

You can use the Business Central connector actions, like Create Record or List Companies, in your agent by adding them as *tools*. Tools are the building blocks that enable your agent to interact with external systems, in this case, Business Central. For example, if you want to create an agent that allows you list, create, and update items in Business Central, add the Create Record, Create Record , Create Record actions as tools to the agent.

### Add Business Central connector actions as a tools to an agent

This section explains how to build an agent with the Dynamics 365 Business Central connector in Copilot Studio. As an example, it walks you through the basic steps to making an agent that can list companies in Business Central and create new customers.

<>
1. Create new or open existing agent.

   1. Sign in to [Copilot Studio](https://copilotstudio.microsoft.com/).
   1. In the left-side navigation pane, select **Agents**.
   1. Select the agent you want to modify or select **New agent** to create a new agent.

   Learn more about creating agents in [Create an agent in Copilot Studio](/microsoft-copilot-studio/authoring-first-bot?tabs=web#create-an-agent).

1. Add the Business Central connector actions as tools.

   1. On the **Tools** tab of the agent page, select **+ Add a tool**.
   1. Under the **Search for tool** box, choose **Connector**, then search for "Dynamics 365 Business Central".
   1. Select the connector action `List companies`. The **Add tool** page opens.
   1. If the **Connection** box displays the `Not connected`, select the box, select **Create new connection** and sign in to Business Central with a valid account.
   1. Select **Add to agent**. You return to the agent **Overview** tab.
   1. Repeat to add the connector action `Create record`. This agent uses this action to create a Customer record.

   Learn more about adding tools in [Create an agent in Copilot Studio](/microsoft-copilot-studio/authoring-first-bot?tabs=web#create-an-agent).

1. Configure the tools.


    - List companies
      - In the action configuration, leave defaults or set a sensible page size.
      - Optionally expose filters (for example, company id) so the agent can scope results.
    - Create record (Customers)
      - Select the table/entity you want to create (for example, Customers).
      - Mark required fields (for example, Display name, Number, Email) as inputs the agent must supply.
      - Provide friendly input names so prompts and samples are clear (e.g., Customer name, Customer number).

4. Teach the agent how to use the tools (simple examples)
    - In the agent’s authoring or examples area add two short examples:
      - Example 1 (List companies): "Show me the available companies."
         - Expected tool use: call List companies; present a short, formatted list (name — id).
      - Example 2 (Create customer): "Create a new customer named Contoso Tests with number CNT-001 and email test@contoso.com."
         - Expected tool use: call Create record with mapped fields; on success return confirmation and created customer id.

5. Test the agent
    1. Use the Try pane (or Preview) in Copilot Studio.
    2. Run: "List companies" — verify the agent calls the connector and shows company names/ids.
    3. Run: "Create a customer named 'Contoso Test' with number CT-100" — verify connector call, then check Business Central to confirm the new record.

6. Save, publish, and deploy
    - Save your agent, publish a version, and add target channels (Teams, Power Pages, etc.) as needed.
    - Verify authentication and environment selection for the published agent.

7. Notes and tips
    - Permissions: The connection uses the signed-in account’s Business Central permissions; ensure the account can read companies and create customers.
    - Validation: Use server-side validation rules in Business Central (pricing/validation) — the connector will surface errors; handle those in agent responses.
    - Inputs: Validate and sanitize user input before calling Create record (e.g., ensure required fields are present).
    - Logging: Use the agent’s execution logs to troubleshoot tool calls and to see request/response payloads.

This simple pattern — one read action and one write action — is a good base. Extend it by adding more connector actions (Get record, Update record, List records) and by refining the agent’s examples and prompt-handling to cover more business scenarios.