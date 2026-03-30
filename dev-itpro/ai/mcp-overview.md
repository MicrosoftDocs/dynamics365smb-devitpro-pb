---
title: Business Central MCP Server Overview and Setup
description: Learn how to set up and use the Business Central MCP server to enable AI clients like GitHub Copilot and ChatGPT to interact with your Business Central data.
author: jswymer
ms.author: jswymer
ms.reviewer: jswymer
ms.topic: concept-article
ms.date: 03/30/2026
ms.custom: bap-template
ms.collection:
  - bap-ai-copilot
---

# Model Context Protocol (MCP) in Business Central overview

> **APPLIES TO:** Business Central online

The [Model Context Protocol (MCP)](https://modelcontextprotocol.io) is an open standard that defines how AI applications communicate with data sources and tools. It provides a consistent and secure way for AI clients&mdash;such as Copilot Studio, GitHub Copilot, Claude, ChatGPT, and custom agents&mdash;to access and interact with external systems like Business Central.

## Business Central MCP Server

An **MCP server** is a service that implements the Model Context Protocol, exposing an application's data and functionality to AI clients. When an AI client connects to an MCP server, it can read data, perform actions, and integrate that application's capabilities directly into conversational workflows—all through a standardized interface.

The Business Central MCP server enables AI clients to interact with Business Central environments from various channels such as Visual Studio Code, Copilot Studio, and other MCP-compliant clients, allowing customers and employees to conversationally work with Business Central data and business logic.

![Shows how MCP clients connect to Business Central](../developer/media/mcp-client-server.svg)

## What the MCP Server can do

By default, the Business Central MCP server provides read-only access to all exposed Business Central API pages. With no extra configuration, MCP clients can immediately read data from your Business Central environment. To enable write operations, administrators configure API page objects with specific permissions for create, modify, delete, and bound actions.

Once configured, these capabilities are exposed to agents as tools, which they can use to:

- View and manage records – List, create, update, and delete entities such as customers, items, and sales orders
- Execute business processes – Post documents, change statuses, and run business logic
- Answer natural language queries – Provide conversational access to Business Central data

The capabilities available to agents depend on how the MCP server is configured and the permissions assigned to each API. Learn more in [Configure Business Central MCP Server](configure-mcp-server.md).

## Supported MCP Clients

An MCP client is an AI application that can connect to the Business Central MCP server to discover available tools and run them. Business Central supports:

- Visual Studio Code with GitHub Copilot
- Copilot Studio
- Other clients that comply with [Model Context Protocol specification](https://modelcontextprotocol.io/specification/2025-11-25), for example Claude, ChatGPT, and MCP Inspector.

## How MCP clients connect to MCP server

All MCP clients connect to the Business Central MCP server using the following endpoint:

`https://mcp.businesscentral.dynamics.com`

How you connect depends on the client you're using. Microsoft MCP clients (Visual Studio Code and Copilot Studio) include built-in authentication support with a default application registration in Microsoft Entra ID. Other MCP-compliant clients require you to register an application in Microsoft Entra ID and configure authentication manually.

All MCP clients must specify the target environment using the following HTTP headers:

[!INCLUDE [mcp-server-headers](../developer/includes/mcp-server-headers.md)]

### How authentication works

The Business Central MCP server acts as a bridge between MCP clients and your Business Central data. Business Central MCP authentication follows the standard [MCP authentication specification](https://modelcontextprotocol.io/specification/2025-11-25/basic/authorization) with Microsoft Entra ID as the authorization server:

![Shows how MCP clients connect to Business Central](../developer/media/mcp-auth-flow.svg)

1. The MCP client sends an unauthenticated request to the MCP server.
1. The server responds with `401 Unauthorized` and a `WWW-Authenticate` header pointing to the protected resource metadata (PRM) endpoint.
1. The client retrieves the PRM document from `https://mcp.businesscentral.dynamics.com/.well-known/protected-resource-metadata`, which identifies Microsoft Entra ID as the authorization server.
1. The client performs the OAuth 2.0 authorization code flow with [Proof Key for Code Exchange (PKCE - RFC 7636)](https://datatracker.ietf.org/doc/html/rfc7636):
    - Generates a `code_verifier` and `code_challenge`
    - Redirects the user to the Microsoft Entra ID authorization endpoint
    - Exchanges the returned authorization code (along with the `code_verifier`) for an access token
1. The client includes the access token in subsequent requests to the MCP server, making authorized requests on the user's behalf

## Next steps

- [Configure Business Central MCP Server](configure-mcp-server.md)
- [Connect with Copilot Studio](create-agent-in-copilot-studio.md)
- [Connect with Visual Code](use-mcp-server-in-vscode.md)
- [Connect with non-Microsoft MCP clients](use-mcp-server-non-microsoft.md)

## Related information

- [Model Context Protocol specification](https://modelcontextprotocol.io)
- [Business Central APIs](/dynamics365/business-central/dev-itpro/api-reference/v2.0/)
