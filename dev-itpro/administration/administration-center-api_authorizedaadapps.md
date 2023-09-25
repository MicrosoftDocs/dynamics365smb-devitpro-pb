---
title: Business Central Admin Center API - Authorized AAD Apps
description: Learn about the Business Central administration center API for authorizing Microsoft Entra apps.
author: jobulsin
ms.topic: conceptual
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.reviewer: solsen
ms.search.keywords: administration, tenant, admin, environment, telemetry
ms.date: 02/24/2023
---

# Authorized Microsoft Entra apps 

Authorized Apps are Microsoft Entra apps authorized to call the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API.

## Get Authorized Microsoft Entra apps

Returns the Microsoft Entra apps that are authorized to call the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API for the specified Microsoft Entra tenant.

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

## Authorize Microsoft Entra app

Authorizes a Microsoft Entra app to call the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API for the specified Microsoft Entra tenant. This does not grant admin consent or assign permission sets in environments to the Microsoft Entra app.

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
## Remove Microsoft Entra app

Removes a Microsoft Entra app authorized to call the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API for the specified Microsoft Entra tenant. This does not revoke admin consent in Microsoft Entra ID nor remove permission sets assigned to the Microsoft Entra app in environments.

```
DELETE /admin/v2.18/authorizedAadApps/<appClientId>
```

## See Also

[The Business Central Administration Center API](administration-center-api.md)  
[Manage Apps](tenant-admin-center-manage-apps.md)  
[Microsoft Dynamics 365 Business Central Server Administration Tool](administration-tool.md) 
