---
title: Analyzing Permission Error Trace Telemetry
description: Learn about the permission error telemetry in Business Central  
author: jswymer
ms.service: dynamics365-business-central
ms.topic: conceptual
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 07/27/2022
ms.author: jswymer
---
# Analyzing Permission Error Trace Telemetry

[!INCLUDE[2022_releasewave1.md](../includes/2022_releasewave1.md)]

When a user gets an error dialog about lack of permissions while working in Business Central, a telemetry signal is emitted. This signal can be logged in an Application Insights resource.

This telemetry data let's you identify and analyze permission problems that users may experience in Business Central.

## Permission Error Shown

Occurs when a user gets a permissions-related error message in Business Central when they try to do an operation in the application.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Permission error shown**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**RT0031**|
|aadTenantId|The Azure Active Directory (Azure AD) tenant ID that's used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
|alObjectId|If there's no value or the value is 0, then the permission error wasn't related to a specific object, which typically happens when `permissionArea` is something other than `Object`. |
|alObjectType|The type of the AL object that the user was trying to access, like a table or page. |
|clientType|The type of client that executed the SQL Statement, such as **Background** or **Web**. For a list of the client types, see [ClientType Option Type](../developer/methods-auto/clienttype/clienttype-option.md).|
|companyName|The display name of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] company that was used at time of execution |
|component|**Dynamics 365 Business Central Server**|
|componentVersion|The version number of the component that emits telemetry (see the component dimension)|
|environmentName|The name of the tenant environment. See [Managing Environments](tenant-admin-center-environments.md). This dimension isn't included for [!INCLUDE[prod_short.md](../includes/prod_short.md)] on-premises environments.|
|environmentType|The environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
|permissionArea|The area that the permission error is related to. Possible values include: `System`, `Entitlement`, `Company`, `Object`.|
|permissionType|The permission that the operation requires, but the user lacks. Possible values: `Delete`, `Execute`, `Insert`, `Modify`, `Read`, `Undefined` |
|telemetrySchemaVersion|The version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|

<!--
{"errorMessage":"You do not have the following permission: Allow Action Automate","aadTenantId":"common","component":"Dynamics 365 Business Central Server","environmentType":"Production","telemetrySchemaVersion":"1.0","eventId":"RT0031","componentVersion":"21.0.42152.0","companyName":"CRONUS International Ltd.","clientType":"WebClient","alObjectId":"0","alObjectType":"System","permissionType":"Execute","permissionArea":"System"}
-->

## See also

[Upgrading Extensions](../developer/devenv-upgrading-extensions.md)  
[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  
