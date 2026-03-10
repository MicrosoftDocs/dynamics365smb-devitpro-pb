---
title: Business Central Administration Center API MCP Server (preview)
description: Get introduced to the Business Central Admin Center API MCP Server
author: jobulsin
ms.topic: concept-article
ms.devlang: al
ms.reviewer: solsen
ms.search.keywords: administration, tenant, admin, environment, telemetry, mcp, ai
ms.date: 03/10/2026
---

# The Business Central Admin Center API MCP server (preview)

The [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API provides a [Model Context Protocol (MCP)](https://modelcontextprotocol.io/docs/getting-started/intro) server that that exposes [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] APIs in a standardized, self‑describing way. MCP‑compatible AI agents can discover available admin operations, understand context, and perform environment management tasks.

Using tools like Visual Studio Code, administrators can ask questions such as environment update status, available upgrades, or installed extensions, and receive structured responses sourced directly from the Admin Center. Agents can also propose follow‑up actions—such as copying an environment to a sandbox, scheduling an update, or investigating a failed upgrade—while keeping the user in control through explicit confirmation steps.

[!INCLUDE [preview-note](~/../shared-content/shared/preview-includes/production-ready-preview-dynamics365.md)]

## Location

The [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API MCP Server is located at the following URL:

```HTTP
https://mcp.businesscentral.dynamics.com/admin/v1 
```

Connect to the MCP server in [Visual Studio Code](https://code.visualstudio.com/docs/copilot/customization/mcp-servers), [Copilot Studio](/microsoft-copilot-studio/mcp-add-existing-server-to-agent), or any other tool that supports MCP.

## Excluded tools

The MCP server includes all tools available in the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API, except for endpoints that might disrupt an environment if called unintentionally. The following API endpoints are excluded during the public preview:

### Set security group

```HTTP
POST /admin/{apiVersion}/applications/{applicationFamily}/environments/{environmentName}/settings/securitygroupaccess
```

### Clear security group

```HTTP
DELETE /admin/{apiVersion}/applications/{applicationFamily}/environments/{environmentName}/settings/securitygroupaccess
```

### Delete environment

```HTTP
DELETE /admin/{apiVersion}/applications/{applicationFamily}/environments/{environmentName}
```

### Rename environment

```HTTP
POST /admin/{apiVersion}/applications/{applicationFamily}/environments/{environmentName}/rename
```

### Link Power Platform environment

```HTTP
POST /admin/{apiVersion}/bap/applications/{applicationFamily}/environments/{environmentName}/linkEnvironment?powerPlatformEnvironmentId={id}
```

### Unlink Power Platform environment

```HTTP
POST /admin/{apiVersion}/bap/applications/{applicationFamily}/environments/{environmentName}/unlinkEnvironment?powerPlatformEnvironmentId={id}
```

### Uninstall app

```HTTP
POST /admin/{apiVersion}/applications/{applicationFamily}/environments/{environmentName}/apps/{appId}/uninstall  
```

## Related information

[Business Central Administration Center API reference](administration-center-api.md)  