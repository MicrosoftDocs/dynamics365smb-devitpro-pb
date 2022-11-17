---
title: Monitoring and Analyzing Telemetry
description: Learn how Business Central provides telemetry for each environment, both for online and on-premises environments.  
author: jswymer
ms.topic: overview
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 11/17/2022
ms.author: jswymer
ms.reviewer: jswymer
ms.custom: bac-template
---

# Monitoring and Analyzing Telemetry

[!INCLUDE[2019_releasewave2.md](../includes/2019_releasewave2.md)]

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] emits telemetry data for various activities and operations on tenants and extensions. Monitoring telemetry gives you a look at the activities and general health of your tenants, so you can diagnose problems and analyze operations that affect performance. [Application Insights](/azure/azure-monitor/app/app-insights-overview) is a service hosted within Azure that gathers telemetry data for analysis and presentation. Whether running [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online or on-premises, you can set your tenants up to send telemetry to Application Insights.  

## Tenant-level and extension-level telemetry

Application Insights can be enabled on two different levels:

- Tenant  

    Application Insights can be enabled for a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online tenant or on-premises [!INCLUDE[server](../developer/includes/server.md)] instance. When enabled on the tenant, telemetry is emitted to a single Application Insights resource for gathering data on tenant-wide operations.
    
- Extension  

    With the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2020 release wave 2 and later, Application Insights can also be enabled on a per-extension basis. Enabling telemetry is done by setting an Application Insights connection in the extension's manifest (app.json file). At runtime, certain events related to the extension are emitted to the Application Insights resource. This feature targets publishers of per-tenant extensions to give them insight into issues in their extension before partners and customers report them.

Both for tenant-level and extension-level telemetry, it's possible to craft custom telemetry messages directly from AL
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

Check the Azure Application Insights documentation for up-to-date information on pricing at [https://azure.microsoft.com/pricing/details/monitor/](https://azure.microsoft.com/pricing/details/monitor/).

For more information, go to [Control Telemetry Cost](telemetry-control-cost.md).

## <a name="viewing"></a>Viewing telemetry data in Application Insights

Telemetry from [!INCLUDE[prod_short](../developer/includes/prod_short.md)] is stored in Azure Monitor Logs in the *traces* table. You can view collected data by writing log queries using Kusto query language (KQL). Learn more at [Logs in Azure Monitor](/azure/azure-monitor/platform/data-platform-logs) and [Overview of log queries in Azure Monitor](/azure/azure-monitor/log-query/log-query-overview).

For more information, go to [Analyze Telemetry with KQL](telemetry-analyze-with-kql.md).

### <a name="customdimensions"></a>About custom dimensions

Each trace has a `customDimensions` column that includes a set of dimensions containing metrics specific to the trace. Each of these custom dimensions has a limit of 8000 characters. When logging an event with a dimension exceeding 8000 characters, the Business Central server adds more overflow dimension keys to the event to contain the excess characters. There can be up to two extra overflow dimension keys, each with a maximum 8000 characters. The overflow dimension keys are named  `<dimension_key_name>_1` and `<dimension_key_name>_2`, where `<dimension_key>` is the name of the original dimension key. So if the custom dimension key is `extensionCompilationDependencyList`, then the overflow dimension keys would be `extensionCompilationDependencyList_1` and `extensionCompilationDependencyList_2`.

> [!NOTE]
> The 8000 character limit is governed by the [Application Insights API](/azure/azure-monitor/app/api-custom-events-metrics#limits).

## Setting up alerts on telemetry

If something happens in your environment or app that you need to act on, you can set up a system that sends you an alert. Azure Application Insights makes it easy to define such alerts.

You can use the following tools to define and set up alerts on telemetry events:

- Azure Application Insights Alerts
- Azure Logic Apps
- Power Automate

All three approaches need a Kusto (KQL) query to define the alerting condition.

For more information, go to [Alert on Telemetry](telemetry-alert.md).

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
