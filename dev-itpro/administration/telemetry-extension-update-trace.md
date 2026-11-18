---
title: Analyzing Extension Update Trace Telemetry
description: Analyze Business Central extension update telemetry to investigate upgrade code failures and track upgrade tags used during extension upgrades.
author: jswymer
ms.topic: concept-article
ms.devlang: al
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 11/17/2026
ai-usage: ai-assisted
ms.author: jswymer
ms.reviewer: jswymer
---
# Analyzing extension update telemetry

**INTRODUCED IN:** Exception telemetry was introduced in Business Central 2020 release wave 1, version 16.2. Upgrade tag telemetry was introduced in Business Central 2021 release wave 1, version 18.1.

Extension upgrade telemetry gathers information about operations that can occur during extension upgrades:

- Upgrade code failures

    The telemetry provides information about exceptions that are thrown by code run by upgrade codeunits. The trace events include the following information:

    - The codeunit that threw the exception.
    - AL stack trace.
    - Exception message.

- Upgrade tag usage

    The telemetry provides information about calls to the AL methods `HasUpgradeTag` and `SetUpgradeTag`. These methods are provided by codeunit **9999 Upgrade Tag** in the System Application extension. Upgrade tags are used to control when upgrade code is run. Learn more in [Using upgrade tags to control upgrade code](../developer/devenv-upgrading-extensions.md#using-upgrade-tags-to-control-upgrade-code). This data can help you identify, troubleshoot, and resolve issues in upgrade code.

The telemetry helps you troubleshoot and resolve code issues that block the data upgrade of per-tenant and Marketplace extensions.

## Extension update failed: exception raised in extension

Occurs when an extension upgrade fails because of an exception in an upgrade codeunit.  

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Extension Update Failed: exception raised in extension {extensionName} by {companyName} (updating to version {extensionTargetedVersion})**|
|severityLevel|**3**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**RT0010**|
|alObjectId|The ID of the AL object that was run by request|
|alStackTrace|The stack trace in AL|
|companyName|The display name of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] company that was used at time of execution |
|extensionName|The name of the extension that was being upgraded|
|extensionId|The AppID of the extension that was being upgraded|
|extensionTargetedVersion|The new version of the extension being upgraded|
|extensionVersion|The version of the extension being upgraded to|
|failureReason|The exception that was thrown by the upgrade code. Some exception messages can contain customer data. As a precaution, Business Central only emits information that's classified as [SystemMetadata](../developer/devenv-instrument-application-for-telemetry-app-insights.md#using-dataclassification-for-privacy). Exception messages that contain other data classifications, like customer data, aren't shown. Instead, the following message is shown: "Message not shown because the NavBaseException(string, Exception, bool) constructor was used."|
|failureType|**DataUpdate**|

<a name="other"></a>**Common custom dimensions**

The following table explains other custom dimensions that are common to all extension update traces.

