---
title: Analyze business events telemetry
description: Learn about business events telemetry in Business Central  
author: kennienp
ms.topic: how-to
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 05/01/2026
ms.reviewer: jswymer
ms.author: kepontop
ms.custom: bap-template
---

# Analyze business events telemetry

**APPLIES TO:** [!INCLUDE[prod_short](../includes/prod_short.md)] 2024 release wave 2 and later

Business events telemetry gathers data about the lifecycle and execution of business event subscriptions. Business events enable external systems to receive notifications when specific actions occur in [!INCLUDE[prod_short](../includes/prod_short.md)].

## <a name="RT0040"></a>Business event subscription created

Occurs when a business event subscription is successfully created.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Business event subscription created**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId| [!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)] |
|companyId| Specifies the GUID of the company in which the business event subscription was created.|
|companyName| [!INCLUDE[companyName](../includes/include-telemetry-dimension-company-name.md)] |
|environmentName| [!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)] |
|environmentType| [!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)] |
|eventId|**RT0040**|
|eventName|Specifies the name of the business event that was subscribed to.|
|eventVersion|Specifies the version of the business event.|
|notificationUrl|Specifies the notification URL that receives business event notifications.|
|subscriptionId|Specifies the GUID assigned to the business event subscription.|

### Sample KQL code

```kql
traces
| where timestamp > ago(60d)
| where customDimensions.eventId == 'RT0040'
| project timestamp
, message
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
, eventName = customDimensions.eventName
, eventVersion = customDimensions.eventVersion
, subscriptionId = customDimensions.subscriptionId
, notificationUrl = customDimensions.notificationUrl
```

## <a name="RT0041"></a>Business event subscription deleted

Occurs when a business event subscription is deleted.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Business event subscription deleted**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId| [!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)] |
|companyId| Specifies the GUID of the company in which the business event subscription was deleted.|
|companyName| [!INCLUDE[companyName](../includes/include-telemetry-dimension-company-name.md)] |
|environmentName| [!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)] |
|environmentType| [!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)] |
|eventId|**RT0041**|
|eventName|Specifies the name of the business event.|
|eventVersion|Specifies the version of the business event.|
|subscriptionId|Specifies the GUID of the business event subscription that was deleted.|

### Sample KQL code

```kql
traces
| where timestamp > ago(60d)
| where customDimensions.eventId == 'RT0041'
| project timestamp
, message
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, companyName = customDimensions.companyName
, eventName = customDimensions.eventName
, subscriptionId = customDimensions.subscriptionId
```

## <a name="RT0042"></a>Business event subscription modified

Occurs when a business event subscription is modified.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Business event subscription modified**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId| [!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)] |
|companyId| Specifies the GUID of the company in which the business event subscription was modified.|
|companyName| [!INCLUDE[companyName](../includes/include-telemetry-dimension-company-name.md)] |
|environmentName| [!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)] |
|environmentType| [!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)] |
|eventId|**RT0042**|
|eventName|Specifies the name of the business event.|
|eventVersion|Specifies the version of the business event.|
|notificationUrl|Specifies the new notification URL.|
|subscriptionId|Specifies the GUID of the business event subscription that was modified.|

### Sample KQL code

```kql
traces
| where timestamp > ago(60d)
| where customDimensions.eventId == 'RT0042'
| project timestamp
, message
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, companyName = customDimensions.companyName
, eventName = customDimensions.eventName
, subscriptionId = customDimensions.subscriptionId
, notificationUrl = customDimensions.notificationUrl
```

## <a name="RT0043"></a>Business event subscription enabled

Occurs when a business event subscription is enabled.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Business event subscription enabled**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId| [!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)] |
|companyId| Specifies the GUID of the company in which the business event subscription was enabled.|
|companyName| [!INCLUDE[companyName](../includes/include-telemetry-dimension-company-name.md)] |
|environmentName| [!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)] |
|environmentType| [!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)] |
|eventId|**RT0043**|
|eventName|Specifies the name of the business event.|
|eventVersion|Specifies the version of the business event.|
|subscriptionId|Specifies the GUID of the business event subscription that was enabled.|

