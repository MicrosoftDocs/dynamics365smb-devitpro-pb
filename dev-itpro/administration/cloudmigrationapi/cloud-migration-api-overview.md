---
title: "Cloud Migration API Overview"
description: 
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 04/01/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: overview
ms.author: solsen
---

# Cloud Migration APIs Overview (v1.0)

[!INCLUDE[2022_releasewave1](../../includes/2022_releasewave1.md)]

Cloud Migration APIs provide capability for automating the cloud migration process end-to-end by using APIs. You will be able to complete the setup, move the data, and track the progress, trigger upgrade if needed and switch off the cloud migration.

The main endpoint for the API is:
`https://api.businesscentral.dynamics.com/v2.0/79dbd222-0f30-42a6-9f25-3164d21b269a/Production/api/microsoft/cloudMigration/v1.0/companies`

## Set up cloud migration

To create the set up you can issue a POST request, if it is a first setup, otherwise use a PATCH request. Issue the request against the following endpoint:

```json
POST https://api.businesscentral.dynamics.com/v2.0/{aadTenantID}/{environment name}//api/microsoft/cloudMigration/v1.0/companies({companyId})/setupCloudMigration
Authorization: Bearer {token}
Content-type: application/json

Body:
{ 
   "productId":"{ProductID}",
   "sqlServerType":"{SqlServerType}",
   "sqlConnectionString":"{SqlConnectionString}"
}

```

In the JSON example above, `productId` can be one of following values:  
 
- DynamicsBCLast – use for cloud migration with upgrade
- DynamicsBC – use for cloud migration from the same version of [!INCLUDE[prod_short](../../developer/includes/prod_short.md)]
- DynamicsGP – use if you are setting up a Dynamics GP cloud migration


##
