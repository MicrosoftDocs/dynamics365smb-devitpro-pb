---
title: Business Central Admin API - Authorized Microsoft Entra Apps
description: Use the Business Central admin center API to list authorized Microsoft Entra apps, authorize or remove an app, and find manageable tenants.
author: jobulsin
ms.topic: reference
ms.devlang: al
ms.reviewer: solsen
ms.search.keywords: administration, tenant, admin, environment, telemetry
ms.date: 11/13/2026
ai-usage: ai-assisted
---

# Business Central admin center API - authorized Microsoft Entra apps

Authorized Apps are Microsoft Entra apps authorized to call the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API.

## Get manageable tenants for app

**Introduced in:** API version 2.24

> [!NOTE]
> The endpoint can only be used when authenticated as an app to any tenant where the app is authorized in the Admin Center and has admin consent for the AdminCenter.ReadWrite.All permission.

Returns a list of Microsoft Entra tenants for which the app that's authenticating the call is registered as authorized app in the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)]. It doesn't indicate whether the required AdminCenter.ReadWrite.All app permission is granted as well.

```HTTP
GET /admin/{apiVersion}/authorizedAadApps/manageableTenants
```

### Route parameters

`apiVersion` - the version of the Admin Center API. Currently, the latest version is [!INCLUDE[admincenterapiversion](../developer/includes/admincenterapiversion.md)]

### Response

```JSON
{
    "value": [
        {
            "entraTenantId": "aaaabbbb-0000-cccc-1111-dddd2222eeee"
        },
        {
            "entraTenantId": "bbbbcccc-1111-dddd-2222-eeee3333ffff"
        }
    ]
}
```

## Get authorized Microsoft Entra apps

> [!NOTE]
> The endpoint can't be used when authenticated as an app.

Returns the Microsoft Entra apps that are authorized to call the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API for the specified Microsoft Entra tenant.

```HTTP
GET /admin/{apiVersion}/authorizedAadApps
```

### Route parameters

`apiVersion` - the version of the Admin Center API. Currently, the latest version is [!INCLUDE[admincenterapiversion](../developer/includes/admincenterapiversion.md)]

### Response

```JSON
[
    {
        "appId": "00001111-aaaa-2222-bbbb-3333cccc4444",
        "isAdminConsentGranted": false
    },
    {
        "appId": "11112222-bbbb-3333-cccc-4444dddd5555",
        "isAdminConsentGranted": true
    }
]
```

## Authorize Microsoft Entra app

> [!NOTE]
> The endpoint can't be used when authenticated as an app.

Authorizes a Microsoft Entra app to call the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API for the specified Microsoft Entra tenant. It doesn't grant admin consent or assign permission sets in environments to the Microsoft Entra app.

```HTTP
PUT /admin/{apiVersion}/authorizedAadApps/<appClientId>
```

### Route parameters

`apiVersion` - the version of the Admin Center API. Currently, the latest version is [!INCLUDE[admincenterapiversion](../developer/includes/admincenterapiversion.md)]

`appClientId` - the application (client) ID of the Microsoft Entra app to authorize.

### Response

```JSON
{
    "appId": "00001111-aaaa-2222-bbbb-3333cccc4444",
    "isAdminConsentGranted": false
}
```

## Remove Microsoft Entra app

Removes a Microsoft Entra app authorized to call the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API for the specified Microsoft Entra tenant. It doesn't revoke admin consent in Microsoft Entra ID nor remove permission sets assigned to the Microsoft Entra app in environments.

```HTTP
DELETE /admin/{apiVersion}/authorizedAadApps/<appClientId>
```

### Route parameters

`apiVersion` - the version of the Admin Center API. Currently, the latest version is [!INCLUDE[admincenterapiversion](../developer/includes/admincenterapiversion.md)]

`appClientId` - the application (client) ID of the Microsoft Entra app to remove.

## Related information

[The Business Central Administration Center API](administration-center-api.md)  
[Manage Apps](tenant-admin-center-manage-apps.md)  
[Microsoft Dynamics 365 Business Central Server Administration Tool](administration-tool.md) 

