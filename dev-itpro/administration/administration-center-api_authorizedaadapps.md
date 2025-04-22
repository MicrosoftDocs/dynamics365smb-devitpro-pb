---
title: Business Central Admin Center API - Authorized AAD Apps
description: Learn about the Business Central administration center API for authorizing Microsoft Entra apps.
author: jobulsin
ms.topic: conceptual
ms.devlang: al
ms.reviewer: solsen
ms.search.keywords: administration, tenant, admin, environment, telemetry
ms.date: 02/24/2023
---

# Business Central Admin Center API - Authorized Microsoft Entra apps 

Authorized Apps are Microsoft Entra apps authorized to call the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API.

## Get Manageable Tenants for App

**Introduced in:** API version 2.24

> [!NOTE]
> This endpoint can only be used when authenticated as app to any tenant where the app is authorized in the Admin Center and has admin consent for the AdminCenter.ReadWrite.All permission.

Returns a list of Entra tenants for which the app that is authenticating the call is registered as authorized app in the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)]. This does not indicate whether the AdminCenter.ReadWrite.All app permission that is required has been granted as well.

```
GET /admin/v2.24/authorizedAadApps/manageableTenants
```

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

## Get Authorized Microsoft Entra apps

> [!NOTE]
> This endpoint cannot be used when authenticated as an app.

Returns the Microsoft Entra apps that are authorized to call the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API for the specified Microsoft Entra tenant.

```
GET /admin/v2.24/authorizedAadApps
```

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
> This endpoint cannot be used when authenticated as an app.

Authorizes a Microsoft Entra app to call the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API for the specified Microsoft Entra tenant. This does not grant admin consent or assign permission sets in environments to the Microsoft Entra app.

```
PUT /admin/v2.24/authorizedAadApps/<appClientId>
```

### Response
```
{
    "appId": "00000000-0000-0000-000000000000",
    "isAdminConsentGranted": false
}
```
## Remove Microsoft Entra app

Removes a Microsoft Entra app authorized to call the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API for the specified Microsoft Entra tenant. This does not revoke admin consent in Microsoft Entra ID nor remove permission sets assigned to the Microsoft Entra app in environments.

```
DELETE /admin/v2.24/authorizedAadApps/<appClientId>
```

## Related information

[The Business Central Administration Center API](administration-center-api.md)  
[Manage Apps](tenant-admin-center-manage-apps.md)  
[Microsoft Dynamics 365 Business Central Server Administration Tool](administration-tool.md) 
