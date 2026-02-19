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
---

# Use the Business Central MCP Server in Visual Studio Code

The Business Central Model Context Protocol (MCP) server enables developers and business users to interact with Business Central data directly from Visual Studio Code using natural language. This integration allows you to perform common business operations&mdash;such as creating customers, managing items, and processing sales orders—through conversational AI assistance.

This article instructions for configuring the Business Central MCP server in Visual Studio Code and using it for AI-powered natural language queries to manage your business data. Learn more about the MCP Server in [Configure Business Central MCP Server](configure-mcp-server.md).

## Prerequisites

Before you begin, ensure the following requirments are met:

- Visual Studio Code installed with GitHub Copilot extension
- Access to a Business Central online environment enabled with the MCP server. Learn more in [Configure Business Central MCP Server](configure-mcp-server.md).

## Configure the MCP Server

1. Open Visual Studio Code.
1. Open the MCP configuration file. You can configure the MCP server at either the user or workspace level. 

   **User-level configuration:**

   Use if you want the MCP server configuration available in every file, folder, or project you open:

   1. Select <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>P</kbd> to open Command Pallete
   1. In search, enter and select **MCP: Open User Configuration**.

   **Workspace-level configuration:**

   Use if you the MCP server config to specific to a project or repo. Projects can have different MCP servers/endpoints:

   1. Open the root folder of the workspace or project
   2. In this folder, create a folder named .vscode if it doean't already exist.
   3 In the **.vscode** folder, create a file called mcp.json.

1. Add the Business Central MCP server configuration to the `mcp.json` file:

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

1. Replace the placeholder values with your actual Business Central environment details:
   - `TenantId`: Your Azure AD tenant ID (e.g., "f0ac72d1-c1b3-4c2a-a196-8fb82cac5934")
   - `EnvironmentName`: Your Business Central environment name (e.g., "Production" or "Sandbox")
   - `Company`: The company name in Business Central (e.g., "CRONUS USA, Inc.")
   - `ConfigurationName`: A name for your MCP configuration (e.g., "MyMCPConfig")

1. In the file, under `"servers":`, select **Start** to run the server.


After configuring the MCP server, restart VS Code to load the new configuration. The GitHub Copilot extension will automatically connect to the Business Central MCP server.

### Step 3: Verify the Connection

To verify the MCP server is working:

1. Open the GitHub Copilot chat in VS Code
2. Ask a simple question like: "Can you list my Business Central customers?"
3. If configured correctly, Copilot will use the MCP server to fetch customer data

## Using the Business Central MCP Server

Once configured, you can interact with Business Central using natural language through GitHub Copilot. Here are common use cases:

### Create Master Data

**Create a Customer:**
```
Can you create a customer called "Contoso Ltd"?
```

**Create an Item:**
```
Create an item called "Desk" in the inventory
```

### Manage Sales Orders

**Create a Sales Order:**
```
Create a sales order for customer "Contoso Ltd" with item "Desk" quantity 5
```

**List Sales Orders:**
```
Show me all open sales orders
```

**Ship and Invoice:**
```
Ship and invoice sales order number SO-12345
```

### Query Business Data

**List Customers:**
```
Show me all customers
```

**List Items:**
```
What items are in my inventory?
```

**View Sales Order Details:**
```
Show me the details of sales order SO-12345
```

### Modify Existing Records

**Update a Customer:**
```
Update customer "Contoso Ltd" with email address "contact@contoso.com"
```

**Modify a Sales Order:**
```
Add a note to sales order SO-12345 saying "Rush delivery requested"
```

## Available Operations

The Business Central MCP server supports the following operations:

| Operation | Description |
|-----------|-------------|
| CreateCustomer | Create a new customer record |
| ListCustomers | Retrieve all customers or filter by criteria |
| ModifyCustomer | Update existing customer information |
| CreateItem | Create a new item in inventory |
| ListItems | View all items or search for specific items |
| ModifyItem | Update item details |
| CreateSalesOrder | Create a new sales order |
| CreateSalesOrderLine | Add line items to a sales order |
| ListSalesOrders | View all sales orders |
| ListSalesOrderLines | View line items for a sales order |
| ModifySalesOrder | Update sales order information |
| ShipAndInvoice | Ship and invoice a completed sales order |

## Troubleshooting

### Connection Issues

**Problem:** Copilot doesn't respond to Business Central queries

**Solutions:**
- Verify the `mcp.json` file is in the correct location
- Check that all environment variables are correctly set
- Ensure your Business Central API credentials are valid
- Restart VS Code after making configuration changes
- Check the VS Code Output panel for MCP server errors

### Authentication Errors

**Problem:** "Authentication failed" or "Unauthorized" errors

**Solutions:**
- Verify your Azure AD app registration has the correct API permissions for Business Central
- Ensure the client secret hasn't expired
- Confirm the tenant ID matches your Business Central environment
- Check that the Business Central API is enabled in your environment

### Data Not Found

**Problem:** "Customer not found" or "Item doesn't exist" errors

**Solutions:**
- Verify you're querying the correct Business Central environment
- Check spelling and exact names when referencing records
- Use list operations to see available data before modifying
- Ensure you have the necessary permissions in Business Central

### MCP Server Not Loading

**Problem:** MCP server doesn't start or tools aren't available

**Solutions:**
- Ensure Node.js is installed on your system (required for `npx` command)
- Check your internet connection (required to download the MCP server package)
- Verify the MCP server package name is correct: `@microsoft/businesscentral-mcp-server`
- Look for error messages in the VS Code Developer Tools console (Help > Toggle Developer Tools)

### Performance Issues

**Problem:** Slow responses or timeouts

**Solutions:**
- Check your network connection to Business Central
- Verify Business Central environment is responsive
- Consider filtering large data sets (e.g., limit customer lists with specific criteria)
- Check Business Central API rate limits

## Best Practices

1. **Use Specific Names:** When creating or modifying records, use clear, specific names to avoid confusion
2. **Verify Before Modifying:** List existing records before making changes to ensure you're updating the correct data
3. **Secure Your Credentials:** Never commit `mcp.json` with credentials to version control
4. **Use Environment Variables:** For team settings, consider using environment variables instead of hardcoded values
5. **Test in Sandbox:** Use a Business Central sandbox environment for testing before working with production data
6. **Monitor API Usage:** Be aware of Business Central API rate limits and quotas

## Example Workflow

Here's a complete example workflow for creating a sales order:

1. **Create a customer:**
   ```
   Create a customer called "Adventure Works" with email "orders@adventureworks.com"
   ```

2. **Create an item:**
   ```
   Create an item called "Office Chair" with unit price 299.99
   ```

3. **Create a sales order:**
   ```
   Create a sales order for customer "Adventure Works"
   ```

4. **Add order lines:**
   ```
   Add 10 units of "Office Chair" to the last sales order
   ```

5. **Ship and invoice:**
   ```
   Ship and invoice the sales order
   ```

## Related Information

[Model Context Protocol Documentation](https://modelcontextprotocol.io)  
[Business Central API Reference](/dynamics365/business-central/dev-itpro/api-reference/v2.0/)  
[GitHub Copilot in VS Code](https://code.visualstudio.com/docs/copilot/overview)
