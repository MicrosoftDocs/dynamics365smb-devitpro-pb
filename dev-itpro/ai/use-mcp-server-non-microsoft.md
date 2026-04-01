---
title: Connect Business Central MCP Server to non-Microsoft clients
description: Learn how to connect non-Microsoft MCP clients like ChatGPT and Claude to Business Central MCP server with step-by-step guidance and prerequisites.
author: jswymer
ms.author: jswymer
ms.reviewer: jswymer
ms.topic: how-to
ms.collection:
  - bap-ai-copilot
ms.date: 03/30/2026
ms.custom: bap-template 
---

# Connect to Business Central MCP server with non-Microsoft clients

> **APPLIES TO:** Business Central online

This article explains how to connect MCP clients that don't have built-in Business Central support, like Claude, ChatGPT, and MCP Inspector, to Business Central MCP server. You connect non-Microsoft MCP clients directly to the Business Central MCP server URL. This approach requires you to register your own application in Microsoft Entra ID and then configure the client connection manually.

Learn more about the MCP Server in [Model Context Protocol (MCP) in Business Central](mcp-overview.md).

## Prerequisites

- An account in the Microsoft Entra tenant for Business Central environment with at least the [Application Developer](/entra/identity/role-based-access-control/permissions-reference#application-developer) role. Only required for registering an application in Microsoft Entra ID.
- The Microsoft Entra tenant ID for Business Central environment
- The redirect URI of the MCP client. Refer to the MCP client's documentation.

## Register an application in Microsoft Entra ID

> [!NOTE]
> **Why is this needed?** The MCP specification supports Dynamic Client Registration (DCR), which allows clients to register themselves automatically with an authorization server. However, Microsoft Entra ID doesn't support DCR, so you must register an application for authentication.

This step is typically done by a tenant admin. You can use the same app registration for different clients.

1. Sign in to the [Microsoft Entra admin center](https://entra.microsoft.com).

1. Create the app registration:

   1. Browse to **Microsoft Entra ID** > **App registrations** > **New registration**.
   1. In the **Name** field, enter a meaningful name for the app, for example *BC MCP - Claude*.
   1. Select **Register**.
   1. The app's **Overview** page is displayed. Copy the **Application (client) ID** for later.

   Learn more in [Register an application in Microsoft Entra ID](/entra/identity-platform/quickstart-register-app).

1. Add the redirect URI of the MCP client to the app registration

   1. Select **Authentication** > **+ Add Redirect URI** > **Mobile and desktop applications platform**.
   1. In the Add Redirect URI pane, enter the MCP client's redirect URI, for example `https://claude.ai/api/mcp/auth_callback`.

   Learn more in [How to add a redirect URI to your application](/entra/identity-platform/how-to-add-redirect-uri).
1. Create a client secret for the registered application. Follow the general guidelines in [Add a client secret](/entra/identity-platform/how-to-add-credentials?tabs=client-secret).

   This step might not be required for your MCP client. Consult your client's documentation for guidance.
1. Add API permissions to Business Central

   1. Select **API permissions** > **+ Add permission**.
   1. On the **Microsoft APIs** tab, select **Dynamics 365 Business Central** > **Delegated permissions**
   1. Select the **user_impersonation** and **Financials.ReadWrite.All** checkboxes, and then select **Add permissions**.
   1. Select **Grant admin consent for** your tenant.

   Learn more in [Configure app permissions for a web API](/entra/identity-platform/quickstart-configure-app-access-web-apis).

1. (optional) Record information about the registered app in the **Model Context Protocol (MCP) Server Entra Applications** page in Business Central. Learn more in [Record and obtain Microsoft Entra app registrations for MCP clients](#record-and-retrieve-microsoft-entra-app-registrations-for-mcp-clients).

   This step is done for convenience only and not required for app registration.

## Connect the MCP client to the Business Central MCP server

After an app is registered for MCP clients, you can connect clients to the Business Central MCP server. Refer to your MCP client's documentation for the specific configuration steps for connecting to MCP servers. Use the following information as needed:

| Setting | Value |
|---------|-------|
| Business MCP server URL | `https://mcp.businesscentral.dynamics.com` |
| Client ID | The application (client) ID of the registered app in Microsoft Entra used for authentication. See the section that follows.|
| Client secret | The client secret on the registered app in Microsoft Entra. Not all clients require a secret.|
| Authorization endpoint | `https://login.microsoftonline.com/<your-tenant-id>/oauth2/v2.0/authorize` |
| Token endpoint | `https://login.microsoftonline.com/<your-tenant-id>/oauth2/v2.0/token` |
| Scope | `https://mcp.businesscentral.dynamics.com/.default` |

Provide the following information as needed to connect to the Business Central environment and MCP server configuration:

[!INCLUDE [mcp-server-headers](../developer/includes/mcp-server-headers.md)]

When you initiate the connection, a browser window opens for you to sign in with your Microsoft account.

## Record and retrieve Microsoft Entra app registrations for MCP clients

It's useful to record the application (client) ID of Microsoft Entra apps used for MCP client authentication. Users need this information to set up the connection from the MCP client to Business Central MCP server. Recording the information in Business Central is optional.

1. Sign in to [Business Central](https://businesscentral.dynamics.com/).
1. Search for and open the [Model Context Protocol (MCP) Server Configurations](https://businesscentral.dynamics.com/?page=8351) page.
1. Select **Advanced** > **Entra Applications**.

   The **Model Context Protocol (MCP) Server Entra Applications** page lists apps registered in Microsoft Entra for authenticating MCP client users.

   Copy the Client ID as needed or select **New** to record another registered app.

## Related information

[Configure Business Central MCP Server](configure-mcp-server.md)  
[Use Business Central MCP server with Visual Studio Code](use-mcp-server-in-vscode.md)  
[Use Business Central MCP server with Copilot Studio](create-agent-in-copilot-studio.md)  