---
title: Configure Business Central MCP Server
description: Learn how to configure the Business Central MCP server to enable AI agents to access and interact with your Business Central data and processes.
ms.topic: how-to
ms.date: 10/02/2026
author: jswymer
ms.author: jswymer
ms.reviewer: jswymer
ms.custom: 
ms.search.form: 8350_Primary, 8351_Primary, 8359, 
ms.collection:
  - bap-ai-copilot
ai-usage: ai-assisted
---

# Configure the Business Central MCP server

> **APPLIES TO:** Business Central online

The Business Central MCP Server enables AI clients to connect to your environments, so agents within those clients can perform a range of interactions and tasks. Customers and employees can conversationally engage with Business Central data and logic from various channels, like Microsoft Copilot, Teams, Visual Studio Code, and websites.

When you configure the MCP server, agents can perform tasks such as:

- **View records**: List customers, items, or other entities exposed through API pages and API queries.
- **Edit records**: Update customer information, item details, or other entity properties exposed through API pages.
- **Create records**: Add new customers, items, or other entities through API pages.
- **Delete records**: Remove entities through API pages when permissions allow.
- **Perform actions**: Execute OData actions attached to API pages or exposed by API codeunits, like posting documents or changing statuses.

The specific tasks available depend on your MCP Server configuration and the permissions you define for each API object.

This article explains how to enable and configure the Business Central MCP server in your Business Central environment so AI clients can connect to the environment's APIs and use them in their agents.

## Configuration overview

The built-in default configuration has dynamic tool mode and read-only object discovery turned on. This configuration lets agents discover and read eligible Business Central API pages and API queries that the signed-in user has permission to use. This behavior means that without any extra setup in Business Central, agent makers can immediately create agents that read the data exposed by these APIs. Administrators can designate another active configuration as the default.

