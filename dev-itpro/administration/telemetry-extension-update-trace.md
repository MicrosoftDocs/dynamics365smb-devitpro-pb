---
title:  Extension Update Trace Telemetry | Microsoft Docs
description: Learn about the extension upgrade telemetry in Business Central  
author: jswymer
ms.service: dynamics365-business-central
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 10/01/2020
ms.author: jswymer
---
# Analyzing Extension Update Trace Telemetry

**INTRODUCED IN:** Business Central 2020 release wave 1, version 16.2

Extension upgrade telemetry gathers information about failures that occur during extension upgrades. Specifically, it provides information about exceptions that are thrown by code run by upgrade codeunits. The trace events include the following information:

- The codeunit that threw the exception.
- AL stack trace.
- Exception message.

This data can help you identify, troubleshoot, and resolve issues with per-tenant and AppSource extensions that are blocking data upgrade.

## Extension Update Failed: exception raised in extension

Occurs when an extension upgrade fails because of an exception in an upgrade codeunit.  

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Extension Update Failed: exception raised in extension {extensionName} by {extensionPublisher} (updating to version {extensionTargetedVersion})**|
|severityLevel|**3**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|Specifies that Azure Active Directory (Azure AD) tenant ID used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
|alObjectId|Specifies the ID of the AL object that was run by request.|
|alStackTrace|The stack trace in AL.|
|companyName|The display name of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] company that was used at time of execution. ||
|component|**Dynamics 365 Business Central Server**.|
|componentVersion|Specifies the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] version number.|
|deprecatedKeys|A comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We recommend that update any queries that use these keys to use the new key name.|
|environmentName|Specifies the name of the tenant environment. See [Managing Environments](tenant-admin-center-environments.md).|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
|eventId|**RT0010**|
|extensionName|Specifies the name of the extension that was being upgraded.|
|extensionId|Specifies the AppID of the extension that was being upgraded.|
|extensionTargetedVersion|Specifies the new version of the extension being upgraded.|
|extensionVersion|Specifies the old version of the extension being upgraded.|
|failureReason|Specifies the exception that was thrown by the upgrade code. Some exception messages can contain customer data. As a precaution, Business Central only emits information that's classified as [SystemMetadata](../developer/devenv-classifying-data.md). Exception messages that contain other data classifications, like customer data, are not shown. Instead, the following message is shown: "Message not shown because the NavBaseException(string, Exception, bool) constructor was used."|
|failureType|**DataUpdate**|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] telemetry schema.|

### Example

`
{"Telemetry schema version":"0.3","telemetrySchemaVersion":"0.3","Component version":"16.0.12582.0","componentVersion":"16.0.12582.0","Environment type":"Production","environmentType":"Production","deprecatedKeys":"Company name, AL Object Id, AL Object
 type, AL Object name, AL Stack trace, Client type, Extension name, Extension App Id, Extension version, Telemetry schema version, AadTenantId, Environment name, Environment type, Component, Component version","Company name":"CRONUS International Ltd.","AL
 Object Id":"0","AadTenantId":"tenant1-1","companyName":"CRONUS International Ltd.","Client type":"Background","aadTenantId":"tenant1-1","Component":"Dynamics 365 Business Central Server","clientType":"Background","alObjectId":"0","extensionVersion":"5.0.0.0","component":"Dynamics
 365 Business Central Server","eventId":"RT0010","extensionTargetedVersion":"5.0.0.1","Extension version":"5.0.0.0","Extension App Id":"f0f770f4-8c9c-48de-adad-1c0281bef849","AL Stack trace":"CustomerListExt(CodeUnit 50100).OnUpgradePerCompany line 7 - MyExtension
 by MyPublisher publisher\n\"\"Upgrade Triggers\"\"(CodeUnit 2000000008).OnUpgradePerCompany line 2","Extension name":"MyExtension","failureReason":"Attempted to divide by zero.","extensionName":"MyExtension","alStackTrace":"CustomerListExt(CodeUnit 50100).OnUpgradePerCompany
 line 7 - MyExtension by MyPublisher publisher\n\"\"Upgrade Triggers\"\"(CodeUnit 2000000008).OnUpgradePerCompany line 2","failureType":"DataUpdate","extensionId":"f0f770f4-8c9c-48de-adad-1c0281bef849"}
`

## See also

[Upgrading Extensions](../developer/devenv-upgrading-extensions.md)  
[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enabling Application Insights for Tenant Telemetry On-Premises](telemetry-enable-application-insights.md)  
[Enable Sending Telemetry to Application Insights](tenant-admin-center-telemetry.md#appinsights)  
