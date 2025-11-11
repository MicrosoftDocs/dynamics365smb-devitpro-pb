---
title: Create Agents with Copilot Studio
description: Learn how to create conversational agents with Copilot Studio that integrate with Business Central data and automate business processes through natural language interactions.
author: jswymer
ms.author: jswymer
ms.reviewer: jswymer
ms.topic: how-to
ms.collection: 
ms.date: 10/30/2025
ms.custom: bap-template
---
# Create agents in Copilot Studio that connect to Business Central

This article explains how to build, configure, and publish agents in Copilot Studio that integrate with Business Central using either the Business Central Connector or the Business Central MCP Server.

## Overview

Copilot Studio is a graphical, low-code tool for building agents and agent flows. You can use it to create conversational agents that understand and act on your business processes and data model in Business Central. Agents present Business Central data (customers, orders, invoices, and inventory) and business logic to users via natural language. Agents can automate tasks such as creating sales orders, checking credit, or posting payments, and trigger approvals or flows.

Business Central provides two model‑aware tools that agents can use to interact directly with Business Central environments: Business Central MCP (Model Context Protocol) server and Business Central Connector for Power Platform. These tools let agents read and write records, call custom APIs exposed by AL extensions, and apply server‑side business logic such as pricing, discounts, and validation rules.

