---
title: Analyze Configuration Package Telemetry
description: Learn about the telemetry for configuration package telemetry for Azure Application Insights.  
author: jswymer
ms.topic: concept-article
ms.devlang: al
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 09/22/2026
ms.author: jswymer
ms.reviewer: jswymer
ai-usage: ai-assisted
---

# Analyze configuration package telemetry

**APPLIES TO:** [!INCLUDE[prod_short](../includes/prod_short.md)] 2020 release wave 2, version 17.2, and later

Configuration package telemetry gathers data about the following operations on configuration packages:

- Export
- Import
- Apply 
- Delete

For information about working with configuration packages, see [Prepare a Configuration Package](/dynamics365/business-central/admin-how-to-prepare-a-configuration-package) in the [!INCLUDE[prod_short](../includes/prod_short.md)] Application Help.

These events come from AL application code. The application source uses the event ID without the `AL` prefix. For example, the source ID `0000E3N` appears as `AL0000E3N` in Application Insights. Learn more in [Find AL event IDs in the application source](telemetry-event-ids.md#find-al-event-ids-in-the-application-source).

## <a name="other"></a>Common custom dimensions
The following table explains custom dimensions that are common to all configuration package traces. 

|Dimension|Description or value|
|---------|-----|
|aadTenantId|Specifies the Microsoft Entra tenant ID used for Microsoft Entra authentication. For on-premises, if you aren't using Microsoft Entra authentication, this value is **common**. |
|alCategory|**RapidStart**|
|alDataClassification|**SystemMetadata**|
|clientType|Specifies the type of client that executed the SQL Statement, such as **Background** or **Web**. For a list of the client types, see [ClientType Option Type](../developer/methods-auto/clienttype/clienttype-option.md). Added in version 20.0.|
|companyName|The name of the company where the operation is applied. Added in version 20.0. |
|component|**Dynamics 365 Business Central Server**.|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments).|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|


## <a name="exportstarted"></a>Configuration package export started

Occurs when an export operation on a configuration package is started.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Configuration package export started: {packageSystemId}**|
|severityLevel|**1**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000E3F**|
|alExecutionId|Specifies the GUID that correlates the start and completion events for the export operation.|
|alPackageCode|Specifies the system ID (GUID) of the configuration package being exported. The dimension name is retained for compatibility.|
|[See common custom dimensions](#other)||


## <a name="exportsuccessful"></a>Configuration package exported successfully

Occurs when an export operation on a configuration package completes successfully. 

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Configuration package exported successfully: {packageSystemId}**|
|severityLevel|**1**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000E3G**|
|alExecutionId|Specifies the GUID that correlates the start and completion events for the export operation.|
|alExecutionTimeInMs|Specifies the number of milliseconds it took to complete the export operation.|
|alPackageCode|Specifies the system ID (GUID) of the configuration package that was exported. The dimension name is retained for compatibility.|
|[See common custom dimensions](#other)||


## <a name="importstarted"></a>Configuration package import started

Occurs when an import operation on a configuration package is started. 

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Configuration package import started: {packageSystemId}**|
|severityLevel|**1**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |


### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000E3H**|
|alExecutionId|Specifies the GUID that correlates the start and completion events for the import operation.|
|[See common custom dimensions](#other)||


## <a name="importsuccessful"></a>Configuration package imported successfully

Occurs when an import operation on a configuration package completes successfully.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Configuration package imported successfully: {packageSystemId}**|
|severityLevel|**1**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000E3I**|
|alExecutionTimeInMs|Specifies the number of milliseconds it took to complete the import operation.|
|alExecutionId|Specifies the GUID that correlates the start and completion events for the import operation.|
|alFileSizeInBytes|Specifies the approximate size of the imported XML content in bytes.|
|[See common custom dimensions](#other)||


## <a name="applystarted"></a>Configuration package apply started

Occurs when an apply operation on a configuration package is started.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Configuration package apply started: {packageSystemId}**|
|severityLevel|**1**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000E3N**|
|alExecutionId|Specifies the GUID that correlates the start and completion events for the apply operation.|
|alPackageCode|Specifies the system ID (GUID) of the configuration package being applied. The dimension name is retained for compatibility.|
|[See common custom dimensions](#other)||


## <a name="applysuccessful"></a>Configuration package applied successfully

Occurs when an apply operation on a configuration package completes successfully.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Configuration package applied successfully: {packageSystemId}**|
|severityLevel|**1**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000E3O**|
|alExecutionId|Specifies the GUID that correlates the start and completion events for the apply operation.|
|alExecutionTimeInMs|Specifies the number of milliseconds it took to complete the apply operation.|
|alErrorCount|Specifies the number of errors that occurred when applying the configuration package.|
|alFieldCount|Specifies the number of fields that were included in the migration table of the applied configuration package. |
|alPackageCode|Specifies the system ID (GUID) of the configuration package that was applied. The dimension name is retained for compatibility.|
|alRecordCount|Specifies the number of records that were included in the applied configuration package.|
|[See common custom dimensions](#other)||


## <a name="deletesuccessful"></a>Configuration package deleted successfully

Occurs when a configuration package is deleted successfully.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Configuration package deleted successfully: {packageSystemId}**|
|severityLevel|**1**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000E3P**|
|alPackageCode|Specifies the system ID (GUID) of the configuration package that was deleted. The dimension name is retained for compatibility.|
|[See common custom dimensions](#other)||


## Related information

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  
[Prepare a Configuration Package](/dynamics365/business-central/admin-how-to-prepare-a-configuration-package) in the [!INCLUDE[prod_short](../includes/prod_short.md)]  
[Telemetry event IDs in Application Insights](telemetry-event-ids.md)
