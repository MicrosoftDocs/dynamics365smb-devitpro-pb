---
title: Connect Business Central MCP Server to non-Microsoft hosts
description: Learn how to connect non-Microsoft MCP hosts like ChatGPT and Claude to Business Central MCP server with step-by-step guidance and prerequisites.
author: jswymer
ms.author: jswymer
ms.reviewer: jswymer
ms.topic: how-to
ms.collection:
  - bap-ai-copilot
ms.date: 06/19/2026
ms.custom: bap-template 
---

# Connect to Business Central MCP server with GitHub Copilot CLI and non-Microsoft hosts

> **APPLIES TO:** Business Central online

This article explains how to connect MCP hosts that don't have built-in Business Central support, like GitHub Copilot CLI, Claude, and ChatGPT, to Business Central MCP server. You connect these MCP hosts directly to the Business Central MCP server URL. This approach requires you to register your own application in Microsoft Entra ID and then configure the client connection manually.

Learn more about the MCP Server in [Model Context Protocol (MCP) in Business Central](mcp-overview.md).


## Prerequisites

- You have an account in the Microsoft Entra tenant that hosts the Business Central environment, with at least the [Application Developer](/entra/identity/role-based-access-control/permissions-reference#application-developer) role. This prerequisite is only required if you need to register an application in Microsoft Entra ID.
- You have the Microsoft Entra tenant ID for the Business Central environment.

## Determine the redirect URI

Before you register an application in Microsoft Entra ID, determine the redirect URI for the MCP host. The redirect URI, also known as the callback URL, can be different for each MCP host.

Check the MCP host's documentation for the required redirect URI. Many MCP hosts use a local HTTP port in the URI, such as `http://localhost:<port>/callback`. 

For example:

- With Claude Code, the redirect URI is `http://localhost:<port>/callback`, like `http://localhost:33418/callback`.
- With GitHub Copilot CLI, use `http://localhost:<port>/callback`, like `http://localhost:33418`.

The port you choose must match the redirect port in the MCP host connection configuration.

## Register an application in Microsoft Entra ID

> [!NOTE]
> **Why is this needed?** The MCP specification supports Dynamic Client Registration (DCR), which allows clients to register themselves automatically with an authorization server. However, Microsoft Entra ID doesn't support DCR, so you must register an application for authentication.

This step is typically done by a tenant admin. You can use the same app registration for different clients.

1. Sign in to the [Microsoft Entra admin center](https://entra.microsoft.com).

1. Create the app registration:

   1. Browse to **Microsoft Entra ID** > **App registrations** > **New registration**.
   1. In the **Name** field, enter a meaningful name for the app, for example *BC MCP - Claude*.
   1. Set the **Supported account types** field to **Multiple Entra ID tenants** and then select **Allow all tenants**. 
   1. Select **Register**.
   1. The app's **Overview** page is displayed. Copy the **Application (client) ID** for later.

   Learn more in [Register an application in Microsoft Entra ID](/entra/identity-platform/quickstart-register-app).

1. Add the redirect URI of the MCP host to the app registration.

   Use the redirect URI that you determined earlier. For more information, see [Determine the redirect URI](#determine-the-redirect-uri).

   1. Select **Authentication** > **+ Add Redirect URI** > **Mobile and desktop applications platform**.
   1. In the **Add Redirect URI** pane, enter the MCP host's redirect URI.

   Learn more in [How to add a redirect URI to your application](/entra/identity-platform/how-to-add-redirect-uri).

1. Add API permissions to Business Central.

   1. Select **API permissions** > **+ Add permission**.
   1. On the **Microsoft APIs** tab, select **Dynamics 365 Business Central** > **Delegated permissions**.
   1. Select the **Financials.ReadWrite.All** checkbox, and then select **Add permissions**.
   1. Select **Grant admin consent for** your tenant.

   Learn more in [Configure app permissions for a web API](/entra/identity-platform/quickstart-configure-app-access-web-apis).

1. (Optional) Record information about the registered app in the **Model Context Protocol (MCP) Server Entra Applications** page in Business Central. Learn more in [Record and obtain Microsoft Entra app registrations for MCP hosts](#record-and-retrieve-microsoft-entra-app-registrations-for-mcp-hosts).

   This step is for convenience only and isn't required for app registration.

## Connect the MCP host to the Business Central MCP server

After an app is registered for MCP hosts, you can connect clients to the Business Central MCP server. Refer to your MCP host's documentation for the specific configuration steps for connecting to MCP servers. Use the following information as needed:

| Setting | Value |
|---------|-------|
| Business Central MCP server URL | `https://mcp.businesscentral.dynamics.com` |
| Client ID | The application (client) ID of the registered app in Microsoft Entra used for authentication.|

Provide the following information as needed to connect to the Business Central environment and MCP server configuration:

[!INCLUDE [mcp-server-headers](../developer/includes/mcp-server-headers.md)]

The following examples show how a configuration can look in different MCP hosts. Replace the sample values with the tenant ID, environment name, company name, configuration name, client ID, and redirect port for your setup.

### Claude Code example

```json
{
   "mcpServers": {
      "businesscentral": {
         "type": "http",
         "url": "https://mcp.businesscentral.dynamics.com",
         "headers": {
            "TenantId": "aaaabbbb-0000-cccc-1111-dddd2222eeee",
            "EnvironmentName": "Production",
            "Company": "CRONUS USA, Inc.",
            "ConfigurationName": "SalesTeamConfig"
         },
         "oauth": {
            "clientId": "bbbbcccc-1111-dddd-2222-eeee3333ffff",
            "callbackPort": 33418
         }
      }
   }
}
```

### GitHub Copilot CLI example 

```json
{
   "mcpServers": {
      "businesscentral": {
         "type": "http",
         "url": "https://mcp.businesscentral.dynamics.com",
         "headers": {
            "TenantId": "aaaabbbb-0000-cccc-1111-dddd2222eeee",
            "EnvironmentName": "Production",
            "Company": "CRONUS USA, Inc.",
            "ConfigurationName": "SalesTeamConfig"
         },
         "tools": [
            "*"
         ],
         "oauthClientId": "bbbbcccc-1111-dddd-2222-eeee3333ffff",
         "oauthRedirectPort": "33418",
         "oauthPublicClient": true
      }
   }
}
```

When you start the connection, a browser window opens for you to sign in with your Microsoft account.

## Record and retrieve Microsoft Entra app registrations for MCP hosts

It's useful to record the application (client) ID of Microsoft Entra apps used for MCP host authentication. Users need this information to set up the connection from the MCP host to Business Central MCP server. Recording the information in Business Central is optional.

1. Sign in to [Business Central](https://businesscentral.dynamics.com/).
1. Search for and open the [Model Context Protocol (MCP) Server Configurations](https://businesscentral.dynamics.com/?page=8351) page.
1. Select **Advanced** > **Entra Applications**.

   The **Model Context Protocol (MCP) Server Entra Applications** page lists apps registered in Microsoft Entra for authenticating MCP host users.

   Copy the **Client ID** as needed, or select **New** to record another registered app.

## Related information

[Configure Business Central MCP Server](configure-mcp-server.md)  
[Use Business Central MCP server with Visual Studio Code](use-mcp-server-in-vscode.md)  
[Use Business Central MCP server with Copilot Studio](create-agent-in-copilot-studio.md)
