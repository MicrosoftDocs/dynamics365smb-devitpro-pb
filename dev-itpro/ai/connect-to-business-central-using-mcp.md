---
title: Business Central MCP Server Overview and Setup
description: Learn how to set up and use the Business Central MCP server to enable AI clients like GitHub Copilot and ChatGPT to interact with your Business Central data.
author: jswymer
ms.author: jswymer
ms.reviewer: jswymer
ms.topic: concept-article
ms.date: 02/18/2026
ms.custom: bap-template
ms.collection:
  - bap-ai-copilot
---

# MCP in Business Central overview

> **APPLIES TO:** Business Central online

The [Model Context Protocol (MCP)](https://modelcontextprotocol.io) is an open protocol that standardizes how AI applications communicate with data sources and tools. It provides a universal way for AI applications—like Copilot Studio, GitHub Copilot, Claude, ChatGPT, and custom agents—to securely access and interact with external systems, like Business Central.

## Business Central MCP Server

An **MCP server** is a service that implements the Model Context Protocol, exposing an application's data and functionality to AI clients. When an AI client connects to an MCP server, it can read data, perform actions, and integrate that application's capabilities directly into conversational workflows—all through a standardized interface.

Business Central provides an MCP server at `https://mcp.businesscentral.dynamics.com` that enables AI clients to interact with your Business Central environments. This capability allows customers and employees to conversationally engage with Business Central data and logic from various channels, such as:

- **Microsoft 365 Copilot**: Natural language queries and actions within your Microsoft 365 workspace using agents
- **Visual Studio Code**: AI-assisted development and data exploration with GitHub Copilot
- **Copilot Studio**: Custom agents that integrate Business Central capabilities
- **Non-Microsoft AI clients**: Claude, ChatGPT, and other MCP-compatible applications

<!--
## Prerequisites

Before you can use the Business Central MCP server, you must meet the following prerequisites:

- **Business Central online**: The MCP server is available for Business Central online environments
- **MCP-compatible client**: An application that supports the Model Context Protocol
- **User account**: A Business Central user account with appropriate permissions
- **MCP server configuration**: At least one configuration created by an administrator (for write operations)-->

## What the MCP Server can do

By default, the Business Central MCP Server gives AI clients read-only access to all exposed Business Central API pages. This means that without any extra setup, MCP clients can immediately read data from your Business Central environment.

To enable agents to create, modify, or delete data, administrators must configure the MCP Server. Configuration involves:

- Adding specific API page objects to configurations
- Defining which operations are allowed (read, create, modify, delete, bound actions)
- Setting up permissions that control what data agents can access

Once configured, these operations become available as "tools" that agents can use to:

- **View and manage records**: List, create, update, and delete entities like customers, items, or sales orders
- **Execute business processes**: Post documents, change statuses, and run business logic
- **Answer natural language queries**: Provide conversational access to your Business Central data

The specific capabilities available to agents depend on how you configure the MCP server and what permissions you define for each API. Learn more in [Configure Business Central MCP Server](configure-mcp-server.md).

## Supported MCP Clients

An MCP client is an AI application that can connect to the Business Central MCP server to discover available tools and run them. Business Central supports:

- Visual Studio Code with GitHub Copilot
- Copilot Studio
- Other clients that comply with [Model Context Protocol](https://modelcontextprotocol.io/specification/2025-11-25), like Claude, ChatGPT, and MCP Inspector.

## Connect to the MCP server with MCP clients

All MCP clients connect to the Business Central MCP server using the following endpoint:

`https://mcp.businesscentral.dynamics.com`

How you connect depends on the client you're using.

**Microsoft MCP clients** include native authentication support for Business Central MCP, so you don't need to register an application. You only need to configure the Business Central environment and MCP server configuration details in the client:

- Visual Studio Code uses Visual Studio Code's preregistered Microsoft Entra ID application. Learn more in [Use the Business Central MCP Server in Visual Studio Code](use-mcp-server-in-vscode.md)
- Copilot Studio handles authentication through Power Platform Connector framework. Learn more in [Connect from Copilot Studio](create-agent-in-copilot-studio.md)

**Other MCP clients** require more setup. You must register an application in Microsoft Entra ID and configure the client with your application credentials and environment details. Learn more in [Connect non-Microsoft clients to Business Central MCP](use-mcp-server-non-microsoft.md.md).

### Required environment details

All MCP clients connecting to Business Central need to specify which environment to target:

| Detail | Description | Example |
|--------|-------------|---------|
| `TenantId` | Your Microsoft Entra tenant ID (GUID) | `00000000-0000-0000-0000-000000000000` |
| `EnvironmentName` | The name of your Business Central environment | `Production` |
| `Company` | The company name within the environment | `CRONUS USA, Inc.` |
| `ConfigurationName` | (Optional) The MCP server configuration to use | `SalesTeamConfig` |

### How the connection works

The Business Central MCP server acts as a bridge between AI clients and your Business Central data:

```
AI Client (Visual Studo Code, Copilot Studio, Claude)
    ↓ (MCP Protocol)
Business Central MCP Server (https://mcp.businesscentral.dynamics.com)
    ↓ (Business Central APIs)
Your Business Central Environment (data and business logic)
```

### Authentication flow

Business Central MCP uses Microsoft Entra ID for secure authentication:

1. The AI client attempts to connect to the MCP server
2. The server responds with authentication requirements (Microsoft Entra ID)
3. The client redirects you to sign in with your Microsoft account
4. Microsoft Entra ID issues an access token to the client
5. The client uses this token to make authorized requests on your behalf

This process ensures that:

- All operations are performed with your user identity and permissions
- Your Business Central permissions apply to all AI-initiated operations
- Audit trails show who performed each action

## Next steps

- [Configure Business Central MCP Server](configure-mcp-server.md)
- [Connect from Visual Code](use-mcp-server-in-vscode.md)
- [Connect from Copilot Studio](create-agent-in-copilot-studio.md)
- [Connect other MCP clients](use-mcp-server-non-microsoft.md)

## Related information

- [Model Context Protocol specification](https://modelcontextprotocol.io)
- [Business Central APIs](/dynamics365/business-central/dev-itpro/api-reference/v2.0/)
- [Create agents with Copilot Studio](create-agent-in-copilot-studio.md)
