---
title: Configure Business Central MCP Server
description: Learn how to configure the Business Central MCP Server to enable AI agents to access and interact with your Business Central data and processes.
ms.topic: how-to
ms.date: 03/30/2026
author: jswymer
ms.author: jswymer
ms.reviewer: jswymer
ms.custom: 
ms.search.form: 8350_Primary, 8351_Primary, 8359, 
ms.collection:
  - bap-ai-copilot
---

# Configure Business Central MCP Server

> **APPLIES TO:** Business Central online

The Business Central MCP Server enables AI clients to connect to your environments, allowing agents within those clients to perform a range of interactions and tasks. Customers and employees can conversationally engage with Business Central data and logic from various channels, like Microsoft 365 Copilot, Teams, Visual Studio Code, and websites.

With the MCP Server configured, agents can perform tasks such as:

- **View records**: List all customers, items, or other entities exposed through API pages
- **Edit records**: Update customer information, item details, or other entity properties
- **Create records**: Add new customers, items, or other entities to Business Central
- **Delete records**: Remove entities from Business Central when permissions allow
- **Perform bound actions**: Execute OData actions attached to records, like posting documents or changing statuses

The specific tasks available depend on your MCP Server configuration and the permissions you define for each API page object.

This article explains how to enable and configure the Business Central MCP Server in your Business Central environment so AI clients can connect to the environment's APIs and use them in their agents.

## Configuration overview

By default, the MCP Server gives agents read-only access to all exposed Business Central API pages. This behavior means that without any extra setup in Business Central, agent makers can immediately create agents that read the data exposed by these APIs.

