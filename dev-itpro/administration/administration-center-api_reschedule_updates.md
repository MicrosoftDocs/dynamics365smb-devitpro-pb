---
title: Business Central Admin Center API - Manage Updates
description: Learn about the Business Central administration center API for rescheduling updates.
author: jswymer
ms.topic: reference
ms.devlang: al
ms.reviewer: solsen
ms.search.keywords: administration, tenant, admin, environment, telemetry
ms.date: 03/31/2025
---

# Business Central Admin Center API - Manage Updates

Allows for the management of scheduled updates such as rescheduling the update to a run on or after a specific date within a provided range.

## Get Updates

Get information about update target versions and their status for a specific environment.

```
GET /admin/{apiVersion}/applications/{applicationFamily}/environments/{environmentName}/updates
```

### Route Parameters

`apiVersion` - The version of the Admin Center API. Currently, the latest version is [!INCLUDE[admincenterapiversion](../developer/includes/admincenterapiversion.md)]

`applicationFamily` - Family of the environment's application (for example, "BusinessCentral")

`environmentName` - Name of the targeted environment

### Response

Returns information about updates available for the specified environment.

```
{
  "value": [
    {
      // Example for a target version that has been released and has been selected as next update for the specified environment
      "targetVersion": "26.1",
      "available": true, // Indicates whether the target version has been released
      "selected": true, // Indicates whether the next selected update is for this target version
      "scheduleDetails":
      {
        "latestSelectableDate": "YYYY-MM-DDTHH:MM:SSZ", // Indicates the last date for which the update to this target version can be scheduled
        "selectedDateTime": "YYYY-MM-DDTHH:MM:SSZ", // Indicates the datetime for which the update to this target version has been scheduled
        "ignoreUpdateWindow": false, // Indicates whether the update window for the environment may be ignored when running this update
        "rolloutStatus": "Active" // Indicates the rollout status of updates to this target version, e.g. "Active", "UnderMaintenance", or "Postponed"
      }
      "targetVersionType": "GA" // Indicates the type of the target version, i.e. "GA" or "Preview"
    },
    { 
      // Example for a target version that has been released but has not been selected as next update for the specified environment
      "targetVersion": "26.2",
      "available": true,
      "selected": false,  
      "scheduleDetails":
      {        
        "latestSelectableDate": "YYYY-MM-DDTHH:MM:SSZ",
        "selectedDateTime": "YYYY-MM-DDTHH:MM:SSZ", // Specifies the date for which this update will be scheduled if Microsoft services select this as next update for the environment, null if no date has been specified by an environment administrator
        "ignoreUpdateWindow": false,
        "rolloutStatus": "Active"
      }
      "targetVersionType": "GA" // Indicates the type of the target version, i.e. "GA" or "Preview"
    },
    {     
      // Example for a target version that has not yet been released but has been selected as next update for the specified environment
      "targetVersion": "26.3", 
      "available": false,
      "selected": true,
      "expectedAvailablity":
        "month": 8, // Indicates the number of the month in which the target version is expected to be released
        "year": 2025 // Indicates the year in which the target version is expected to be released
      }
      "targetVersionType": "GA" // Indicates the type of the target version, i.e. "GA" or "Preview"
    },
    {
      // Example for a target version that has not yet been released and has not been selected as next update for the specified environment
      "targetVersion": "26.4",
      "available": false,
      "selected": false,
      "expectedAvailablity": {
        "month": 9,
        "year": 2025
      }
      "targetVersionType": "GA" // Indicates the type of the target version, i.e. "GA" or "Preview"
    }
  ]
}
```

## Select target version for next environment update

Select a target version and update date for the next update on an environment. Only one target version can be selected per environment at a time; selecting a new target version for the next environment updates automatically unselects the previous target version.

```
PATCH /admin/{apiVersion}/applications/{applicationFamily}/environments/{environmentName}/updates/{targetVersion}
```

### Route Parameters

`apiVersion` - The version of the Admin Center API. Currently, the latest version is [!INCLUDE[admincenterapiversion](../developer/includes/admincenterapiversion.md)]

`applicationFamily` - Family of the environment's application (for example, "BusinessCentral")

`environmentName` - Name of the targeted environment

`targetVersion` - Version number of the target version to be selected as next update, must match the value returned by the `GET /admin/vX.XX/applications/{applicationFamily}/environments/{environmentName}/updates` request.


### Body

Example for selecting a target version that is available.

```
{
  "selected": true, // Optional. Must be true to select target version; setting this to false returns an error. Omitting it from the body changes scheduleDetails properties for the targetVersion without selecting it or for a targetVersion that is already selected
"targetVersionType": "GA", // Indicates the type of the target version, i.e. "GA" or "Preview". Defaults to "GA" if property is omitted from body. "Preview" versions can only be scheduled for sandbox environments
  "scheduleDetails": {
    "selectedDateTime": datetime // Specifies the datetime at which the environment update should start. If selected time is outside the environment update window, the update will start during the next update window
    "ignoreUpdateWindow": boolean // Specifies whether the update window set for the environment may be ignored for this update
  }
}
```

Example for selecting a target version that is not yet available.

```
{
  "selected": true // Required. Must be true to select target version. Setting this to false returns an error
}
```

### Expected Error Codes

`applicationTypeDoesNotExist` - the provided value for the application family wasn't found

`environmentNotFound` - the targeted environment couldn't be found

## Cancel running update

Cancels a running update and restores the environment to its state immediately before the update started. Can only be used while an update is running. Operation may take over an hour during which the environment is not accessible.

```
POST /admin/{apiVersion}/applications/{applicationFamily}/environments/{environmentName}/operations/{id}/cancel
```

### Route Parameters

`apiVersion` - The version of the Admin Center API. Currently, the latest version is [!INCLUDE[admincenterapiversion](../developer/includes/admincenterapiversion.md)]

`applicationFamily` - Family of the environment's application (for example, "BusinessCentral")

`environmentName` - Name of the targeted environment

`id` - The operation ID for the update operation. Can be obtained from the `GET /admin/v2.28/environments/{environmentName}/operations` endpoint



## Related information

[The Business Central Administration Center API](administration-center-api.md)  
[Manage Apps](tenant-admin-center-manage-apps.md)  
[Microsoft Dynamics 365 Business Central Server Administration Tool](administration-tool.md) 