[![Shows how agents work between Business Central and Coplito Studio](../developer/media/integrate-copilot-studio.svg)](../developer/media/integrate-copilot-studio.svg#lightbox)

After you create an agent, you can publish agents into multiple platforms or channels, like live websites and Microsoft 365 Copilot, or messaging platforms like Teams and Facebook.

Learn more about Copilot Studio and agents in [Copilot Studio](/microsoft-copilot-studio/fundamentals-what-is-copilot-studio).

### Connection options

You can build agents that connect to Business Central using the **Business Central Connector for Power Platform** or the **Business Central MCP (Model Context Protocol) server**. You can also use both options together:

**Business Central Connector:** This connector is part of the Power Platform framework. It provides a simplified, low-code interface for accessing Business Central entities such as customers, vendors, items, and invoices. It's ideal for scenarios where:

- The agent needs to perform simple CRUD (create, read, update, delete) operations using predefined actions while acting as the user (respecting their Business Central permissions).
- You want low-code integration through Power Automate.

The connector abstracts away many of the API details, making it easier to use but less flexible for advanced scenarios.

**Business Central MCP Server:** This implementation uses the Model Context Protocol (MCP) to provide access to Business Central through standard and custom API pages. It's ideal for scenarios where:

- The agent must coordinate multiple AI-driven steps&mdash;such as retrieving data, analyzing it, and performing actions&mdash;into one seamless, automated workflow (AI orchestration).
- Scenarios where performance, scalability, or security policies require direct API management.

Agents using the MCP server typically invoke HTTP operations (GET, POST, PATCH, DELETE) against Business Central endpoints, allowing for full customization and extensibility.

**Choosing the connector and MCP Server:** Your choice depends on the agent’s requirements, the level of customization needed, and your familiarity with Business Central APIs. In short:

- Connector: For standard integration and automation
- MCP server: For AI agents only

**Using both**: In some cases, you might use both the connector and MCP Server in a Copilot Studio agent. For example, using both is helpful when the API you need to connect to has a cryptic description that the AI via MCP can't interpret. Adding that API as a tool manually with the connector allows you to edit descriptions and provide AI-friendly context.

## Prerequisites

- You have a Copilot Studio user license with available Copilot Credits capacity for use. Learn more in [Copilot Studio licensing](/microsoft-copilot-studio/billing-licensing).
- To connect the agent to the Business Central MCP Server, it must be enabled in the Business Central environment.

  As long as the Business Central MCP Server is enabled, the agent can read data in Business Central through the default read-only permissions on all exposed API pages. If you want the agent to create, update, or delete entities and data, the MCP server must be configured to allow these operations on API pages. Learn more in [Configure Business Central MCP Server](configure-mcp-server.md).

  You use these configurations when you set up the agent to connect to Business Central by specifying the appropriate MCP Server configuration during the agent setup process.

## Create agents that use Business Central connector

You can use the Business Central connector actions, like `Create Record` or `List Companies`, in your agent by adding them as *tools*. Tools are the building blocks that enable your agent to interact with external systems, in this case, Business Central. For example, if you want to create an agent that allows you list, create, and update items in Business Central, add the `Find Records`, `Create Record`, and `Update Record`actions as tools to the agent.

Learn more about the connector and its actions in [Dynamics 365 Business Central Connector](/connectors/dynamicssmbsaas/).

### Exercise: Build an agent to find and create customers

Follow the steps in this exercise to create an agent that uses the Dynamics 365 Business Central connector. The agent lets users get information about customers in Business Central and create new ones by providing instructions in plain language. The agent uses one read action `Find records (V3)` and one write action `Create record (V3)` of the Business Central connector. You can extend it by adding more connector actions (like `Update record (V3)`, `Delete record (V3)`) and refining the prompt-handling to cover more business scenarios.  

1. Create new or open existing agent.

   1. Sign in to [Copilot Studio](https://copilotstudio.microsoft.com/).
   1. In the left-side navigation pane, select **Agents**.
   1. Select the agent you want to modify or select **New agent** to create a new agent.

   Learn more about creating agents in [Create an agent in Copilot Studio](/microsoft-copilot-studio/authoring-first-bot?tabs=web#create-an-agent).

1. Add the Business Central connector actions as tools.

   1. On the **Tools** tab of the agent page, select **+ Add a tool**.
   1. Under the **Search for tool** box, choose **Connector**, then search for "Dynamics 365 Business Central".
   1. Select the connector action `Find records (V3)`. The **Add tool** page opens.
   1. If the **Connection** box displays the `Not connected`, select the box, select **Create new connection** and sign in to Business Central with a valid account.
   1. Select **Add to agent**. You return to the agent **Overview** tab.
   1. Repeat to add the connector action `Create record (V3)`. This agent uses this action to create a Customer record.

   Learn more in [Use connectors in Copilot Studio](/microsoft-copilot-studio/advanced-connector).

1. Configure the tools.

   1. On the **Tools** tab of the agent page, select the `Find records (V3)` to open the tool for editing.
   1. Go to **Inputs** and configure the required input values: 

      |Input name|Fill using|Value|
      |-|-|-|
      |Envronment|Custom value|Set to Business Central environment, for example, `PRODUCTION`|
      |Company|Custom value|Set to Business Central environment, for example, `CRONUS USA, Inc.`|
      |API category|Custom value|`V2.0`|
      |Table name|Custom value|`customers`|

   1. Select **Save**.
   1. Repeat for the `Create record (V3)` tool.

   Learn more in [Make changes to your tools configuration](/microsoft-copilot-studio/advanced-plugin-actions#view-and-make-changes-to-your-tool-configuration).

1. Test the agent.

    1. Select **Test** in the upper-right corner of any page to open the **Test your agent** pane.
    1. In the field at the bottom, enter text that explains what you want the agent to do, for example:

       - `List customers`
       - `Show my top customer`
       - `Create a customer named jesse homer with email jesse.homer@contoso.com`
    1. Wait for the response.
    1. Make necessary changes and save.
  
    Learn more in [Test you agent](/microsoft-copilot-studio/authoring-test-bot).

1. Publish and deploy the agent.

   Learn more in [Publish agents](/microsoft-copilot-studio/publication-fundamentals-publish-channels).

### Tips and best practices when using connector

- **Permissions:** The connection uses the signed-in account’s Business Central permissions; ensure the account can read companies and create customers.
- **Validation:** Use server-side validation rules in Business Central (pricing/validation). The connector surfaces errors; handle these errors in agent responses.
- **Inputs:** Validate and sanitize user input before calling Create record (that is, ensure required fields are present).
- **Logging:** Use the agent's execution logs to troubleshoot tool calls and to see request/response payloads.

## Create agents that connect to Business Central MCP Server

[!INCLUDE [preview-section](~/../shared-content/shared/preview-includes/preview-banner-section.md)]

[!INCLUDE [preview-note](~/../shared-content/shared/preview-includes/production-ready-preview-dynamics365.md)]

Follow these steps to create an agent that connects to the Business MCP server.

1. Create new or open existing agent.

   1. Sign in to [Copilot Studio](https://copilotstudio.microsoft.com/).
   1. In the left-side navigation pane, select **Agents**.
   1. Select the agent you want to modify or select **New agent** to create a new agent.

   Learn more about creating agents in [Create an agent in Copilot Studio](/microsoft-copilot-studio/authoring-first-bot?tabs=web#create-an-agent).

1. Connect the agent to the Business Central MCP server.

   1. On the **Tools** tab of the agent page, select **+ Add a tool**.
   1. Search for and select **Dynamics 365 Business Central MCP Server (Preview)**.
   1. If the **Connection** box displays the `Not connected`, select the box, select **Create new connection** and sign in to Business Central with a valid account.
   1. Select **Add and configure** to return to the **Tools** tab. If you select **Add agent**, you configure it later by opening the **Tools** tab.
   1. In **Inputs** section of the **Tools** tab, configure the MCP server to connect Business Central by setting the following fields.

      |Field|Value|
      |-|-|
      |Environment|The Business Central environment that the agent connects to. Select the down arrow and select the environment when it appears.|
      |Company|The company in Business Central that the agent connects to. Select the down arrow and select the company when it appears.|
      |MCP Server Configuration (optional)|The MCP configuration defined in Business Central that the agent uses. An MCP configuration specifies the APIs the agent can access and its permissions (create, read, update, or delete). Learn more about MCP Server configurations in [Configure Business Central MCP Server](configure-mcp-server.md).<br><br>You can leave this field blank, in which case, the agent has read-only access to all exposed API pages in the Business Central environment. |

   1. Go to the **Tools** section to view the individual tools (APIs) available to the agent, based on the **MCP Server Configuration** field. Select the refresh icon :::image type="icon" source="../developer/media/refresh-icon-copilot-studio.png"::: in the list header to make sure the view is up-to-date.

      - If you didn't specify a configuration: the list shows only the standard server actions `bc_actions_search`, `bc_actions_describe`, and `bc_actions_invoke`. Read-only tools are available to the agent for all API pages in Business Central but they're discovered dynamically and therefore not listed.|
      - If you specified a configuration that uses dynamic tool mode: the list shows the standard actions (`bc_actions_search`, `bc_actions_describe`, `bc_actions_invoke`). Tools for API pages defined in the configuration are available to the agent at runtime but aren't listed.
      - If you specified a configuration that doesn't use dynamic tool mode: the list includes tools for API pages included in the configuration, so you can review and manage them individually.

      Learn more about tools and dynamics tool mode in [Create MCP Server configurations](configure-mcp-server.md#create-mcp-server-configurations) and [How API object entries in Business Central map to MCP server tools](configure-mcp-server.md#how-api-page-object-entries-map-to-mcp-server-tools).
1. Select **Save**.
1. Test the agent.
   1. Select **Test** in the upper-right corner of any page to open the **Test your agent** pane.
   1. In the field at the bottom, enter text that explains what you want the agent to do.

   Learn more in [Test you agent](/microsoft-copilot-studio/authoring-test-bot).
1. Publish and deploy the agent.

   Learn more in [Publish agents](/microsoft-copilot-studio/publication-fundamentals-publish-channels).

### Tips and best practices when using MCP Server

- To improve results, try these options:

  - Use a version of GTP-5 as the model
  - Give the instructions to the agent.
  
    Instructions are the directions and parameters an agent follows. Agents depend on instructions to:

    - Decide what tool or knowledge to call to address a user query or autonomous trigger.
    - Fill inputs for any tool based on the available context.
    - Generate a response to the end user.

      To add instructions, go to the **Overview** tab on the agent page, and add instructions in the **Instructions** section. For example, try adding:

      ```
      You are a Business Central agent. The user will ask a question, or ask you to perform a task or retrieve data. Start by outlining a plan of what you have and what you must do and then use the available tools to retrieve the relevant information.
   
      Clearly show your reasoning, before trying to invoke any tool. 
   
      Additionally:
      Prefer using semantic search when searching for available actions.
      ```

    Learn more in [Write instructions](/microsoft-copilot-studio/authoring-instructions).

- To get a list of available API pages in a Business Central environment, open the Page Metadata virtual table (ID 2000000138) in the Business Central web client by using the following URL, customized for the environment the agent connects to:

  ```http
  https://businesscentral.dynamics.com/<tenant ID>/<environment name>?table=2000000138
  ```

## Related information

[Transparency note: Semantic Metadata Search in Business Central](transparency-note-semantic-metadata-search.md)  
