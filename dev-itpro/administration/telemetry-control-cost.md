---
title: Controlling Telemetry Cost
description: Learn how to control the cost of Business Central provides telemetry.  
author: kennieNP
ms.topic: overview
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 11/13/2022
ms.author: jswymer
ms.reviewer: jswymer
ms.service: dynamics365-business-central
ms.custom: bac-template
---
# Controlling Telemetry Cost

[!INCLUDE[telemetryCost](../includes/include-telemetry-cost.md)]

## Control data ingestion cost

[!INCLUDE[telemetryControlCost](../includes/include-telemetry-control-cost.md)]

### Data ingestion cost strategies
To control data ingestion cost, consider the following practice when setting up telemetry
1. Set a daily cap on how much data that can be ingested (and what you are willing to pay for)
2. Set up an alert when daily cap is reached (so that you know that you do not get all data)
3. Use sampling or Data Collection Rules to adjust data ingestion

For more information, see [Cost optimization in Azure Monitor](/azure/azure-monitor/best-practices-cost) and [Set daily cap on Log Analytics workspace](/azure/azure-monitor/logs/daily-cap).

### Calculating the cost of data ingestion

Currently, the first 5GB of data ingested per month is free. To stay below this limit, you can set up a daily cap of 160 MB per day.

One telemetry event typically consumes 2-10 KB depending of the type of event. The max size for one event is 32 KB.

So with a 160 MB daily cap, you can receive between 5000 (worst case) and 80000 daily events (best case). With event size 10kb, this corresponds to 16000 daily events.

Current price for data ingestion is 2.76 USD/GB (for pay-as-you-go). If we assume 10KB event size, 1 GB can give you an additional 100.000 monthly events ~ 3300 daily events. Or 0.00276 cents/event.

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

To use DCRs, your [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] resource must be converted to Workspace-based (which enables Log Analytics as your back-end). For recently created [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] resources, Workspace-based is the default setting. For older [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] resources, you need to convert them (takes a few minutes).

DCRs are defined on your _workspace_ under the menu item _Tables_. Business Central currently logs to two tables: _AppTraces_ and _AppPageViews_. These tables are the back-end tables for the tables _traces_ and _pageviews_ that you normally use in KQL queries. Right-click on a table and go to **Edit transformation** and select the **Transformation Editor** button to add a KQL query to filter away certain types of data.

To help you get started with setting up Data Collection Rules, we've added many sample KQL queries that illustrate common filter scenarios:

- How to filter out one or more events (I don't need these events, no need to pay for them)
- How to only filter part of an event (I only want to see events when something fails or I only want 10 percent of these events)
- How to filter on Microsoft Entra tenant (I'm an ISV and I want to start slowly on telemetry, so only enabling it for a few customers)
- How to filter on environment type (I'm an ISV and I only want data from production environments)
- How to filter on app dimensions (I'm a VAR and this app/publisher is too noisy)

For sample queries, go to [Data Collection Rule KQL samples](https://github.com/microsoft/BCTech/tree/master/samples/AppInsights/KQL/Queries/DataCollectionRules).

### Use a custom endpoint

[!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] support overriding the standard data ingestion endpoint provided in the connection string (available in the [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] portal). This capability means you can send telemetry data to your own component to do post-processing. For example, you could filter or enrich before ingesting data into your data source of choice. The data source can be an Azure SQL database, a data lake, Azure Log Analytics, [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)], or a third-party data store.

You can override the ingestion endpoint by using the IngestionEndpoint key in the [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] connection string. Learn more in the documentation: [Overriding the Azure Application Insights standard connection string](/azure/azure-monitor/app/sdk-connection-string?tabs=net#connection-string-with-explicit-endpoint-overrides).

## Reducing data retention cost

To reduce data retention cost, you can 
- use the default retention for [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] resources (currently 90 days). Different retention periods can be selected for each Application Insights resource. The full set of available retention periods is 30, 60, 90, 120, 180, 270, 365, 550, or 730 days.
- purge data from your Application Insights resource using a set of user-defined filters. See [Components - Purge](/rest/api/application-insights/components/purge#examples) for examples.

## See also
[Telemetry overview](telemetry-overview.md)  
[Enabling telemetry](telemetry-enable-application-insights.md)  
[Available telemetry](telemetry-available-telemetry.md)  
[Telemetry FAQ](telemetry-faq.md)
