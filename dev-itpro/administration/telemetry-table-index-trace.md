---
title: Analyzing Table Index Trace Telemetry
description: Learn about the telemetry for changes made to table indexes  
author: jswymer
ms.service: dynamics365-business-central
ms.topic: conceptual
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry, table keys, indexes, keys, indexes
ms.date: 04/14/2021
ms.author: jswymer
---

# Analyzing Table Index Trace Telemetry

**APPLIES TO:** [!INCLUDE[prod_short](../includes/prod_short.md)] 2021 release wave 1, version 18.0 and later

The table index trace gathers data when a index is added to, modified, or removed from a base table by a table extension.  

In AL, an index is defined by a key, which can include one or more table fields. A key in a table extension object can include either fields from the base table or fields from the table extension object itself. A key that includes base tables fields is added as an index on the base table in the SQL database. For more information, see [Table Keys](../developer/devenv-table-keys.md).

This signal is emitted when a table extension object is installed or upgraded on a tenant, and it does one of the following operations:

- Adds an index to the base table
- Changes an existing index on the base table, for example, it adds or removes fields
- Removes an existing index from the base table

## <a name="enabled"></a>Index enabled 

Occurs when an index was added or modified on the base table by key in a table extension object.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Index enabled: {alObjectName}**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**LC0024**|
|alObjectId|Specifies the ID of table that the index was added or changed.|
|alObjectName|Specifies the name of table that the index was added or changed.|
|extensionId|Specifies the ID of the extension that added the index.|
|extensionName|Specifies the name of the extension that added or changed the index.|
|extensionPublisher|Specifies the publisher of the extension that added added or changed the index.|
|keyMaintainSIFTIndex|Specifies whether the index's [MaintainSIFTIndex property](../developer/properties/devenv-maintainsiftindex-property.md) is  `true` or `false`.  |
|keyMaintainSQLIndex|Specifies whether the index's [MaintainSQLIndex property](../developer/properties/devenv-maintainsqlindex-property.md) is  `true` or `false`.  ||
|keyFields|Specifies the table fields that are included in the index.|
|keyName|Specifies the name of the index that was added or changed.|

<a name="other"></a>**Common custom dimensions**

The following table explains other custom dimensions that are common to all table index traces. 

|Dimension|Description or value|
|---------|-----|
|aadTenantId|Specifies that Azure Active Directory (Azure AD) tenant ID used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
|component|**Dynamics 365 Business Central Server**.|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|deprecatedKeys|Specifies a comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We recommend that update any queries that use these keys to use the new key name.|
|environmentName|Specifies the name of the tenant environment. See [Managing Environments](tenant-admin-center-environments.md). This dimension isn't included for [!INCLUDE[prod_short.md](../includes/prod_short.md)] on-premises environments.|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|


<!--
{"extensionVersion":"1.0.0.0","Telemetry schema version":"0.1","telemetrySchemaVersion":"0.1","extensionPublisher":"Default publisher","Component version":"18.0.22893.23353","Extension version":"1.0.0.0","componentVersion":"18.0.22893.23353","Environment type":"Production","Extension App Id":"dac46aa2-3007-49d1-93c1-80d337c173e6","environmentType":"Production","deprecatedKeys":"Extension name, Extension App Id, Extension version, Telemetry schema version, Component, Component version, Telemetry schema version, AadTenantId, Environment name, Environment type","Extension name":"bc-index5","extensionName":"bc-index5","alObjectName":"MyBaseTable","AadTenantId":"common","aadTenantId":"common","extensionId":"dac46aa2-3007-49d1-93c1-80d337c173e6","alObjectId":"50120","component":"Dynamics 365 Business Central Server","Component":"Dynamics 365 Business Central Server","eventId":"LC0024","keyMaintainSQLIndex":"True","keyName":"Key2","keyMaintainSIFTIndex":"False","keyFields":"MyBaseField1, MyBaseField2"}

-->

## <a name="disabled"></a>Index disabled

Occurs when an index was removed from the base table by table extension object.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Index disabled: {alObjectName}**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|--------------------|
|eventId|**LC0025**|
|alObjectId|Specifies the ID of table that the index was removed from.|
|alObjectName|Specifies the name of table that the index was removed from.|
|extensionId|Specifies the ID of the extension that removed the index.|
|extensionName|Specifies the name of the extension that removed the index.|
|extensionPublisher|Specifies the publisher of the extension that removed the index.|
|keyMaintainSIFTIndex|Specifies whether the index's [MaintainSIFTIndex property](../developer/properties/devenv-maintainsiftindex-property.md) was `true` or `false`.  |
|keyMaintainSQLIndex|Specifies whether the index's [MaintainSQLIndex property](../developer/properties/devenv-maintainsqlindex-property.md) was  `true` or `false`.  ||
|keyFields|Specifies the table fields that are included in the index.|
|keyName|Specifies the name of the index that was removed. |
|[See common custom dimensions](#other)||

<!--
{"extensionVersion":"1.0.0.0","Telemetry schema version":"0.1","telemetrySchemaVersion":"0.1","extensionPublisher":"Default publisher","Component version":"18.0.22893.23353","Extension version":"1.0.0.0","Environment type":"Production","componentVersion":"18.0.22893.23353","Extension App Id":"dac46aa2-3007-49d1-93c1-80d337c173e6","environmentType":"Production","deprecatedKeys":"Extension name, Extension App Id, Extension version, Telemetry schema version, Component, Component version, Telemetry schema version, AadTenantId, Environment name, Environment type","Extension name":"bc-index5","extensionName":"bc-index5","alObjectName":"MyBaseTable","aadTenantId":"common","AadTenantId":"common","extensionId":"dac46aa2-3007-49d1-93c1-80d337c173e6","Component":"Dynamics 365 Business Central Server","alObjectId":"50120","component":"Dynamics 365 Business Central Server","eventId":"LC0025","keyMaintainSIFTIndex":"False","keyMaintainSQLIndex":"True","keyFields":"MyBaseField1, MyBaseField2","keyName":"Key2"}

-->
## See also

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enabling Application Insights for Tenant Telemetry On-Premises](telemetry-enable-application-insights.md)  
[Enable Sending Telemetry to Application Insights](tenant-admin-center-telemetry.md#appinsights)  
