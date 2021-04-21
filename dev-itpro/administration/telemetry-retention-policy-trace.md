---
title: Analyzing Retention Policy Trace Telemetry
description: Learn about the telemetry for retention policies in Business Central  
author: jswymer
ms.service: dynamics365-business-central
ms.topic: conceptual
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 04/01/2021
ms.author: jswymer
---

# Analyzing Retention Policy Trace Telemetry

**APPLIES TO:** [!INCLUDE[prod_short](../includes/prod_short.md)] 2020 release wave 2, update 17.1 and later

Administrators define retention policies to specify how frequently they want [!INCLUDE[prod_short](../includes/prod_short.md)] to delete outdated data in tables that contain log entries and archived records. For example, cleaning up log entries makes it easier to work with the data that's relevant. Policies can include all data in the tables that is past the expiration date. Or you can add filter criteria to include only certain expired data in the policy.

To gather this telemetry data, you'll have to set up retention policies on tables that contain log entries and archived records. For more information, see [Define Retention Policies](/dynamics365/business-central/admin-data-retention-policies) in the Application help.

Telemetry is then logged for the following operations:

- A table is added to the list of allowed tables
- An error occurs when adding a new retention policy
- A retention policy is enabled
- A retention policy is applied, either manually or automatically
- Data is deleted because of a retention policy
- The first retention policy is enabled on a table in a company
- The last retention policy is removed in a company

## <a name="info"></a>Retention policy log entry logged

Occurs when a retention policy is enabled, applied, or disabled. It provides information about the different operations related to the retention policy. This information is similar to what you see in the **Retention Policy Log** page in the client.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Retention Policy Log Entry Logged: {alMessageType}**|
|severityLevel|**1** for error, **2** for warning, **3** for info|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000D3L**|
|alCategory|Specifies the aspect of the retention policy that created the log entry. For example, it can be related to setup, the retention period, and when the policy was applied. Some of the values are: **Retention Policy - Setup**, **Retention Policy - Apply**, **Retention Policy - Schedule**, **Retention Policy - Allowed Tables**.|
|alCompanyName|Specifies the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] company that the retention policy applies to.|
|alLogEntry|Specifies message about the retention policy execution step, for example: Table 405 Change Log Entry was added to the list of allowed tables. Default Date Field No.: 2000000001|
|alMessageType|Specifies the message type for the log entry: <ul><li>**Error** - indicates an error occurred and the operation was unsuccessful</li><li>**Warning** - indicates that the operation succeeded but there's a warning</li><li> **Info** - indicates that the operation was successful.|


<a name="other"></a>**Common custom dimensions**

The following table explains other custom dimensions that are common to all retention policy traces. 

|Dimension|Description or value|
|---------|-----|
|aadTenantId|Specifies that Azure Active Directory (Azure AD) tenant ID used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
|component|**Dynamics 365 Business Central Server**.|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|environmentName|Specifies the name of the tenant environment. See [Managing Environments](tenant-admin-center-environments.md). This dimension isn't included for [!INCLUDE[prod_short.md](../includes/prod_short.md)] on-premises environments.|
|alDataClassification|**SystemMetadata**|
|alObjectId|**3912**, which is the ID of the **Reten. Policy Telemetry Impl.** codeunit.|
|alObjectName|**Reten. Policy Telemetry Impl.**|
|alObjectType|**Codeunit**|
|extensionId|Specifies the ID of the system application: **63ca2fa4-4f03-4f2b-a480-172fef340d3f**.|
|extensionName|**System Application**|
|extensionVersion|Specifies the version of the system application.|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|


<!--
{ 
{"Telemetry schema version":"1.0","telemetrySchemaVersion":"1.0","Component version":"18.0.24530.0","extensionPublisher":"Microsoft","componentVersion":"18.0.24530.0","Environment type":"Production","Extension version":"18.1.24582.0","environmentType":"Production","extensionVersion":"18.1.24582.0","Extension App Id":"63ca2fa4-4f03-4f2b-a480-172fef340d3f","deprecatedKeys":"AadTenantId, Environment name, Environment type, Telemetry schema version, Component, Component version, Telemetry schema version, AadTenantId, Environment name, Environment type","Extension name":"System Application","extensionName":"System Application","aadTenantId":"common","AadTenantId":"common","alObjectType":"CodeUnit","alObjectName":"Reten. Policy Telemetry Impl.","extensionId":"63ca2fa4-4f03-4f2b-a480-172fef340d3f","component":"Dynamics 365 Business Central Server","Component":"Dynamics 365 Business Central Server","alObjectId":"3912","eventId":"AL0000D3L","alDataClassification":"SystemMetadata","alCategory":"Retention Policy - Setup","alCompanyName":"CRONUS International Ltd.","alMessageType":"Error","alLogEntry":"Table 11 Country/Region Translation is not in the list of allowed tables."}

} 
-->

## <a name="deleted"></a>Records deleted using retention policy

