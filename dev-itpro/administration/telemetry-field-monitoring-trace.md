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
ms.date: 11/09/2020
ms.author: jswymer
---

# Analyzing Field Monitoring Telemetry

[!INCLUDE[2020_releasewave2-17-1-later](../includes/2020_releasewave2-17-1-later.md)] 

Keeping sensitive data secure and private is a core concern for most businesses. To add a layer of security, you can monitor important fields when someone changes a value. For example, you might want to know if someone changes your company's IBAN number.

To gather this data, you'll have to start field monitoring and specify the fields that you want to monitor.  For more information, see [Auditing Changes in Business Central - Monitoring Sensitive Fields](/dynamics365/business-central/across-log-changes#monitoring-sensitive-fields) in the Application help.

Telemetry is then logged for the following operations:

- When field monitoring is stopped or started
- When a field is added or removed for monitoring
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
|---------|-----|-----------|
|aadTenantId|Specifies that Azure Active Directory (Azure AD) tenant ID used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
|alDataClassification|**SystemMetadata**|
|almonitorStatus|**Yes** - the field monitor feature was started.<br /><br /> **No** the field monitor feature was stopped.|
|alObjectId|**1392**|
|alObjectName|**Monitor Sensitive Field**|
|alObjectType|**CodeUnit**|
|component|**Dynamics 365 Business Central Server**|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|deprecatedKeys|Specifies a comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We recommend that update any queries that use these keys to use the new key name.|
|environmentName|Specifies the name of the tenant environment. See [Managing Environments](tenant-admin-center-environments.md). This dimension isn't  included for [!INCLUDE[prod_short.md](../includes/prod_short.md)] on-premises environments.|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments). <br /><br />This dimension isn't included for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] on-premises environments.|
|eventId|**AL0000DD3**|
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
|---------|-----|
|message|**Sensitive field value has changed: {alfieldCaption} in table {altableCaption}**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|-----------|
|aadTenantId|Specifies that Azure Active Directory (Azure AD) tenant ID used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
|alDataClassification|**SystemMetadata**|
|alfieldCaption|Specifies the name of the field that was changed.|
|altableCaption|Specifies the name of the table that the changed field is included.|
|alObjectId|**1392**|
|alObjectName|**Monitor Sensitive Field**|
|alObjectType|**CodeUnit**|
|component|**Dynamics 365 Business Central Server**|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|deprecatedKeys|Specifies a comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We recommend that update any queries that use these keys to use the new key name.|
|environmentName|Specifies the name of the tenant environment. See [Managing Environments](tenant-admin-center-environments.md). This dimension isn't  included for [!INCLUDE[prod_short.md](../includes/prod_short.md)] on-premises environments.|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments). <br /><br />This dimension isn't included for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] on-premises.|
|eventId|**AL0000CTE**|
|extensionName|Specifies the name of the base application. |
|extensionId|Specifies the ID of the base extension.|
|extensionPublisher|Specifies the publisher of the extension.|
|extensionVersion|Specifies the version of the base application.|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|

> [!NOTE]
> Changes to fields in the following tables are always logged: 
> - Fields in the **Field Monitoring Setup** table. Many of the fields are included on the **Field Monitoring Setup** page.
> - Fields in the **Change Log Setup (Field)** table. Many of the fields are included on the **Field Monitoring Worksheet** page.
> - The **Contact Email** field in the **User** table.

## See also

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enabling Application Insights for Tenant Telemetry On-Premises](telemetry-enable-application-insights.md)  
[Enable Sending Telemetry to Application Insights](tenant-admin-center-telemetry.md#appinsights)  
