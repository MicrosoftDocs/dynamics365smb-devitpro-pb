---
title: Analyzing Permission Changes Trace Telemetry
description: Learn about the telemetry for permission changes made in Business Central  
author: jswymer
ms.topic: conceptual
ms.devlang: al
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 04/01/2021
ms.author: jswymer
---

# Analyzing Permission Changes Trace Telemetry

**APPLIES TO:** [!INCLUDE[prod_short](../includes/prod_short.md)] 2020 release wave 2, version 17.2, and later

[!INCLUDE[azure-ad-to-microsoft-entra-id](~/../shared-content/shared/azure-ad-to-microsoft-entra-id.md)]

Permission changes telemetry gathers data about the following operations on permission sets: 

- A user-defined permission set was added or removed
- A link between a user-defined permission set and system permission set was added or removed
- A permission set was assigned to or removed from a user or user group
- A permission set was changed by an app/extension

For information about managing permission sets, see [Assign Permissions to Users and Groups](/dynamics365/business-central/ui-define-granular-permissions).


## <a name="other"></a>Common custom dimensions

The following table explains custom dimensions that are common to all permission traces. 

|Dimension|Description or value|
|---------|-----|
|aadTenantId|Specifies the Microsoft Entra tenant ID used for Microsoft Entra authentication. For on-premises, if you aren't using Microsoft Entra authentication, this value is **common**. |
|alCategory|**AL PermissionSet**|
|alDataClassification|**SystemMetadata**|
|alObjectId|**1351**, which is the ID of the system application codeunit that subscribes to the telemetry events.|
|alObjectName|**Telemetry Subscribers**, which is the name of the system application codeunit that subscribes to the telemetry events.|
|alObjectType|**CodeUnit**|
|component|**Dynamics 365 Business Central Server**.|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments).|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|


## <a name="setadded"></a>User-defined permission set added

Occurs when a user-defined permission set is created.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**User-defined permission set added: {alPermissionSetId}**|
|severityLevel|**1**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000E2A**|
|alNumberOfUserDefinedPermissionSets|Specifies the total number of user-defined permission sets.|
|alPermissionSetId|Specifies the ID assigned to the permission set.|

### Sample KQL code (user-defined permission set added)

This KQL code can help you get started analyzing when a user-defined permission set was added.

```kql
// User-defined permission set added 
traces
| timestamp > ago(60d) // adjust as needed
| where customDimensions has 'AL0000E2A'
| where customDimensions.eventId == 'AL0000E2A'
| project timestamp
// in which environment/company did it happen
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
// what was changed
, alNumberOfUserDefinedPermissionSets = customDimensions.alNumberOfUserDefinedPermissionSets
, alPermissionSetId = customDimensions.alPermissionSetId
// which user did it
, usertelemetryId = case(
  toint( substring(customDimensions.componentVersion,0,2)) >= 20, user_Id // user telemetry ID was introduced in the platform in version 20.0
, 'N/A'
)
```

<!--
{"component":"Dynamics 365 Business Central Server","Telemetry schema version":"1.0","telemetrySchemaVersion":"1.0","Component version":"17.0.18466.0","componentVersion":"17.0.18466.0","Environment type":"Production","environmentType":"Production","deprecatedKeys":"AadTenantId, Environment name, Environment type, Telemetry schema version, Component, Component version, Telemetry schema version, AadTenantId, Environment name, Environment type","aadTenantId":"common","AadTenantId":"common","Component":"Dynamics 365 Business Central Server","eventId":"AL0000E2A","alObjectId":"1351","alObjectName":"Telemetry Subscribers","alObjectType":"CodeUnit","alDataClassification":"SystemMetadata","alCategory":"AL PermissionSet","alNumberOfUserDefinedPermissionSets":"10","alPermissionSetId":"EMAIL SETUP COPY"}

-->

## <a name="setremoved"></a>User-defined permission set removed

