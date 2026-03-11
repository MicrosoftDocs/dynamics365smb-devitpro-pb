---
title: Business Central Admin Center API - Environment Settings
description: Configure Business Central environment settings via Admin Center API, including update windows, App Insights, security groups, and access controls.
author: jswymer
ms.topic: reference
ms.devlang: al
ms.reviewer: solsen
ms.search.keywords: administration, tenant, admin, environment, telemetry
ms.date: 11/17/2025
ms.custom: sfi-ga-nochange
---
# Business Central admin center API - Environment settings

Allows you to manage environment-specific settings such as the AppInsights key or the update window.

## Get update settings

Returns the update settings for the environment.

```HTTP
GET /admin/{apiVersion}/applications/{applicationFamily}/environments/{environmentName}/settings/upgrade
```

### Route parameters

`apiVersion` - the version of the Admin Center API. Currently, the latest version is [!INCLUDE[admincenterapiversion](../developer/includes/admincenterapiversion.md)]

`applicationFamily` - the family of the environment's application as is. (For example, "BusinessCentral")

`environmentName` - the name of the targeted environment

### Response

Returns the environment's update settings, or "null" if none exist

```JSON
{
  "preferredStartTime": string, // Start of environment update window in 24h format (HH:mm). Supported by API version 2.13 and later only. 
  "preferredEndTime": string, // End of environment update window in 24h format (HH:mm). Supported by API version 2.13 and later only.  
  "timeZoneId": string, // Windows time zone identifier. Supported by API version 2.13 and later only.  
  "preferredStartTimeUtc": datetime, // Start of an environment's update window, expressed as an UTC timestamp
  "preferredEndTimeUtc": datetime // End of an environment's update window, expressed as an UTC timestamp
}
```

> [!NOTE]  
> The UTC values identify the current or next immediate occurrence of the update window. For instance, when the request is issued, if the current time is within the update window defined for the environment, then `preferredStartTimeUtc` will identify an instant in the past, and `preferredEndTimeUtc` will identify an instant in the future. Otherwise, both the start and end times will identify instants in the future. For a static, deterministic set of values that uniquely identify the definition of the update window for a given environment, refer to the `preferredStartTime`, `preferredEndTime`, and `timeZoneId` values.

### Expected error codes

`environmentNotFound` - the targeted environment couldn't be found

   - target: {applicationFamily}/{environmentName}

## Get time zones for update settings

**INTRODUCED IN:** API version 2.13

Returns a list of time zones and basic information associated with them, such as daylight saving time and the current offset from Coordinated Universal Time (UTC). Time zone identifiers are the only allowed values for the `timeZoneId` parameter of the update settings.

```HTTP
GET /admin/{apiVersion}/applications/settings/timezones
```

### Route parameters

`apiVersion` - the version of the Admin Center API. Currently, the latest version is [!INCLUDE[admincenterapiversion](../developer/includes/admincenterapiversion.md)]

### Response
 
Returns a wrapped array of time zones.

```JSON
{
  "value":
    [
      {
        "id": string, // Time zone identifier (For example, "Romance Standard Time")
        "displayName": string, // Display name of the time zone (for example, "(UTC+01:00) Brussels, Copenhagen, Madrid, Paris")
        "currentUtcOffset": string, // Offset from UTC, expressed as a time span with +/-HH:mm format (for example, "+01:00", "-09:00")
        "supportsDaylightSavingTime": boolean, // Indicates whether the time zone supports daylight saving time rules
        "isCurrentlyDaylightSavingTime": boolean, // Indicates whether daylight saving time is in effect for the given time zone, at the instant the request is issued
      }
    ]
}
```

## Set update settings

Sets the update window start and end times.

```HTTP
Content-Type: application/json
PUT /admin/{apiVersion}/applications/{applicationFamily}/environments/{environmentName}/settings/upgrade
```

### Route parameters

`apiVersion` - the version of the Admin Center API. Currently, the latest version is [!INCLUDE[admincenterapiversion](../developer/includes/admincenterapiversion.md)]

`applicationFamily` - the family of the environment's application as is. (For example, "BusinessCentral")

`environmentName` - the name of the targeted environment

### Body

With API version 2.13 and later, there are two different parameter sets for defining the update window: the *wall-time + timezone* parameter set and the *UTC* parameter set. Consumers can provide either parameter set, but not both. Earlier API versions only support the UTC parameter set.

- The wall-time + timezone parameter set identifies the clock time (or "real time")&mdash;expressed in 24-hour format, like "22:00" for 10:00 PM or "07:30" for 7:30 AM&mdash;for a given time zone. The time zone ID must be a valid [Windows time zone identifier](/windows-hardware/manufacture/desktop/default-time-zones), for example, "Romance Standard Time" or "Pacific Standard Time".
- The UTC parameter set identifies the start and end times in Coordinated Universal Time.

> [!NOTE]
> If you use the UTC parameter set when modifying the update window settings and the country of the environment supports multiple time zones, the time zone shown on the **Environment Details** page in the admin center resets to the default time zone for the country. This result might not be desirable. We recommend using the new parameter set when consuming API v2.13 and later.

