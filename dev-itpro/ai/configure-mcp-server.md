---
title: Build Business Central agents with Copilot Studio
description: Learn how to create agents that expose existing Business Central data and processes through Copilot Studio using either the Business Central MCP server or Business Central connector.
ms.topic: how-to
ms.date: 10/22/2025
author: jswymer
ms.author: jswymer
ms.reviewer: jswymer
ms.collection: 
ms.custom: 
---
# Configure Business Central MCP Server

Business Central provides an [Model Context Protocol (MCP)](https://modelcontextprotocol.io/docs/getting-started/intro) Server that enables AI agents to connect to your environments and perform a range of interactions and tasks. With agents, customers and employees to conversationally engage with Business Central data and logic from various channels, like Microsoft 365 Copilot, Teams, and websites.

The article explains how to enable and configure the Business Central MCP Server in your Business Central environment so agents can connect to the environment's APIs.

## Configuration overview

Configuring the Business Central MCP server involves exposing API page objects in individual configurations. Each configuration exposes one or more API pages as *tools*, which specify the object and permitted operations (create, read, update, and delete).

Once the MCP server is enabled and configured, the individual configurations become available in Copilot Studio for agent makers to use in their agents. Learn more in [Create agents with Copilot Studio](create-agent-in-copilot-studio.md).

## Prerequisites

- The **Feature: Enable MCP Server access** feature is enabled on the environment in the [Feature Management](https://businesscentral.dynamics.com/?page=2610) page. Learn more in [Enabling Upcoming Features Ahead of Time](/dynamics365/business-central/dev-itpro/administration/feature-management).

## Create MCP Server configurations

1. Search for and open the [Model Context Protocol (MCP) Server Configurations](https://businesscentral.dynamics.com/?page=8351) page in Business Central.
1. Select **New**.
1. Set these general fields:  

   |Field|Description|
   |-|-|
   |Name|Specifies the configuration's name. This name appears in Copilot Studio to assign the configuration to MCP Server connection for an agent.|
   |Description|Specifies a brief description of the configuration.|
   |Active|Specifies whether the configuration is active. When this switch is on, the configuration and its tools are available for agents to use. If you turn the switch off, agents that currently use the configuration won't work as expected.|
   |Dynamic Tool Mode|Specifies whether to enable dynamic tool mode for the MCP configuration. When this switch is on, agents search for tools within the configuration dynamically, which means the tools don't have to be explicitly added to agent configuration.<br><br>This option is useful when you expose a large number of API pages because some clients, like Copilot Studio, limit the number of tools on an agent. Tools in excess of the limit are not available to the agent. <br><br>For example, Copilot Studio currently has a limit of 70 tools. If you add all standard APIs as tools in the configuration, only the first 70 are available to agents you build in Copilot Studio. To make all the standard APIs available, turn the switch on.|
   |Discover Additional Objects|Specifies whether to allow discovery of read-only objects not defined in the configuration. When this switch is on, agents that use the configuration also have ready-only access to all the environment's API page objects in the environment that aren't included as tools in the configuration. This switch only applies when the **Dynamic Tool Mode** is on. |
   |Allow Create/Update/Delete Tools|Specifies whether APIs included as tools in the configuration can perform create, update, or delete operations. When this switch is turned off, agents that use this configuration can't perform create, update, and delete operations with tools even if the operations are enabled in the configuration.|

1. In the **Tools** section, add API page objects as tools to the configuration.

   You can add objects individually as separate entries. Select **Add All Standard APIs as Tools** to automatically add all Business Central API pages as tools.

   |Permission|Description|
   |-|-|
   |Allow Read|Specifies whether read operations are allowed for this tool.|
   |Allow Create|Specifies whether create operations are allowed for this tool.|
   |Allow Modify|Specifies whether modify operations are allowed for this tool.|
   |Allow Delete|Specifies whether delete operations are allowed for this tool.|
   |Allow Bound Actions|Specifies whether bound actions are allowed for this tool. A bound action is an OData action that is bound to a resource, like a table or record.|
   |Allow Delete|Specifies whether delete operations are allowed for this tool.|
   |Allow Bound Actions|Specifies whether bound actions are allowed for this tool. A bound action is an OData action that is bound to a resource, like a table or record |

   ### How API page object entries map to MCP server tools

   When you add an API page object entry to the MCP Server Configuration, each allow operation (read, create, modify, update, or delete) results in a corresponding tool being made available in the MCP server. These tools can then be added to agents in clients like Copilot Studio.

   The tool names follow this format:

   |Business Central object permissions|Tool|
   |-|-|
   |Allow read|`List<object_name>_ PAG<ID>`|
   |Allow create|`Create <object_name>_ PAG<ID>`|
   |Allow modify|`ListUpdate <object_name>_ PAG<ID>`|
   |Allow delete|`Delete <object_name>_ PAG<ID>`|

   For example, if you specify the following on the **MCP Server Configuration** page:

   |Object type|Object ID|Object Name|Allow read|Allow create|Allow modify|Allow delete|
   |-|-|-|-|-|-|-|
   |Page|30009|APIV2 - Customer|X|X|X|X|

   The following tools are made available in the server:

   - `ListAPIV2 - Customer_ PAG30009`
   - `Create APIV2 - Customer_ PAG30009`
   - `ListUpdate APIV2 - Customer_ PAG30009`
   - `Delete APIV2 - Customer_ PAG30009`

   These tools appear in the MCP server and can be added to agents in Copilot Studio, allowing agents to perform the permitted operations on the specified API page objects.

## Next steps

[Create agents with Copilot Studio](create-agent-in-copilot-studio.md#create-agents-that-use-business-central-mcp.md)  

## Related information

[Transparency note: Semantic Metadata Search in Business Central](transparency-note-semantic-metadata-search.md)  