Occurs when a user-defined permission set is deleted.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**User-defined permission set removed: {alPermissionSetId}**|
|severityLevel|**1**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000E2B**|
|alNumberOfUserDefinedPermissionSets|Specifies the total number of user-defined permission sets.|
|alPermissionSetId|Specifies the ID of the permission set that was deleted.|
|[See common custom dimensions](#other)||

### Sample KQL code (User-defined permission set removed)

This KQL code can help you get started analyzing when a user-defined permission set was removed.

```kql
// User-defined permission set removed 
traces
| where timestamp > ago(60d) // adjust as needed
| where customDimensions.eventId == 'AL0000E2B'
| project timestamp
// in which environment/company did it happen
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
// what was changed
, alNumberOfUserDefinedPermissionSets = customDimensions.alNumberOfUserDefinedPermissionSets
, alPermissionSetId = customDimensions.alPermissionSetId
// which user did it
, usertelemetryId = case(
  toint( substring(customDimensions.componentVersion,0,2)) >= 20, user_Id // user telemetry ID was introduced in the platform in version 20.0
, 'N/A'
)
```


## <a name="linkadded"></a>Permission set link added

Occurs when a user-defined permission set is created from a copy of a system permission set, and the **Notify on Changed Permission Set** option is selected. The **Notify on Changed Permission Set** option creates a link between the system permission set and the user-defined permission set. 

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Permission set link added: {alSourcePermissionSetId} -> {alLinkedPermissionSetId}**|
|severityLevel|**1**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000E28**|
|alSourcePermissionSetId|Specifies the ID of the system permission set that was copied to create the user-defined permission set.|
|alLinkedPermissionSetId|Specifies the ID of the user-defined permission that was created from a copy of the system permission set.|
|alNumberOfUserDefinedPermissionSetLinks|Specifies the total number of user-defined permission sets that are linked to system permission sets.|
|[See common custom dimensions](#other)||

### Sample KQL code (permission set link added)

This KQL code can help you get started analyzing when a permission set link was added.

```kql
// Permission set link added 
traces
| where timestamp > ago(60d) // adjust as needed
| where customDimensions.eventId == 'AL0000E28'
| project timestamp
// in which environment/company did it happen
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
// what was changed
, alSourcePermissionSetId = customDimensions.alSourcePermissionSetId
, alLinkedPermissionSetId = customDimensions.alLinkedPermissionSetId
, alNumberOfUserDefinedPermissionSetLinks = customDimensions.alNumberOfUserDefinedPermissionSetLinks
// which user did it
, usertelemetryId = case(
  toint( substring(customDimensions.componentVersion,0,2)) >= 20, user_Id // user telemetry ID was introduced in the platform in version 20.0
, 'N/A'
)
```

## <a name="linkremoved"></a>Permission set link removed

Occurs when a user-defined permission set, which is linked to a system permission set, is deleted.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Permission set link removed {alSourcePermissionSetId} -> {alLinkedPermissionSetId}**|
|severityLevel|**1**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000E29**|
|alSourcePermissionSetId|Specifies the ID of the system permission set that the deleted user-defined permission set was linked to.|
|alLinkedPermissionSetId|Specifies the ID of the deleted user-defined permission set.|
|alNumberOfUserDefinedPermissionSetLinks|Specifies the total number of user-defined permission sets that are linked to system permission sets.|
|[See common custom dimensions](#other)||

### Sample KQL code (Permission set link removed)

This KQL code can help you get started analyzing when a permission set link was removed.

```kql
// Permission set link removed 
traces
| where timestamp > ago(60d) // adjust as needed
| where customDimensions.eventId == 'AL0000E29'
| project timestamp
// in which environment/company did it happen
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
// what was changed
, alSourcePermissionSetId = customDimensions.alSourcePermissionSetId
, alLinkedPermissionSetId = customDimensions.alLinkedPermissionSetId
, alNumberOfUserDefinedPermissionSetLinks = customDimensions.alNumberOfUserDefinedPermissionSetLinks
// which user did it
, usertelemetryId = case(
  toint( substring(customDimensions.componentVersion,0,2)) >= 20, user_Id // user telemetry ID was introduced in the platform in version 20.0
, 'N/A'
)
```


## <a name="assigneduser"></a>Permission set assigned to user 

Occurs when a permission set is assigned to a user.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Permission set assigned to user: {alPermissionSetId}**|
|severityLevel|**1**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000E2C**|
|alPermissionSetId|Specifies the ID of the permission set that was assigned to a user.|
|[See common custom dimensions](#other)||

### Sample KQL code (Permission set assigned to user)

This KQL code can help you get started analyzing when a permission set was assigned to a user.

```kql
// Permission set assigned to user 
traces
| where timestamp > ago(60d) // adjust as needed
| where customDimensions.eventId == 'AL0000E2C'
| project timestamp
// in which environment/company did it happen
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
// what was changed
, alPermissionSetId = customDimensions.alPermissionSetId
// which user did it
, usertelemetryId = case(
  toint( substring(customDimensions.componentVersion,0,2)) >= 20, user_Id // user telemetry ID was introduced in the platform in version 20.0
, 'N/A'
)
```


## <a name="removeduser"></a>Permission set removed from user  

Occurs when a permission set is removed from a user.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Permission set removed from user: {alPermissionSetId}**|
|severityLevel|**1**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000E2D**|
|alPermissionSetId|Specifies the ID of the permission set that was removed from the user.|
|[See common custom dimensions](#other)||


### Sample KQL code (Permission set removed from user)

This KQL code can help you get started analyzing when a permission set was removed from a user.

```kql
// Permission set removed from user 
traces
| where timestamp > ago(60d) // adjust as needed
| where customDimensions.eventId == 'AL0000E2D'
| project timestamp
// in which environment/company did it happen
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
// what was changed
, alPermissionSetId = customDimensions.alPermissionSetId
// which user did it
, usertelemetryId = case(
  toint( substring(customDimensions.componentVersion,0,2)) >= 20, user_Id // user telemetry ID was introduced in the platform in version 20.0
, 'N/A'
)
```


## <a name="assignedusergroup"></a>Permission set assigned to user group

Occurs when a permission set is assigned to a user group.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Permission set assigned to user group: {alPermissionSetId}**|
|severityLevel|**1**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000E2E**|
|alPermissionSetId|Specifies the ID of the permission set that was assigned to the user group.|
|alUserGroupId|Specifies the ID of the user group that the permission set was assigned to.|
|[See common custom dimensions](#other)||

### Sample KQL code (Permission set assigned to user group)

This KQL code can help you get started analyzing when a permission set was assigned to a user group.

```kql
// Permission set assigned to user group 
traces
| where timestamp > ago(60d) // adjust as needed
| where customDimensions.eventId == 'AL0000E2E'
| project timestamp
// in which environment/company did it happen
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
// what was changed
, alPermissionSetId = customDimensions.alPermissionSetId
, alUserGroupId = customDimensions.alUserGroupId
// which user did it
, usertelemetryId = case(
  toint( substring(customDimensions.componentVersion,0,2)) >= 20, user_Id // user telemetry ID was introduced in the platform in version 20.0
, 'N/A'
)
```


## <a name="removedusergroup"></a>Permission set removed from user group

Occurs when a permission set is removed from a user.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Permission set removed from user group: {alPermissionSetId}**|
|severityLevel|**1**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000E2F**|
|alPermissionSetId|Specifies the ID of the permission set that was removed from the user group.|
|alUserGroupId|Specifies the ID of the user group that the permission set was removed from.|
|[See common custom dimensions](#other)||


### Sample KQL code (Permission set removed from user group)

This KQL code can help you get started analyzing when a permission set was removed from a user group.

```kql
// Permission set removed from user group 
traces
| where timestamp > ago(60d) // adjust as needed
| where customDimensions has 'AL0000E2F'
| where customDimensions.eventId == 'AL0000E2F'
| project timestamp
// in which environment/company did it happen
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
// what was changed
, alPermissionSetId = customDimensions.alPermissionSetId
, alUserGroupId = customDimensions.alUserGroupId
// which user did it
, usertelemetryId = case(
  toint( substring(customDimensions.componentVersion,0,2)) >= 20, user_Id // user telemetry ID was introduced in the platform in version 20.0
, 'N/A'
)
```


## <a name="permissionsetchangedbyapp"></a>Permission set changed by an extension.

Occurs when a permission set was changed by an app/extension at install/update time.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Permission set changed by an extension**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**LC0058**|
|extensionName|Specifies the name of the app/extension that changed the permission set.|
|extensionId|Specifies the id of the app/extension that changed the permission set.|
|extensionVersion|Specifies the version of the app/extension that changed the permission set.|
|extensionpublisher|Specifies the publisher of the app/extension that changed the permission set.|
|permissionSetExtensionObjectId|Specifies the object ID for the permission set extension that changed the permission set.|
|permissionSetExtensionObjectName|Specifies the name of the object for the permission set extension that changed the permission set.|
|permissionSetId|Specifies the ID of the permission set that was changed.|
|permissionSetName|Specifies the name of the permission set that was changed.|
|[See common custom dimensions](#other)||

## Sample KQL code (analyze permission changes)

This KQL code can help you get started analyzing changes to permission sets. 

```kql
traces
| where timestamp > ago(60d) // adjust as needed
| where customDimensions.eventId == 'RT0011'
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
// what did the user do
, documentFormat = customDimensions.documentFormat   // documentFormat dimension added in version 20.0
, LayoutAppId = customDimensions.layoutAppId         // layout dimensions added in version 20.0
, LayoutName = customDimensions.layoutName           // layout dimensions added in version 20.0
, LayoutType = customDimensions.layoutType           // layout dimensions added in version 20.0
, reportAction = customDimensions.reportAction       // reportAction dimension added in version 20.0
, reportingEngine = customDimensions.reportingEngine // reportingEngine dimension was added in version 17.3
// which user ran the report
, usertelemetryId = case(
  toint( substring(customDimensions.componentVersion,0,2)) >= 20, user_Id // user telemetry ID was introduced in the platform in version 20.0
, 'N/A'
)
// why was the report cancelled
, cancelReason = tostring( customDimensions.cancelReason )
, alStackTrace = customDimensions.alStackTrace
```



## See also

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  
