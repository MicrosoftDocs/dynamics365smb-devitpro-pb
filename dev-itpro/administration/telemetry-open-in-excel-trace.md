---
title: Analyze Open in Excel telemetry
description: Learn about the Open in Excel telemetry in Business Central  
author: jswymer
ms.topic: how-to
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 05/01/2026
ms.reviewer: jswymer
ms.author: jswymer
ms.custom: bap-template
ai-usage: ai-assisted
---

# Analyze Open in Excel telemetry

**APPLIES TO:** [!INCLUDE[prod_short](../includes/prod_short.md)] 2024 release wave 2 and later

Open in Excel telemetry gathers data about when users export data from [!INCLUDE[prod_short](../includes/prod_short.md)] to Excel using the **Open in Excel** action. Learn more in [Open in Excel](/dynamics365/business-central/across-work-with-excel#open-in-excel).

## <a name="RT0056"></a>Open in Excel

Occurs when a user successfully opens a page in Excel.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Open in Excel: {pageName}** where {pageName} is the name of the page that was opened in Excel.|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId| [!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)] |
|alObjectId| Specifies the ID of the page that was opened in Excel.|
|alObjectName| Specifies the name of the page that was opened in Excel.|
|alObjectType| Specifies the type of the AL object. Value is **Page**.|
|clientType| [!INCLUDE[clientType](../includes/include-telemetry-dimension-client-type.md)] |
|companyName| [!INCLUDE[companyName](../includes/include-telemetry-dimension-company-name.md)] |
|component|**Dynamics 365 Business Central Server**|
|componentVersion| Specifies the version number of the component that emits telemetry.|
|environmentName| [!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)] |
|environmentType| [!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)] |
|eventId|**RT0056**|
|extensionId| Specifies the GUID of the extension that defines the page.|
|extensionName| Specifies the name of the extension that defines the page.|
|extensionPublisher| Specifies the publisher of the extension that defines the page.|
|extensionVersion| Specifies the version of the extension that defines the page.|

### Sample KQL code

```kql
traces
| where timestamp > ago(60d)
| where customDimensions.eventId == 'RT0056'
| project timestamp
, message
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
, clientType = customDimensions.clientType
, alObjectId = customDimensions.alObjectId
, alObjectName = customDimensions.alObjectName
, extensionName = customDimensions.extensionName
, extensionPublisher = customDimensions.extensionPublisher
, extensionVersion = customDimensions.extensionVersion
```

[!INCLUDE[telemetry_alert_learn_more](../includes/telemetry-alerting.md)]

## Related information

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  
