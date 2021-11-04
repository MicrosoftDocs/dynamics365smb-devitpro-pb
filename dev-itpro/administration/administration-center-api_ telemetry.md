---
title: Business Central Admin Center API - Notifications
description: Learn about the Business Central administration center API for logging telemetry.
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

# Telemetry

Telemetry includes the top-level AL events and any returned errors logged from the service. These events can provide necessary information and errors that can be used to troubleshoot issues happening in the tenant's environment. 

## Get Environment Telemetry

Returns the telemetry information for the provided environment and filters. it's recommended that you provide start and end time parameters to return a manageable data set.

```
GET /admin/v2.9/applications/{applicationFamily}/environments/{environmentName}/telemetry?startDateUtc={start}&endDateUtc={end}&logCategory={cat}
```

### Route Parameters

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

### Expected Error Codes

`applicationTypeDoesNotExist` - the provided value for the application family wasn't found

`environmentNotFound` - the targeted environment couldn't be found

   - target: {applicationFamily}/{environmentName}

`invalidInput` - the targeted property is invalid in some way

   - target: {logCategory} - the provided log category isn't a valid value

## See Also

[The Business Central Administration Center API](administration-center-api)  
[Manage Apps](tenant-admin-center-manage-apps.md)  
[Microsoft Dynamics 365 Business Central Server Administration Tool](administration-tool.md) 
