---
title: Business Central Admin Center API - Session Management
ms.author: jswymer
description: Learn how to manage sessions in Business Central environments using the Admin Center API. Retrieve session details or terminate sessions with ease.
author: jswymer
ms.topic: reference
ms.devlang: al
ms.reviewer: solsen
ms.search.keywords: administration, tenant, admin, environment, telemetry
ms.date: 11/17/2025
---

# Business Central Admin Center API - Session management

[!INCLUDE[2020_releasewave1](../includes/2020_releasewave1.md)]

Manage the active sessions on an environment.

## Get active sessions

Gets active sessions for an environment.

```
GET /admin/{apiVersion}/applications/{applicationFamily}/environments/{environmentName}/sessions
```

### Route parameters

`apiVersion` - the version of the Admin Center API. Currently, the latest version is [!INCLUDE[admincenterapiversion](../developer/includes/admincenterapiversion.md)]

`applicationFamily` - the family of the ring's application (for example, "BusinessCentral")

`environmentName` - the name of the targeted environment

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

Gets session information for a specific session ID.

```
GET /admin/{apiVersion}/applications/{applicationFamily}/environments/{environmentName}/sessions/{sessionId}
```

### Route parameters

`apiVersion` - the version of the Admin Center API. Currently, the latest version is [!INCLUDE[admincenterapiversion](../developer/includes/admincenterapiversion.md)]

`applicationFamily` - the family of the ring's application (for example, "BusinessCentral")

`environmentName` - the name of the targeted environment

`sessionId` - the ID of the session

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

### Route parameters

`apiVersion` - the version of the Admin Center API. Currently, the latest version is [!INCLUDE[admincenterapiversion](../developer/includes/admincenterapiversion.md)]

`applicationFamily` - the family of the ring's application (for example, "BusinessCentral")

`environmentName` - the name of the targeted environment

`sessionId` - The ID of the session

## Related information

[The Business Central Administration Center API](administration-center-api.md)  
[Manage Apps](tenant-admin-center-manage-apps.md)  
[Microsoft Dynamics 365 Business Central Server Administration Tool](administration-tool.md) 