Example with wall-time + timezone parameter set (supported only by API v2.13 and later):

```JSON
{
  "preferredStartTime": string, // Start of environment update window,
  "preferredEndTime": string, // End of environment update window
  "timeZoneId": string // Windows time zone identifier
}
```

Example with UTC parameter set:

```JSON
{
  "preferredStartTimeUtc": datetime, // Start of environment update window
  "preferredEndTimeUtc": datetime, // End of environment update window
}
```

### Response

Returns the updated settings

```JSON
{
  "preferredStartTimeUtc": datetime, // Start of environment update window
  "preferredEndTimeUtc": datetime, // End of environment update window
}
```

> [!NOTE]  
> The `date` components of the values are ignored. Only the time components are used.

### Expected error codes

`environmentNotFound` - the targeted environment couldn't be found

   - target: {applicationFamily}/{environmentName}

**- invalidRange:** - the targeted logical range is invalid in some way

   - target: "Preferred Upgrade Window" - the specified window is too small

`requestBodyRequired` - the request body must be provided

`ScheduledUpgradeConstraintViolation` - the update window conflicts with the current update date set for the environment. Either the update would occur outside the allowed update date range or, if the update date is today, the update window is in the past. Adjust the update window or change the update date.


## Set Application Insights key

Sets the connection string or instrumentation key an environment uses for Azure Application Insights resource, which you can use to gather telemetry. For information about Application Insights and the connection string/instrumentation key, go to [Enable Environment Telemetry](telemetry-enable-application-insights.md#appinsights).

> [!IMPORTANT]
> This process requires a restart to the environment, which is triggered automatically when you call this API. Plan to do this task during nonworking hours to avoid disruptions.

```HTTP
Content-Type: application/json
POST /admin/{apiVersion}/applications/{applicationFamily}/environments/{environmentName}/settings/appinsightskey
```

### Route parameters

`apiVersion` - the version of the Admin Center API. Currently, the latest version is [!INCLUDE[admincenterapiversion](../developer/includes/admincenterapiversion.md)]

`applicationFamily` - the family of the environment's application (for example, "BusinessCentral")

`environmentName` - the name of the targeted environment

### Body

```JSON
{
  "key": string, // The Application Insights key for the environment
}
```

### Expected error codes

`environmentNotFound` - the targeted environment couldn't be found

   - target: {applicationFamily}/{environmentName}

`requestBodyRequired` - the request body must be provided

`cannotSetAppInsightsKey` - the targeted environment's status isn't 'Active'

## Get security group

**INTRODUCED IN:** API version 2.8

Gets the Microsoft Entra group currently assigned to an environment.

```HTTP
GET /admin/{apiVersion}/applications/{applicationFamily}/environments/{environmentName}/settings/securitygroupaccess
```

### Route parameters

`apiVersion` - the version of the Admin Center API. Currently, the latest version is [!INCLUDE[admincenterapiversion](../developer/includes/admincenterapiversion.md)]

`applicationFamily` - the family of the environment's application (for example, "BusinessCentral")

`environmentName` - the name of the targeted environment

### Response

If the group exists in Microsoft Graph:

```JSON
{
    "id": "796d9c99-80e4-479c-8544-e745ffd18150",
    "displayName": "Security group 1"
}
```

If a previously assigned group no longer exists in Microsoft Graph:

```JSON
{
    "id": "796d9c99-80e4-479c-8544-e745ffd18150",
    "displayName": ""
} 
```

If no group is configured for the tenant, returns 204. 

## Set security group

**INTRODUCED IN:** API version 2.8

Assigns a Microsoft Entra group to an environment.

```HTTP
Content-Type: application/json
POST /admin/{apiVersion}/applications/{applicationFamily}/environments/{environmentName}/settings/securitygroupaccess
```

### Route parameters

`apiVersion` - the version of the Admin Center API. Currently, the latest version is [!INCLUDE[admincenterapiversion](../developer/includes/admincenterapiversion.md)]

`applicationFamily` - the family of the environment's application (for example, "BusinessCentral")

`environmentName` - the name of the targeted environment

### Body

```JSON
{
  "Value": GUID, // The object Id of the Microsoft Entra group, "aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb"
}
```

### Response

Returns 200 if successful, or 404 if the group doesn't exist in Microsoft Entra ID.

## Clear security group

**INTRODUCED IN:** API version 2.8

Clears a Microsoft Entra group that is currently assigned to an environment.

```HTTP
DELETE /admin/{apiVersion}/applications/{applicationFamily}/environments/{environmentName}/settings/securitygroupaccess
```

### Route parameters

`apiVersion` - the version of the Admin Center API. Currently, the latest version is [!INCLUDE[admincenterapiversion](../developer/includes/admincenterapiversion.md)]

`applicationFamily` - the family of the environment's application (for example, "BusinessCentral")

`environmentName` - the name of the targeted environment

## Get partner access settings

**INTRODUCED IN:** API version 2.22

Returns a boolean value that indicates whether the environment allows access for delegated administrators and foreign multitenant apps and a list of allowlisted foreign Microsoft Entra tenant IDs.

> [!IMPORTANT]
> Only internal global administrators can use this API endpoint. Delegated administrator or application authentication isn't supported.

```HTTP
GET /admin/{apiVersion}/applications/{applicationFamily}/environments/{environmentName}/settings/partneraccess
```

### Route parameters

`apiVersion` - the version of the Admin Center API. Currently, the latest version is [!INCLUDE[admincenterapiversion](../developer/includes/admincenterapiversion.md)]

`applicationFamily` - the family of the environment's application (for example, "BusinessCentral")

`environmentName` - the name of the targeted environment

### Response

```JSON
{
  "status": "Disabled | AllowAllPartnerTenants | AllowSelectedPartnerTenants",
  "allowedPartnerTenantIds": ["guid1", "guid"2, ...] // Only if status is "AllowSelectedPartnerTenants"
}
```

## Set partner access settings

**INTRODUCED IN:** API version 2.22

Enable or disable delegated administrators and foreign multitenant apps to administer and access the environment. Optionally, allowlist only specific foreign Microsoft Entra tenants to administer and access the environment.

> [!IMPORTANT]
> Only internal global administrators can use this API endpoint. Delegated administrator or application authentication isn't supported.

```HTTP
PUT /admin/{apiVersion}/applications/{applicationFamily}/environments/{environmentName}/settings/partneraccess
```

### Route parameters

`apiVersion` - the version of the Admin Center API. Currently, the latest version is [!INCLUDE[admincenterapiversion](../developer/includes/admincenterapiversion.md)]

`applicationFamily` - the family of the environment's application (for example, "BusinessCentral")

`environmentName` - the name of the targeted environment

### Body

```JSON
{
  "status": "Disabled | AllowAllPartnerTenants | AllowSelectedPartnerTenants",
  "allowedPartnerTenantIds": ["guid1", "guid2", ...] // Only if status is "AllowSelectedPartnerTenants"
}
```

## Get access with Microsoft 365 licenses

**INTRODUCED IN:** API version 2.12

Returns a boolean value that indicates whether the environment allows access with Microsoft 365 licenses. Supported on environments of version 21.1 or later. Learn more at [Set Up Access with Microsoft 365 licenses](/dynamics365/business-central/admin-access-with-m365-license).

```HTTP
GET /admin/{apiVersion}/applications/{applicationFamily}/environments/{environmentName}/settings/accesswithm365licenses
```

### Route parameters

`apiVersion` - the version of the Admin Center API. Currently, the latest version is [!INCLUDE[admincenterapiversion](../developer/includes/admincenterapiversion.md)]

`applicationFamily` - the family of the environment's application (for example, "BusinessCentral")

`environmentName` - the name of the targeted environment

### Response

```JSON
{
  "enabled": true/false
}
```

## Set access with Microsoft 365 licenses

**INTRODUCED IN:** API version 2.12

Specifies whether users can access the environment with Microsoft 365 licenses. Supported on environments of version 21.1 or later. Learn more at [Set Up Access with Microsoft 365 licenses](/dynamics365/business-central/admin-access-with-m365-license).

```HTTP
Content-Type: application/json
POST /admin/{apiVersion}/applications/{applicationFamily}/environments/{environmentName}/settings/accesswithm365licenses
```

### Route parameters

`apiVersion` - the version of the Admin Center API. Currently, the latest version is [!INCLUDE[admincenterapiversion](../developer/includes/admincenterapiversion.md)]

`applicationFamily` - the family of the environment's application (for example, "BusinessCentral")

`environmentName` - the name of the targeted environment

### Body

```JSON
{ 
   "enabled": "true" 
} 
```

### Response

Returns 200 if successful.

## Set app update cadence for environment

**INTRODUCED IN:** API version 2.19

Specifies whether Marketplace apps installed on the environment should be updated with every major environment update or every major and minor update. Learn more at [Manage Apps](tenant-admin-center-manage-apps.md).

```HTTP
Content-Type: application/json
PUT /admin/{apiVersion}/applications/{applicationFamily}/environments/{environmentName}/settings/appSourceAppsUpdateCadence
```

### Route parameters

`apiVersion` - the version of the Admin Center API. Currently, the latest version is [!INCLUDE[admincenterapiversion](../developer/includes/admincenterapiversion.md)]

`applicationFamily` - the family of the environment's application (for example, "BusinessCentral")

`environmentName` - the name of the targeted environment

### Body

```JSON
{ 
   "value": string //Accepted values are 'Default', 'DuringMajorUpgrade', and 'DuringMajorMinorUpgrade'
} 
```

### Response

Returns 200 if successful.

## Related information

[The Business Central Administration Center API](administration-center-api.md)  
[Manage Apps](tenant-admin-center-manage-apps.md)  
[Microsoft Dynamics 365 Business Central Server Administration Tool](administration-tool.md)  
