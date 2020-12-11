---
title: Analyzing Email Trace Telemetry 
description: Learn about the email telemetry in Business Central  
author: jswymer
ms.service: dynamics365-business-central
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 11/24/2020
ms.author: jswymer
---

# Analyzing Email Trace Telemetry

**APPLIES TO:** [!INCLUDE[prodshort](../includes/prodshort.md)] 2020 release wave 2, update 17.2, and later

Email telemetry gathers data about the following operations: 

- An email was sent successfully
- An attempt to send an email failed 


<!--Today, partners can test email setup during setup (click a test button). If settings change on SMTP side later, they don't get notified before something stops working. -->

Before you can collect this data, you'll have to set up email. For more information, see [Set Up Email](/dynamics365/business-central/admin-how-setup-email) in the [!INCLUDE[prodshort](../includes/prodshort.md)] application help.

## <a name="success"></a>Email sent successfully

Occurs when an email was successfully sent from the client.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Email sent successfully**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|Specifies that Azure Active Directory (Azure AD) tenant ID used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
|alCategory|**Email**|
|alConnector|Specifies the email-provider connector used to send the email. Possible values include: <ul><li>Current User</li><li>Microsoft 365</li><li>SMTP</li><li>Other custom connectors installed by extensions.</li></ul> The connector is specified on the email accounts that are set up in [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. For more information, see [Adding Email Accounts](/dynamics365/business-central/admin-how-setup-email#adding-email-accounts).|
|alDataClassification|**SystemMetadata**|
|alEmailMessageID|Specifies the GUID assigned to email, like C7A56676-9F3F-4044-90F0-D7F3196AC366.|
|alObjectId|**8888**, which is the ID of the system application codeunit that sends emails.|
|alObjectName|**Email Dispatcher**, which is the name of the system application codeunit that sends the emails.|
|alObjectType|**CodeUnit**|
|component|**Dynamics 365 Business Central Server**.|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|environmentName|Specifies the name of the tenant environment. See [Managing Environments](tenant-admin-center-environments.md). This dimension isn't included for [!INCLUDE[prodshort](../includes/prodshort.md)] on-premises environments.|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
|eventId|**AL0000CTV**|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] telemetry schema.|

## <a name="failed"></a>Failed to send email

Occurs when an email failed to be sent from the client.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Failed to send email.**|
|severityLevel|**1**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|Specifies that Azure Active Directory (Azure AD) tenant ID used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
|alCategory|**Email**|
|alConnector|Specifies the email-provider connector used to send the email. Possible values include: <ul><li>Current User</li><li>Microsoft 365</li><li>SMTP</li><li>Other custom connectors installed by extensions.</li></ul> The connector is specified on the email accounts that are set up in [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. For more information, see [Adding Email Accounts](/dynamics365/business-central/admin-how-setup-email#adding-email-accounts).|
|alDataClassification|**SystemMetadata**|
|alEmailMessageID|Specifies the GUID assigned to email, like C7A56676-9F3F-4044-90F0-D7F3196AC366.|
|alObjectId|**8888**, which is the ID of the system application codeunit that sends emails.|
|alObjectName|**Email Dispatcher**, which is the name of the system application codeunit that sends the emails.|
|alObjectType|**CodeUnit**|
|component|**Dynamics 365 Business Central Server**.|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|environmentName|Specifies the name of the tenant environment. See [Managing Environments](tenant-admin-center-environments.md). This dimension isn't included for [!INCLUDE[prodshort](../includes/prodshort.md)] on-premises environments.|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
|eventId|**AL0000CTP**|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] telemetry schema.|

> [!TIP]
> You can also view failed emails in the **Email Outbox** page in the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] client.

<!--

{"Telemetry schema version":"1.0","telemetrySchemaVersion":"1.0","Component version":"17.0.19123.0","Environment type":"Production","componentVersion":"17.0.19123.0","environmentType":"Production","deprecatedKeys":"AadTenantId, Environment name, Environment type, Telemetry schema version, Component, Component version, Telemetry schema version, AadTenantId, Environment name, Environment type","alObjectName":"Email Dispatcher","alObjectType":"CodeUnit","AadTenantId":"450a3361-0bcb-4125-89c7-ceb20379258d","aadTenantId":"450a3361-0bcb-4125-89c7-ceb20379258d","alObjectId":"8888","Component":"Dynamics 365 Business Central Server","component":"Dynamics 365 Business Central Server","eventId":"AL0000CTP","alEmailMessageID":"{C7A56676-9F3F-4044-90F0-D7F3196AC366}","alConnector":"Current User","alDataClassification":"SystemMetadata","alCategory":"Email"}
-->
## See also

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enabling Application Insights for Tenant Telemetry On-Premises](telemetry-enable-application-insights.md)  
[Enable Sending Telemetry to Application Insights](tenant-admin-center-telemetry.md#appinsights)  
