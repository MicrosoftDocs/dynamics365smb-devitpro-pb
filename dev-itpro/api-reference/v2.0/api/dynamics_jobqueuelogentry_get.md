---
title: Get jobQueueLogEntries
description: Gets a job queue log entry object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 08/30/2024
ms.author: solsen
---

# Get jobQueueLogEntries

Retrieves the properties and relationships of a job queue log entry object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
GET businesscentralPrefix/companies({id})/jobQueueLogEntries({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **jobQueueLogEntry** object in the response body.

## Example

**Request**

Here's an example of the request.

```json
GET https://{businesscentralPrefix}/api/v2.0/companies({id})/jobQueueLogEntries({id})
```

**Response**

Here's an example of the response.

```json
{
    "id": "f8d93b42-89a1-ed11-94cc-000d3a2feca1",
    "jobQueueEntryId": "JQE00042",
    "userId": "f2a5738a-44e3-ea11-bb43-000d3a2feca1",
    "startDateTime": "2025-04-28T20:00:03Z",
    "endDateTime": "2025-04-28T20:01:45Z",
    "objectIdToRun": 12345,
    "objectTypeToRun": "Codeunit",
    "status": "Success",
    "description": "Daily customer data synchronization job",
    "errorMessage": "",
    "jobQueueCategoryCode": "SYNC",
    "errorCallStack": "",
    "parameterString": "CustomerID=CUST1042;SyncAll=true",
    "systemTaskId": "00000000-0000-0000-0000-000000000000",
    "userSessionId": "754e2b1a-89a1-ed11-94cc-000d3a2feca1",
    "userServiceInstanceId": "bc125-na-prod-42",
    "lastModifiedDateTime": "2025-04-28T20:01:45Z"
}
```

## Related information

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[jobQueueLogEntry](../resources/dynamics_jobQueueLogEntry.md)
