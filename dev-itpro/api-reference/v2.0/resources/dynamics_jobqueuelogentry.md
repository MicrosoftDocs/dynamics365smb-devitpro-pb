---
title: jobQueueLogEntry resource type
description: A job queue log entry object in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 08/30/2024
ms.author: solsen
---

# jobQueueLogEntry resource type

<!-- START>DO_NOT_EDIT -->
<!-- IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT. -->
Represents a job queue log entry in [!INCLUDE[prod_short](../../../includes/prod_short.md)].

> [!NOTE]
> For information about enabling APIs for [!INCLUDE[prod_short](../../../includes/prod_short.md)] see [Enabling the APIs for Dynamics 365 Business Central](../enabling-apis-for-dynamics-nav.md).

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET jobQueueLogEntry](../api/dynamics_jobqueuelogentry_get.md)|jobQueueLogEntry|Gets a job queue log entry object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|id|GUID|The unique ID of the job queue log entry. Non-editable.|
|jobQueueEntryId|GUID||
|userId|string||
|startDateTime|datetime||
|endDateTime|datetime||
|objectIdToRun|integer||
|objectTypeToRun|string||
|status|string|Specifies the status of the job queue log entry.|
|description|string|Specifies the description of the job queue log entry.|
|errorMessage|string|The error message provided when a fail occurs.|
|jobQueueCategoryCode|string||
|errorCallStack|stream||
|parameterString|string||
|systemTaskId|GUID||
|userSessionId|integer||
|userServiceInstanceId|integer||
|lastModifiedDateTime|datetime|The last datetime the job queue log entry was modified. Read-Only.|

## JSON representation

Here is a JSON representation of the jobQueueLogEntry resource.


```json
{
    "id": "GUID",
    "jobQueueEntryId": "GUID",
    "userId": "string",
    "startDateTime": "datetime",
    "endDateTime": "datetime",
    "objectIdToRun": "integer",
    "objectTypeToRun": "string",
    "status": "string",
    "description": "string",
    "errorMessage": "string",
    "jobQueueCategoryCode": "string",
    "errorCallStack": "stream",
    "parameterString": "string",
    "systemTaskId": "GUID",
    "userSessionId": "integer",
    "userServiceInstanceId": "integer",
    "lastModifiedDateTime": "datetime"
}
```

## Related information
[GET jobQueueLogEntry](../api/dynamics_jobqueuelogentry_get.md)  
