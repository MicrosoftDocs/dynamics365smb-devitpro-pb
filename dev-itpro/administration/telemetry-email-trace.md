---
title: Analyzing Email Trace Telemetry
description: Analyze email telemetry in Business Central to monitor email delivery and troubleshoot failures when connecting or authenticating to SMTP servers.
author: kennienp
ms.topic: reference
ai-usage: ai-assisted
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 11/17/2026
ms.reviewer: jswymer
ms.author: kepontop

ms.custom: bap-template
---

# Analyze email telemetry

**APPLIES TO:** [!INCLUDE[prod_short](../includes/prod_short.md)] 2020 release wave 2, update 17.2, and later

Email telemetry gathers data about the following operations: 

- An email was sent successfully
- An attempt to send an email failed 

In application versions that include the SMTP telemetry events documented below, the following operations are also emitted to telemetry:

- Authentication to an SMTP server succeeded or failed
- Connection to an SMTP server succeeded or failed
- Sending an email through SMTP succeeded or failed


<!--Today, partners can test email setup during setup (click a test button). If settings change on SMTP side later, they don't get notified before something stops working. -->

Before you can collect this data, you'll have to set up email. Learn more in [Set Up Email](/dynamics365/business-central/admin-how-setup-email) in the [!INCLUDE[prod_short](../includes/prod_short.md)] application help.

These events use `TelemetryScope::All`. The failed-to-send event uses error verbosity (`severityLevel` **3**). The other events use normal verbosity (`severityLevel` **1**), including SMTP events whose result dimension is **No**.

> [!TIP]
> You can also view failed emails in the **Email Outbox** page in the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] client.


## <a name="success"></a>Email sent successfully

Occurs when the email dispatcher successfully sends an email.

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
|alFeatureName|**Emailing**|
|alEventName|**Email sent**|
|alObjectId|**8713**, which is the ID of the system application telemetry logger codeunit.|
|alObjectName|`System Telemetry Logger`, which emits the event on behalf of the email dispatcher.|
|alObjectType|**CodeUnit**|
|eventId|**AL0000CTV**|

## <a name="failed"></a>Failed to send email

Occurs when the email dispatcher fails to send an email.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|The error text returned by the failed send operation.|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId| [!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)] |
|clientType| [!INCLUDE[clientType](../includes/include-telemetry-dimension-client-type.md)] | 
|companyName| [!INCLUDE[companyName](../includes/include-telemetry-dimension-company-name.md)] | 
|environmentName| [!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)] |
|environmentType| [!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)] |
|alFeatureName|**Emailing**|
|alEventName|**Failed to send email**|
|alErrorCallStack| Specifies the AL callstack when the error occurred. This dimension was added in version 19.0.|
|alErrorText| Specifies the AL error message. This dimension was added in version 19.0. |
|alObjectId|**8713**, which is the ID of the system application telemetry logger codeunit.|
|alObjectName|`System Telemetry Logger`, which emits the event on behalf of the email dispatcher.|
|alObjectType|**CodeUnit**|
|eventId|**AL0000CTP**|

## <a name="smtp_auth"></a>SMTP server authentication

Occurs when the SMTP module is authenticating to an SMTP server.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Authenticated to SMTP server.**|
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
|message|**Connected to SMTP server.**|
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
|message|**Sent email.**|
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
// Sent email
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

## Related information

[Monitoring and Analyzing Telemetry](telemetry-overview.md)    
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)    
[Alert on Telemetry](telemetry-alert.md)   
