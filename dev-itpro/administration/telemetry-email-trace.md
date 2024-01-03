---
title: Analyze email trace telemetry 
description: Learn about the email telemetry in Business Central  
author: kennienp
ms.topic: conceptual
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 01/02/2024
ms.reviewer: jswymer
ms.author: kepontop
ms.service: dynamics365-business-central
ms.custom: bap-template
---

# Analyze email telemetry

**APPLIES TO:** [!INCLUDE[prod_short](../includes/prod_short.md)] 2020 release wave 2, update 17.2, and later

Email telemetry gathers data about the following operations: 

- An email was sent successfully
- An attempt to send an email failed 

From [!INCLUDE[prod_short](../includes/prod_short.md)] 2023 release wave 1, update 23.2, and later, the following operations are also emitted to telemetry:

- Authentication to an SMTP server succeded/failed
- Connection to an SMTP server succeded/failed


<!--Today, partners can test email setup during setup (click a test button). If settings change on SMTP side later, they don't get notified before something stops working. -->

Before you can collect this data, you'll have to set up email. For more information, see [Set Up Email](/dynamics365/business-central/admin-how-setup-email) in the [!INCLUDE[prod_short](../includes/prod_short.md)] application help.

> [!TIP]
> You can also view failed emails in the **Email Outbox** page in the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] client.


## <a name="success"></a>Email sent successfully

Occurs when an email was successfully sent from the client.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Email sent successfully**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId| [!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)] |
|clientType| [!INCLUDE[clientType](../includes/include-telemetry-dimension-client-type.md)] | 
|companyName| [!INCLUDE[companyName](../includes/include-telemetry-dimension-company-name.md)] | 
|environmentName| [!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)] |
|environmentType| [!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)] |
|alConnector|Specifies the email-provider connector used to send the email. Possible values include: <ul><li>Current User</li><li>Microsoft 365</li><li>SMTP</li><li>Other custom connectors installed by extensions.</li></ul> The connector is specified on the email accounts that are set up in [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. For more information, see [Adding Email Accounts](/dynamics365/business-central/admin-how-setup-email#adding-email-accounts).|
|alEmailMessageID|Specifies the GUID assigned to email, like C7A56676-9F3F-4044-90F0-D7F3196AC366.|
|alObjectId|**8888**, which is the ID of the system application codeunit that sends emails.|
|alObjectName|**Email Dispatcher**, which is the name of the system application codeunit that sends the emails.|
|alObjectType|**CodeUnit**|
|eventId|**AL0000CTV**|

## <a name="failed"></a>Failed to send email

Occurs when an email failed to be sent from the client.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Failed to send email.**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId| [!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)] |
|clientType| [!INCLUDE[clientType](../includes/include-telemetry-dimension-client-type.md)] | 
|companyName| [!INCLUDE[companyName](../includes/include-telemetry-dimension-company-name.md)] | 
|environmentName| [!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)] |
|environmentType| [!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)] |
|alConnector|Specifies the email-provider connector used to send the email. Possible values include: <ul><li>Current User</li><li>Microsoft 365</li><li>SMTP</li><li>Other custom connectors installed by extensions.</li></ul> The connector is specified on the email accounts that are set up in [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. For more information, see [Adding Email Accounts](/dynamics365/business-central/admin-how-setup-email#adding-email-accounts).|
|alEmailMessageID|Specifies the GUID assigned to email, like C7A56676-9F3F-4044-90F0-D7F3196AC366.|
|alErrorCallStack| Specifies the AL callstack when the error occurred. This dimension was added in version 19.0.|
|alErrorText| Specifies the AL error message. This dimension was added in version 19.0. |
|alObjectId|**8888**, which is the ID of the system application codeunit that sends emails.|
|alObjectName|**Email Dispatcher**, which is the name of the system application codeunit that sends the emails.|
|alObjectType|**CodeUnit**|
|eventId|**AL0000CTP**|

## <a name="smtp_auth"></a>SMTP server authentication

Occurs when the SMTP module is authenticating to an SMTP server.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Authenticated to SMTP server**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId| [!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)] |
|clientType| [!INCLUDE[clientType](../includes/include-telemetry-dimension-client-type.md)] | 
|companyName| [!INCLUDE[companyName](../includes/include-telemetry-dimension-company-name.md)] | 
|environmentName| [!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)] |
|environmentType| [!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)] |
|eventId|**AL0000GKK**|
| alAuthenticated | Specifies whether authentication succeeded. Possible values are **Yes** or **No**. |

