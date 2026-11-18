---
title: Control Business Central Telemetry Costs
description: Control Business Central telemetry costs with ingestion filters, daily caps, and retention settings for your Azure Application Insights data.
author: kennieNP
ms.topic: how-to
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 11/17/2026
ms.author: jswymer
ms.reviewer: jswymer
ms.custom: bap-template
ai-usage: ai-assisted
---

# Control telemetry costs

[!INCLUDE[telemetryCost](../includes/include-telemetry-cost.md)]

## Control data ingestion cost

[!INCLUDE[telemetryControlCost](../includes/include-telemetry-control-cost.md)]

### Data ingestion cost strategies

To control data ingestion cost, consider the following practice when setting up telemetry:

1. Use sampling or data collection rules to adjust data ingestion.
1. Set a daily cap as a safeguard against unexpected ingestion spikes.
1. Set up an alert when the daily cap is reached so that you know data collection has stopped.

> [!IMPORTANT]
> A daily cap isn't a precise spending limit. Ingestion can exceed the cap, and the excess is billed. When the cap stops data collection, monitoring and telemetry-based alerts can miss events.

Learn more in [Cost optimization in Azure Monitor](/azure/azure-monitor/best-practices-cost) and [Set daily cap on Log Analytics workspace](/azure/azure-monitor/logs/daily-cap).

#### Video guidance

The following video shows how to enable cost control strategies for telemetry.

> [!VIDEO https://learn-video.azurefd.net/vod/player?id=38a5cd44-3817-487d-818c-2bc2317f5d8f]

### Calculating the cost of data ingestion

Azure Monitor pricing depends on your region, pricing tier, and subscription. Check the current ingestion allowance and price for your linked Log Analytics workspace in [Azure Monitor pricing](https://azure.microsoft.com/pricing/details/monitor/).

One telemetry event typically consumes 2-10 KB depending on the type of event. The maximum size for one event is 64 KB.

For example, 160 MB of data corresponds to approximately 16,000 events at 10 KB per event. Actual billable volume depends on the data stored, not just the size of the transmitted event.

At 10 KB per event, 1 GB corresponds to approximately 100,000 events. Multiply the billable volume by your regional ingestion price to estimate cost. Learn more in [Azure Monitor Logs cost calculations and options](/azure/azure-monitor/logs/cost-logs).

Typically, non-interactive sessions such as web service calls or background sessions are the ones that can generate a lot of data. These are the ones you could consider filtering away to reduce cost.

### Examples of cost of data ingestion

One partner that uses telemetry a lot reported that they on average spend 7.3 USD per customer per month on data ingestion. For their large customers they spend up to 178 USD per month (without setting up data collection rules, sampling, or daily cap). 

Their top 10 customer cost per month on telemetry is:

| Rank | Monthly Cost (in USD) |
| ---- | --------------------- |
|1 |178.68 |
|2 |173.68 |
|3 |146.03 |
|4 |106.32 |
|5 |66.47 |
|6 |31.91 |
|7 |27.06 |
|8 |23.53 |
|9 |22.79 |
|10|17.65|

> [!NOTE]  
> These numbers can vary and should only be taken as guidance. You need to measure your own telemetry cost based on data ingestion volume.

### Distribution of telemetry data

[!INCLUDE[telemetryEventDistribution](../includes/include-telemetry-event-distribution.md)]

### Use data collection rules (DCR)

Azure Log Analytics (the backend of [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)]) has a feature called Data Collection Rules (DCR). DCRs allow you to define rules on what is ingested into your telemetry resource. Use them to filter away unneeded telemetry data, which speeds up query performance and saves cost.

To use DCRs, use the Log Analytics workspace linked to your workspace-based [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] resource. Classic Application Insights resources are retired. Learn more in [Create and configure Application Insights resources](/azure/azure-monitor/app/create-workspace-resource).

DCRs are defined on your workspace. Business Central currently logs to two tables: `AppTraces` and `AppPageViews`. These tables are the workspace tables for `traces` and `pageViews` that you normally use in Application Insights KQL queries. Add a transformation to the workspace transformation DCR to filter data before ingestion. Learn more in [Create a transformation in Azure Monitor](/azure/azure-monitor/data-collection/data-collection-transformations-create).

To help you get started with setting up Data Collection Rules, we've added many sample KQL queries that illustrate common filter scenarios:

- How to filter out one or more events (I don't need these events, no need to pay for them)
- How to only filter part of an event (I only want to see events when something fails or I only want 10 percent of these events)
- How to filter on Microsoft Entra tenant (I'm an ISV and I want to start slowly on telemetry, so only enabling it for a few customers)
- How to filter on environment type (I'm an ISV and I only want data from production environments)
- How to filter on app dimensions (I'm a VAR and this app/publisher is too noisy)

Learn more in [Data Collection Rule KQL samples](https://github.com/microsoft/BCTech/tree/master/samples/AppInsights/KQL/Queries/DataCollectionRules).

### Use a custom endpoint

[!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] supports overriding the standard data ingestion endpoint provided in the connection string (available in the [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] portal). This capability means you can send telemetry data to your own component to do post-processing. For example, you could filter or enrich before ingesting data into your data source of choice. The data source can be an Azure SQL database, a data lake, Azure Log Analytics, [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)], or a third-party data store.

You can override the ingestion endpoint by using the `IngestionEndpoint` key in the [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] connection string. The custom endpoint must accept the Application Insights ingestion protocol and forward or transform the data. A connection string can't send telemetry directly to an arbitrary database. Learn more in [Connection strings in Application Insights](/azure/azure-monitor/app/connection-strings#connection-string-with-explicit-endpoint-overrides).

## <a name="reducing-data-retention-cost"></a>Reduce data retention cost

To reduce data retention cost, configure retention on the Log Analytics workspace and its tables. Keep analytics retention within your included allowance unless you need longer access. Use lower-cost long-term retention when you can use search jobs instead of interactive queries.

Purging data is intended for privacy requirements, not routine cost control. Learn more in [Manage data retention in a Log Analytics workspace](/azure/azure-monitor/logs/data-retention-configure) and [Manage personal data in Azure Monitor Logs](/azure/azure-monitor/logs/personal-data-mgmt).

## Related information
[Telemetry overview](telemetry-overview.md)  
[Enabling telemetry](telemetry-enable-application-insights.md)  
[Available telemetry](telemetry-available-telemetry.md)  
[Telemetry FAQ](telemetry-faq.md)
