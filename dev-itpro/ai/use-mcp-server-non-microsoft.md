---
title: How-to topic template #Required; page title displayed in search results. Don't enclose in quotation marks.
description: How-to description #Required; article description that's displayed in search results. Don't enclose in quotation marks. Do end with a period.
author: rhanajoy #Required; your GitHub user alias, with correct capitalization.
ms.author: rhcassid #Required; your Microsoft alias; optional team alias.
ms.reviewer: kfend #Required; Microsoft alias of content publishing team member.
ms.topic: how-to #Required; don't change.
ms.collection: get-started #Required; If this isn't a getting started article, don't remove the attribute, but leave the value blank. The values for this attribute will be updated over time.
ms.date: 03/18/2026
ms.custom: bap-template #Required; don't change.
---

# Connect with non-Microsoft clients (Claude, ChatGPT, MCP Inspector, etc.)

For MCP clients that do not have built-in Business Central support, you need to register your own application in Microsoft Entra ID and configure the client manually.

> **Why is this needed?** The MCP specification supports Dynamic Client Registration (DCR), which allows clients to register themselves automatically with an authorization server. However, Microsoft Entra ID does not support DCR, so you must pre-register an application.

## Step 1: Register an application in Microsoft Entra ID

1. In the [Azure portal](https://portal.azure.com), go to **Microsoft Entra ID** > **App registrations** > **New registration**.
2. Give the application a name (for example, `BC MCP - Claude`).
3. Under **Authentication**, add the redirect URI provided by your MCP client. Choose the **Mobile and desktop applications** platform.
4. Under **API permissions**, add a **delegated** permission:
   - Select **Dynamics 365 Business Central** as the API
   - Add the `user_impersonation` and `Financials.ReadWrite.All` permissions
5. Select **Grant admin consent** for your tenant.
6. Copy the **Application (client) ID**.

## Step 2: Configure your MCP client

Provide your MCP client with the following details:

| Setting | Value |
|---------|-------|
| MCP server URL | `https://mcp.businesscentral.dynamics.com` |
| Client ID | The application (client) ID from step 1 |
| Authorization endpoint | `https://login.microsoftonline.com/<your-tenant-id>/oauth2/v2.0/authorize` |
| Token endpoint | `https://login.microsoftonline.com/<your-tenant-id>/oauth2/v2.0/token` |
| Scope | `https://mcp.businesscentral.dynamics.com/.default` |

Also configure the environment headers (`TenantId`, `EnvironmentName`, `Company`) as described in [How it works](#how-it-works).

The client will use the OAuth 2.0 Authorization Code flow with PKCE to authenticate. When you initiate the connection, a browser window opens for you to sign in with your Microsoft account.