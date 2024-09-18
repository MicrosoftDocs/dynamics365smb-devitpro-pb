---
title: Business Central Admin Center API - Environment Settings
description: Learn about the Business Central administration center API for setting up environments.
author: jswymer
ms.topic: conceptual
ms.devlang: al
ms.reviewer: solsen
ms.search.keywords: administration, tenant, admin, environment, telemetry
ms.date: 02/24/2023
---
# Business Central Admin Center API - Environment Settings

[!INCLUDE[azure-ad-to-microsoft-entra-id](~/../shared-content/shared/azure-ad-to-microsoft-entra-id.md)]

Allows you to manage environment-specific settings such as the AppInsights key or the update window. 

## Get Update Settings

Returns the update settings for the environment.

```
GET /admin/v2.22/applications/{applicationFamily}/environments/{environmentName}/settings/upgrade
```

### Route Parameters

`applicationFamily` - Family of the environment's application as is. (for example "BusinessCentral")

`environmentName` - Name of the targeted environment

### Response

Returns the environment's update settings, or "null" if none exist

```
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

### Expected Error Codes

`environmentNotFound` - the targeted environment couldn't be found

   - target: {applicationFamily}/{environmentName}

## Get Time Zones for Update Settings

**INTRODUCED IN:** API version 2.13

Returns a list of time zones and basic information associated with them, such as daylight saving time and the current offset from Coordinated Universal Time (UTC). Time zone identifiers are the only allowed values for the `timeZoneId` parameter of the update settings.

```
GET /admin/v2.22/applications/settings/timezones
```
 
### Response
 
Returns a wrapped array of time zones.

```
{
  "value":
    [
      {
        "id": string, // Time zone identifier (for example, "Romance Standard Time")
        "displayName": string, // Display name of the time zone (for example, "(UTC+01:00) Brussels, Copenhagen, Madrid, Paris")
        "currentUtcOffset": string, // Offset from UTC, expressed as a time span with +/-HH:mm format (for example, "+01:00", "-09:00")
        "supportsDaylightSavingTime": boolean, // Indicates whether the time zone supports daylight saving time rules
        "isCurrentlyDaylightSavingTime": boolean, // Indicates whether daylight saving time is in effect for the given time zone, at the instant the request is issued
      }
    ]
}
```

## Put Update Settings

Sets the update window start and end times.

```
Content-Type: application/json
PUT /admin/v2.22/applications/{applicationFamily}/environments/{environmentName}/settings/upgrade
```

### Route Parameters

`applicationFamily` - Family of the environment's application as is. (for example "BusinessCentral")

`environmentName` - Name of the targeted environment

### Body

With API version 2.13 and later, there are two different parameter sets for defining the update window: the *wall-time + timezone* parameter set and the *UTC* parameter set. Consumers can provide either parameter set, but not both. Earlier API versions only support the UTC parameter set.

- The wall-time + timezone parameter set identifies the clock time (or "real time")&mdash;expressed in 24-hour format, like "22:00" for 10:00 PM or "07:30" for 7:30 AM&mdash;for a given time zone. The time zone ID must be a valid [Windows time zone identifier](/windows-hardware/manufacture/desktop/default-time-zones), for example, "Romance Standard Time" or "Pacific Standard Time".
- The UTC parameter set identifies the start and end times in Coordinated Universal Time.

> [!NOTE]
> If the UTC parameter set is used when modifying the update window settings and the country of the environment supports multiple time zones, the time zone shown on the Environment Details page in the admin center will be reset to the default time zone for the country, which may not always be desirable. We recommend to use the new parameter set when consuming API v2.13 and later.

Example with wall-time + timezone parameter set (supported only by API v2.13 and later):

```
{

  "preferredStartTime": string, // Start of environment update window,

  "preferredEndTime": string, // End of environment update window

  "timeZoneId": string // Windows time zone identifier

}
```

Example with UTC parameter set:

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

`ScheduledUpgradeConstraintViolation` - the update window conflicts with the current update date that's set for the environment. Either the update would occur outside the allowed update date range or, if the update date is today, the update window is in the past. Adjust the update window or change the update date.


## Put AppInsights key

Sets the connection string or instrumentation key an environment uses for Azure Application Insights resource, which you can use to gather telemetry. For information about Application Insights and the connection string/instrumentation key, go to [Enable Environment Telemetry](telemetry-enable-application-insights.md#appinsights).

> [!IMPORTANT]
> This process requires a restart to the environment, which is triggered automatically when you call this API. Plan to do this during non-working hours to avoid disruptions.

```
Content-Type: application/json
PUT /admin/v2.22/applications/{applicationFamily}/environments/{environmentName}/settings/appinsightskey
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

Gets the Microsoft Entra group currently assigned to an environment.

