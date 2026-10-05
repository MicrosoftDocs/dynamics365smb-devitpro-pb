---
title: Connect Business Central MCP Server to non-Microsoft hosts
description: Learn how to connect non-Microsoft MCP hosts like ChatGPT and Claude to Business Central MCP server with step-by-step guidance and prerequisites.
author: jswymer
ms.author: jswymer
ms.reviewer: jswymer
ms.topic: how-to
ms.collection:
  - bap-ai-copilot
ms.date: 10/02/2026
ms.custom: bap-template
---

# Connect to Business Central MCP server with GitHub Copilot CLI and non-Microsoft hosts

> **APPLIES TO:** Business Central online

This article explains how to connect MCP hosts that don't have built-in Business Central support, like GitHub Copilot CLI, Claude, and ChatGPT, to the Business Central MCP server. You connect these MCP hosts directly to the Business Central MCP server URL. This approach requires a registered application in Microsoft Entra ID and manual client configuration. You can use an existing application that meets the requirements or register a new application.

Learn more about the MCP server in [Model Context Protocol (MCP) in Business Central](mcp-overview.md).

## Prerequisites

- If the MCP host doesn't support omitting `TenantId`, you have the Microsoft Entra tenant ID for the Business Central environment.
- You have access to a Microsoft Entra application for the MCP host. Choose one of these paths:
   - **Use an existing application:** Get its application (client) ID. The application must include the MCP host's redirect URI and the delegated `Financials.ReadWrite.All` permission for Dynamics 365 Business Central. A tenant administrator must grant consent for the permission.
   - **Register a new application:** You need an account in the Microsoft Entra tenant with at least the [Application Developer](/entra/identity/role-based-access-control/permissions-reference#application-developer) role. You must also be a tenant administrator or have access to one who can grant consent for the required permission. Follow the registration steps in this article.

## Determine the redirect URI

If you use an existing application that already includes the MCP host's redirect URI and required permission, skip to [Connect the MCP host to the Business Central MCP server](#connect-the-mcp-host-to-the-business-central-mcp-server).

Before you register an application in Microsoft Entra ID, determine the redirect URI for the MCP host. The redirect URI, also known as the callback URL, can be different for each MCP host.

Check the MCP host's documentation for the required redirect URI. Many MCP hosts use a local HTTP port in the URI, such as `http://localhost:<port>/callback`. 

For example:

- With Claude Code, the redirect URI is `http://localhost:<port>/callback`, like `http://localhost:33418/callback`.
- With GitHub Copilot CLI, use `http://localhost:<port>`, like `http://localhost:33418`.

The port you choose must match the redirect port in the MCP host connection configuration.

## Register an application in Microsoft Entra ID

> [!NOTE]
> **Why is this needed?** The MCP specification supports Dynamic Client Registration (DCR), which allows clients to register themselves automatically with an authorization server. However, Microsoft Entra ID doesn't support DCR, so you must register an application for authentication.

A user with the Application Developer role can register the application. A tenant administrator must grant consent for the Business Central API permission. You can use the same app registration for different clients.

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
   1. If you're a tenant administrator, select **Grant admin consent for** your tenant. Otherwise, ask a tenant administrator to complete this step.

   Learn more in [Configure app permissions for a web API](/entra/identity-platform/quickstart-configure-app-access-web-apis).

1. (Optional) Record information about the registered app in the **Model Context Protocol (MCP) Server Entra Applications** page in Business Central. Learn more in [Record and obtain Microsoft Entra app registrations for MCP hosts](#record-and-retrieve-microsoft-entra-app-registrations-for-mcp-hosts).

   This step is for convenience only and isn't required for app registration.

## Connect the MCP host to the Business Central MCP server

After an app is registered for MCP hosts, you can connect clients to the Business Central MCP server. Refer to your MCP host's documentation for the specific configuration steps for connecting to MCP servers. Use the following information as needed:

| Setting | Value |
|---------|-------|
| Business Central MCP server URL | `https://mcp.businesscentral.dynamics.com` |
| Transport | Streamable HTTP. HTTP/SSE transport isn't supported. |
| Client ID | The application (client) ID of the registered app in Microsoft Entra used for authentication.|

Provide the following information as needed to connect to the Business Central environment and MCP server configuration:

[!INCLUDE [mcp-server-headers](../developer/includes/mcp-server-headers.md)]

The following examples show how a configuration can look in different MCP hosts. Replace the sample values with the applicable header values, client ID, and redirect port for your setup.

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

GitHub Copilot CLI supports omitting `TenantId` and `Company` but requires `EnvironmentName`. This example omits `TenantId` so the server determines the tenant from the signed-in identity. It omits `Company` so the agent can select an accessible company at runtime.

```json
{
   "mcpServers": {
      "businesscentral": {
         "type": "http",
         "url": "https://mcp.businesscentral.dynamics.com",
         "headers": {
            "EnvironmentName": "Production",
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

> [!NOTE]
> Because this example omits `Company`, Business Central uses dynamic tool mode for API tools. The MCP host can use `list_companies` to discover available companies, then use `bc_actions_search`, `bc_actions_describe`, and `bc_actions_invoke` with the required `company` parameter.

## Check available configurations and tool parameters

Non-Microsoft hosts can use the MCP protocol responses and the Business Central configuration endpoint to determine how to connect.

- `GET /$configurations`: Returns the active MCP server configurations for the authenticated tenant. The response includes fields such as `name`, `description`, `default`, `enableApiTools`, `enableDynamicToolMode`, `discoverReadOnlyObjects`, and `enableAlQueryTools`.
- MCP `initialize`: Returns server capabilities. Hosts that support Business Central headerless connections advertise and receive the `x-ms-headerless` experimental capability.
- MCP `tools/list`: Returns the tools for the supplied header context. When `TenantId` is absent, the server determines the tenant from the signed-in identity. When a host supports omitting `Company` and the header is absent, API tools use dynamic tool mode, operational tool schemas include the required `company` parameter, and the server includes the `list_companies` tool. When the host negotiates `x-ms-headerless`, tool schemas include the required `environmentName` parameter. If `tools/list` returns `list_environments`, use it to discover available environments.

Include `TenantId` unless your MCP host supports determining the tenant from the signed-in identity. Include `EnvironmentName` unless your MCP host supports Business Central headerless connections or provides its own environment picker. Include `Company` unless the host supports selecting a company at runtime. Including headers pins their values and avoids supplying environment and company parameters with each call.

## Record and retrieve Microsoft Entra app registrations for MCP hosts

It's useful to record the application (client) ID of Microsoft Entra apps used for MCP host authentication. Users need this information to set up the connection from the MCP host to Business Central MCP server. Recording the information in Business Central is optional.

1. Sign in to [Business Central](https://businesscentral.dynamics.com/).
1. Search for and open the [Model Context Protocol (MCP) Server Configurations](https://businesscentral.dynamics.com/?page=8350) page.
1. Select **Advanced** > **Entra Applications**.

   The **Model Context Protocol (MCP) Server Entra Applications** page lists apps registered in Microsoft Entra for authenticating MCP host users.

   Copy the **Client ID** as needed, or select **New** to record another registered app.

## Related information

[Configure Business Central MCP Server](configure-mcp-server.md)  
[Use Business Central MCP server with Visual Studio Code](use-mcp-server-in-vscode.md)  
[Use Business Central MCP server with Copilot Studio](create-agent-in-copilot-studio.md)  
