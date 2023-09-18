---
title: Business Central Admin Center API - Authorized AAD Apps
description: Learn about the Business Central administration center API for authorizing Microsoft Entra ID Apps.
author: jobulsin
ms.topic: conceptual
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.reviewer: solsen
ms.search.keywords: administration, tenant, admin, environment, telemetry
ms.date: 02/24/2023
---

# Authorized Microsoft Entra ID Apps 

Authorized Apps are Microsoft Entra ID Apps authorized to call the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API.

## Get Authorized Microsoft Entra ID Apps

Returns the Microsoft Entra ID apps that are authorized to call the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API for the specified Microsoft Entra ID Tenant.

```
GET /admin/v2.18/authorizedAadApps
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

## Authorize Microsoft Entra ID App

Authorizes an Microsoft Entra ID app to call the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API for the specified Microsoft Entra ID Tenant. This does not grant admin consent or assign permission sets in environments to the Microsoft Entra ID app.

```
PUT /admin/v2.18/authorizedAadApps/<appClientId>
```

### Response
```
{
    "appId": "00000000-0000-0000-000000000000",
    "isAdminConsentGranted": false
}
```
## Remove Microsoft Entra ID App

Removes an Microsoft Entra ID app authorized to call the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API for the specified Microsoft Entra ID Tenant. This does not revoke admin consent in Microsoft Entra ID nor remove permission sets assigned to the Microsoft Entra ID app in environments.

```
DELETE /admin/v2.18/authorizedAadApps/<appClientId>
```

## See Also

[The Business Central Administration Center API](administration-center-api.md)  
[Manage Apps](tenant-admin-center-manage-apps.md)  
[Microsoft Dynamics 365 Business Central Server Administration Tool](administration-tool.md) 
