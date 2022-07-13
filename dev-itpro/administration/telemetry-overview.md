---
title: Monitoring and Analyzing Telemetry
description: Learn how Business Central provides telemetry for each environment, for both for online and on-premises environments.  
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

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] emits telemetry data for various activities and operations on tenants and extensions. Monitoring telemetry gives you a look at the activities and general health of your tenants, enabling you to diagnose problems and analyze operations that affect performance. [Application Insights](/azure/azure-monitor/app/app-insights-overview) is a service hosted within Azure that gathers telemetry data for analysis and presentation. Whether running [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online or on-premises, you can set your tenants up to send telemetry to Application Insights.  

## Tenant-level and extension-level telemetry

Application Insights can be enabled on two different levels:

- Tenant  

    When enabled on the tenant, either for a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online tenant or on-premises [!INCLUDE[server](../developer/includes/server.md)] instance, telemetry is emitted to a single Application Insights resource for gathering data on tenant-wide operations.
- Extension  

    With the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2020 release wave 2 and later, Application Insights can also be enabled on a per-extension basis by setting an Application Insights connection in the extension's manifest (app.json file). At runtime, certain events related to the extension are emitted to the Application Insights resource. This feature targets publishers of per-tenant extensions to give them insight into issues in their extension before partners and customers report them.

Both for tenant-level and for extension-level telemetry, it is possible to craft custom telemetry messages directly from AL using the [LogMessage Method](../developer/methods-auto/session/session-logmessage-string-string-verbosity-dataclassification-telemetryscope-string-string-string-string-method.md).  

## Available telemetry
In Application Insights, telemetry from [!INCLUDE[prod_short](../developer/includes/prod_short.md)] is logged as traces. Currently, [!INCLUDE[prod_short](../developer/includes/prod_short.md)] offers telemetry on the following operations:  

<!--
|Web service access key authentication |Provides information about the authentication of web server access keys on web service requests.|![check mark for feature.](../developer/media/check.png)|![check mark for feature](../developer/media/check.png)||[See...](telemetry-webservices-access-key-trace.md)|
-->
[!INCLUDE[prod_short](../includes/include-telemetry-by-area.md)]

## <a name="enable"></a> Enabling Application Insights
To send telemetry data to Application Insights, you must have an Application Insights resource in Azure. Once you have the Application Insights resource, you can start to configure your tenants and extensions to send telemetry data to it. For more information, see [Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md).  

> [!NOTE]
> For extensions, see [Sending Extension Telemetry to Azure Application Insights](../developer/devenv-application-insights-for-extensions.md).

## <a name="ingest"></a> Controlling data ingestion
Azure Application Insights supports overriding the standard data ingestion endpoint provided in the connection string (available from the Azure Application Insights portal). This means that you can send telemetry data to your own component for post-processing such as filtering or enrichment before ingesting data into your data source of choice (i.e., an Azure SQL database, a datalake, Azure Log Analytics, Azure Application Insights, or a third-party data store).

You can override the ingestion endpoint by using the IngestionEndpoint key in the Azure Application Insights connection string.

Read more in the documentation: [Overriding the Azure Application Insights standard connection string](/azure/azure-monitor/app/sdk-connection-string?tabs=net#connection-string-with-explicit-endpoint-overrides).


## <a name="viewing"></a>Viewing telemetry data in Application Insights

Telemetry from [!INCLUDE[prod_short](../developer/includes/prod_short.md)] is stored in Azure Monitor Logs in the *traces* table. You can view collected data by writing log queries using Kusto query language (KQL). For more information, see [Logs in Azure Monitor](/azure/azure-monitor/platform/data-platform-logs) and [Overview of log queries in Azure Monitor](/azure/azure-monitor/log-query/log-query-overview).

As a simple example, follow these steps:  

1. In the Azure portal, open your Application Insights resource.
2. In the **Monitoring** menu, select **Logs**.
3. On the **New Query** tab, type the following to get the last 100 traces:

    ```kql
    traces
    | take 100
    | sort by timestamp desc 
    ```

### <a name="customdimensions"></a>About Custom Dimensions

Each trace has a `customDimensions` column that includes a set of dimensions containing metrics specific to the trace. Each of these custom dimensions has a limit of 8000 characters. When logging an event where a dimension's value exceeds 8000 characters, the BC server will add additional overflow dimension keys to the event to contain the excess characters. There can be up to two additional overflow dimension keys, each with a maximum 8000 characters. The overflow dimension keys are named  `<dimension_key_name>_1` and `<dimension_key_name>_2`, where `<dimension_key>` is the name of the original dimension key. For example, if the custom dimension key is `extensionCompilationDependencyList`, then the overflow dimension keys would be `extensionCompilationDependencyList_1` and `extensionCompilationDependencyList_2`.

> [!NOTE]
> The 8000 character limit is governed by the [Application Insights API](/azure/azure-monitor/app/api-custom-events-metrics#limits).

## Application Insights sample code

In the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] BCTech repository on GitHub, samples of KQL code are available to make it easy to get started using Application Insights.  

For more information, see [Business Central BCTech repository on GitHub](https://github.com/microsoft/BCTech/tree/master/samples/AppInsights).

## [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry FAQ

The [!INCLUDE[prod_short](../developer/includes/prod_short.md)] BCTech repository on GitHub have an extensive FAQ on telemetry in Azure Application Insights.

For more information, see [Business Central BCTech repository on GitHub](https://github.com/microsoft/BCTech/tree/master/samples/AppInsights/FAQ.md).
    
    
## See also

[Telemetry Event IDs](telemetry-event-ids.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  
[Working with Administration Tools](administration.md)  
[Business Central Administration Center](tenant-admin-center.md)  
[Managing Environments](tenant-admin-center-environments.md)  
[Managing Tenant Notifications](tenant-admin-center-notifications.md)  
[Introduction to Automation APIs](itpro-introduction-to-automation-apis.md)  
[LogMessage Method](../developer/methods-auto/session/session-logmessage-string-string-verbosity-dataclassification-telemetryscope-string-string-string-string-method.md)  
