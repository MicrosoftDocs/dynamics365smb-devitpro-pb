---
title: Analyze and Monitor Telemetry with KQL
description: Learn how to query Business Central telemetry with KQL.  
author: kennienp
ms.topic: overview
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 11/13/2022
ms.author: jswymer
ms.reviewer: jswymer
ms.service: dynamics365-business-central
ms.custom: bac-template
---
# Analyze and Monitor Telemetry with KQL

Telemetry from [!INCLUDE[prod_short](../developer/includes/prod_short.md)] is stored in [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] in the tables *traces* and *pageViews*. The language used to query data in [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] is _Kusto Query Language_ (KQL). This article has information and links to resources to get started learning about the KQL language.
As a simple example, follow these steps:
  
1. In the Azure portal, open your Application Insights resource.
2. In the **Monitoring** menu, select **Logs**.
3. On the **New Query** tab, enter the following to get the last 100 traces:

    ```kql
    traces
    | where timestamp > ago(7d)                     // look back 7 days
    | take 100                                      // only take 100 rows
    | project timestamp, message, customDimensions  // only choose these three columns 
    | sort by timestamp desc                        // show the most recent data first
    ```

## Where can I use Kusto Queries?

You can use Kusto queries as the data source in many places. For example:

* The **logs** part of Application Insights in the Azure portal
* Power BI reports
* Alerts
* Azure Dashboards
* Jupyter Notebooks (with the Kqlmagic extension)

## Where can I learn more about KQL?

[!INCLUDE[LearnKQL](../developer/include-telemetry-learn-kql.md)]

## Which tools can I use (KQL editors and clients)?

[!INCLUDE[KQLTools](../developer/include-telemetry-kql-tool.md)]

### <a name="customdimensions"></a>About custom dimensions

Each event has a `customDimensions` column that includes a set of dimensions containing metrics specific to the event. Each of these custom dimensions has a limit of 8000 characters. When logging an event with a dimension exceeding 8000 characters, the  [!INCLUDE[server](../developer/includes/server.md)] adds more overflow dimension keys to the event to contain the excess characters. There can be up to two extra overflow dimension keys, each with a maximum 8000 characters. The overflow dimension keys are named  `<dimension_key_name>_1` and `<dimension_key_name>_2`, where `<dimension_key>` is the name of the original dimension key. So if the custom dimension key is `extensionCompilationDependencyList`, then the overflow dimension keys would be `extensionCompilationDependencyList_1` and `extensionCompilationDependencyList_2`.

> [!NOTE]
> The 8000 character limit is governed by the [Application Insights API](/azure/azure-monitor/app/api-custom-events-metrics#limits).

## See also

[Telemetry overview](telemetry-overview.md)  
[Enabling telemetry](telemetry-enable-application-insights.md)  
[Available telemetry](telemetry-available-telemetry.md)  
[Analyze Telemetry with Power BI](telemetry-power-bi-app.md)
[Telemetry FAQ](telemetry-faq.md)
