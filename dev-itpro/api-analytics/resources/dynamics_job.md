---
title: job resource type
description: Represents a job entity in Dynamics 365 Business Central analytics API.
author: SusanneWindfeldPedersen
ms.topic: reference
ms.devlang: al
ms.date: 06/08/2026
ms.author: solsen
ms.reviewer: solsen
---

# job resource type

Represents a job in [!INCLUDE[prod_short](../../includes/prod_short.md)].

## Methods

| Method | Return Type|Description |
|:--------------------|:-----------|:-------------------------|
|[GET job](../api/dynamics_job_get.md)|job|Gets a job object.|

## Properties

| Property           | Type   |Description     |
|:-------------------|:-------|:---------------|
|no|string|The primary key of the job.|
|description|string|Specifies the description of the job.|
|billToCustomerNo|string|Specifies the billToCustomerNo of the job.|
|creationDate|Date|Specifies the creationDate of the job.|
|startingDate|Date|Specifies the startingDate of the job.|
|endingDate|Date|Specifies the endingDate of the job.|
|status|string|Specifies the status of the job.|
|jobPostingGroup|string|Specifies the jobPostingGroup of the job.|
|blocked|string|Specifies the blocked of the job.|
|projectManager|string|Specifies the projectManager of the job.|
|complete|boolean|Specifies the complete of the job.|

## JSON representation

Here's a JSON representation of the job resource.

```json
{
    "no": "string",
    "description": "string",
    "billToCustomerNo": "string",
    "creationDate": "Date",
    "startingDate": "Date",
    "endingDate": "Date",
    "status": "string",
    "jobPostingGroup": "string",
    "blocked": "string",
    "projectManager": "string",
    "complete": "boolean"
}
```

## Related information

[GET job](../api/dynamics_job_get.md)
