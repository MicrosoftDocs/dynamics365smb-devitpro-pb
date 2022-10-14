---
title: Business Central Admin Center API - Session Management
description: Learn about the Business Central administration center API.
author: jswymer
ms.topic: conceptual
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.reviewer: solsen
ms.search.keywords: administration, tenant, admin, environment, telemetry
ms.date: 10/05/2021
---

# Session Management

[!INCLUDE[2020_releasewave1](../includes/2020_releasewave1.md)]

Manage the active sessions on an environment.

## Get active sessions

Gets active sessions for an environment.

```
GET /admin/v2.15/applications/{applicationFamily}/environments/{environmentName}/sessions
```

### Response
```
{
  value: [
    {
      environmentName: string,
      applicationFamily: string,
      sessionId: int,
      userId: string,
      clientType: string,
      logOnDate: string,
      entryPointOperation: string,
      entryPointObjectName: string,
      entryPointObjectId: string,
      entryPointObjectType: string,
      currentObjectName: string,
      currentObjectId: int,
      currentObjectType: string,
      currentOperationDuration: long
    }
    ,...
  ]
}
```

## Get session details

Gets session information for a specific session id.

```
GET /admin/v2.15/applications/{applicationFamily}/environments/{environmentName}/sessions/{sessionId}
```

### Response

```
{
  environmentName: string,
  applicationFamily: string,
  sessionId: int,
  userId: string,
  clientType: string,
  logOnDate: string,
  entryPointOperation: string,
  entryPointObjectName: string,
  entryPointObjectId: string,
  entryPointObjectType: string,
  currentObjectName: string,
  currentObjectId: int,
  currentObjectType: string,
  currentOperationDuration: long
}
```

## Stop and delete a session

Terminates and deletes an active session.

```
DELETE /admin/v2.15/applications/{applicationFamily}/environments/{environmentName}/sessions/{sessionId}
```

## See Also

[The Business Central Administration Center API](administration-center-api.md)  
[Manage Apps](tenant-admin-center-manage-apps.md)  
[Microsoft Dynamics 365 Business Central Server Administration Tool](administration-tool.md) 
