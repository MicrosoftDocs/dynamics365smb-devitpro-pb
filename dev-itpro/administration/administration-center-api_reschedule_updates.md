---
title: Business Central Admin Center API - Manage Updates
ms.author: jswymer
description: Learn how to reschedule updates and manage target versions for Business Central environments using the Admin Center API.
author: jswymer
ms.topic: reference
ms.devlang: al
ms.reviewer: solsen
ms.search.keywords: administration, tenant, admin, environment, telemetry
ms.date: 11/17/2025
---

# Business Central Admin Center API - Manage updates

Allows for the management of scheduled updates such as scheduling the update to run on or after a specific date within a provided range.

## Get updates

Get information about update target versions and their status for a specific environment.

```HTTP
GET /admin/{apiVersion}/applications/{applicationFamily}/environments/{environmentName}/updates
```

### Route parameters

`apiVersion` - the version of the Admin Center API. Currently, the latest version is [!INCLUDE[admincenterapiversion](../developer/includes/admincenterapiversion.md)]

`applicationFamily` - the family of the environment's application (for example, "BusinessCentral")

`environmentName` - the name of the targeted environment

### Response

Returns information about updates available for the specified environment.

```JSON
{
  "value": [
    {
      // Example for a target version that has been released and has been selected as next update for the specified environment
      "targetVersion": "26.1",
      "available": true, // Indicates whether the target version has been released
      "selected": true, // Indicates whether the next selected update is for this target version
      "scheduleDetails": {
        "latestSelectableDateTime": "YYYY-MM-DDTHH:MM:SSZ", // Indicates the last date for which the update to this target version can be scheduled
        "selectedDateTime": "YYYY-MM-DDTHH:MM:SSZ", // Indicates the datetime for which the update to this target version has been scheduled
        "ignoreUpdateWindow": false, // Indicates whether the update window for the environment may be ignored when running this update
        "rolloutStatus": "Active" // Indicates the rollout status of updates to this target version, e.g. "Active", "UnderMaintenance", or "Postponed"
      },
      "targetVersionType": "GA" // Indicates the type of the target version, i.e. "GA", "Preview" or "EarlyAccessPreview"
    },
    { 
      // Example for a target version that has been released but has not been selected as next update for the specified environment
      "targetVersion": "26.2",
      "available": true,
      "selected": false,  
      "scheduleDetails": {        
        "latestSelectableDateTime": "YYYY-MM-DDTHH:MM:SSZ",
        "selectedDateTime": "YYYY-MM-DDTHH:MM:SSZ", // Specifies the date for which this update will be scheduled if Microsoft services select this as next update for the environment, null if no date has been specified by an environment administrator
        "ignoreUpdateWindow": false,
        "rolloutStatus": "Active"
      },
      "targetVersionType": "GA" // Indicates the type of the target version, i.e. "GA", "Preview" or "EarlyAccessPreview"
    },
    {     
      // Example for a target version that has not yet been released but has been selected as next update for the specified environment
      "targetVersion": "26.3", 
      "available": false,
      "selected": true,
      "expectedAvailablity": {
        "month": 8, // Indicates the number of the month in which the target version is expected to be released
        "year": 2025 // Indicates the year in which the target version is expected to be released
      },
      "targetVersionType": "GA" // Indicates the type of the target version, i.e. "GA", "Preview" or "EarlyAccessPreview"
    },
    {
      // Example for a target version that has not yet been released and has not been selected as next update for the specified environment
      "targetVersion": "26.4",
      "available": false,
      "selected": false,
      "expectedAvailablity": {
        "month": 9,
        "year": 2025
      },
      "targetVersionType": "GA" // Indicates the type of the target version, i.e. "GA", "Preview" or "EarlyAccessPreview"
    }
  ]
}
```

## Select target version for next environment update

Select a target version and update date for the next update on an environment. Only one target version can be selected per environment at a time; selecting a new target version for the next environment updates automatically unselects the previous target version.

```HTTP
PATCH /admin/{apiVersion}/applications/{applicationFamily}/environments/{environmentName}/updates/{targetVersion}
```

### Route parameters

`apiVersion` - the version of the Admin Center API. Currently, the latest version is [!INCLUDE[admincenterapiversion](../developer/includes/admincenterapiversion.md)]

`applicationFamily` - the family of the environment's application (for example, "BusinessCentral")

`environmentName` - the name of the targeted environment

`targetVersion` - Version number of the target version to be selected as next update, must match the value returned by the `GET /admin/vX.XX/applications/{applicationFamily}/environments/{environmentName}/updates` request.

### Body

Example for selecting a target version that's available.

```JSON
{
  "selected": true, // Optional. Must be true to select target version; setting this to false returns an error. Omitting it from the body changes scheduleDetails properties for the targetVersion without selecting it or for a targetVersion that is already selected
"targetVersionType": "GA", // Indicates the type of the target version, i.e. "GA", "Preview" or "EarlyAccessPreview". Defaults to "GA" if property is omitted from body. "Preview" and "EarlyAccessPreview" versions can only be scheduled for sandbox environments. Additionally, Partner Sandbox license is required to schedule update targetting "EarlyAccessPreview".
  "scheduleDetails": {
    "selectedDateTime": datetime // Specifies the datetime at which the environment update should start. If selected time is outside the environment update window, the update will start during the next update window
    "ignoreUpdateWindow": boolean // Specifies whether the update window set for the environment might be ignored for this update
  }
}
```

Example for selecting a target version that isn't yet available.

```JSON
{
  "selected": true // Required. Must be true to select target version. Setting this to false returns an error
}
```

### Expected error codes

`applicationTypeDoesNotExist` - the provided value for the application family wasn't found

`environmentNotFound` - the targeted environment couldn't be found

## Cancel running update

Cancels a running update or Cloud Migration data upgrade and restores the environment to its state immediately before the operation started. Can only be used while an update is running. The operation might take over an hour during which the environment isn't accessible.

```HTTP
POST /admin/{apiVersion}/applications/{applicationFamily}/environments/{environmentName}/operations/{id}/cancel
```

### Route parameters

`apiVersion` - the version of the Admin Center API. Currently, the latest version is [!INCLUDE[admincenterapiversion](../developer/includes/admincenterapiversion.md)]

`applicationFamily` - the family of the environment's application (for example, "BusinessCentral")

`environmentName` - the name of the targeted environment

`id` - The operation ID for the update operation. Can be obtained from the `GET /admin/v2.28/environments/{environmentName}/operations` endpoint

### Restrictions

- Environment operation must be of type `Update` or `Data Upgrade`.
- Environment operation must be in state `Running`.
- For operations of type `Update`, the environment can't be in the Enforced Update Period.

## Related information

[The Business Central Administration Center API](administration-center-api.md)  
[Manage Apps](tenant-admin-center-manage-apps.md)  
[Microsoft Dynamics 365 Business Central Server Administration Tool](administration-tool.md) 
