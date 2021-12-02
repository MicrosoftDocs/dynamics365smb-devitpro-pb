---
title: Analyzing Analyzing Field Monitoring Telemetry
description: Learn about the telemetry for monitoring changes to sensitive data in Business Central  
author: jswymer
ms.service: dynamics365-business-central
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry, data, sensitive
ms.date: 11/09/2020
ms.author: jswymer
---

# Analyzing Field Monitoring Telemetry

[!INCLUDE[2020_releasewave1.md](../includes/2020_releasewave2.md)]

Keeping sensitive data secure and private is a core concern for most businesses. To add a layer of security, you can monitor important fields when someone changes a value. For example, you might want to be notified if someone changes your company's IBAN number. Both the addition of a field to be monitored and actual changes to a monitored field will be logged to telemetry.

To gather this data, field monitoring must be enabled. For more information, see [Auditing Changes in Business Central - Monitoring Sensitive Fields](/dynamics365/business-central/across-log-changes#monitoring-sensitive-fields) in the Application help.

## Sensitive field monitor status changed

Occurs when the field monitor feature is started or stopped in the company.


<!--
{"Component":"Dynamics 365 Business Central Server","Telemetry schema version":"1.0","telemetrySchemaVersion":"1.0","Component version":"17.0.18204.18458","componentVersion":"17.0.18204.18458","Environment type":"Production","environmentType":"Production","deprecatedKeys":"AadTenantId, Environment name, Environment type, Telemetry schema version, Component, Component version, Telemetry schema version, AadTenantId, Environment name, Environment type","AadTenantId":"common","aadTenantId":"common","component":"Dynamics 365 Business Central Server","eventId":"AL0000DD3","alObjectId":"1392","alDataClassification":"SystemMetadata","alObjectName":"Monitor Sensitive Field","alObjectType":"CodeUnit","almonitorStatus":"Yes"}

-->

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Sensitive field monitor status has changed to Yes** - the field monitor feature was started.<br /><br />**Sensitive field monitor status has changed to No** -  the field monitor feature was stopped.|
|severityLevel|**1**|

### Custom dimensions

<!--
The custom dimensions that are of particular interest for this operation include: numberOfRows, result, serverExecutionTime, sqlExecutes, sqlRowsRead, totalTime. For a description of these dimensions and other custom dimensions, see [Custom dimensions](#customdimensions).
-->
<!--
|Dimension|Description or value|
|---------|-----|
|numberOfRows|Specifies the number of rows generated for the report dataset.|
|result|**Success**.|
|serverExecutionTime|Specifies the amount of time it took the service to complete the request. The time has the format hh:mm:ss.sssssss.|
|sqlExecutes|Specifies the number of SQL statements that the report executed. |
|totalTime|Specifies the amount of time it took for the system to generate the dataset and render the report. The time has the format hh:mm:ss.sssssss.|
-->

|Dimension|Description or value|
|---------|-----|-----------|
|aadTenantId|Specifies that Azure Active Directory (Azure AD) tenant ID used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
|alDataClassification||
|almonitorStatus||
|alObjectId|Specifies the ID of the object that was run: **1392**.|
|alObjectName|Specifies the name of the object that was run: **Monitor Sensitive Field**.|
|alObjectType|Specifies the name of the object that was run: **CodeUnit**.|
|component|**Dynamics 365 Business Central Server**.|
|componentVersion|Specifies the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] version number.|
|deprecatedKeys|Specifies a comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We recommend that update any queries that use these keys to use the new key name.|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
|eventId|**AL0000DD3**|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] telemetry schema.|

## Sensitive field value has changed: Name in table Customer

Occurs the value of a monitored field has changed in the company.

<!--
{"Telemetry schema version":"1.0","telemetrySchemaVersion":"1.0","Component version":"17.0.18204.18458","componentVersion":"17.0.18204.18458","Environment type":"Production","environmentType":"Production","deprecatedKeys":"AadTenantId, Environment name, Environment type, Telemetry schema version, Component, Component version, Telemetry schema version, AadTenantId, Environment name, Environment type","aadTenantId":"common","AadTenantId":"common","alObjectId":"1367","component":"Dynamics 365 Business Central Server","Component":"Dynamics 365 Business Central Server","eventId":"AL0000CTE","alDataClassification":"SystemMetadata","altableCaption":"Customer","alfieldCaption":"Name","alObjectType":"CodeUnit","alObjectName":"Monitor Sensitive Field Data"}

-->

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Sensitive field value has changed: {field caption} in table {table caption}**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|-----------|
|aadTenantId|Specifies that Azure Active Directory (Azure AD) tenant ID used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
|alDataClassification||
|alfieldCaption||
|altableCaption||
|alObjectId|Specifies the ID of the object that was run: **1392**.|
|alObjectName|Specifies the name of the object that was run: **Monitor Sensitive Field**.|
|alObjectType|Specifies the name of the object that was run: **CodeUnit**.|
|component|**Dynamics 365 Business Central Server**.|
|componentVersion|Specifies the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] version number.|
|deprecatedKeys|Specifies a comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We recommend that update any queries that use these keys to use the new key name.|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
|eventId|**AL0000DD3**|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] telemetry schema.|


> [!NOTE]
> Changes to fields in the following tables are always recorded: 
> - **Field Monitoring Setup** table. These fields are part of the **Field Monitoring Setup** page.
> - **Change Log Setup** table. These fields are part of the **Field Monitoring Worksheet** page.
> - **User** table.

## See also

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enabling Application Insights for Tenant Telemetry On-Premises](telemetry-enable-application-insights.md)  
[Enable Sending Telemetry to Application Insights](tenant-admin-center-telemetry.md#appinsights)  