If you want to enable agents to create, modify, or delete entities and data, or invoke API actions, you must configure these operations on the MCP server. Configuring the Business Central MCP server involves adding API objects in individual configurations and defining the allowed operations. The operations are available as *tools* in Copilot Studio. Learn more in [How API object entries map to MCP server tools](#how-api-object-entries-map-to-mcp-server-tools).

When you enable and configure the MCP server, agent makers can use the individual configurations in Copilot Studio. Learn more in [Create agents with Copilot Studio](create-agent-in-copilot-studio.md).

## Prerequisites

- You have at least the **MCP - Admin** permission set or equivalent permissions.

## Create MCP server configurations

1. Search for and open the [Model Context Protocol (MCP) Server Configurations](https://businesscentral.dynamics.com/?page=8350) page in Business Central.
1. Select **New**.
1. Set these general fields:  

   |Field|Description|
   |-|-|
   |Name|Specifies the configuration's name. This name appears in Copilot Studio to assign the configuration to MCP server connection for an agent.|
   |Description|Specifies a brief description of the configuration.|
   |Active|Specifies whether the configuration and its tools are available for agents to use. Leave this switch off while you configure the server. An active configuration is read-only, so its settings aren't editable until you deactivate it.|
   |Unblock Edit Tools|Specifies whether APIs included as tools in the configuration can perform create, update, delete, or action operations. When this switch is turned on, the `Allow Create`, `Allow Modify`, `Allow Delete`, and `Allow Actions` permissions control these operations.|

1. In the **Server Features** section, enable the features your configuration needs.

   The following table describes each feature:

   |Feature|Description|Setup|
   |-|-|-|
   |**API Tools**|Exposes the list of API pages and API queries your agents can access. Admins curate which API objects are available to agents.<br><br>**Dynamic Tool Mode requires this feature to be enabled first.**|Select **Activate** to turn on the feature. Then configure which API objects agents can reach. See [Configure available APIs](#configure-available-apis).|
   |**Dynamic Tool Mode**|Agents discover tools dynamically instead of requiring manual tool configuration. Useful when you have many API objects and need to work around client tool limits (like Copilot Studio's 70-tool limit).|Select **Activate** to turn on. Select **Configure** to set whether agents can discover read-only objects beyond those explicitly added. See [Configure dynamic tool mode](#configure-dynamic-tool-mode).|
   |**Data Query Tools (Preview)**|Enables agents to run queries directly against your Business Central database. This feature is currently in preview.|Select **Activate** to turn on. No additional configuration needed.|

   > [!NOTE]
   > Disabling API Tools automatically turns off Dynamic Tool Mode because Dynamic Tool Mode depends on API Tools. When you disable API Tools, any **Discover Read-Only Objects** setting is also cleared.

1. In the **Available APIs** section, add API objects as tools to the configuration.

   To add an API object, set the **Object Type**, **Object ID**, and **API Version** fields, and then select the permissions as described in the following table. To automatically add standard Business Central API pages and API queries as tools, select **Add All Standard APIs**.

   > [!NOTE]
   > API pages of subtype `ListPart` and `CardPart` aren't currently supported as MCP tools. Only top-level API pages can be added to MCP server configurations.

   |Permission|Description|
   |-|-|
   |Allow Read|Specifies whether read operations are allowed for this tool.|
   |Allow Create|Specifies whether create operations are allowed for this tool.|
   |Allow Modify|Specifies whether modify operations are allowed for this tool.|
   |Allow Delete|Specifies whether delete operations are allowed for this tool.|
   |Allow Actions|Specifies whether actions are allowed for this tool. For API pages, this permission controls bound actions. For API codeunits, it controls whether the codeunit action can be invoked.|

1. After you finish configuring the server features and API tools, turn on **Active**. After activation, the configuration is read-only. To change its settings later, first turn off **Active**.

### Manage the default configuration

The built-in default configuration has a blank name and is used when the MCP connection doesn't specify `ConfigurationName`. You can designate a named active configuration as the default instead.

1. Search for and open the [Model Context Protocol (MCP) Server Configurations](https://businesscentral.dynamics.com/?page=8350) page in Business Central.
1. Select the active configuration that you want to use by default.
1. Select **Set as Default**.

To go back to the built-in default configuration, select the designated default configuration, and then select **Clear Default**. A configuration that's currently designated as the default can't be deactivated until you clear the default setting or choose another default configuration.

## Configure available APIs

After you enable **API Tools**, you can curate which API pages and API queries agents can access.

1. On the **Server Features** list, select the **API Tools** row.
1. Select **Configure**.
1. In the **Available APIs** section, select **Select APIs**.
1. In the **Select APIs** dialog, search for or browse API objects.
1. Select the objects you want to add, and then select **OK**.
1. For each API object, set the allowed operations by selecting the checkboxes:

   |Permission|Description|
   |-|-|
   |Allow Read|Specifies whether read operations are allowed.|
   |Allow Create|Specifies whether create operations are allowed.|
   |Allow Modify|Specifies whether modify operations are allowed.|
   |Allow Delete|Specifies whether delete operations are allowed.|
   |Allow Actions|Specifies whether actions are allowed. For API pages, this permission controls bound actions. For API codeunits, it controls whether the codeunit action can be invoked.|

Business Central enables only the permissions that apply to the selected API object type. API queries support read operations only. API pages can support read, create, modify, delete, and action operations, depending on the API object's capabilities.

Alternatively, select **Add All Standard APIs** to automatically add standard Business Central API v2.0 pages and queries, or select **Add APIs by API Group** to add published API objects from a specific API group.

When multiple published API versions are available for the same object, use the **API Version** field to choose the version that the MCP tool uses.

> [!NOTE]
> API pages of subtype `ListPart` and `CardPart` aren't currently supported as MCP tools. Only top-level API pages can be added to MCP server configurations.

## Configure dynamic tool mode

By using dynamic tool mode, agents can discover tools dynamically without requiring you to manually add each tool to your configuration. This feature is especially useful when you have many API objects and need to overcome client limits on the number of tools per agent.

**Prerequisite:** API Tools must be enabled before you can enable dynamic tool mode.

> [!NOTE]
> When API Tools are enabled and an MCP connection doesn't include the `Company` header, Business Central uses dynamic tool mode for API tools even if **Dynamic Tool Mode** isn't activated in the configuration. The MCP host can use `list_companies` to discover available companies, and operational tool calls must include the `company` parameter.

1. On the **Server Features** list, select the **Dynamic Tool Mode** row.
1. Select **Configure**.
1. Set **Discover Read-Only Objects** to control agent access:
   - **Off** (default): Agents can only access the API objects you explicitly added in the **Available APIs** section.
   - **On**: Agents have read-only access to eligible API pages and API queries in your environment, even if you didn't add them as tools. The user must have permission to execute the API object and read its source table data.
1. Select **OK**.

> [!NOTE]
> If you disable API Tools, dynamic tool mode is automatically turned off and the **Discover Read-Only Objects** setting is cleared.

## Configure data query tools (preview)

By using data query tools, agents can run queries directly against your Business Central database. This feature is currently in preview and subject to change.

1. On the **Server Features** list, find the **Data Query Tools (Preview)** row.
1. Select **Activate**.

When you enable this feature, agents who use your MCP server configuration have access to data query tools they can use in their workflows. Data query tools are read-only and don't allow agents to create, modify, or delete data.

The following data query tools are available:

|Tool|Purpose|
|-|-|
|`bc_data_find_tables`|Finds Business Central tables by keyword or semantic search. Use the `searchText`, `searchMode`, and optional `top` parameters.|
|`bc_data_get_table_schema`|Returns fields for a table. Use this tool before writing a query because fields can vary by environment and installed extensions.|
|`bc_data_get_table_relations`|Returns outgoing or incoming table relations. Use this tool to discover join paths for multi-table queries.|
|`bc_data_query`|Compiles and validates an AL query. Set `returnData` to `true` to run the validated query and return rows. Use `top`, `skip`, and `resultFormat` for paging and large results.|

## Validate a configuration

Use **Validate** before activating or sharing a configuration. Validation checks for common issues, such as API objects that no longer exist, missing parent API pages, and API page entries where **Allow Modify** is enabled but **Allow Read** is disabled.

1. Search for and open the [Model Context Protocol (MCP) Server Configurations](https://businesscentral.dynamics.com/?page=8350) page in Business Central.
1. Open the configuration.
1. Select **Validate**.
1. If warnings appear, review **Warning Message** and **Recommended Action**.
1. To apply a suggested fix, select the warning, and then select **Apply Recommended Action**.

### Example 1

This simplified configuration allows agents to:

- Read, modify, create, and delete items
- Read and modify customers

**Server Features**

| Feature | Status |
|-|-|
| API Tools | Activated |
| Dynamic Tool Mode | Not activated |
| Data Query Tools (Preview) | Not activated |

**General Settings**

Unblock Edit Tools: ON

**Available APIs**

| Object ID | Name | Type | Allow Read | Allow Create | Allow Modify | Allow Delete |
|-|-|-|-|-|-|-|
| 30008 | APIV2 - Items | Page | ✓ | ✓ | ✓ | ✓ |
| 30009 | APIV2 - Customers | Page | ✓ | ✓ | ✓ | |

### Example 2

This simplified configuration allows agents to:

- Read, modify, create, and delete items
- Read and modify customers
- Read other eligible API pages and API queries

**Server Features**

| Feature | Status |
|-|-|
| API Tools | Activated |
| Dynamic Tool Mode | Activated (**Discover Read-Only Objects**: On) |
| Data Query Tools (Preview) | Not activated |

**General Settings**

Unblock Edit Tools: ON

**Available APIs**

| Object ID | Name | Type | Allow Read | Allow Create | Allow Modify | Allow Delete |
|-|-|-|-|-|-|-|
| 30008 | APIV2 - Items | Page | ✓ | ✓ | ✓ | ✓ |
| 30009 | APIV2 - Customers | Page | ✓ | ✓ | ✓ | |

## Export and import MCP server configurations

You can export MCP server configurations as JSON files, which makes it easier to share configurations with other users and across different environments. You can export existing configurations, modify them, and import them as new configurations. Alternatively, you can create new configurations from scratch in JSON format and import them.

### Export a configuration

To export an existing MCP server configuration:

1. Search for and open the [Model Context Protocol (MCP) Server Configurations](https://businesscentral.dynamics.com/?page=8350) page in Business Central.
1. Select the configuration you want to export from the list.
1. On the **Model Context Protocol (MCP) Server Configuration** page, select **Advanced** > **Export**.

The configuration downloads as a JSON file to your device. You can edit this file in any text editor to modify settings or share it with other users.

### Import a configuration

To import an MCP server configuration from a JSON file:

1. Search for and open the [Model Context Protocol (MCP) Server Configurations](https://businesscentral.dynamics.com/?page=8350) page in Business Central.
1. Select **Advanced** > **Import**.
1. Browse to and select the JSON configuration file you want to import.

The configuration imports as a new entry and appears in the list of available configurations. You can activate it and make any additional adjustments as needed.

## Get the MCP server configuration connection string

Each MCP server configuration has a connection string, which is a JSON definition that includes information for AI clients to connect to your Business Central environment. You can use the connection string to set up the MCP configuration in various clients, such as Visual Studio Code, to enable natural-language access to your Business Central data and processes.

To get your MCP server configuration connection string:

1. Search for and open the [Model Context Protocol (MCP) Server Configurations](https://businesscentral.dynamics.com/?page=8350) page in Business Central.
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
   - `TenantId`: The Microsoft Entra tenant ID used by the Business Central environment. Required unless the MCP host supports omitting it.
   - `EnvironmentName`: The Business Central environment name. Required unless the MCP host supports omitting it.
   - `Company`: The company name in Business Central. Required unless the MCP host supports omitting it.
   - `ConfigurationName`: The optional name of your MCP configuration

1. Copy the text or select **Download** to save it in a text (.txt) file on your device.

## Choose how the tenant, environment, and company are specified

Whether you can omit `TenantId`, `EnvironmentName`, or `Company` depends on the MCP host. Visual Studio Code with GitHub Copilot supports omitting all three headers. GitHub Copilot CLI supports omitting `TenantId` and `Company`. Copilot Studio doesn't require `TenantId`, but it requires `EnvironmentName` and `Company`. For other MCP hosts, check the host's support for determining the tenant from the signed-in identity and selecting environment and company values at runtime. `ConfigurationName` is optional for all hosts.

When you omit `TenantId`, the server determines the tenant from the signed-in identity. Including `EnvironmentName` or `Company` pins that value for the connection. When a supported host omits `Company`, the server uses dynamic tool mode for API tools, requires a `company` parameter with each operational tool call, and exposes `list_companies`. When a host supports omitting `EnvironmentName`, the server requires an `environmentName` parameter on tool calls and can expose `list_environments`.

For details about detecting required parameters in non-Microsoft clients, see [Check available configurations and tool parameters](use-mcp-server-non-microsoft.md#check-available-configurations-and-tool-parameters).

## How API object entries map to MCP server tools

When you add an API object entry to an MCP server configuration, each allowed operation (read, create, modify, delete, or action) results in a corresponding tool in the MCP server. You can add these tools to agents in clients like Copilot Studio.

Depending on the **Dynamic Tool Mode** setting, agent makers explicitly add these tools during design or the agent dynamically adds these tools at runtime. The following sections explain how tools are named and made available in each mode.

### [Dynamic tool mode off](#tab/off)

When you turn off **Dynamic Tool Mode**, agent creators specifically apply individual tools to the agent during design. In Copilot Studio, the tool names follow this format:

|Business Central object permissions|Tool|
|-|-|
|Allow read|`List_<EntitySetName>_PAG<ID>` or `List_<EntitySetName>_QRY<ID>`|
|Allow create|`Create_<EntityName>_PAG<ID>`|
|Allow modify|`Modify_<EntityName>_PAG<ID>`|
|Allow delete|`Delete_<EntityName>_PAG<ID>`|
|Allow actions|`<ActionName>_<EntitySetName>_PAG<ID>` or `<ServiceName>_<ProcedureName>_COD<ID>`|

The MCP server builds tool names from API metadata, not from the object caption. Names use PascalCase with underscores between parts. Page tools use the `_PAG<ID>` suffix. Query list tools use the `_QRY<ID>` suffix. Codeunit API action tools can use the `_COD<ID>` suffix when codeunit APIs are available. Some page and query tools can also include an API entity group prefix.

For example, if you specify the following settings on the **MCP Server Configuration** page:

|Object type|Object ID|Object Name|Allow read|Allow create|Allow modify|Allow delete|
|-|-|-|-|-|-|-|
|Page|30009|APIV2 - Customer|✓|✓|✓|✓|

The following tools are available in the server:

- `List_Customers_PAG30009`
- `Create_Customer_PAG30009`
- `Modify_Customer_PAG30009`
- `Delete_Customer_PAG30009`

These tools appear in the MCP server and you can add them to agents in Copilot Studio. By using these tools, agents can perform the permitted operations on the specified API page objects.

### [Dynamic tool mode on](#tab/on)

When **Dynamic Tool Mode** is on, agent makers in Copilot Studio can't select tools, but the system dynamically applies tools at runtime as needed.

In this mode, the agent uses these standard tools to search for and execute the needed tools from the configuration: `bc_actions_search`, `bc_actions_describe`, `bc_actions_invoke`.

> [!NOTE]
> These system tools use a different naming convention (lowercase with underscores) because the MCP server provides them, not generated from object metadata like the other tools listed in the other tab.

---

## Next steps

- [Create agents with Copilot Studio](create-agent-in-copilot-studio.md)
- [Connect to MCP server with Visual Studio Code](use-mcp-server-in-vscode.md)
- [Connect to MCP server with non-Microsoft clients](use-mcp-server-non-microsoft.md)

## Related information

[Transparency note: Semantic Metadata Search in Business Central](transparency-note-semantic-metadata-search.md)  
[Business Central API Reference](/dynamics365/business-central/dev-itpro/api-reference/v2.0/)  
[API developer overview](../developer/devenv-api.md)  
