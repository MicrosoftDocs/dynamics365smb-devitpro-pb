---
title: Business Central Admin Center API - Authorized Microsoft Entra Apps
description: Learn about the Business Central administration center API for authorizing Microsoft Entra apps.
author: jobulsin
ms.topic: reference
ms.devlang: al
ms.reviewer: solsen
ms.search.keywords: administration, tenant, admin, environment, telemetry
ms.date: 11/17/2025
---

# Business Central admin center API - Authorized Microsoft Entra apps

Authorized Apps are Microsoft Entra apps authorized to call the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API.

## Get manageable tenants for app

**Introduced in:** API version 2.24

> [!NOTE]
> The endpoint can only be used when authenticated as an app to any tenant where the app is authorized in the Admin Center and has admin consent for the AdminCenter.ReadWrite.All permission.

Returns a list of Microsoft Entra tenants for which the app that's authenticating the call is registered as authorized app in the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)]. It doesn't indicate whether the required AdminCenter.ReadWrite.All app permission is granted as well.

```
GET /admin/{apiVersion}/authorizedAadApps/manageableTenants
```

### Route parameters

`apiVersion` - The version of the Admin Center API. Currently, the latest version is [!INCLUDE[admincenterapiversion](../developer/includes/admincenterapiversion.md)]

### Response

```
{
    "value": [
        {
            "entraTenantId": "00000000-0000-0000-0000-000000000000"
        },
        {
            "entraTenantId": "11111111-1111-1111-1111-111111111111"
        }
    ]
}
```

## Get authorized Microsoft Entra apps

> [!NOTE]
> The endpoint can't be used when authenticated as an app.

Returns the Microsoft Entra apps that are authorized to call the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API for the specified Microsoft Entra tenant.

```
GET /admin/{apiVersion}/authorizedAadApps
```

### Route parameters

`apiVersion` - The version of the Admin Center API. Currently, the latest version is [!INCLUDE[admincenterapiversion](../developer/includes/admincenterapiversion.md)]

### Response

```
[
    {
        "appId": "00000000-0000-0000-000000000000",
        "isAdminConsentGranted": false
    },
    {
        "appId": "11111111-1111-1111-111111111111",
        "isAdminConsentGranted": true
    }
]
```

## Authorize Microsoft Entra app

> [!NOTE]
> The endpoint can't be used when authenticated as an app.

Authorizes a Microsoft Entra app to call the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API for the specified Microsoft Entra tenant. It doesn't grant admin consent or assign permission sets in environments to the Microsoft Entra app.

```
PUT /admin/{apiVersion}/authorizedAadApps/<appClientId>
```

### Route parameters

`apiVersion` - The version of the Admin Center API. Currently, the latest version is [!INCLUDE[admincenterapiversion](../developer/includes/admincenterapiversion.md)]

### Response

```
{
    "appId": "00000000-0000-0000-000000000000",
    "isAdminConsentGranted": false
}
```

## Remove Microsoft Entra app

Removes a Microsoft Entra app authorized to call the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API for the specified Microsoft Entra tenant. It doesn't revoke admin consent in Microsoft Entra ID nor remove permission sets assigned to the Microsoft Entra app in environments.

```
DELETE /admin/{apiVersion}/authorizedAadApps/<appClientId>
```

### Route parameters

`apiVersion` - The version of the Admin Center API. Currently, the latest version is [!INCLUDE[admincenterapiversion](../developer/includes/admincenterapiversion.md)]

## Related information

[The Business Central Administration Center API](administration-center-api.md)  
[Manage Apps](tenant-admin-center-manage-apps.md)  
[Microsoft Dynamics 365 Business Central Server Administration Tool](administration-tool.md) 