On the other hand, if you want to enable agents to create, modify, or delete entities and data, you must configure these operations on the MCP Server. Configuring the Business Central MCP server involves adding API page objects in individual configurations and defining the allowed operations. The operations are available as *tools* in Copilot Studio. Learn more in [How API page object entries map to MCP server tools](#how-api-page-object-entries-map-to-mcp-server-tools).

Once the MCP server is enabled and configured, the individual configurations become available in Copilot Studio for agent makers to use in their agents. Learn more in [Create agents with Copilot Studio](create-agent-in-copilot-studio.md).

## Prerequisites

- You have at least the **MCP - ADMIN** permission set or equivalent permissions.

## Create MCP Server configurations

1. Search for and open the [Model Context Protocol (MCP) Server Configurations](https://businesscentral.dynamics.com/?page=8351) page in Business Central.
1. Select **New**.
1. Set these general fields:  

   |Field|Description|
   |-|-|
   |Name|Specifies the configuration's name. This name appears in Copilot Studio to assign the configuration to MCP Server connection for an agent.|
   |Description|Specifies a brief description of the configuration.|
   |Active|Specifies whether the configuration is active. When this switch is on, the configuration and its tools are available for agents to use. If you turn off the switch, agents that currently use the configuration don't work as expected.|
   |Dynamic Tool Mode|Specifies whether to enable dynamic tool mode for the MCP configuration. When this switch is on, agents search for tools within the configuration dynamically, which means the tools don't have to be explicitly added to agent configuration.<br><br>This option is useful when you expose a large number of API pages because some clients, like Copilot Studio, limit the number of tools on an agent. Tools in excess of the limit aren't available to the agent. <br><br>For example, Copilot Studio currently has a limit of 70 tools. If you add all standard APIs as tools in the configuration, only the first 70 are available to agents you build in Copilot Studio. To make all the standard APIs available, turn on the switch.|
   |Discover Additional Objects|Specifies whether agents can access API page objects that aren't explicitly defined in the configuration. When this switch is on, agents have read-only access to all API page objects in the environment, even if they aren't added as tools in the configuration. This setting only works when **Dynamic Tool Mode** is turned on.|
   |Unblock Edit Tools|Specifies whether APIs included as tools in the configuration can perform create, update, or delete operations. When this switch is turned on, the `Allow Create`, `Allow Modify`, `Allow Delete`, and `Allow Bound Actions` permissions control write operations. When turned off, all these permissions are set to `false` making the tools read-only.|

1. In the **Available Tools** section, add API page objects as tools to the configuration.

   To add a page, set the **Object ID** field and then select the permissions as described in the table. To automatically add all Business Central API pages as tools, select **Add All Standard APIs as Tools**.

   > [!NOTE]
   > API pages of subtype `ListPart` and `CardPart` aren't currently supported as MCP tools. Only top-level API pages can be added to MCP Server configurations.

   |Permission|Description|
   |-|-|
   |Allow Read|Specifies whether read operations are allowed for this tool.|
   |Allow Create|Specifies whether create operations are allowed for this tool.|
   |Allow Modify|Specifies whether modify operations are allowed for this tool.|
   |Allow Delete|Specifies whether delete operations are allowed for this tool.|
   |Allow Bound Actions|Specifies whether bound actions are allowed for this tool. A bound action is an OData action that is bound to a resource, like a table or record.|

### Example 1

This simplified configuration allows agents to:

- Read, modify, create, and delete items
- Read and modify customers

**General**

Dynamic Tool Mode: OFF

Discover Additional Objects: OFF

Unblock Edit Tools: ON

**Available Items**

|Object ID|ObjectName |Allow read  |Allow modify  |Allow create |Allow delete|
|-|-|-|-|-|-|
|30008|APIV2 - Items|✓|✓|✓|✓|
|30009|APIV2 - Customers|✓|✓|||

### Example 2

This simplified configuration allows agents to:

- Read, modify, create, and delete items
- Read and modify customers
- Read all other API pages

**General**

Dynamic Tool Mode: ON

Discover Additional Objects: ON

Unblock Edit Tools: ON

**Available Items**

|Object ID|ObjectName |Allow read  |Allow modify  |Allow create |Allow delete|
|-|-|-|-|-|-|
|30008|APIV2 - Items|✓|✓|✓|✓|
|30009|APIV2 - Customers|✓|✓|||

## Export and import MCP Server configurations

You can export MCP Server configurations as JSON files, which makes it easier to share configurations with other users and across different environments. You can export existing configurations, modify them, and import them as new configurations. Alternatively, you can create new configurations from scratch in JSON format and import them.

### Export a configuration

To export an existing MCP Server configuration:

1. Search for and open the [Model Context Protocol (MCP) Server Configurations](https://businesscentral.dynamics.com/?page=8351) page in Business Central.
1. Select the configuration you want to export from the list.
1. On the **Model Context Protocol (MCP) Server Configuration** page, select **Advanced** > **Export**.

The configuration is downloaded as a JSON file to your device. You can then edit this file in any text editor to modify settings or share it with other users.

### Import a configuration

To import an MCP Server configuration from a JSON file:

1. Search for and open the [Model Context Protocol (MCP) Server Configurations](https://businesscentral.dynamics.com/?page=8351) page in Business Central.
1. Select **Advanced** > **Import**.
1. Browse to and select the JSON configuration file you want to import.

The configuration is imported as a new entry and appears in the list of available configurations. You can then activate it and make any additional adjustments as needed.

## How API page object entries map to MCP server tools

When you add an API page object entry to an MCP Server Configuration, each allowed operation (read, create, modify, update, delete, or bound action) results in a corresponding tool in the MCP server. These tools can then be added to agents in clients like Copilot Studio.

Depending on the **Dynamic Tool Mode** setting, these tools are added explicitly by agent makers during design or dynamically by the agent at runtime. The following sections explain how tools are named and made available in each mode.

### [Dynamic Tool Mode off](#tab/off)

If the **Dynamic Tool Mode** is turned off, then agent makers specifically apply the individual tools to the agent during design. In Copilot Studio, the tool names follow this format:

|Business Central object permissions|Tool|
|-|-|
|Allow read|`List<object_name>_PAG<ID>`|
|Allow create|`Create<object_name>_PAG<ID>`|
|Allow modify|`ListUpdate<object_name>_PAG<ID>`|
|Allow delete|`Delete<object_name>_PAG<ID>`|
|Allow bound actions|`<bound_action_name>_PAG<ID>`|

For example, if you specify the following on the **MCP Server Configuration** page:

|Object type|Object ID|Object Name|Allow read|Allow create|Allow modify|Allow delete|
|-|-|-|-|-|-|-|
|Page|30009|APIV2 - Customer|✓|✓|✓|✓|

The following tools are made available in the server:

- `ListAPIV2 - Customer_PAG30009`
- `CreateAPIV2 - Customer_PAG30009`
- `ListUpdateAPIV2 - Customer_PAG30009`
- `DeleteAPIV2 - Customer_PAG30009`

These tools appear in the MCP server and can be added to agents in Copilot Studio, allowing agents to perform the permitted operations on the specified API page objects.

### [Dynamic Tool Mode on](#tab/on)

If the **Dynamic Tool Mode** is turned on, then the tools aren't available for selection to agent makers in Copilot Studio but are applied dynamically at runtime as needed.

In this case, the agent uses these standard tools to search for and execute the needed tools from the configuration: `bc_actions_search`, `bc_actions_describe`, `bc_actions_invoke`.

> [!NOTE]
> These system tools use a different naming convention (lowercase with underscores) because they're provided by the MCP server, not generated from object metadata like the other tools listed in the other tab.

---

## Get the MCP server configuration connection string

Each MCP server configuration has a connection string, which is a JSON definition that includes information for AI clients to connect to your Business Central environment. You can use the connection string to set up the MCP configuration in various clients, such as Visual Studio Code, to enable natural-language access to your Business Central data and processes.

To get your MCP server configuration connection string:

1. Search for and open the [Model Context Protocol (MCP) Server Configurations](https://businesscentral.dynamics.com/?page=8351) page in Business Central.
1. Open the configuration from the list.
1. On the **Model Context Protocol (MCP) Server Configuration** page, select **Advanced** > **Connection String**.

   The **Connection String** dialog displays the connection string similar to:

   ```json
   "businesscentral": {
      "url": "https://mcp.businesscentral.dynamics.com",
      "type": "http",
      "headers": {
      "TenantId": "aaaabbbb-0000-cccc-1111-dddd2222eeee",
      "EnvironmentName": "Production",
      "Company": "CRONUS USA, Inc.",
      "ConfigurationName": "MyMCPConfig"
      }
   }
   ```

   - `url`: The MCP server endpoint. This value is the same for all Business Central MCP configurations.
   - `type`: The connection protocol type. This value is the same for all Business Central MCP configurations.
   - `TenantId`: The Microsoft Entra tenant ID used by the Business Central environment
   - `EnvironmentName`: The Business Central environment name
   - `Company`: The company name in Business Central
   - `ConfigurationName`: The name for your MCP configuration

1. Copy the text or select **Download** to save it in a text (.txt) file on your device.

## Next steps

- [Create agents with Copilot Studio](create-agent-in-copilot-studio.md)
- [Connect to MCP Server with Visual Studio Code](use-mcp-server-in-vscode.md)
- [Connect to MCP server with non-Microsoft clients](use-mcp-server-non-microsoft.md)

## Related information

[Transparency note: Semantic Metadata Search in Business Central](transparency-note-semantic-metadata-search.md)  