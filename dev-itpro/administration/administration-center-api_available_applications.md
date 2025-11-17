---
title: Business Central Admin Center API - Available Applications
description: Learn about the Business Central administration center API for getting information about the applications.
author: jswymer
ms.topic: reference
ms.devlang: al
ms.reviewer: solsen
ms.search.keywords: administration, tenant, admin, environment, telemetry
ms.date: 11/17/2025
---

# Business Central admin center API - available applications

Get information about the currently available application families, countries/regions, rings, and versions that environments can be created on.
The API endpoints here should be utilized to determine what values can be used for environment creation or copying.

## Applications and corresponding Countries/regions with Rings

Get a list of the currently available application families, the available countries/regions within those families, and the available rings within the countries/regions.

```
GET /admin/{apiVersion}/applications/
```

### Route parameters

`apiVersion` - The version of the Admin Center API. Currently, the latest version is [!INCLUDE[admincenterapiversion](../developer/includes/admincenterapiversion.md)]

### Response

```
{
  "value": [
    {
      "applicationFamily": string, // The name of the family for a given Business Central offered application. (Typically this will just be "BusinessCentral")
      "countriesringDetails": {
          "countryCode": string, // Code for a country/region that the application family supports creating environments within.
          "rings": [{ // A list of logical ring groupings where environments can be created
            "name": string, // The API name of the ring (for example, PROD, PREVIEW)
            "productionRing": bool, // Indicates that the ring is a production ring. Currently there should only be one production ring within a country.
            "friendlyName": string, // The display friendly name of the ring
          }]
      }
    }
  ]
}
```

## Ring details with versions

Gets a list of the currently available versions that an environment can be created on within a logical ring group.

```
GET /admin/{apiVersion}/applications/{applicationFamily}/Countries/{countryCode}/Rings/{ringName}
```

### Route parameters

`apiVersion` - The version of the Admin Center API. Currently, the latest version is [!INCLUDE[admincenterapiversion](../developer/includes/admincenterapiversion.md)]

`applicationFamily` - Family of the ring's application (for example, "BusinessCentral")

`countryCode` - Code for the ring's country/region.

`ringName` - Name of the ring to inspect.

### Response

```
{
  "value": [ // A list of the available application versions within the ring that environments can be created on 
    "<version string>",
    "<version string>",
    ...
  ]
}
```

## Related information

[The Business Central Administration Center API](administration-center-api.md)  
[Manage Apps](tenant-admin-center-manage-apps.md)  
[Microsoft Dynamics 365 Business Central Server Administration Tool](administration-tool.md)  
