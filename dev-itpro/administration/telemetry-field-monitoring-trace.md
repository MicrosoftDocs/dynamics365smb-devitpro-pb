---
title: Analyzing Field Monitoring Telemetry
description: Learn about the telemetry for monitoring changes to sensitive data in Business Central  
author: jswymer
ms.topic: conceptual
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry, data, sensitive
ms.date: 05/01/2021
ms.author: jswymer
---

# Analyzing Field Monitoring Telemetry

[!INCLUDE[2020_releasewave2-17-1-later](../includes/2020_releasewave2-17-1-later.md)]

[!INCLUDE[azure-ad-to-microsoft-entra-id](~/../shared-content/shared/azure-ad-to-microsoft-entra-id.md)]

Keeping sensitive data secure and private is a core concern for most businesses. To add a layer of security, you can monitor important fields when someone changes a value. For example, you might want to know if someone changes your company's IBAN number.

To gather this data, you'll have to start field monitoring and specify the fields that you want to monitor.  For more information, see [Auditing Changes in Business Central - Monitoring Sensitive Fields](/dynamics365/business-central/across-log-changes#monitoring-sensitive-fields) in the Application help.

Telemetry is then logged for the following operations:

- When field monitoring is stopped or started
- When a field is added or removed for monitoring (only in version 18.0 and later)
- When a field value is changed  

## <a name="status"></a>Sensitive field monitor status changed

Occurs when the field monitor feature is started or stopped in the company.

<!--
{"Component":"Dynamics 365 Business Central Server","Telemetry schema version":"1.0","telemetrySchemaVersion":"1.0","Component version":"17.0.18204.18458","componentVersion":"17.0.18204.18458","Environment type":"Production","environmentType":"Production","deprecatedKeys":"AadTenantId, Environment name, Environment type, Telemetry schema version, Component, Component version, Telemetry schema version, AadTenantId, Environment name, Environment type","AadTenantId":"common","aadTenantId":"common","component":"Dynamics 365 Business Central Server","eventId":"AL0000DD3","alObjectId":"1392","alDataClassification":"SystemMetadata","alObjectName":"Monitor Sensitive Field","alObjectType":"CodeUnit","almonitorStatus":"Yes"}

-->

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Sensitive field monitor status has changed to {almonitorStatus}**|
|severityLevel|**1**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000DD3**|
|alMonitorStatus|**Yes** - the field monitor feature was started.<br /><br /> **No** the field monitor feature was stopped. This dimension is called "almonitorStatus" before version 18.0.|

<a name="other"></a>**Common custom dimensions**

The following table explains other custom dimensions that are common to all field monitoring traces. 

|Dimension|Description or value|
|---------|-----|
|aadTenantId| [!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)] |
|environmentName| [!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)] |
|environmentType| [!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)] |


## <a name="changed"></a>Sensitive field value has changed

Occurs the value of a monitored field has changed in the company.

<!-- example for reference:
{"Telemetry schema version":"1.0","telemetrySchemaVersion":"1.0","Component version":"17.0.18204.18458","componentVersion":"17.0.18204.18458","Environment type":"Production","environmentType":"Production","deprecatedKeys":"AadTenantId, Environment name, Environment type, Telemetry schema version, Component, Component version, Telemetry schema version, AadTenantId, Environment name, Environment type","aadTenantId":"common","AadTenantId":"common","alObjectId":"1367","component":"Dynamics 365 Business Central Server","Component":"Dynamics 365 Business Central Server","eventId":"AL0000CTE","alDataClassification":"SystemMetadata","altableCaption":"Customer","alfieldCaption":"Name","alObjectType":"CodeUnit","alObjectName":"Monitor Sensitive Field Data"}

-->

### General dimensions