### Sample KQL code

This KQL code can help you get started analyzing SMTP authentication failures:

```kql
// Authenticated to SMTP server
// Introduced in version 22.3
traces
| where timestamp > ago(60d) // adjust as needed
| where customDimensions.eventId == 'AL0000GKK'
| where customDimensions.alAuthenticated == 'No'
| project timestamp
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
, clientType = customDimensions.clientType
```

[!INCLUDE[telemetry_alert_learn_more](../includes/telemetry-alerting.md)]

## <a name="smtp_connection"></a>SMTP server connections

Occurs when the SMTP module is connecting to an SMTP server.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Connected to SMTP server**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId| [!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)] |
|clientType| [!INCLUDE[clientType](../includes/include-telemetry-dimension-client-type.md)] | 
|companyName| [!INCLUDE[companyName](../includes/include-telemetry-dimension-company-name.md)] | 
|environmentName| [!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)] |
|environmentType| [!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)] |
|eventId|**AL0000GKJ**|
| alConnected | Specifies whether connection succeeded. Possible values are **Yes** or **No**. |

### Sample KQL code
 
This KQL code can help you get started analyzing SMTP connection failures:

```kql
// Connected to SMTP server
// Introduced in version 22.3
traces
| where timestamp > ago(60d) // adjust as needed
| where customDimensions.eventId == 'AL0000GKJ'
| where customDimensions.alConnected == 'No'
| project timestamp
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
, clientType = customDimensions.clientType
```

[!INCLUDE[telemetry_alert_learn_more](../includes/telemetry-alerting.md)]

## <a name="smtp_sent"></a>Email sent (using SMTP)

Occurs when the SMTP module is sending an email.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Email sent**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId| [!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)] |
|clientType| [!INCLUDE[clientType](../includes/include-telemetry-dimension-client-type.md)] | 
|companyName| [!INCLUDE[companyName](../includes/include-telemetry-dimension-company-name.md)] | 
|environmentName| [!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)] |
|environmentType| [!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)] |
|eventId|**AL0000GKL**|
|alSent| Specifies whether sending the email succeeded. Possible values are **Yes** or **No**. |

### Sample KQL code

This KQL code can help you get started analyzing failures in sending emails:

```kql
// Connected to SMTP server
// Introduced in version 22.3
traces
| where timestamp > ago(60d) // adjust as needed
| where customDimensions.eventId == 'AL0000GKL'
| where customDimensions.alSent == 'No'
| project timestamp
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
, clientType = customDimensions.clientType
```

[!INCLUDE[telemetry_alert_learn_more](../includes/telemetry-alerting.md)]

## Sample KQL code for alerting on SMTP failures

Use this KQL code if you want to set up alerts on SMTP failures, either failures authenticating/connecting to SMTP servers or failures on sending emails.

```kql
traces
| where timestamp > ago(1d) // adjust as needed
| where  customDimensions.eventId == 'AL0000CTP'
     or (customDimensions.eventId == 'AL0000GKK' and customDimensions.alAuthenticated == 'No')
     or (customDimensions.eventId == 'AL0000GKJ' and customDimensions.alConnected == 'No')
     or (customDimensions.eventId == 'AL0000GKL' and customDimensions.alSent == 'No')
| extend EventId = customDimensions.eventId     
| summarize count() by
  aadTenantId = tostring( customDimensions.aadTenantId )
, environmentName = tostring( customDimensions.environmentName )
, environmentType = tostring( customDimensions.environmentType )
, companyName = tostring( customDimensions.companyName )
, clientType = tostring( customDimensions.clientType )
, ErrorType = case (
  EventId == 'AL0000CTP', 'Other'
, EventId == 'AL0000GKK', 'SMTP authentication'
, EventId == 'AL0000GKJ', 'SMTP connection'
, EventId == 'AL0000GKL', 'SMTP email'
, 'Unknown'
)
```

[!INCLUDE[telemetry_alert_learn_more](../includes/telemetry-alerting.md)]

## See also

[Monitoring and Analyzing Telemetry](telemetry-overview.md)    
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)    
[Alert on Telemetry](telemetry-alert.md)   
