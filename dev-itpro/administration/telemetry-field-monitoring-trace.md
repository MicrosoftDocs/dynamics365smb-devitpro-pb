---
title: Analyzing Field Monitoring Telemetry
description: Learn about the telemetry for monitoring changes to sensitive data in Business Central  
author: jswymer
ms.service: dynamics365-business-central
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

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000DD3**|
|alMonitorStatus|**Yes** - the field monitor feature was started.<br /><br /> **No** the field monitor feature was stopped. This dimension is called "almonitorStatus" before version 18.0.|
|alObjectId|**1392**|
|alObjectName|**Monitor Sensitive Field**|
|alObjectType|**CodeUnit**|

<a name="other"></a>**Common custom dimensions**

The following table explains other custom dimensions that are common to all field monitoring traces. 

|Dimension|Description or value|
|---------|-----|
|aadTenantId|Specifies that Azure Active Directory (Azure AD) tenant ID used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
|alDataClassification|**SystemMetadata**|
|component|**Dynamics 365 Business Central Server**.|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|deprecatedKeys|Specifies a comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We recommend that update any queries that use these keys to use the new key name.|
|environmentName|Specifies the name of the tenant environment. See [Managing Environments](tenant-admin-center-environments.md). This dimension isn't included for [!INCLUDE[prod_short.md](../includes/prod_short.md)] on-premises environments.|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
|extensionName|Specifies the name of the base application. |
|extensionId|Specifies the ID of the base extension.|
|extensionPublisher|Specifies the publisher of the extension.|
|extensionVersion|Specifies the version of the base application.|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|


## <a name="changed"></a>Sensitive field value has changed

Occurs the value of a monitored field has changed in the company.

<!-- example for reference:
{"Telemetry schema version":"1.0","telemetrySchemaVersion":"1.0","Component version":"17.0.18204.18458","componentVersion":"17.0.18204.18458","Environment type":"Production","environmentType":"Production","deprecatedKeys":"AadTenantId, Environment name, Environment type, Telemetry schema version, Component, Component version, Telemetry schema version, AadTenantId, Environment name, Environment type","aadTenantId":"common","AadTenantId":"common","alObjectId":"1367","component":"Dynamics 365 Business Central Server","Component":"Dynamics 365 Business Central Server","eventId":"AL0000CTE","alDataClassification":"SystemMetadata","altableCaption":"Customer","alfieldCaption":"Name","alObjectType":"CodeUnit","alObjectName":"Monitor Sensitive Field Data"}

-->

### General dimensions


|Dimension|Description or value|
|---------|---------|
|alTableNumber|Specifies the ID of the table where the changed field is included. This dimension was introduced in version 18.0. |
|message|**Sensitive field value has changed: {alfieldCaption} ({alFieldNumber}) in table {altableCaption} ({alTableNumber})**|
|severityLevel|**1**|


### Custom dimensions

|Dimension|Description or value|
|---------|--------------------|
|eventId|**AL0000CTE**|
|alFieldCaption|Specifies the name of the field that was changed. This dimension is called "alfieldCaption" before version 18.0.|
|alFieldNumber|Specifies the ID of the field that was changed. This dimension was introduced in version 18.0. |
|alTableCaption|Specifies the name of the table that includes the changed field. This dimension is called "altableCaption" before version 18.0. |
|alTableNumber|Specifies the ID of the table that includes the changed field. This dimension was introduced in version 18.0. |
|alObjectId|**1367**|
|alObjectName|**Monitor Sensitive Field Data**|
|alObjectType|**CodeUnit**|
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

### Custom dimensions

|Dimension|Description or value|
|---------|--------------------|
|eventId|**AL0000EMW**|
|alFieldCaption|Specifies the name of the field that was added or removed. |
|alFieldNumber|Specifies the ID of the field that was added or removed.  |
|alTableNumber|Specifies the ID of the table that includes the added or removed field. |
|alTableCaption|Specifies the name of the table that includes the added or removed field.|
|alObjectId|**1367**|
|alObjectName|**Monitor Sensitive Field Data**|
|alObjectType|**CodeUnit**|
|[See common custom dimensions](#other)||


<!--
{"Telemetry schema version":"1.0","telemetrySchemaVersion":"1.0","extensionVersion":"18.1.24822.0","extensionPublisher":"Microsoft","Component version":"18.0.24800.0","Extension version":"18.1.24822.0","componentVersion":"18.0.24800.0","Environment type":"Production","Extension App Id":"437dbf0e-84ff-417a-965d-ed2bb9650972","environmentType":"Production","deprecatedKeys":"AadTenantId, Environment name, Environment type, Telemetry schema version, Component, Component version, Telemetry schema version, AadTenantId, Environment name, Environment type","Extension name":"Base Application","extensionName":"Base Application","alObjectType":"CodeUnit","alObjectName":"Monitor Sensitive Field Data","aadTenantId":"common","AadTenantId":"common","extensionId":"437dbf0e-84ff-417a-965d-ed2bb9650972","alObjectId":"1367","Component":"Dynamics 365 Business Central Server","component":"Dynamics 365 Business Central Server","eventId":"AL0000EMW","alDataClassification":"SystemMetadata","alFieldCaption":"Address 2","alTableCaption":"Customer","alFieldNumber":"6","alTableNumber":"18"}


{"Telemetry schema version":"1.0","telemetrySchemaVersion":"1.0","extensionPublisher":"Microsoft","Component version":"18.0.24800.0","Extension version":"18.1.24822.0","extensionVersion":"18.1.24822.0","componentVersion":"18.0.24800.0","Environment type":"Production","Extension App Id":"437dbf0e-84ff-417a-965d-ed2bb9650972","environmentType":"Production","deprecatedKeys":"AadTenantId, Environment name, Environment type, Telemetry schema version, Component, Component version, Telemetry schema version, AadTenantId, Environment name, Environment type","Extension name":"Base Application","extensionName":"Base Application","alObjectName":"Monitor Sensitive Field Data","alObjectType":"CodeUnit","aadTenantId":"common","AadTenantId":"common","extensionId":"437dbf0e-84ff-417a-965d-ed2bb9650972","alObjectId":"1367","component":"Dynamics 365 Business Central Server","Component":"Dynamics 365 Business Central Server","eventId":"AL0000EMW","alDataClassification":"SystemMetadata","alFieldCaption":"Name 2","alTableCaption":"Vendor","alFieldNumber":"4","alTableNumber":"23"}

-->
## See also

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  