Occurs when a record is deleted by a retention policy.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Records Deleted Using Retention Policy: Deleted {alRecordsDeleted} records from Table {alTableNo}, {alTableName}**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000D6H**|
|alCompanyName|Specifies the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] company that the retention policy applies to.|
|alManualRun| Specifies whether the retention policy was run manually, **true**, or automatically by a job queue entry, **false**.|
|alRecordsDeleted|Specifies the number of records that were deleted by the retention policy.|
|alTableName| Specifies the name of the table from which the records were deleted.|
|alTableNo|Specifies the ID of the table from which the records were deleted.|
|[See common custom dimensions](#other)||

<!--
{
{"Telemetry schema version":"1.0","telemetrySchemaVersion":"1.0","Component version":"18.0.24530.0","componentVersion":"18.0.24530.0","Environment type":"Production","environmentType":"Production","deprecatedKeys":"AadTenantId, Environment name, Environment type, Telemetry schema version, Component, Component version, Telemetry schema version, AadTenantId, Environment name, Environment type","extensionPublisher":"Microsoft","Extension version":"18.1.24582.0","Extension App Id":"63ca2fa4-4f03-4f2b-a480-172fef340d3f","extensionVersion":"18.1.24582.0","aadTenantId":"common","AadTenantId":"common","Extension name":"System Application","extensionName":"System Application","alObjectType":"CodeUnit","alObjectName":"Reten. Policy Telemetry Impl.","component":"Dynamics 365 Business Central Server","Component":"Dynamics 365 Business Central Server","extensionId":"63ca2fa4-4f03-4f2b-a480-172fef340d3f","alObjectId":"3912","eventId":"AL0000D6H","alDataClassification":"SystemMetadata","alCompanyName":"CRONUS International Ltd.","alTableName":"Retention Policy Log Entry","alTableNo":"3905","alRecordsDeleted":"0","alManualRun":"true"}

}
-->

## <a name="first"></a>First retention policy enabled on company

Occurs when the first retention policy is enabled in a company.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**First retention policy enabled on: {alCompanyName}**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000D6I**|
|alCompanyName|Specifies the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] company that the retention policy applies to.|
|alTableName| Specifies the name of the table the retention policy was enabled on.|
|alTableNo|Specifies the ID of the table that the retention policy was enabled on.|
|[See common custom dimensions](#other)||

<!--
{
{"Telemetry schema version":"1.0","telemetrySchemaVersion":"1.0","Component version":"18.0.24530.0","extensionPublisher":"Microsoft","componentVersion":"18.0.24530.0","Environment type":"Production","Extension version":"18.1.24582.0","environmentType":"Production","extensionVersion":"18.1.24582.0","Extension App Id":"63ca2fa4-4f03-4f2b-a480-172fef340d3f","deprecatedKeys":"AadTenantId, Environment name, Environment type, Telemetry schema version, Component, Component version, Telemetry schema version, AadTenantId, Environment name, Environment type","Extension name":"System Application","extensionName":"System Application","aadTenantId":"common","AadTenantId":"common","alObjectType":"CodeUnit","alObjectName":"Reten. Policy Telemetry Impl.","extensionId":"63ca2fa4-4f03-4f2b-a480-172fef340d3f","component":"Dynamics 365 Business Central Server","Component":"Dynamics 365 Business Central Server","alObjectId":"3912","eventId":"AL0000D6I","alDataClassification":"SystemMetadata","alCompanyName":"CRONUS International Ltd.","alTableName":"Change Log Entry","alTableNo":"405"}

}
-->

## <a name="last"></a>Last retention policy disabled on company

Occurs when the last retention policy is disabled in a company.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Last retention policy disabled on: {alCompanyName}**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000D6J**|
|alCompanyName|Specifies the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] company that the retention policy applies to.|
|alTableName| Specifies the name of the table from which the records were deleted.|
|alTableNo|Specifies the ID of the table from which the records were deleted.|
|[See common custom dimensions](#other)||

<!--
{"Telemetry schema version":"1.0","telemetrySchemaVersion":"1.0","extensionPublisher":"Microsoft","Component version":"18.0.24530.0","Extension version":"18.1.24582.0","componentVersion":"18.0.24530.0","Environment type":"Production","Extension App Id":"63ca2fa4-4f03-4f2b-a480-172fef340d3f","extensionVersion":"18.1.24582.0","environmentType":"Production","deprecatedKeys":"AadTenantId, Environment name, Environment type, Telemetry schema version, Component, Component version, Telemetry schema version, AadTenantId, Environment name, Environment type","Extension name":"System Application","extensionName":"System Application","alObjectName":"Reten. Policy Telemetry Impl.","alObjectType":"CodeUnit","AadTenantId":"common","aadTenantId":"common","extensionId":"63ca2fa4-4f03-4f2b-a480-172fef340d3f","alObjectId":"3912","Component":"Dynamics 365 Business Central Server","component":"Dynamics 365 Business Central Server","eventId":"AL0000D6J","alDataClassification":"SystemMetadata","alCompanyName":"CRONUS International Ltd.","alTableNo":"405","alTableName":"Change Log Entry"}

-->
## See also

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enabling Application Insights for Tenant Telemetry On-Premises](telemetry-enable-application-insights.md)  
[Enable Sending Telemetry to Application Insights](tenant-admin-center-telemetry.md#appinsights)  
