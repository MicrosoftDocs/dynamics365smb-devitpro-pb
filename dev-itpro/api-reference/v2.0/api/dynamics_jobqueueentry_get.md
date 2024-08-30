---
title: Get jobQueueEntries
description: Gets a job queue entry object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.service: "dynamics365-business-central"
ms.topic: reference
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 08/30/2024
ms.author: solsen
---

<!-- NOTE: This article is an auto-generated stub from the metadata file. -->
<!-- The sections marked with an EDIT_IS_REQUIRED require manual editing. -->
# Get jobQueueEntries

Retrieves the properties and relationships of a job queue entry object for [!INCLUDE[prod_short](../../../includes/prod_short.md)].

## HTTP request

Replace the URL prefix for [!INCLUDE[prod_short](../../../includes/prod_short.md)] depending on environment following the [guideline](../../v2.0/endpoints-apis-for-dynamics.md).
<!-- START>EDIT_IS_REQUIRED. There URL for accessing the endpoint might be different -->
```
GET businesscentralPrefix/companies({id})/jobQueueEntries({id})
```
<!-- END>EDIT_IS_REQUIRED -->
## Request headers

|Header|Value|
|------|-----|
|Authorization  |Bearer {token}. Required. |

## Request body

Do not supply a request body for this method.

## Response

If successful, this method returns a ```200 OK``` response code and a **jobQueueEntry** object in the response body.

## Example

**Request**

Here is an example of the request.
<!-- START>EDIT_IS_REQUIRED. There URL for accessing the endpoint might be different -->
```json
GET https://{businesscentralPrefix}/api/v2.0/companies({id})/jobQueueEntries({id})
```
<!-- END>EDIT_IS_REQUIRED -->
**Response**

Here is an example of the response.

<!-- START>EDIT_IS_REQUIRED. Fill in values for properties -->
```json
{
    "id" : "",
    "jobQueueEntryId" : "",
    "userId" : "",
    "lastReadyState" : "",
    "expirationDateTime" : "",
    "earliestStartDateTime" : "",
    "objectTypeToRun" : "",
    "objectIdToRun" : "",
    "objectCaptionToRun" : "",
    "reportOutputType" : "",
    "maxNumberAttemptsToRun" : "",
    "numberOfAttemptsToRun" : "",
    "status" : "",
    "recordIdToProcess" : "",
    "parameterString" : "",
    "recurringJob" : "",
    "numberOfMinutesBetweenRuns" : "",
    "runOnMonday" : "",
    "runOnTuesday" : "",
    "runOnWednesday" : "",
    "runOnThursday" : "",
    "runOnFridays" : "",
    "runOnSaturdays" : "",
    "runOnSundays" : "",
    "startingTime" : "",
    "endingTime" : "",
    "referenceStartingTime" : "",
    "nextRunDateFormula" : "",
    "description" : "",
    "runInUserSession" : "",
    "userSessionId" : "",
    "jobQueueCategoryCode" : "",
    "errorMessage" : "",
    "userServiceInstanceId" : "",
    "userSessionStarted" : "",
    "notifyOnSuccess" : "",
    "userLanguageId" : "",
    "printerName" : "",
    "reportRequestPageOptions" : "",
    "rerunDelay" : "",
    "systemTaskId" : "",
    "scheduled" : "",
    "manualRecurrence" : "",
    "jobTimeOut" : "",
    "priorityWithinCategory" : "",
    "lastModifiedDateTime" : ""
}
```
<!-- END>EDIT_IS_REQUIRED -->
## See Also

[Tips for working with the APIs](/dynamics365/business-central/dev-itpro/developer/devenv-connect-apps-tips)  
[jobQueueEntry](../resources/dynamics_jobQueueEntry.md)  
