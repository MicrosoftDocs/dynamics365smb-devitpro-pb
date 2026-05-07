---
title: Business Central Administration Center API MCP Server (preview)
description: Get introduced to the Business Central Admin Center API MCP Server
author: jobulsin
ms.topic: concept-article
ms.devlang: al
ms.reviewer: solsen
ms.search.keywords: administration, tenant, admin, environment, telemetry, mcp, ai
ms.date: 03/25/2026
---

# The Business Central Admin Center API MCP server (preview)

The [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API provides a [Model Context Protocol (MCP)](https://modelcontextprotocol.io/docs/getting-started/intro) server that exposes [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] APIs in a standardized, self‑describing way. MCP‑compatible AI agents can discover available admin operations, understand context, and perform environment management tasks.

Using tools like Visual Studio Code, administrators can ask questions such as environment update status, available upgrades, or installed extensions, and receive structured responses sourced directly from the Admin Center. Agents can also propose follow‑up actions; such as copying an environment to a sandbox, scheduling an update, or investigating a failed upgrade, while keeping the user in control through explicit confirmation steps.

[!INCLUDE [preview-note](~/../shared-content/shared/preview-includes/production-ready-preview-dynamics365.md)]

## Location

The [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API MCP server is located at the following URL:

```HTTP
https://mcp.businesscentral.dynamics.com/admin/v1 
```

Connect to the MCP server in [Visual Studio Code](https://code.visualstudio.com/docs/copilot/customization/mcp-servers), [Copilot Studio](/microsoft-copilot-studio/mcp-add-existing-server-to-agent), or any other tool that supports MCP.

## Multitenancy

Partners administering environments for multiple customers using [granular delegated admin privileges (GDAP)](/partner-center/customers/gdap-introduction) might want to use this MCP server to administer environments across customer tenants. During public preview, this endpoint supports the same single-tenant authentication as other [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API endpoints. To facilitate multi‑tenant administration, partners can refer to a sample MCP Proxy available on [GitHub](https://github.com/microsoft/BCTech/tree/master/samples/BcAdminMcpProxy) that illustrates how requests might be routed to different target tenants. 

The sample MCP Proxy is provided as‑is, for reference purposes only, and is not supported or intended for production use. Partners assume full responsibility for any use, modification, or deployment of the sample.

## Excluded tools

The MCP server includes all tools available in the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API, except for endpoints that might disrupt an environment if called unintentionally. The following API endpoints **are excluded during the public preview**:

### Set security group - excluded during public preview

```HTTP
POST /admin/{apiVersion}/applications/{applicationFamily}/environments/{environmentName}/settings/securitygroupaccess
```

### Clear security group - excluded during public preview

```HTTP
DELETE /admin/{apiVersion}/applications/{applicationFamily}/environments/{environmentName}/settings/securitygroupaccess
```

### Delete environment - excluded during public preview

```HTTP
DELETE /admin/{apiVersion}/applications/{applicationFamily}/environments/{environmentName}
```

### Rename environment - excluded during public preview

```HTTP
POST /admin/{apiVersion}/applications/{applicationFamily}/environments/{environmentName}/rename
```

### Link Power Platform environment - excluded during public preview

```HTTP
POST /admin/{apiVersion}/bap/applications/{applicationFamily}/environments/{environmentName}/linkEnvironment?powerPlatformEnvironmentId={id}
```

### Unlink Power Platform environment - excluded during public preview

```HTTP
POST /admin/{apiVersion}/bap/applications/{applicationFamily}/environments/{environmentName}/unlinkEnvironment?powerPlatformEnvironmentId={id}
```

### Uninstall app - excluded during public preview

```HTTP
POST /admin/{apiVersion}/applications/{applicationFamily}/environments/{environmentName}/apps/{appId}/uninstall  
```

## Related information

[Business Central Administration Center API reference](administration-center-api.md)  