```
GET /admin/v2.22/applications/{applicationFamily}/environments/{environmentName}/settings/securitygroupaccess
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

Assigns a Microsoft Entra group to an environment.

```
Content-Type: application/json
POST /admin/v2.22/applications/{applicationFamily}/environments/{environmentName}/settings/securitygroupaccess
```

### Route Parameters

`applicationFamily` - Family of the environment's application (for example, "BusinessCentral")

`environmentName` - Name of the targeted environment

### Body

```
{
  "Value": GUID, // The object Id of the Microsoft Entra group, "11111111-aaaa-2222-bbbb-222222222222"
}
```

### Response

Returns 200 if successful, or 404 if the group doesn't exist in Microsoft Entra ID.

## Clear Security Group

**INTRODUCED IN:** API version 2.8

Clears a Microsoft Entra group that is currently assigned to an environment.

```
DELETE /admin/v2.22/applications/{applicationFamily}/environments/{environmentName}/settings/securitygroupaccess
```

### Route Parameters

`applicationFamily` - Family of the environment's application (for example, "BusinessCentral")

`environmentName` - Name of the targeted environment

## Get foreign tenants with access to Business Central

**INTRODUCED IN:** API version 2.22

Returns a list of all foreign tenants that have access to Business Central, either because the tenant has an active GDAP relationship that includes a supported Entra role or because the tenant is home to a multitenant app that has permissions to Business Central APIs.

> [!IMPORTANT]
> This API endpoint can only be used by internal administrators. Authentication as delegated administrator or application is not supported.

```
GET /admin/v2.22/aadTenantInfo/foreigntenants
```

### Response
```
{
  value:  [
    {
      "tenantId": "guid",
      "displayName": "Contoso",
      "domain": "contoso.com",
      "accessType": "Gdap | App | GdapAndApp"
    },
    {
      ...
    }
    ...
  ]
}
```

## Get partner access settings

**INTRODUCED IN:** API version 2.22

Returns a boolean value that indicates whether the environment allows access for delegated administrators and foreign multitenant apps and a list of allowlisted foreign Entra tenant IDs.

> [!IMPORTANT]
> This API endpoint can only be used by internal administrators. Authentication as delegated administrator or application is not supported.

```
GET /admin/v2.22/applications/{applicationFamily}/environments/{environmentName}/settings/partneraccess
```

### Route Parameters

`applicationFamily` - Family of the environment's application (for example, "BusinessCentral")

`environmentName` - Name of the targeted environment

### Response

```
{
  "status": "Disabled | AllowAllPartnerTenants | AllowSelectedPartnerTenants",
  "allowedPartnerTenantIds": ["guid1", "guid"2, ...] //Only if status is "AllowSelectedPartnerTenants"
}
```

## Update partner access settings

**INTRODUCED IN:** API version 2.22

Enable/disable delegated administrators and foreign multitenant apps to/from administering and accessing the environment, optionally allowlist only specific foreign Entra tenants to administer and access the environment.

> [!IMPORTANT]
> This API endpoint can only be used by internal administrators. Authentication as delegated administrator or application is not supported.

```
PUT /admin/v2.22/applications/{applicationFamily}/environments/{environmentName}/settings/partneraccess
```

### Route Parameters

`applicationFamily` - Family of the environment's application (for example, "BusinessCentral")

`environmentName` - Name of the targeted environment

### Body

```
{
  "status": "Disabled | AllowAllPartnerTenants | AllowSelectedPartnerTenants",
  "allowedPartnerTenantIds": ["guid1", "guid2", ...] //Only if status is "AllowSelectedPartnerTenants"
}
```

## Get access with Microsoft 365 licenses

**INTRODUCED IN:** API version 2.12

Returns a boolean value that indicates whether the environment allows access with Microsoft 365 licenses. Supported on environments of version 21.1 or later. Learn more at [Set Up Access with Microsoft 365 licenses](/dynamics365/business-central/admin-access-with-m365-license).

```
GET /admin/v2.22/applications/{applicationFamily}/environments/{environmentName}/settings/accesswithm365licenses
```

### Route Parameters

`applicationFamily` - Family of the environment's application (for example, "BusinessCentral")

`environmentName` - Name of the targeted environment

### Response

```
{
  "enabled": true/false
}
```

## Set access with Microsoft 365 licenses

**INTRODUCED IN:** API version 2.12

Specifies whether users can access the environment with Microsoft 365 licenses. Supported on environments of version 21.1 or later. Learn more at [Set Up Access with Microsoft 365 licenses](/dynamics365/business-central/admin-access-with-m365-license).

```
Content-Type: application/json
POST /admin/v2.22/applications/{applicationFamily}/environments/{environmentName}/settings/accesswithm365licenses
```

### Route Parameters

`applicationFamily` - Family of the environment's application (for example, "BusinessCentral")

`environmentName` - Name of the targeted environment

### Body

```
{ 
   "enabled": "true" 
} 
```

### Response

Returns 200 if successful.

## Set App Update Cadence for Environment

**INTRODUCED IN:** API version 2.19

Specifies whether AppSource apps installed on the environment should be updated with every major environment update or every major and minor update. Learn more at [Manage Apps](tenant-admin-center-manage-apps.md).

```
Content-Type: application/json
POST /admin/v2.22/applications/{applicationFamily}/environments/{environmentName}/settings/appSourceAppsUpdateCadence
```

### Route Parameters

`applicationFamily` - Family of the environment's application (for example, "BusinessCentral")

`environmentName` - Name of the targeted environment

### Body

```
{ 
   "value": string //Accepted values are 'Default', 'DuringMajorUpgrade', and 'DuringMajorMinorUpgrade'
} 
```

### Response

Returns 200 if successful.


## See Also

[The Business Central Administration Center API](administration-center-api.md)  
[Manage Apps](tenant-admin-center-manage-apps.md)  
[Microsoft Dynamics 365 Business Central Server Administration Tool](administration-tool.md)  
