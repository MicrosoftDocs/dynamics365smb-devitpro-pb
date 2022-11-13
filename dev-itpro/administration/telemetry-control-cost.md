---
title: Controlling Telemetry Cost
description: Learn how to control the cost of Business Central provides telemetry.  
author: kepontop
ms.topic: overview
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 11/13/2022
ms.author: kepontop
---

# Controlling Telemetry Cost
Azure Application Insights is billed based on the volume of telemetry data your application sends (data ingestion) and how long time you want data to be available (data retention). 

Check the Azure Application Insights documentation for up-to-date information on pricing: [https://azure.microsoft.com/pricing/details/monitor/](https://azure.microsoft.com/pricing/details/monitor/).

### Control data ingestion cost
To reduce data ingestion cost, you can:
- sample to only ingest a percentage of the inbound data (learn more at [Sampling in Application Insights](/azure/azure-monitor/app/sampling#ingestion-sampling).
- set a daily limit of how much data can be ingested.
- set alerts on cost thresholds being exceeded to get notified if this happens.
- use a custom endpoint (learn more in the section below).
- use a custom endpoint (learn more in the section below).

Except for using a custom endpoint, you find the options for controlling data ingestion cost in Azure Application Insights, under _configure, usage, and estimated costs_.

#### Distribution of Telemetry Data
To see the data distribution of different event ids in your Azure Application Insights resource, your can run the KQL queries below.

    ```kql
// 30 day overview of event ingestion in your Application Insights resource
let lookback = 30d ;
let traces_stats = 
traces
| where timestamp > ago(lookback) 
| extend eventId = tostring( customDimensions.eventId )
| summarize count() by eventId
| extend table_name = 'traces'
| project eventId, table_name, count_
;
let pageview_stats =
pageViews
| where timestamp > ago(lookback) 
| extend eventId = tostring( customDimensions.eventID )
| summarize count() by eventId
| extend table_name = 'pageViews'
| project eventId, table_name, count_
;
traces_stats
| union pageview_stats
| order by count_ desc
| project eventId, table_name, event_count=count_
| order by event_count desc  
    ```

Similarly, you can see the data distribution of different environments in your Azure Application Insights resource, by running the KQL queries below.
    ```kql
// 30 day overview of data ingestion by environment in your Application Insights resource
let lookback = 30d ;
union traces, pageViews
| where timestamp > ago(lookback) 
| extend aadTenantId = tostring( customDimensions.aadTenantId )
, environmentName = tostring( customDimensions.environmentName )
| summarize count() by aadTenantId, environmentName
| project aadTenantId, environmentName, count_
| order by aadTenantId, environmentName
    ```

#### Use Data Collection Rules (DCR)
Azure Log Analytics (the backend of Azure Application Insights) has a feature called Data Collection Rules (DCR) that allows you to define rules on what is ingested into your telemetry resource. You can use this to filter away data that you do not need in telemetry to speed up query performance and save cost.

To use Data Collection Rules, your Azure Application Insights resource must be converted to Workspace-based (this enables Log Analytics as your backend). For recently created Azure Application Insights resources, this is the default setting. For older Azure Application Insights resources, you need to convert them (takes a few minutes).

Data Collection Rules are defined on your _workspace_ under the menu item _Tables_. Business Central currently logs to two tables: _AppTraces_ and _AppPageViews_ (these are the backend tables for the tables _traces_ and _pageviews_ that you normally use in KQL queries). Right-click on a table and go to _Edit transformation_ and click the button _Transformation Editor_ to add a KQL query to filter away certain types of data.

To help you get started with setting up Data Collection Rules, we added a number of sample KQL queries that illustrates common filter scenarios:
- how to filter out one or more events (I don't need these, no need to pay for them)
- how to only filter part of an event (I only want to see events when this fails or I only want 10% of these events)
- how to filter on AAD tenant (I am an ISV and I want to start slowly on telemetry, so only enabling it for a few customers)
- how to filter on environment type (I am an ISV and I only want data from production environments)
- how to filter on app dimensions (I am a VAR and this app/publisher is too noisy)

See the sample queries here: [Data Collection Rule KQL samples](https://github.com/microsoft/BCTech/tree/master/samples/AppInsights/KQL/Queries/DataCollectionRules) 

#### Use a custom endpoint
Azure Application Insights support overriding the standard data ingestion endpoint provided in the connection string (available  in the Azure Application Insights portal). This means that you can send telemetry data to your own component to do post-processing such as filtering or enrichment before ingesting data into your data source of choice (such as an Azure SQL database, a datalake, Azure Log Analytics, Azure Application Insights, or a third-party data store).

You can override the ingestion endpoint by using the IngestionEndpoint key in the Azure Application Insights connection string. Learn more in the documentation: [Overriding the Azure Application Insights standard connection string](/azure/azure-monitor/app/sdk-connection-string?tabs=net#connection-string-with-explicit-endpoint-overrides).

### Reducing data retention cost
To reduce data retention cost, you can 
- use the default retention for Application Insights resources (currently 90 days). Different retention periods can be selected for each Application Insights resource. The full set of available retention periods is 30, 60, 90, 120, 180, 270, 365, 550, or 730 days.
- purge data from your Application Insights resource using a set of user-defined filters. See [Components - Purge](/rest/api/application-insights/components/purge#examples) for examples.

## See also
[Telemetry overview](telemetry-overview.md)  
[Enabling telemetry](telemetry-enable-application-insights.md)  
[Available telemetry](telemetry-available-telemetry.md)  
