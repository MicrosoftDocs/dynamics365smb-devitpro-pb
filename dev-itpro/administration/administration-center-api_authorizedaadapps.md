---
title: Business Central Admin Center API - Authorized AAD Apps
description: Learn about the Business Central administration center API for authorizing AAD Apps.
author: jobulsin
ms.topic: conceptual
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.reviewer: solsen
ms.search.keywords: administration, tenant, admin, environment, telemetry
ms.date: 10/12/2022
---

# Authorized AAD Apps 

Authorized Apps are Azure Active Directory Apps authorized to call the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API.

## Get Authorized AAD Apps

Returns the AAD apps that are authorized to call the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API for the specified AAD Tenant.

```
GET /admin/v2.15/authorizedAadApps
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

## Authorize AAD App

Authorizes an AAD app to call the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API for the specified AAD Tenant. This does not grant admin consent or assign permission sets in environments to the AAD app.

```
PUT /admin/v2.15/authorizedAadApps/<appClientId>
```

### Response
```
{
    "appId": "00000000-0000-0000-000000000000",
    "isAdminConsentGranted": false
}
```
## Remove AAD App

Removes an AAD app authorized to call the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API for the specified AAD Tenant. This does not revoke admin consent in AAD nor remove permission sets assigned to the AAD app in environments.

```
DELETE /admin/v2.15/authorizedAadApps/<appClientId>
```

## See Also

[The Business Central Administration Center API](administration-center-api.md)  
[Manage Apps](tenant-admin-center-manage-apps.md)  
[Microsoft Dynamics 365 Business Central Server Administration Tool](administration-tool.md) 
