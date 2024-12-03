---
title: jobQueueEntry resource type
description: A job queue entry object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 08/30/2024
ms.author: solsen
---

# jobQueueEntry resource type

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a job queue entry in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET jobQueueEntry](../api/dynamics_jobqueueentry_get.md)|jobQueueEntry|Gets a job queue entry object.|

## Bound Actions

The jobQueueEntry resource type offers a bound action called `restart` which restarts the corresponding jobQueueEntry batch.
This is illustrated in the following example:
`RESTART https://<server address>:<server API port>/<server instance name>/api/v2.0/companies({id})/jobQueueEntrys({id})/Microsoft.NAV.restart`

The response has no content; the response code is 204.

## Navigation

| Navigation |Return Type| Description |
|:----------|:----------|:-----------------|
|[jobQueueLogEntries](dynamics_jobqueuelogentry.md)|jobQueueLogEntries |Gets the jobqueuelogentries of the jobQueueEntry.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the job queue entry. Non-editable.|
|jobQueueEntryId|GUID||
|userId|string||
|lastReadyState|datetime||
|expirationDateTime|datetime|Date and time for when the webhook will expire.|
|earliestStartDateTime|datetime||
|objectTypeToRun|string||
|objectIdToRun|integer||
|objectCaptionToRun|string||
|reportOutputType|NAV.jobQueueReportOutputType||
|maxNumberAttemptsToRun|integer||
|numberOfAttemptsToRun|integer||
|status|string|Specifies the status of the job queue entry.|
|recordIdToProcess|string||
|parameterString|string||
|recurringJob|boolean||
|numberOfMinutesBetweenRuns|integer||
|runOnMonday|boolean||
|runOnTuesday|boolean||
|runOnWednesday|boolean||
|runOnThursday|boolean||
|runOnFridays|boolean||
|runOnSaturdays|boolean||
|runOnSundays|boolean||
|startingTime|string||
|endingTime|string||
|referenceStartingTime|datetime||
|nextRunDateFormula|string||
|description|string|Specifies the description of the job queue entry.|
|runInUserSession|boolean||
|userSessionId|integer||
|jobQueueCategoryCode|string||
|errorMessage|string|The error message provided when a fail occurs.|
|userServiceInstanceId|integer||
|userSessionStarted|datetime||
|notifyOnSuccess|boolean||
|userLanguageId|integer||
|printerName|string||
|reportRequestPageOptions|boolean||
|rerunDelay|integer||
|systemTaskId|GUID||
|scheduled|boolean||
|manualRecurrence|boolean||
|jobTimeOut|string||
|priorityWithinCategory|NAV.jobQueuePriority||
|lastModifiedDateTime|datetime|The last datetime the job queue entry was modified. Read-Only.|

## JSON representation

Here is a JSON representation of the jobQueueEntry resource.


```json
{
    "id": "GUID",
    "jobQueueEntryId": "GUID",
    "userId": "string",
    "lastReadyState": "datetime",
    "expirationDateTime": "datetime",
    "earliestStartDateTime": "datetime",
    "objectTypeToRun": "string",
    "objectIdToRun": "integer",
    "objectCaptionToRun": "string",
    "reportOutputType": "NAV.jobQueueReportOutputType",
    "maxNumberAttemptsToRun": "integer",
    "numberOfAttemptsToRun": "integer",
    "status": "string",
    "recordIdToProcess": "string",
    "parameterString": "string",
    "recurringJob": "boolean",
    "numberOfMinutesBetweenRuns": "integer",
    "runOnMonday": "boolean",
    "runOnTuesday": "boolean",
    "runOnWednesday": "boolean",
    "runOnThursday": "boolean",
    "runOnFridays": "boolean",
    "runOnSaturdays": "boolean",
    "runOnSundays": "boolean",
    "startingTime": "string",
    "endingTime": "string",
    "referenceStartingTime": "datetime",
    "nextRunDateFormula": "string",
    "description": "string",
    "runInUserSession": "boolean",
    "userSessionId": "integer",
    "jobQueueCategoryCode": "string",
    "errorMessage": "string",
    "userServiceInstanceId": "integer",
    "userSessionStarted": "datetime",
    "notifyOnSuccess": "boolean",
    "userLanguageId": "integer",
    "printerName": "string",
    "reportRequestPageOptions": "boolean",
    "rerunDelay": "integer",
    "systemTaskId": "GUID",
    "scheduled": "boolean",
    "manualRecurrence": "boolean",
    "jobTimeOut": "string",
    "priorityWithinCategory": "NAV.jobQueuePriority",
    "lastModifiedDateTime": "datetime"
}
```

## Related information
[GET jobQueueEntry](../api/dynamics_jobqueueentry_get.md)  
