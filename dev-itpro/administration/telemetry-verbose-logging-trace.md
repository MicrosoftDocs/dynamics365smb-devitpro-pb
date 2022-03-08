---
title: Analyzing Verbose Enable and Disable Telemetry | Microsoft Docs
description: Learn about the verbose logging telemetry in Business Central  
author: jswymer
ms.topic: conceptual
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 04/01/2021
ms.author: jswymer
---

# Analyzing Verbose Telemetry

[!INCLUDE[2022_releasewave1](../includes/2022_releasewave1.md)] 

The [!INCLUDE[prod_short](../developer/includes/prod_short.md)] emits telemetry data about the success or failure of authenticating web service access keys on web service requests. 

For information about web service access keys, see [How to use an Access Key for SOAP and OData Web Service Authentication](../webservices/web-services-authentication.md#accesskey).

## <a name="enabled"></a>Verbose telemetry enabled for session

Occurs when **Additional Logging** is turned on from the **Help and Support** page in the client. 

### General dimensions

The following table explains the general dimensions included in the trace. The table lists the dimensions that are specific to Business Central.

|Dimension|Description or value|
|---------|-----|-----------|
|message|**Verbose telemetry enabled for session: {sessionId}**|
|severityLevel|**3**|

### Custom dimensions

The following table explains the custom dimensions included in the trace.

|Dimension|Description or value|
|---------|-----|
|aadTenantId|Specifies that Azure Active Directory (Azure AD) tenant ID used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
|component|**Dynamics 365 Business Central Server**|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|environmentName|Specifies the name of the tenant environment. See [Managing Environments](tenant-admin-center-environments.md). This dimension is only for traces from Business Central online.|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
|eventId|**RT0023**|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|

<!--
{"telemetrySchemaVersion":"0.1","componentVersion":"20.0.36722.0","environmentType":"Production","aadTenantId":"d88985a1-c863-442c-bb5f-dc622e480a8d","component":"Dynamics 365 Business Central Server","eventId":"RT0023"}

-->

## <a name="enabled"></a>Verbose telemetry disabled for session

Occurs when **Additional Logging** is turned off because a user closed the browser in which Business Central was running or they signed out of Business Central. 

### General dimensions

The following table explains the general dimensions included in the trace. The table lists the dimensions that are specific to Business Central.

|Dimension|Description or value|
|---------|-----|-----------|
|message|**Verbose telemetry disabled for session: {sessionId}**|
|severityLevel|**3**|

### Custom dimensions

The following table explains the custom dimensions included in the trace.

|Dimension|Description or value|
|---------|-----|
|eventId|**RT0024**|
|aadTenantId|Specifies that Azure Active Directory (Azure AD) tenant ID used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
|component|**Dynamics 365 Business Central Server**|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|environmentName|Specifies the name of the tenant environment. See [Managing Environments](tenant-admin-center-environments.md). This dimension is only for traces from Business Central online.|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|

<!--
{"telemetrySchemaVersion":"0.1","componentVersion":"20.0.36722.0","environmentType":"Production","aadTenantId":"d88985a1-c863-442c-bb5f-dc622e480a8d","component":"Dynamics 365 Business Central Server","eventId":"RT0024"}

-->


## See also

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  
