---
title: Business Central Admin Center API - Telemetry
ms.author: jswymer
description: Explore the Business Central Admin Center API for telemetry logging, including top-level AL events and error tracking for tenant environments.
author: jswymer
ms.topic: reference
ms.devlang: al
ms.reviewer: solsen
ms.search.keywords: administration, tenant, admin, environment, telemetry
ms.date: 11/17/2025
---

# Business Central admin center API - Telemetry (API)

Telemetry includes the top-level AL events and any returned errors logged from the service. These events can provide necessary information and errors that can be used to troubleshoot issues happening in the tenant's environment.

## Get environment telemetry

Returns the telemetry information for the provided environment and filters. It's recommended that you provide start and end time parameters to return a manageable data set.

```
GET /admin/{apiVersion}/applications/{applicationFamily}/environments/{environmentName}/telemetry?startDateUtc={start}&endDateUtc={end}&logCategory={cat}
```

### Route parameters

`apiVersion` - The version of the Admin Center API. Currently, the latest version is [!INCLUDE[admincenterapiversion](../developer/includes/admincenterapiversion.md)]

`applicationFamily` - Family of the environment's application (for example, "BusinessCentral")

`environmentName` - Name of the targeted environment

### Query parameters

`start`: datetime // The start of the telemetry entry time window to query  
`end`: datetime // The end of the telemetry entry time window to query  
`cat`:  (All or 0) // Category of telemetry to query  

### Response

Returns the telemetry logs and with data column headers.

```
{
  "queryColumns": [
    {
      "name": string, // Column display name
      "ordinal": int, // Index of the column in the data set
      "dataType": ( string or 0 | numeric or 1 | datetime or 2 )
      "expectations": (none or 0 | wide or 1) // Flags enum value
    }
  ],
  "queryResults": object[][] // Raw query data results 
}
```

### Expected error codes

`applicationTypeDoesNotExist` - the provided value for the application family wasn't found

`environmentNotFound` - the targeted environment couldn't be found

   - target: {applicationFamily}/{environmentName}

`invalidInput` - the targeted property is invalid in some way

   - target: {logCategory} - the provided log category isn't a valid value

## Related information

[The Business Central Administration Center API](administration-center-api.md)  
[Manage Apps](tenant-admin-center-manage-apps.md)  
[Microsoft Dynamics 365 Business Central Server Administration Tool](administration-tool.md)  
