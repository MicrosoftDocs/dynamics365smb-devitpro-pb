---
title: Get jobQueueEntries
description: Gets a job queue entry object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 08/30/2024
ms.author: solsen
---

# Get jobQueueEntries

Retrieves the properties and relationships of a job queue entry object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).

```
GET businesscentralPrefix/companies({id})/jobQueueEntries({id})
```

## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Don't supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **jobQueueEntry** object in the response body.

## Example

**Request**

Here's an example of the request.

```json
GET https://{businesscentralPrefix}/api/v2.0/companies({id})/jobQueueEntries({id})
```

**Response**

Here's an example of the response.

```json
{
    "id": "e7c93b42-89a1-ed11-94cc-000d3a2feca1",
    "jobQueueEntryId": "JQE00042",
    "userId": "f2a5738a-44e3-ea11-bb43-000d3a2feca1",
    "lastReadyState": "Ready",
    "expirationDateTime": "2025-05-29T23:59:59Z",
    "earliestStartDateTime": "2025-04-29T20:00:00Z",
    "objectTypeToRun": "Codeunit",
    "objectIdToRun": 12345,
    "objectCaptionToRun": "Customer Data Sync",
    "reportOutputType": "None",
    "maxNumberAttemptsToRun": 5,
    "numberOfAttemptsToRun": 0,
    "status": "Ready",
    "recordIdToProcess": "",
    "parameterString": "CustomerID=CUST1042;SyncAll=true",
    "recurringJob": true,
    "numberOfMinutesBetweenRuns": 1440,
    "runOnMonday": true,
    "runOnTuesday": true,
    "runOnWednesday": true,
    "runOnThursday": true,
    "runOnFridays": true,
    "runOnSaturdays": false,
    "runOnSundays": false,
    "startingTime": "20:00:00",
    "endingTime": "23:00:00",
    "referenceStartingTime": "2025-04-01T20:00:00Z",
    "nextRunDateFormula": "<1D>",
    "description": "Daily customer data synchronization job",
    "runInUserSession": false,
    "userSessionId": "",
    "jobQueueCategoryCode": "SYNC",
    "errorMessage": "",
    "userServiceInstanceId": "",
    "userSessionStarted": false,
    "notifyOnSuccess": true,
    "userLanguageId": 1033,
    "printerName": "",
    "reportRequestPageOptions": "",
    "rerunDelay": 30,
    "systemTaskId": "00000000-0000-0000-0000-000000000000",
    "scheduled": true,
    "manualRecurrence": false,
    "jobTimeOut": 60,
    "priorityWithinCategory": 50,
    "lastModifiedDateTime": "2025-04-28T15:42:18Z"
}
```

## Related information

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[jobQueueEntry](../resources/dynamics_jobQueueEntry.md)
