---
title: Monitoring and Analyzing Telemetry
description: Learn how Business Central provides telemetry for each environment, both for online and on-premises environments.  
author: jswymer
ms.topic: overview
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 05/31/2023
ms.author: jswymer
ms.reviewer: jswymer
ms.custom: bac-template
---

# Monitoring and Analyzing Telemetry

[!INCLUDE[2019_releasewave2.md](../includes/2019_releasewave2.md)]

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] emits telemetry data for various activities and operations on environments and apps/extensions. Monitoring telemetry gives you a look at the activities and general health of your environments/apps, so you can diagnose problems and analyze operations that affect performance. [Azure Application Insights](/azure/azure-monitor/app/app-insights-overview) is a service hosted within Azure that gathers telemetry data for analysis and presentation. Whether running [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online or on-premises, you can set your tenants up to send telemetry to [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)].

## Environment-level and app/extension-level telemetry

Telemetry can be enabled on two different levels:

- Environment-level telemetry

    Telemetry can be enabled for a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online environment or on-premises [!INCLUDE[server](../developer/includes/server.md)] instance. When enabled on the environment, telemetry is emitted to a single [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] resource for gathering data on operations that happen on the environment.

- App/extension-level telemetry  

    With the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2020 release wave 2 and later, telemetry can also be enabled on a per-extension basis. Enabling telemetry is done by setting an [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] connection string in the app's manifest (app.json file). At runtime, certain events related to the app/extension are emitted to the [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] resource. This feature targets publishers of per-tenant extensions or Microsoft AppSource apps. It gives extension publishers insight into usage of their apps/extensions and also allows them to find errors and performance issues before partners and customers report them.

Both for environment-level and app-level telemetry, it's possible to craft custom telemetry messages directly from AL
using the [LogMessage Method](../developer/methods-auto/session/session-logmessage-string-string-verbosity-dataclassification-telemetryscope-string-string-string-string-method.md). Learn more about AL at [Programming in AL](../developer/devenv-programming-in-al.md).

## Available telemetry

Currently, [!INCLUDE[prod_short](../developer/includes/prod_short.md)] offers telemetry on the following operations:  

[!INCLUDE[prod_short](../includes/include-telemetry-by-area.md)]

## <a name="enable"></a> Enable Telemetry

[!INCLUDE[enableTelemetryEnvironment](../includes/include-telemetry-enable-environment.md)]

> [!NOTE]
> For apps/extensions, see [Sending Extension Telemetry to Azure Application Insights](../developer/devenv-application-insights-for-extensions.md).

## <a name="ingest"></a> Control telemetry cost

[!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] is billed based on the volume of telemetry data that is sent (data ingestion) and how long time you want data to be available (data retention). 

Check the [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] documentation for up-to-date information on pricing at [https://azure.microsoft.com/pricing/details/monitor/](https://azure.microsoft.com/pricing/details/monitor/).

For more information, go to [Control Telemetry Cost](telemetry-control-cost.md).

## <a name="view"></a>Viewing telemetry data with Power BI
To make it simple to analyze Business Central telemetry, we've developed two Power BI apps available from the Microsoft commercial marketplace. One app is for telemetry on environments. The other one is for telemetry on apps/extensions (the telemetry defined in app.json). Both apps are free and open source but requires Power BI pro licenses to use.

For more information, go to [Analyze and Monitor Telemetry with Power BI](telemetry-power-bi-app.md).

## <a name="analyze"></a>Analyze telemetry data
Telemetry from [!INCLUDE[prod_short](../developer/includes/prod_short.md)] is stored in [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] Logs in the *traces* and *pageViews* tables. You can view collected data by writing log queries using Kusto query language (KQL). Learn more at [Logs in Azure Monitor](/azure/azure-monitor/platform/data-platform-logs) and [Overview of log queries in Azure Monitor](/azure/azure-monitor/log-query/log-query-overview).

For more information, go to [Analyze Telemetry with KQL](telemetry-analyze-with-kql.md).

## Setting up alerts on telemetry

If something happens in your environment or app that you need to act on, you can set up a system that sends you an alert. [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] makes it easy to define such alerts. You can set up alerts on telemetry events with various tools depending on your role.

If you're a project manager, product owner, or functional consultant, consider using the no-code tool Power BI Metrics for your alerting needs.

If you prefer more control, consider using one of these low-code tools for your alerting needs.
- Azure Application Insights Alerts
- Azure Logic Apps
- Power Automate

For more information, go to [Alert on Telemetry](telemetry-alert.md).

## Telemetry sample code

[!INCLUDE[telemetrySamples](../includes/include-telemetry-samples.md)]

## [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry FAQ
We have compiled a list of frequently asked questions (FAQ) on telemetry. See [Telemetry FAQ](telemetry-faq.md)

## See also
[Available signal in telemetry](telemetry-available-telemetry.md)  
[Enable Telemetry](telemetry-enable-application-insights.md)  
[Control Telemetry Cost](telemetry-control-cost.md)  
[Analyze Telemetry with Power BI](telemetry-power-bi-app.md)  
[Analyze Telemetry with KQL](telemetry-analyze-with-kql.md)  
[Alert on Telemetry](telemetry-alert.md)  
[Telemetry FAQ](telemetry-faq.md)   
[Custom telemetry with LogMessage Method](../developer/methods-auto/session/session-logmessage-string-string-verbosity-dataclassification-telemetryscope-string-string-string-string-method.md)  
[Working with Administration Tools](administration.md)  
[Business Central Administration Center](tenant-admin-center.md)  