|Dimension|Description or value|
|---------|---------|
|message|**Sensitive field value has changed: {alfieldCaption} ({alFieldNumber}) in table {altableCaption} ({alTableNumber})**|
|severityLevel|**1**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|--------------------|
|eventId|**AL0000CTE**|
|alFieldCaption|Specifies the name of the field that was changed. This dimension is called "alfieldCaption" before version 18.0.|
|alFieldNumber|Specifies the ID of the field that was changed. This dimension was introduced in version 18.0. |
|alTableCaption|Specifies the name of the table that includes the changed field. This dimension is called "altableCaption" before version 18.0. |
|alTableNumber|Specifies the ID of the table that includes the changed field. This dimension was introduced in version 18.0. |
|[See common custom dimensions](#other)||

> [!NOTE]
> Changes to fields in the following tables are always logged: 
> - Fields in the **Field Monitoring Setup** table. Many of the fields are included on the **Field Monitoring Setup** page.
> - Fields in the **Change Log Setup (Field)** table. Many of the fields are included on the **Field Monitoring Worksheet** page.
> - The **Contact Email** field in the **User** table.

## <a name="added"></a>Sensitive field added to or removed from monitor

Occurs when a field has been added to or removed from monitoring. This dimension was introduced in version 18.0.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Sensitive field added to monitor: {alfieldCaption} ({alFieldNumber}) in table {alTableCaption} ({alTableNumber})**<br />or<br />**Sensitive field removed from monitor: {alfieldCaption} ({alFieldNumber}) in table {alTableCaption} ({alTableNumber})**|
|severityLevel|**1**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |


### Custom dimensions

|Dimension|Description or value|
|---------|--------------------|
|eventId|**AL0000EMW**|
|alFieldCaption|Specifies the name of the field that was added or removed. |
|alFieldNumber|Specifies the ID of the field that was added or removed.  |
|alTableNumber|Specifies the ID of the table that includes the added or removed field. |
|alTableCaption|Specifies the name of the table that includes the added or removed field.|
|[See common custom dimensions](#other)||


<!--
{"Telemetry schema version":"1.0","telemetrySchemaVersion":"1.0","extensionVersion":"18.1.24822.0","extensionPublisher":"Microsoft","Component version":"18.0.24800.0","Extension version":"18.1.24822.0","componentVersion":"18.0.24800.0","Environment type":"Production","Extension App Id":"437dbf0e-84ff-417a-965d-ed2bb9650972","environmentType":"Production","deprecatedKeys":"AadTenantId, Environment name, Environment type, Telemetry schema version, Component, Component version, Telemetry schema version, AadTenantId, Environment name, Environment type","Extension name":"Base Application","extensionName":"Base Application","alObjectType":"CodeUnit","alObjectName":"Monitor Sensitive Field Data","aadTenantId":"common","AadTenantId":"common","extensionId":"437dbf0e-84ff-417a-965d-ed2bb9650972","alObjectId":"1367","Component":"Dynamics 365 Business Central Server","component":"Dynamics 365 Business Central Server","eventId":"AL0000EMW","alDataClassification":"SystemMetadata","alFieldCaption":"Address 2","alTableCaption":"Customer","alFieldNumber":"6","alTableNumber":"18"}


{"Telemetry schema version":"1.0","telemetrySchemaVersion":"1.0","extensionPublisher":"Microsoft","Component version":"18.0.24800.0","Extension version":"18.1.24822.0","extensionVersion":"18.1.24822.0","componentVersion":"18.0.24800.0","Environment type":"Production","Extension App Id":"437dbf0e-84ff-417a-965d-ed2bb9650972","environmentType":"Production","deprecatedKeys":"AadTenantId, Environment name, Environment type, Telemetry schema version, Component, Component version, Telemetry schema version, AadTenantId, Environment name, Environment type","Extension name":"Base Application","extensionName":"Base Application","alObjectName":"Monitor Sensitive Field Data","alObjectType":"CodeUnit","aadTenantId":"common","AadTenantId":"common","extensionId":"437dbf0e-84ff-417a-965d-ed2bb9650972","alObjectId":"1367","component":"Dynamics 365 Business Central Server","Component":"Dynamics 365 Business Central Server","eventId":"AL0000EMW","alDataClassification":"SystemMetadata","alFieldCaption":"Name 2","alTableCaption":"Vendor","alFieldNumber":"4","alTableNumber":"23"}

-->
## See also
[Changelog configuration telemetry](telemetry-changelog-configuration-trace.md)
[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  
[Alert on telemetry](telemetry-alert.md)