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

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] emits telemetry data for various activities and operations on environments and apps/extensions. Monitoring telemetry gives you a look at the activities and general health of your environments/apps, so you can diagnose problems and analyze operations that affect performance. [Azure Application Insights](/azure/azure-monitor/app/app-insights-overview) is a service hosted within Azure that gathers telemetry data for analysis and presentation. Whether running [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online or on-premises, you can set your tenants up to send telemetry to [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)].

## Environment-level and app/extension-level telemetry

Telemetry can be enabled on two different levels:

- Environment

    Telemetry can be enabled for a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online environment or on-premises [!INCLUDE[server](../developer/includes/server.md)] instance. When enabled on the environment, telemetry is emitted to a single [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] resource for gathering data on operations that happen on the environment.
    
- App/Extension  

    With the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2020 release wave 2 and later, telemetry can also be enabled on a per-extension basis. Enabling telemetry is done by setting an [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] connection string in the app's manifest (app.json file). At runtime, certain events related to the app/extension are emitted to the [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] resource. This feature targets publishers of per-tenant extensions or Appsource apps to give them insight into issues in their app/extension before partners and customers report them.

Both for environment-level and app-level telemetry, it's possible to craft custom telemetry messages directly from AL
using the [LogMessage Method](../developer/methods-auto/session/session-logmessage-string-string-verbosity-dataclassification-telemetryscope-string-string-string-string-method.md). Learn more about AL at [Programming in AL](../developer/devenv-programming-in-al.md).

## Available telemetry
Currently, [!INCLUDE[prod_short](../developer/includes/prod_short.md)] offers telemetry on the following operations:  

[!INCLUDE[prod_short](../includes/include-telemetry-by-area.md)]

## <a name="enable"></a> Enable Telemetry

To send telemetry data to [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)], you must have an Application Insights resource in Azure. Once you have the [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] resource, you can start to configure your environments and apps/extensions to send telemetry data to it. Learn more at [Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md).  

> [!NOTE]
> For apps/extensions, see [Sending Extension Telemetry to Azure Application Insights](../developer/devenv-application-insights-for-extensions.md).

## <a name="ingest"></a> Control telemetry cost

[!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] is billed based on the volume of telemetry data that is sent (data ingestion) and how long time you want data to be available (data retention). 

Check the [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] documentation for up-to-date information on pricing at [https://azure.microsoft.com/pricing/details/monitor/](https://azure.microsoft.com/pricing/details/monitor/).

For more information, go to [Control Telemetry Cost](telemetry-control-cost.md).

## <a name="viewing"></a>Viewing telemetry data

Telemetry from [!INCLUDE[prod_short](../developer/includes/prod_short.md)] is stored in [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] Logs in the *traces* and *pageViews* tables. You can view collected data by writing log queries using Kusto query language (KQL). Learn more at [Logs in Azure Monitor](/azure/azure-monitor/platform/data-platform-logs) and [Overview of log queries in Azure Monitor](/azure/azure-monitor/log-query/log-query-overview).

For more information, go to [Analyze Telemetry with KQL](telemetry-analyze-with-kql.md).

## Setting up alerts on telemetry

If something happens in your environment or app that you need to act on, you can set up a system that sends you an alert. [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] makes it easy to define such alerts.

You can use the following tools to define and set up alerts on telemetry events:

- Azure Application Insights Alerts
- Azure Logic Apps
- Power Automate

All three approaches need a Kusto (KQL) query to define the alerting condition.

For more information, go to [Alert on Telemetry](telemetry-alert.md).

## Telemetry sample code

To make it easier to get started using [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] with [!INCLUDE[prod_short](../developer/includes/prod_short.md)], samples of KQL code are available in the [Business Central BCTech repository on GitHub](https://github.com/microsoft/BCTech/tree/master/samples/AppInsights).

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
