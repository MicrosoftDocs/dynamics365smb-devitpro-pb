---
title: Analyzing Permission Error Trace Telemetry
description: Learn about the permission error telemetry in Business Central  
author: jswymer

ms.topic: concept-article
ms.devlang: al
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 07/27/2022
ms.author: jswymer
ms.reviewer: jswymer
---
# Analyzing Permission Error Trace Telemetry

[!INCLUDE[2022_releasewave1.md](../includes/2022_releasewave1.md)]

When a user gets an error dialog about lack of permissions while working in [!INCLUDE[prod_short](../developer/includes/prod_short.md)], a telemetry signal is emitted. This signal can be logged in an Application Insights resource.

This telemetry data let's you identify and analyze permission problems that users may experience in Business Central.

## Permission Error Shown

Occurs when a user gets a permissions-related error message in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] when they try to do an operation in the application.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Permission error shown**|
|severityLevel|**1**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**RT0031**|
|aadTenantId|The Microsoft Entra tenant ID that's used for Microsoft Entra authentication. For on-premises, if you aren't using Microsoft Entra authentication, this value is **common**. |
|alObjectId|If there's no value or the value is 0, then the permission error wasn't related to a specific object, which typically happens when `permissionArea` is something other than `Object`. |
|alObjectName|The name of the AL object that the user was trying to access, like a table or page. |
|alObjectType|The type of the AL object that the user was trying to access, like a table or page. |
|alStackTrace| [!INCLUDE[alStackTrace](../includes/include-telemetry-dimension-al-stacktrace.md)] |
|clientType|The type of client that executed the SQL Statement, such as **Background** or **Web**. For a list of the client types, see [ClientType Option Type](../developer/methods-auto/clienttype/clienttype-option.md).|
|companyName|The display name of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] company that was used at time of execution |
|component|**Dynamics 365 Business Central Server**|
|componentVersion|The version number of the component that emits telemetry (see the component dimension)|
|environmentName|The name of the tenant environment. See [Managing Environments](tenant-admin-center-environments.md). This dimension isn't included for [!INCLUDE[prod_short.md](../includes/prod_short.md)] on-premises environments.|
|environmentType|The environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
|errorMessage|The error string defined in the error method and displayed in the client.| 
|extensionName| [!INCLUDE[extensionName](../includes/include-telemetry-dimension-extension-name.md)] |
|extensionPublisher| [!INCLUDE[extensionPublisher](../includes/include-telemetry-dimension-extension-publisher.md)] |
|extensionVersion| [!INCLUDE[extensionVersion](../includes/include-telemetry-dimension-extension-version.md)] |
|extensionId| [!INCLUDE[extensionId](../includes/include-telemetry-dimension-extension-id.md)] |
|permissionArea|The area that the permission error is related to. Possible values include: `System`, `Entitlement`, `Company`, `Object`.|
|permissionType|The permission that the operation requires, but the user lacks. Possible values: `Delete`, `Execute`, `Insert`, `Modify`, `Read`, `Undefined` |
|telemetrySchemaVersion|The version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|

## Sample KQL code (permission error dialogs)

This KQL code can help you get started analyzing which permission error dialogs users see:

```kql
traces
| where timestamp > ago(60d) // adjust as needed
| where customDimensions.eventId == 'RT0031'
| project timestamp
// in which environment/company did it happen
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
// in which extension/app
, extensionId = customDimensions.extensionId
, extensionName = customDimensions.extensionName
, extensionVersion = customDimensions.extensionVersion
, extensionPublisher = customDimensions.extensionPublisher
// in which object
, alObjectId = customDimensions.alObjectId
, alObjectName = customDimensions.alObjectName
, alObjectType = customDimensions.alObjectType
// which user got the error
, usertelemetryId = case(
  toint( substring(customDimensions.componentVersion,0,2)) >= 20, user_Id // user telemetry id was introduced in the platform in version 20.0
, 'N/A'
)
// error information
, clientType = customDimensions.clientType
, errorMessage = customDimensions.errorMessage
, alStackTrace = customDimensions.alStackTrace
```

## Related information

[Upgrading Extensions](../developer/devenv-upgrading-extensions.md)  
[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  
