---
title: Monitoring and Analyzing Telemetry
description: Learn how Business Central provides telemetry for each environment, both for online and on-premises environments.  
author: jswymer
ms.topic: overview
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 07/13/2022
ms.author: jswymer
---

# Monitoring and Analyzing Telemetry

[!INCLUDE[2019_releasewave2.md](../includes/2019_releasewave2.md)]

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] emits telemetry data for various activities and operations on tenants and extensions. Monitoring telemetry gives you a look at the activities and general health of your tenants, so you can diagnose problems and analyze operations that affect performance. [Application Insights](/azure/azure-monitor/app/app-insights-overview) is a service hosted within Azure that gathers telemetry data for analysis and presentation. Whether running [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online or on-premises, you can set your tenants up to send telemetry to Application Insights.  

## Tenant-level and extension-level telemetry

Application Insights can be enabled on two different levels:

- Tenant  

    When enabled on the tenant, either for a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online tenant or on-premises [!INCLUDE[server](../developer/includes/server.md)] instance, telemetry is emitted to a single Application Insights resource for gathering data on tenant-wide operations.
    
- Extension  

    With the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2020 release wave 2 and later, Application Insights can also be enabled on a per-extension basis by setting an Application Insights connection in the extension's manifest (app.json file). At runtime, certain events related to the extension are emitted to the Application Insights resource. This feature targets publishers of per-tenant extensions to give them insight into issues in their extension before partners and customers report them.

Both for tenant-level and extension-level telemetry, it is possible to craft custom telemetry messages directly from AL
using the [LogMessage Method](../developer/methods-auto/session/session-logmessage-string-string-verbosity-dataclassification-telemetryscope-string-string-string-string-method.md). Learn more about AL at [Programming in AL](../developer/devenv-programming-in-al.md).

## Available telemetry
In Application Insights, telemetry from [!INCLUDE[prod_short](../developer/includes/prod_short.md)] is logged as traces.  Currently, [!INCLUDE[prod_short](../developer/includes/prod_short.md)] offers telemetry on the following operations:  

[!INCLUDE[prod_short](../includes/include-telemetry-by-area.md)]

## <a name="enable"></a> Enable Application Insights
To send telemetry data to Application Insights, you must have an Application Insights resource in Azure. Once you have the Application Insights resource, you can start to configure your tenants and extensions to send telemetry data to it. Learn more at [Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md).  

> [!NOTE]
> For extensions, see [Sending Extension Telemetry to Azure Application Insights](../developer/devenv-application-insights-for-extensions.md).

## <a name="ingest"></a> Control telemetry cost
Azure Application Insights is billed based on the volume of telemetry data your application sends (data ingestion) and how long time you want data to be available (data retention). 

Check the Azure Application Insights documentation for up-to-date information on pricing: [https://azure.microsoft.com/pricing/details/monitor/](https://azure.microsoft.com/pricing/details/monitor/).

### Control data ingestion cost
To reduce data ingestion cost, you can:
- sample to only ingest a percentage of the inbound data (learn more at [Sampling in Application Insights](/azure/azure-monitor/app/sampling#ingestion-sampling).
- set a daily limit of how much data can be ingested.
- set alerts on cost thresholds being exceeded to get notified if this happens.
- use a custom endpoint (learn more in the section below).

Except for using a custom endpoint, you find the options for controlling data ingestion cost in Azure Application Insights, under configure, usage, and estimated costs.

#### Use a custom endpoint
Azure Application Insights support overriding the standard data ingestion endpoint provided in the connection string (available  in the Azure Application Insights portal). This means that you can send telemetry data to your own component to do post-processing such as filtering or enrichment before ingesting data into your data source of choice (such as an Azure SQL database, a datalake, Azure Log Analytics, Azure Application Insights, or a third-party data store).

You can override the ingestion endpoint by using the IngestionEndpoint key in the Azure Application Insights connection string. Learn more in the documentation: [Overriding the Azure Application Insights standard connection string](/azure/azure-monitor/app/sdk-connection-string?tabs=net#connection-string-with-explicit-endpoint-overrides).

### Reducing data retention cost
To reduce data retention cost, you can 
- use the default retention for Application Insights resources (currently 90 days). Different retention periods can be selected for each Application Insights resource. The full set of available retention periods is 30, 60, 90, 120, 180, 270, 365, 550, or 730 days.
- purge data from your Application Insights resource using a set of user-defined filters. See [Components - Purge](/rest/api/application-insights/components/purge#examples) for examples.

## <a name="viewing"></a>Viewing telemetry data in Application Insights

Telemetry from [!INCLUDE[prod_short](../developer/includes/prod_short.md)] is stored in Azure Monitor Logs in the *traces* table. You can view collected data by writing log queries using Kusto query language (KQL). Learn more at [Logs in Azure Monitor](/azure/azure-monitor/platform/data-platform-logs) and [Overview of log queries in Azure Monitor](/azure/azure-monitor/log-query/log-query-overview).

As a simple example, follow these steps:  

1. In the Azure portal, open your Application Insights resource.
2. In the **Monitoring** menu, select **Logs**.
3. On the **New Query** tab, enter the following to get the last 100 traces:

    ```kql
    traces
    | take 100
    | sort by timestamp desc 
    ```

### <a name="customdimensions"></a>About custom dimensions

Each trace has a `customDimensions` column that includes a set of dimensions containing metrics specific to the trace. Each of these custom dimensions has a limit of 8000 characters. When logging an event with a dimension exceeding 8000 characters, the Business Central server adds additional overflow dimension keys to the event to contain the excess characters. There can be up to two additional overflow dimension keys, each with a maximum 8000 characters. The overflow dimension keys are named  `<dimension_key_name>_1` and `<dimension_key_name>_2`, where `<dimension_key>` is the name of the original dimension key. So if the custom dimension key is `extensionCompilationDependencyList`, then the overflow dimension keys would be `extensionCompilationDependencyList_1` and `extensionCompilationDependencyList_2`.

> [!NOTE]
> The 8000 character limit is governed by the [Application Insights API](/azure/azure-monitor/app/api-custom-events-metrics#limits).


## Setting up alerts on telemetry events
If something happens in your environment or app that you need to take action on, you might want to have a system that sends you an alert. Azure Application Insights makes it easy to define such alerts.

You can use the following tools to define and set up alerts on telemetry events
 1. Azure Application Insights Alerts,
 2. Azure Logic Apps, or
 3. Power Automate

All three approaches need a Kusto (KQL) query to define the alerting condition. 

### Alerting condition queries
When defining an alert based on telemetry, you need to define two things:
1. A Kusto (KQL) query that defines the alerting condition. It's considered good practice to add a `where` clause that limits the timestamp of events in the query, e.g. **| where timestamp > ago(1h)**. 
2. How often you want to run the alerting query. Typically the recurrence follows the `where` clause in the alerting query. E.g. if the query looks back 1 hour, then you set your recurrence to 1 hour as well.

> Samples of alerting queries are shared by Microsoft and third parties on the [Business Central BCTech repository on GitHub](https://github.com/microsoft/BCTech/tree/master/samples/AppInsights/Alerts). You can also share your alerting queries with the community on GitHub.

### How to create alerts in Azure Application Insights?
If you want to create alerts in Azure Application Insights, then do as follows:
 1. Open the Azure portal and locate your Application Insights resource
 2. Click "Alerts" in the navigation pane on the left
 3. Add a KQL alerting condition query in the condition for a custom log search 

Please read more in the documentation for [Azure Application Insights](/azure/azure-monitor/platform/alerts-unified-log)

### How to create alerts using Azure Logic Apps and Power Automate
Azure Logic Apps and Power Automate have built-in connectors to query telemetry in Application Insights that you can use to set up custom notifications or to automate certain actions triggered by an environment lifecycle event.

> [!NOTE]
> Samples of custom notifications and automations are shared by Microsoft and third parties on the [Business Central BCTech repository on GitHub](https://github.com/microsoft/BCTech/tree/master/samples/AppInsights/Alerts). You can also share your Application Insights Alerts and Automations with the community on GitHub.

The samples below can help getting started with customization and automation using Application Insights.

> [!IMPORTANT]
> Deploying a Logic App to Azure also creates the API Connection Resources necessary to authenticate certain actions in the Logic Apps.
>
> After deploying the Logic App, navigate to the created API Connection Resources in the Azure Portal to authenticate them. The Application Insights API Connection Resource can be authenticated using the Application ID and an API Key. These can be found and generated on the API Access page of the Application Insights Resource in the Azure Portal.
>
> If you have already have API Connection Resources deployed in the selected Resource Group for the connections needed to run the Logic App you can reuse them by entering the same resource name before deploying the Logic App.

#### Example - run an alerting query every n days and send an email
This Logic App runs every number of days (specified in deployment) and lists all updates made available to environments that emit telemetry to the specified Application Insights resource for the specified period. Administrators can use this to replace the many email notifications they would receive for each individual enviroment when set up as notification recipient.

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2FBCTech%2Fmaster%2Fsamples%2FAppInsights%2FAlerts%2FAvailableUpdatesNotification.json)

#### Example - run an alerting query every m minutes and send a message to Teams
This Logic App queries Application Insights every number of minutes (specified in deployment) and notifies a user (also specified in deployment) of any deleted environments in Microsoft Teams. The action that sends the notification in Teams can be updated to notify a Channel or Group Chat instead.

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2FBCTech%2Fmaster%2Fsamples%2FAppInsights%2FAlerts%2FDeletedEnvironmentNotification.json)


## Telemetry sample code

To make it easier to get started using Azure Application Insights with [!INCLUDE[prod_short](../developer/includes/prod_short.md)], samples of KQL code are available in the [Business Central BCTech repository on GitHub](https://github.com/microsoft/BCTech/tree/master/samples/AppInsights).

## [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry FAQ

The [Business Central BCTech repository on GitHub](https://github.com/microsoft/BCTech/tree/master/samples/AppInsights) has an extensive FAQ on [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry in Azure Application Insights.

## See also

[Telemetry Event IDs](telemetry-event-ids.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  
[Working with Administration Tools](administration.md)  
[Business Central Administration Center](tenant-admin-center.md)  
[Managing Environments](tenant-admin-center-environments.md)  
[Managing Tenant Notifications](tenant-admin-center-notifications.md)  
[Introduction to Automation APIs](itpro-introduction-to-automation-apis.md)  
[LogMessage Method](../developer/methods-auto/session/session-logmessage-string-string-verbosity-dataclassification-telemetryscope-string-string-string-string-method.md)  