### Sample KQL code

```kql
traces
| where timestamp > ago(60d)
| where customDimensions.eventId == 'RT0043'
| project timestamp
, message
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, companyName = customDimensions.companyName
, eventName = customDimensions.eventName
, subscriptionId = customDimensions.subscriptionId
```

## <a name="RT0044"></a>Business event subscription disabled

Occurs when a business event subscription is disabled.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Business event subscription disabled**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId| [!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)] |
|companyId| Specifies the GUID of the company in which the business event subscription was disabled.|
|companyName| [!INCLUDE[companyName](../includes/include-telemetry-dimension-company-name.md)] |
|environmentName| [!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)] |
|environmentType| [!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)] |
|eventId|**RT0044**|
|eventName|Specifies the name of the business event.|
|eventVersion|Specifies the version of the business event.|
|subscriptionId|Specifies the GUID of the business event subscription that was disabled.|

### Sample KQL code

```kql
traces
| where timestamp > ago(60d)
| where customDimensions.eventId == 'RT0044'
| project timestamp
, message
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, companyName = customDimensions.companyName
, eventName = customDimensions.eventName
, subscriptionId = customDimensions.subscriptionId
```

## <a name="RT0045"></a>Business event triggered successfully

Occurs when a business event is successfully triggered and a log entry is created.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Business event triggered successfully**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId| [!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)] |
|companyId| Specifies the GUID of the company in which the business event was triggered.|
|companyName| [!INCLUDE[companyName](../includes/include-telemetry-dimension-company-name.md)] |
|environmentName| [!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)] |
|environmentType| [!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)] |
|eventId|**RT0045**|
|eventName|Specifies the name of the business event that was triggered.|
|eventVersion|Specifies the version of the business event.|

### Sample KQL code

```kql
traces
| where timestamp > ago(60d)
| where customDimensions.eventId == 'RT0045'
| project timestamp
, message
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, companyName = customDimensions.companyName
, eventName = customDimensions.eventName
, eventVersion = customDimensions.eventVersion
```

## <a name="RT0046"></a>Business event trigger failed

Occurs when a business event couldn't be triggered.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Business event trigger failed**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId| [!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)] |
|companyId| Specifies the GUID of the company in which the business event trigger failed.|
|companyName| [!INCLUDE[companyName](../includes/include-telemetry-dimension-company-name.md)] |
|environmentName| [!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)] |
|environmentType| [!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)] |
|eventId|**RT0046**|
|eventName|Specifies the name of the business event that failed to trigger.|
|eventVersion|Specifies the version of the business event.|

### Sample KQL code

```kql
traces
| where timestamp > ago(60d)
| where customDimensions.eventId == 'RT0046'
| project timestamp
, message
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, companyName = customDimensions.companyName
, eventName = customDimensions.eventName
, eventVersion = customDimensions.eventVersion
```

## <a name="RT0047"></a>Business event notification sending failed

Occurs when a business event notification failed to be sent to the subscription endpoint.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Business event notification sending failed**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId| [!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)] |
|companyId| Specifies the GUID of the company in which the business event notification failed.|
|companyName| [!INCLUDE[companyName](../includes/include-telemetry-dimension-company-name.md)] |
|environmentName| [!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)] |
|environmentType| [!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)] |
|eventId|**RT0047**|
|eventName|Specifies the name of the business event.|
|eventVersion|Specifies the version of the business event.|

### Sample KQL code

```kql
traces
| where timestamp > ago(60d)
| where customDimensions.eventId == 'RT0047'
| project timestamp
, message
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, companyName = customDimensions.companyName
, eventName = customDimensions.eventName
, eventVersion = customDimensions.eventVersion
```

[!INCLUDE[telemetry_alert_learn_more](../includes/telemetry-alerting.md)]

## Related information

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  
