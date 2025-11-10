---
title: Business Central Admin Center API - Session Management
description: Learn about the Business Central administration center API.
author: jswymer
ms.topic: reference
ms.devlang: al
ms.reviewer: solsen
ms.search.keywords: administration, tenant, admin, environment, telemetry
ms.date: 02/24/2023
---

# Business Central Admin Center API - Session Management

[!INCLUDE[2020_releasewave1](../includes/2020_releasewave1.md)]

Manage the active sessions on an environment.

## Get active sessions

Gets active sessions for an environment.

```
GET /admin/{apiVersion}/applications/{applicationFamily}/environments/{environmentName}/sessions
```

### Route Parameters

`apiVersion` - The version of the Admin Center API. Currently, the latest version is [!INCLUDE[admincenterapiversion](../developer/includes/admincenterapiversion.md)]

`applicationFamily` - Family of the ring's application (for example, "BusinessCentral")

`environmentName` - Name of the targeted environment


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
GET /admin/{apiVersion}/applications/{applicationFamily}/environments/{environmentName}/sessions/{sessionId}
```

### Route Parameters

`apiVersion` - The version of the Admin Center API. Currently, the latest version is [!INCLUDE[admincenterapiversion](../developer/includes/admincenterapiversion.md)]

`applicationFamily` - Family of the ring's application (for example, "BusinessCentral")

`environmentName` - Name of the targeted environment

`sessionId` - The ID of the session

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
DELETE /admin/{apiVersion}/applications/{applicationFamily}/environments/{environmentName}/sessions/{sessionId}
```

### Route Parameters

`apiVersion` - The version of the Admin Center API. Currently, the latest version is [!INCLUDE[admincenterapiversion](../developer/includes/admincenterapiversion.md)]

`applicationFamily` - Family of the ring's application (for example, "BusinessCentral")

`environmentName` - Name of the targeted environment

`sessionId` - The ID of the session

## Related information

[The Business Central Administration Center API](administration-center-api.md)  
[Manage Apps](tenant-admin-center-manage-apps.md)  
[Microsoft Dynamics 365 Business Central Server Administration Tool](administration-tool.md) 