|Dimension|Description or value|
|---------|-----|
|aadTenantId|The Microsoft Entra tenant ID that's used for Microsoft Entra authentication. For on-premises, if you aren't using Microsoft Entra authentication, this value is **common**. |
|component|**Dynamics 365 Business Central Server**|
|componentVersion|The version number of the component that emits telemetry (see the component dimension)|
|environmentName|The name of the tenant environment. Learn more in [Managing environments](tenant-admin-center-environments.md). This dimension isn't included for [!INCLUDE[prod_short.md](../includes/prod_short.md)] on-premises environments.|
|deprecatedKeys|A comma-separated list of keys that have been deprecated. We recommend that you update any queries that use these keys to use the new key names.|
|environmentType|The environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. Learn more in [Environment types](tenant-admin-center-environments.md#types-of-environments).|
|telemetrySchemaVersion|The version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema|

## Upgrade tag searched for

Occurs when the `HasUpgradeTag` method in codeunit **9999 Upgrade Tag** checks for a tag during an extension upgrade and the tag isn't found.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Upgrade tag searched for: {alUpgradeTag}**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000EJ9**|
|alCategory|**ALUpgrade**|
|alCompanyName|The company for which the upgrade tag was checked. An empty value indicates a database-wide tag.|
|alDataClassification|**OrganizationIdentifiableInformation**|
|alObjectId|**9996**|
|alObjectName|**Upgrade Tag Impl.**|
|alUpgradeTag| The upgrade tag that was input to the `HasUpgradeTag` method |
|alExecutionContext| The context that the upgrade code was running in. The dimension has the following values:<ul><li> **Install** indicates the code was run during the installation of the extension.</li><li>**Upgrade** indicates the code was run during the upgrade of the extension.</li><li>**Normal** indicates the code was run by an operation other than extension installation or upgrade. For example, when a new company was added.</li></ul>|
|alValue|**false**, because this event is emitted when the upgrade tag isn't found.|
|extensionName|**System Application**|
|extensionId|The ID of the **System Application** extension|
|extensionPublisher|The publisher of the **System Application** extension|
|extensionVersion|The version of the **System Application** extension|
|[See common custom dimensions](#other)||
<!--

{"Telemetry schema version":"1.0","telemetrySchemaVersion":"1.0","Component version":"18.0.25732.0","Environment type":"Production","componentVersion":"18.0.25732.0","extensionPublisher":"Microsoft","extensionVersion":"19.0.25795.0","environmentType":"Production","Extension version":"19.0.25795.0","Extension App Id":"63ca2fa4-4f03-4f2b-a480-172fef340d3f","deprecatedKeys":"AadTenantId, Environment name, Environment type, Telemetry schema version, Component, Component version, Telemetry schema version, AadTenantId, Environment name, Environment type","Extension name":"System Application","extensionName":"System Application","AadTenantId":"common","aadTenantId":"common","alObjectType":"CodeUnit","alObjectName":"Upgrade Tag Impl.","extensionId":"63ca2fa4-4f03-4f2b-a480-172fef340d3f","Component":"Dynamics 365 Business Central Server","component":"Dynamics 365 Business Central Server","alObjectId":"9996","eventId":"AL0000EJ9","alDataClassification":"OrganizationIdentifiableInformation","alCategory":"ALUpgrade","alExecutionContext":"Upgrade","alCompanyName":"$TEST2","alUpgradeTag":"ABC-1234-SHOESIZEUPGRADE-20201125","alValue":"true"}

-->

## Upgrade tag set

Occurs when codeunit **9999 Upgrade Tag** sets an upgrade tag. This event can also occur outside an extension upgrade, such as when a company is created.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Upgrade tag set: {alUpgradeTag}**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000EJA**|
|alCategory|**ALUpgrade**|
|alCompanyName|The company for which the upgrade tag was set. An empty value indicates a database-wide tag.|
|alDataClassification|**OrganizationIdentifiableInformation**|
|alObjectId|**9996**|
|alObjectName|**Upgrade Tag Impl.**|
|alUpgradeTag| The upgrade tag that was set by the `SetUpgradeTag` method.|
|alExecutionContext| The context that the upgrade code was running in. The dimension has the following values:<ul><li> **Install** indicates the code was run during the installation of the extension.</li><li>**Upgrade** indicates the code was run during the upgrade of the extension.</li><li>**Normal** indicates the code was run by an operation other than extension installation or upgrade. For example, when a new company was added.</li></ul>|
|extensionName|**System Application**|
|extensionId|The ID of the **System Application** extension|
|extensionPublisher|The publisher of the **System Application** extension|
|extensionVersion|The version of the **System Application** extension|
|[See common custom dimensions](#other)||

<!--
{"Telemetry schema version":"1.0","telemetrySchemaVersion":"1.0","extensionVersion":"19.0.25795.0","Component version":"18.0.25732.0","Environment type":"Production","componentVersion":"18.0.25732.0","extensionPublisher":"Microsoft","environmentType":"Production","Extension version":"19.0.25795.0","deprecatedKeys":"AadTenantId, Environment name, Environment type, Telemetry schema version, Component, Component version, Telemetry schema version, AadTenantId, Environment name, Environment type","Extension App Id":"63ca2fa4-4f03-4f2b-a480-172fef340d3f","Extension name":"System Application","aadTenantId":"common","AadTenantId":"common","extensionName":"System Application","alObjectName":"Upgrade Tag Impl.","alObjectType":"CodeUnit","extensionId":"63ca2fa4-4f03-4f2b-a480-172fef340d3f","component":"Dynamics 365 Business Central Server","Component":"Dynamics 365 Business Central Server","alObjectId":"9996","eventId":"AL0000EJA","alDataClassification":"OrganizationIdentifiableInformation","alExecutionContext":"Upgrade","alCompanyName":"$TEST2","alUpgradeTag":"ABC-TEST","alCategory":"ALUpgrade"}

-->

## Related information

[Upgrading Extensions](../developer/devenv-upgrading-extensions.md)  
[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  
