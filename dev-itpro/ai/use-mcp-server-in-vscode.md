---
title: Use the Business Central MCP Server in Visual Studio Code
description: Learn how to set up and use the Business Central Model Context Protocol (MCP) server in Visual Studio Code to interact with your Business Central data through natural language.
author: jswymer
ms.author: jswymer
ms.reviewer: jswymer
ms.topic: how-to
ms.collection: 
ms.date: 02/18/2026
ms.custom: bap-template
ms.collection:
  - bap-ai-copilot
---

# Use the Business Central MCP Server with Visual Studio Code

> **APPLIES TO:** Business Central online

The Business Central Model Context Protocol (MCP) server enables developers and business users to interact with Business Central data directly from Visual Studio Code using natural language. This integration allows you to perform common business operations&mdash;such as viewing customers, creating items, and processing sales orders&mdash;through conversational AI assistance.

This article gives instructions for configuring the Business Central MCP server in Visual Studio Code and using it for AI-powered natural language queries to manage your business data. Learn more about the MCP Server in [Configure Business Central MCP Server](configure-mcp-server.md).

## Prerequisites

Before you begin, ensure the following requirements are met:

- Visual Studio Code installed with GitHub Copilot extension
- Access to a Business Central online environment enabled with the MCP server. Learn more in [Configure Business Central MCP Server](configure-mcp-server.md).
- Connection string details for MCP server configuration you want to use for agents (TenantId, EnvironmentName, Company, and ConfigurationName).

  You can get the complete MCP server configuration connection string directly from the Business Central web client. Learn more in [Get the MCP server configuration connection](configure-mcp-server.md#get-the-mcp-server-configuration-connection).

## Set up the MCP Server in Visual Studio Code

1. Open Visual Studio Code.
1. Open the MCP server configuration file at either the user or workspace level, depending on whether you want the configuration available globally or only for a specific project:

   **User-level configuration:**

   Use if you want the MCP server configuration available in every file, folder, or project you open:

   1. Select <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>P</kbd> to open Command Palette.
   1. In search, enter and select **MCP: Open User Configuration**.

   **Workspace-level configuration:**

   Use if you want to use the MCP server configuration in a project or repo. Projects can have different MCP servers/endpoints:

   1. Open the root folder of the workspace or project
   1. In this folder, create a folder named `.vscode` if it doesn't already exist.  
   1. In the `.vscode` folder, create a file called `mcp.json`.

1. Add the Business Central MCP server configuration connection string within the `"servers": { }` element of the `mcp.json` file as illustrated in the following json code.  

   ```json
   {
       "servers": {
            "businesscentral": {
                "url": "https://mcp.businesscentral.dynamics.com",
                "type": "http",
                "headers": {
                    "TenantId": "your-tenant-id",
                    "EnvironmentName": "your-environment-name",
                    "Company": "your-company-name",
                    "ConfigurationName": "your-configuration-name"
                }
            }
        }
    }
    ```

   Replace the placeholder values with your actual Business Central environment details:
   - `TenantId`: Your organization's Microsoft Entra tenant ID (for example, "aaaabbbb-0000-cccc-1111-dddd2222eeee")
   - `EnvironmentName`: Your Business Central environment name (for example, "Production" or "Sandbox")
   - `Company`: The company name in Business Central (for example, "CRONUS USA, Inc.")
   - `ConfigurationName`: A name for the MCP configuration (for example, "MyMCPConfig")

   > [!TIP]
   > If you copied the MCP server configuration connection string directly from the Business Central web client, paste the copy within `"servers": { }`. Learn more in [Get the MCP server configuration connection](configure-mcp-server.md#get-the-mcp-server-configuration-connection).

1. In the toolbar that appears under `"servers":` line, select **Start** to start the server.

   ![Shows the MCP server toolbar in the mcp.json file in Visiual Studio Code](../developer/media/vs-code-mcp-toolbar.png )

   When started, the text changes to `Running`.

1. Go to the next section to verify the connection

## Use Business Central MCP Server with agent

Once the MCP server is configured, you can interact with Business Central through GitHub Copilot Chat.

1. Open the GitHub Copilot chat (<kbd>Ctrl</kbd>+<kbd>Alt</kbd>+<kbd>I</kbd>) and set it to agent mode.
1. In the Chat, ask a question or give instruction like: "Can you list all items" or "list my customers". 
1. The agent starts working on a response, like fetching customer data.

   > [!NOTE]
   > The agent can only access data and perform operations permitted by the MCP server configuration. Your available operations depend on the API permissions defined in your Business Central environment. For example, you can only create a customer if you have Create permission on the Customer API. If an operation fails due to insufficient permissions, contact your Business Central administrator to enable the required API access. Learn more about configurations in [Configure Business Central MCP Server](configure-mcp-server.md)

## Related Information

[Business Central MCP Server overview](connect-to-business-central-using-mcp.md)  
[Configure Business Central MCP Server](configure-mcp-server.md)  
[Model Context Protocol Documentation](https://modelcontextprotocol.io)  
[Business Central API Reference](/dynamics365/business-central/dev-itpro/api-reference/v2.0/)  
[GitHub Copilot in Visual Studio Code](https://code.visualstudio.com/docs/copilot/overview)
