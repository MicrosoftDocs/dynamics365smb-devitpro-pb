---
title: Connect Business Central MCP Server to non-Microsoft clients
description: Learn how to connect non-Microsoft MCP clients like ChatGPT and Claude to Business Central MCP server with step-by-step guidance and prerequisites.
author: jswymer
ms.author: jswymer
ms.reviewer: jswymer
ms.topic: how-to
ms.collection:
  - bap-ai-copilot
ms.date: 03/18/2026
ms.custom: bap-template 
---

# Connect Business Central MCP server with non-Microsoft clients 

This article explains how to connect MCP clients that don't have built-in Business Central support, like Claude, ChatGPT, and MCP Inspector, to Business Central MCP server. To connect these clients, you must register your own application in Microsoft Entra ID and configure the client manually.

> [!NOTE]
> **Why is this needed?** The MCP specification supports Dynamic Client Registration (DCR), which allows clients to register themselves automatically with an authorization server. However, Microsoft Entra ID doesn't support DCR, so you must preregister an application.

## Prerequisites

To complete the connection, you meet the following requirements:

- An account in the Microsoft Entra tenant for Business Central environment with at least the [Application Developer](/entra/identity/role-based-access-control/permissions-reference#application-developer) role
- The Microsoft Entra tenant ID for Business Central environment
- The redirect URI of the MCP client

## Step 1: Register an application in Microsoft Entra ID

1. Sign in to the [Microsoft Entra admin center](https://entra.microsoftonline.com).

1. Create the app registration:
    1. Browse to **Microsoft Entra ID** > **App registrations** > **New registration**.
    1. In the **Name** field, enter a meaningful name for the app, for example *BC MCP - Claude*.
    1. Select **Register**.
    1. The app's **Overview** page is displayed. Copy the **Application (client) ID** for later.

    Learn more in [Register an application in Microsoft Entra ID](/entra/identity-platform/quickstart-register-app).
1. Add the redirect URI of the MCP client to the app registration

   1. Select **Authentication** > **+ Add Redirect URI** > **Mobile and desktop applications platform**.
   1. In the Add Redirect URI pane, enter the MCP clients redirect URI, for example *https://claude.ai/api/mcp/auth_callback*.

    Learn more in [How to add a redirect URI to your application](/entra/identity-platform/how-to-add-redirect-uri).
1. Add API permissions to Business Central

   1. Select **API permissions** > **+ Add permission**.
   1. On the **Microsoft APIs** tab, select **Dynamics 365 Business Central** > **Delegated permissions**
   1. Select the **user_impersonation** and **Financials.ReadWrite.All** checkboxes, and then select **Add permissions**.
   1. Select **Grant admin consent** your tenant.

    Learn more in [Configure app permissions for a web API](/entra/identity-platform/quickstart-configure-app-access-web-apis).

## Step 2: Configure the MCP client

Provide your MCP client with the following details:

| Setting | Value |
|---------|-------|
| MCP server URL | `https://mcp.businesscentral.dynamics.com` |
| Client ID | The application (client) ID from step 1 |
| Authorization endpoint | `https://login.microsoftonline.com/<your-tenant-id>/oauth2/v2.0/authorize` |
| Token endpoint | `https://login.microsoftonline.com/<your-tenant-id>/oauth2/v2.0/token` |
| Scope | `https://mcp.businesscentral.dynamics.com/.default` |

Also configure the environment headers (`TenantId`, `EnvironmentName`, `Company`) as described in [How it works](connect-to-business-central-using-mcp.md#how-the-connection-works).

The client uses the OAuth 2.0 Authorization Code flow with PKCE to authenticate. When you initiate the connection, a browser window opens for you to sign in with your Microsoft account.