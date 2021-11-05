---
title: Business Central Admin Center API - Reschedule Updates
description: Learn about the Business Central administration center API for rescheduling updates.
author: jswymer
ms.service: dynamics365-business-central
ms.topic: conceptual
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.reviewer: solsen
ms.search.keywords: administration, tenant, admin, environment, telemetry
ms.date: 10/05/2021
---

# Reschedule Updates

Allows for the management of scheduled updates such as rescheduling the update to a run on or after a specific date within a provided range.

## Get Scheduled Update

Get information about updates that have already been scheduled for a specific environment.

```
GET /admin/v2.9/applications/{applicationFamily}/environments/{environmentName}/upgrade
```

### Route Parameters

`applicationFamily` - Family of the environment's application (for example, "BusinessCentral")

`environmentName` - Name of the targeted environment

### Response

Returns information about the scheduled update for that environment.

```
{
  "environmentName": string, // The name of the targeted environment.
  "applicationFamily": string, // Family of the environment (for example, "BusinessCentral")
  "sourceVersion": string, // The current version of the environment's application.
  "targetVersion": string, // The version of the application that the environment will update to.
  "canTenantSelectDate": boolean, // Indicates if a new update date can be selected.
  "didTenantSelectDate": boolean, // Indicates if the tenant has selected the current date for the update.
  "earliestSelectableUpgradeDate": datetime, // Specifies the earliest date that can be chosen for the update.
  "latestSelectableUpgradeDate": datetime, // Specifies the latest date that can be chosen for the update.
  "upgradeDate": datetime, // The currently selected scheduled date of the update.
  "updateStatus": string, // The current status of the environment's update. (enum | "Scheduled" or "Running")
  "ignoreUpgradeWindow": boolean, // Indicates if the environment's update window will be ignored
  "isActive": boolean, // Indicates if the update is activated and is scheduled to occur.
}
```

### Expected Error Codes

`applicationTypeDoesNotExist` - the provided value for the application family wasn't found

`environmentNotFound` - the targeted environment couldn't be found

   - target: {applicationFamily}/{environmentName}

## Reschedule Update

Reschedule an update, if able.

```
Content-Type: application/json
PUT /admin/v2.9/applications/{applicationFamily}/environments/{environmentName}/upgrade
```

### Route Parameters

`applicationFamily` - Family of the environment's application (for example, "BusinessCentral")

`environmentName` - Name of the targeted environment

### Body

```
{
  "runOn": datetime, // Sets the date that the upgrade should be run on.
  "ignoreUpgradeWindow": boolean // Specifies if the upgrade window for the environment should be respected.
}
```

### Expected Error Codes

`applicationTypeDoesNotExist` - the provided value for the application family wasn't found

`requestBodyRequired` - the request body must be provided

`resourceDoesNotExist` - no upgrade is currently scheduled for the targeted environment

` entityValidationFailed` - some unhandled error occurred in the validation of the request

`environmentNotFound` - the targeted environment couldn't be found

   - target: {applicationFamily}/{environmentName}


## See Also

[The Business Central Administration Center API](administration-center-api)  
[Manage Apps](tenant-admin-center-manage-apps.md)  
[Microsoft Dynamics 365 Business Central Server Administration Tool](administration-tool.md) 
