---
title: Authentication tools - al_auth_login and al_auth_logout
description: Learn about the al_auth_login and al_auth_logout tools available for AL development, including how to use them in Visual Studio Code with GitHub Copilot and through the AL MCP Server for headless environments and CI/CD pipelines.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.topic: concept-article
ms.update-cycle: 180-days
ms.date: 03/12/2026
ms.collection: bap-ai-copilot
ms.reviewer: solsen
---

# Authentication tools - al_auth_login and al_auth_logout

[!INCLUDE [2026rw1-later-al-ext](../includes/2026rw1-later-al-ext.md)] | Available in: AL MCP Server only

Two tools manage authentication for the AL MCP Server when connecting to Business Central cloud environments (SaaS). Authentication uses browser-based interactive sign-in through Microsoft Authentication Library (MSAL). Tokens are cached securely on disk and reused automatically by tools that require them, such as `al_publish` and `al_downloadsymbols`.

> [!NOTE]
> These tools are available on the AL MCP Server only. In Visual Studio Code, authentication is handled transparently using the existing Visual Studio Code account session.
>
> For on-premises Business Central deployments that use Windows authentication, no explicit sign in is required.

## al_auth_login

The `al_auth_login` tool opens a browser window for interactive Microsoft Entra ID sign-in. After the user signs in, the resulting token is cached. Subsequent AL MCP tool calls that require authentication uses the cached token automatically, without prompting again.

### Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `tenant` | string | `"common"` | The Microsoft Entra tenant domain or GUID (for example, `"contoso.onmicrosoft.com"` or a GUID). Use `"common"` to allow any tenant. |
| `environmentType` | string | `"Sandbox"` | The type of Business Central environment: `"OnPrem"`, `"Sandbox"`, or `"Production"`. |
| `environmentName` | string | — | The name of the cloud environment (for example, `"sandbox"` or `"production"`). |
| `applicationFamily` | string | — | The application family for the cloud server, if applicable. |
| `usernameHint` | string | — | Optional. Prefills the account selector in the browser sign-in dialog with the specified email address. |
| `noCache` | boolean | `false` | When `true`, clears any existing cached tokens before initiating the new sign-in flow. |

### Return value

| Property | Type | Description |
|----------|------|-------------|
| `Success` | boolean | `true` if authentication completed successfully. |
| `AuthRequired` | boolean | `true` if user interaction in the browser is required (this is the expected state for an interactive sign in). |
| `Message` | string | Status message describing the outcome. |

### Examples

**Authenticate to a sandbox environment:**

```json
{
  "tenant": "contoso.onmicrosoft.com",
  "environmentType": "Sandbox",
  "environmentName": "sandbox"
}
```

**Authenticate with a username hint (to pre-select an account):**

```json
{
  "tenant": "contoso.onmicrosoft.com",
  "environmentType": "Production",
  "usernameHint": "user@contoso.onmicrosoft.com"
}
```

**Force re-authentication (clear cached tokens first):**

```json
{
  "tenant": "contoso.onmicrosoft.com",
  "noCache": true
}
```

### When to call al_auth_login

- Before calling `al_publish` with a cloud environment for the first time.
- Before calling `al_downloadsymbols` with a cloud environment.
- When you receive an authentication error from another tool.
- When switching to a different Microsoft Entra account (combine with `noCache: true`).

## al_auth_logout

The `al_auth_logout` tool clears all cached Microsoft Entra ID tokens from the local MSAL token cache. After calling this tool, any tool that requires authentication will prompt for sign-in again.

### Parameters

None.

### Return value

| Property | Type | Description |
|----------|------|-------------|
| `Success` | boolean | `true` if the token cache was cleared successfully. |
| `Message` | string | Confirmation message (for example, `"Token cache cleared."`). |

### When to call al_auth_logout

- To sign out for security purposes after finishing work in a shared or automated environment.
- Before calling `al_auth_login` with a different account.
- To resolve persistent authentication errors by clearing a stale cached token.

## Security design

Authentication tokens are never passed as tool parameters and are never returned in tool responses. The sign-in flow is handled entirely by MSAL and the user's browser. The AL MCP Server only stores and reuses the resulting token from the secure local cache.

## Related tools

- [`al_publish`](al-tool-publish.md) — Deploy an extension; requires authentication for cloud environments.
- [`al_downloadsymbols`](al-tool-download-symbols.md) — Download symbol packages; requires authentication for cloud environments.

## Related information

[AI agent tools overview](al-agent-tools-overview.md)  
[AL MCP Server reference](al-mcp-server.md)  

