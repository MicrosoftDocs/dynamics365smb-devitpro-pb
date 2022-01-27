---
title: Business Central Admin Center API - Environment Settings
description: Learn about the Business Central administration center API for setting up environments.
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
# Environment Settings

Allows you to manage environment-specific settings such as the environment's AppInsights key or the update window. That is, the timeframe is considered 'ok' for updates (and downtime as a result) to occur.

## Get Update Settings
Returns the update settings for the environment.

```
GET /admin/v2.11/applications/{applicationFamily}/environments/{environmentName}/settings/upgrade
```

### Route Parameters

`applicationFamily` - Family of the environment's application as is. (for example "BusinessCentral")

`environmentName` - Name of the targeted environment

### Response
Returns the environment's update settings, or "null" if none exist
```
{
  "preferredStartTimeUtc": datetime, // Specifies the start of an environment's update window. 
  "preferredEndTimeUtc": datetime, // Specifies the end of environment's update window.
}
```

> [!NOTE]  
> The `date` components of the values are ignored, only the time components are used.

### Expected Error Codes

`environmentNotFound` - the targeted environment couldn't be found

   - target: {applicationFamily}/{environmentName}

## Put Update Settings

Sets the update window start and end times.

```
Content-Type: application/json
PUT /admin/v2.11/applications/{applicationFamily}/environments/{environmentName}/settings/upgrade
```

### Route Parameters

`applicationFamily` - Family of the environment's application as is. (for example "BusinessCentral")

`environmentName` - Name of the targeted environment

### Body

```
{
  "preferredStartTimeUtc": datetime, // Start of environment update window
  "preferredEndTimeUtc": datetime, // End of environment update window
}
```

### Response

Returns the updated settings
```
{
  "preferredStartTimeUtc": datetime, // Start of environment update window
  "preferredEndTimeUtc": datetime, // End of environment update window
}
```

> [!NOTE]  
> The `date` components of the values are ignored, only the time components are used.

### Expected Error Codes

`environmentNotFound` - the targeted environment couldn't be found

   - target: {applicationFamily}/{environmentName}

**- invalidRange:** - the targeted logical range is invalid in some way

   - target: "Preferred Upgrade Window" - the specified window is too small

`requestBodyRequired` - the request body must be provided

## Put AppInsights key

Sets the key an environment uses for Azure AppInsights.

> [!IMPORTANT]
> This process requires a restart to the environment, which is triggered automatically when you call this API. Plan to do this during non-working hours to avoid disruptions.

```
Content-Type: application/json
POST /admin/v2.11/applications/{applicationFamily}/environments/{environmentName}/settings/appinsightskey
```

### Route Parameters

`applicationFamily` - Family of the environment's application (for example, "BusinessCentral")

`environmentName` - Name of the targeted environment

### Body

```
{
  "key": string, // The Application Insights key for the environment
}
```

### Expected Error Codes

`environmentNotFound` - the targeted environment couldn't be found

   - target: {applicationFamily}/{environmentName}

`requestBodyRequired` - the request body must be provided

`cannotSetAppInsightsKey` - the targeted environment's status isn't 'Active'

## Get Security Group

**INTRODUCED IN:** API version 2.8

Gets the Azure AD group currently assigned to an environment.

```
GET /admin/v2.8/applications/{applicationFamily}/environments/{environmentName}/settings/securitygroupaccess
```

### Route Parameters

`applicationFamily` - Family of the environment's application (for example, "BusinessCentral")

`environmentName` - Name of the targeted environment

### Response

If the group exists in Azure AD graph:

```
{
    "id": "796d9c99-80e4-479c-8544-e745ffd18150",
    "displayName": "Security group 1"
}
```

If a previously assigned group no longer exists in Azure AD graph:

```
{
    "id": "796d9c99-80e4-479c-8544-e745ffd18150",
    "displayName": ""
} 
```

If no group is configured for the tenant, returns 204. 

## Set Security Group

**INTRODUCED IN:** API version 2.8

Assigns an Azure AD group to an environment.

```
Content-Type: application/json
POST /admin/v2.8/applications/{applicationFamily}/environments/{environmentName}/settings/securitygroupaccess
```

### Route Parameters

`applicationFamily` - Family of the environment's application (for example, "BusinessCentral")

`environmentName` - Name of the targeted environment

### Body

```
{
  "Value": GUID, // The object Id of the Azure AD group, "11111111-aaaa-2222-bbbb-222222222222"
}
```

### Response

Returns 200 if successful, or 404 if the group doesn't exist in Azure AD.

## Clear Security Group

**INTRODUCED IN:** API version 2.8

Clears an Azure AD group that is currently assigned to an environment.

```
DELETE /admin/v2.8/applications/{applicationFamily}/environments/{environmentName}/settings/securitygroupaccess
```

### Route Parameters

`applicationFamily` - Family of the environment's application (for example, "BusinessCentral")

`environmentName` - Name of the targeted environment

## See Also

[The Business Central Administration Center API](administration-center-api)  
[Manage Apps](tenant-admin-center-manage-apps.md)  
[Microsoft Dynamics 365 Business Central Server Administration Tool](administration-tool.md) 
