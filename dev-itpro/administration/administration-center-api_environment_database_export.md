---
title: Business Central Admin Center API - Environment Database Export
description: Learn about the Business Central administration center API for exporting an environment database.
author: jswymer
ms.topic: conceptual
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.reviewer: solsen
ms.search.keywords: administration, tenant, admin, environment, telemetry
ms.date: 06/14/2022
---

# Environment Database Export

Allows for the export of an environment's Azure database. Databases are exported to an Azure Storage account provided by you. There is a limit to the number of exports that can be done within a month as shown by the 'metrics' endpoint below.

### Required In-Product Permissions for Exporting an Environment Database

To use the `exports` endpoint, you must have the **D365 BACKUP/RESTORE** permission set assigned to your Business Central user account or authorized AAD App.

## Get Export Metrics

Gets information about the number of exports allowed per month and the amount remaining.

```
GET /admin/v2.15/exports/applications/{applicationFamily}/environments/{environmentName}/metrics
```

### Route Parameters

`applicationFamily` - Family of the environment's application (for example, "BusinessCentral")

`environmentName` - Name of the targeted environment

### Response

Returns the metrics around the current month's database exports.

```
{
  "exportsPerMonth": int, // The total number of allowed exports of the targeted environment every month.
  "exportsRemainingThisMonth": int, // The number of exports remaining for the targeted environment that can be performed this month.
}
```

### Expected Error Codes

`environmentNotFound` - the targeted environment couldn't be found

   - target: {applicationFamily}/{environmentName}

## Start Environment Database Export

Starts the export of an environment's database to a provided Azure storage account

```
Content-Type: application/json
POST /admin/v2.15/exports/applications/{applicationFamily}/environments/{environmentName}
```

### Route Parameters

`applicationFamily` - Family of the environment's application (for example, "BusinessCentral")

`environmentName` - Name of the targeted environment

### Body

```
{
  "storageAccountSasUri": string, // An Azure SAS uri pointing at the Azure storage account where the database will be exported to. The uri must have (Read | Write | Create | Delete) permissions
  "container": string, // The name of the container that will be created by the process to store the exported database.
  "blob": string, // The name of the blob within the container that the database will be exported to. Databases are exported in the .bacpac format so a filename ending with the '.bacpac' suffix is typical.
}
```

### Expected Error Codes

`environmentNotFound` - the targeted environment couldn't be found

   - target: {applicationFamily}/{environmentName}

`requestBodyRequired` - the request body must be provided

`exportFailed` - the export failed because the target environment's version was too old, it wasn't a production environment, the requesting tenant is a trial, the calling user doesn't have permissions to export, or the quota of allowed exports has been used up

## Get Export History

Gets information about the exports that have been done within a provided time frame, for which environment, and by which user.

```
POST /admin/v2.15/exports/history?start={startTime}&end={endTime}
```

### Query parameters

`startTime` - datetime // The start of the export history entry time window to query
`endTime` - datetime // The end of the  export history entry time window to query

### Response

Returns a detailed list of the database exports that occurred within the provided timeframe of the `start` and `end` query parameters

```
{
  "applicationType": string, // Family of the environment (for example, "BusinessCentral")
  "applicationVersion": string, // The version of the environment's application at the time of the export.
  "blob": string, // The name of the blob that the environment's database was exported to.
  "container": string, // The name of the Azure storage account container that the environment's database was exported within.
  "country": string, // The country code of the environment.
  "environmentName": string, // The name of the environment that was exported.
  "storageAccount": string, // The name of the Azure storage account that the environent's database was exported to.
  "time": dateTime, // The time that the environment's database was exported.
  "user": string // The user who initiated the export process.
}
```

> [!NOTE]
> All datetime values are in UTC

## Case-Invariant blocked environment names

### All environment types

- addremotehost
- admin
- api
- clickonce
- connectivity
- deployment
- error
- getapp
- health
- home
- invoicing
- navwinclient
- notsupported
- officeaddin
- phone
- pwa
- remotesignin
- reset
- shellservice
- signout
- tablet

### Production Environment Types

- sandbox

### Sandbox Environment Types

- production

## See Also

[The Business Central Administration Center API](administration-center-api.md)
[Manage Apps](tenant-admin-center-manage-apps.md)
[Microsoft Dynamics 365 Business Central Server Administration Tool](administration-tool.md)
