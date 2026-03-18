# Business Central MCP Server overview

> **APPLIES TO:** Business Central online

The [Model Context Protocol (MCP)](https://modelcontextprotocol.io) is an open protocol that standardizes how AI applications communicate with data sources and tools. It provides a universal way for AI applications—like Copilot Studio, GitHub Copilot, Claude, ChatGPT, and custom agents—to securely access and interact with external systems.

## Business Central MCP Server

An **MCP server** is a service that implements the Model Context Protocol, exposing an application's data and functionality to AI clients. When an AI client connects to an MCP server, it can read data, perform actions, and integrate that application's capabilities directly into conversational workflows—all through a standardized interface.

Business Central provides an MCP server at `https://mcp.businesscentral.dynamics.com` that enables AI clients to interact with your Business Central environments. This capability allows customers and employees to conversationally engage with Business Central data and logic from various channels, such as:

- **Microsoft 365 Copilot**: Natural language queries and actions within your Microsoft 365 workspace
- **Microsoft Teams**: Collaborative access to Business Central data in team conversations
- **Visual Studio Code**: AI-assisted development and data exploration with GitHub Copilot
- **Copilot Studio**: Custom agents that integrate Business Central capabilities
- **Non-Microsoft AI clients**: Claude, ChatGPT, and other MCP-compatible applications

## Configuring what the MCP server can do

Once configured, AI clients connected to the Business Central MCP server can perform various operations on your behalf:

**Data operations**

- **View records**: List all customers, items, vendors, or other entities exposed through API pages
- **Edit records**: Update customer information, item details, pricing, or other entity properties
- **Create records**: Add new customers, items, sales orders, or other entities to Business Central
- **Delete records**: Remove entities from Business Central when permissions allow

**Business processes**

- **Execute operations**: Perform OData bound actions attached to records, such as:
  - Posting documents (sales orders, purchase orders, invoices)
  - Changing record statuses
  - Running business logic defined in your Business Central environment

**Conversational interactions**

- **Natural language queries**: Ask questions like "Show me all customers in California" or "What's the inventory level for item X?"
- **Guided workflows**: Have the AI guide you through complex business processes
- **Data analysis**: Get summaries, trends, and insights from your Business Central data

The specific capabilities available depend on how you configure the MCP server and what permissions you grant. Learn more in [Configure Business Central MCP Server](configure-mcp-server.md).

## Connecting to the MCP Server

Connecting to the Business Central MCP server varies depending on which AI client you're using. Here are the main approaches:

Some clients have built-in Business Central MCP support with preconfigured authentication. For these clients, you just add the MCP server configuration with your environment details.

- **GitHub Copilot in  Visual Studio Code**: Uses Visual Studio Code's preregistered Microsoft Entra ID application. Learn more in [Use the Business Central MCP Server in Visual Studio Code
](use-mcp-server-in-vscode.md)
- **Copilot Studio**: Handles authentication through Power Platform Connector framework. Learn more in [Connect from Copilot Studio](create-agent-in-copilot-studio.md)-

For AI clients without built-in support (Claude, ChatGPT, MCP Inspector, and so on.), there's more setup required. You need to register an application in Microsoft Entra ID and configure the client with your application credentials and environment details. Learn more in [Connect non-Microsoft clients to Business Central MCP](use-mcp-server-non-microsoft.md.md).

### Required environment details

All MCP clients connecting to Business Central need to specify which environment to target:

| Detail | Description | Example |
|--------|-------------|---------|
| `TenantId` | Your Microsoft Entra tenant ID (GUID) | `00000000-0000-0000-0000-000000000000` |
| `EnvironmentName` | The name of your Business Central environment | `Production` |
| `Company` | The company name within the environment | `CRONUS USA, Inc.` |
| `ConfigurationName` | (Optional) The MCP server configuration to use | `SalesTeamConfig` |

## How the connection works

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

## Prerequisites

To use Business Central MCP:

- **Business Central online**: The MCP server is available for Business Central online environments
- **MCP-compatible client**: An application that supports the Model Context Protocol
- **User account**: A Business Central user account with appropriate permissions
- **MCP server configuration**: At least one configuration created by an administrator (for write operations)

## Next steps

- [Configure Business Central MCP Server](configure-mcp-server.md)
- [Connect from Visual  Code](use-mcp-server-in-vscode.md)
- [Connect from Copilot Studio](create-agent-in-copilot-studio.md)
- [Connect other MCP clients](use-mcp-server-non-microsoft.md)

## Related information

- [Model Context Protocol specification](https://modelcontextprotocol.io)
- [Business Central APIs](/dynamics365/business-central/dev-itpro/api-reference/v2.0/)
- [Create agents with Copilot Studio](create-agent-in-copilot-studio.md)
