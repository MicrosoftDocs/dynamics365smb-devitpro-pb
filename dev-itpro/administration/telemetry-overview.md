---
title: Telemetry | Microsoft Docs
description: Learn how the Business Central provides telemetry for each environment.  
author: jswymer
ms.service: dynamics365-business-central
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 10/01/2020
ms.author: jswymer
---

# Monitoring and Analyzing Telemetry

[!INCLUDE[2019_releasewave2.md](../includes/2019_releasewave2.md)]

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] emits telemetry data for various activities and operations on tenants and extensions. Whether running [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Online or On-premises, you can set up your tenants to send telemetry to Application Insights. Application Insights is a service hosted within Azure that gathers telemetry data for analysis and presentation. For more information, see [What is Application Insights?](/azure/azure-monitor/app/app-insights-overview). Monitoring telemetry gives you a look at the activities and general health of your tenants. It helps you diagnose problems and analyze operations that affect performance.

## Tenant-level and extension-level telemetry

Application Insights can be enabled on two different levels: tenant and extension. When enabled on the tenant, either for a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online tenant or on-premises [!INCLUDE[server](../developer/includes/server.md)] instance, telemetry is emitted to a single Application Insights resource for gathering data on tenant-wide operations. 

With [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2020 release wave 2 and later, Application Insights can also be enabled on a per-extension basis. An Application Insights key is set in the extension's manifest (app.json file). At runtime, certain events related to the extension are emitted to the Application Insights resource. This feature targets publishers of per-tenant extensions to give them insight into issues in their extension before partners and customers report them.

## Available telemetry

In Application Insights, telemetry from [!INCLUDE[prod_short](../developer/includes/prod_short.md)] is logged as traces. Currently, [!INCLUDE[prod_short](../developer/includes/prod_short.md)] offers telemetry on the following operations:  

|Area | Description |Online|On-premises|Extension support|More information|
|-----|-------------|------|-----------|-----------------|--------|
|App key vault secrets |Provides information about the retrieval of secrets from Azure Key Vaults by extensions.|![check mark for feature](../developer/media/check.png)<sup>[\[1\]](#1)|![check mark for feature](../developer/media/check.png)<sup>[\[1\]](#1)|![check mark for feature](../developer/media/check.png)|[See...](telemetry-extension-key-vault-trace.md) |
|Authorization|Provides information about user sign-in attempts. Information includes success or failure indication, reason for failure, user type, and more.|![check mark for feature](../developer/media/check.png)|||[See...](telemetry-authorization-trace.md) |
|Company lifecycle|Provides information about creating, copying, and deleting of companies.|![check mark for feature](../developer/media/check.png)|![check mark for feature](../developer/media/check.png)||[See...](telemetry-company-lifecycle-trace.md) |
|Configuration package lifecycle|Provides information about operations done on configuration packages, including exporting, importing, applying, and deleting. |![check mark for feature](../developer/media/check.png)|![check mark for feature](../developer/media/check.png)||[See...](telemetry-configuration-package-trace.md)|
|Database lock timeouts|Provides information about database locks that have timed out. |![check mark for feature](../developer/media/check.png)|![check mark for feature](../developer/media/check.png)||[See...](telemetry-database-locks-trace.md)|
|Email|Provides information about the success or failure of sending emails.|![check mark for feature](../developer/media/check.png)|![check mark for feature](../developer/media/check.png)||[See...](telemetry-email-trace.md) |
|Extension lifecycle <sup>[\[2\]](#2)|Provides information about the success or failure of extension-related operations, like publishing, synchronizing, installing, and more.|![check mark for feature](../developer/media/check.png)|![check mark for feature](../developer/media/check.png)|![check mark for feature](../developer/media/check.png)|[See...](telemetry-extension-lifecycle-trace.md) |
|Extension update|Provides information about errors that occur when upgrading an extension.|![check mark for feature](../developer/media/check.png)|![check mark for feature](../developer/media/check.png)|![check mark for feature](../developer/media/check.png)|[See...](telemetry-extension-update-trace.md) |
|Field monitoring trace|Provides information about the usage of the field monitoring feature.|![check mark for feature](../developer/media/check.png)|![check mark for feature](../developer/media/check.png)||[See...](telemetry-field-monitoring-trace.md) |
|Job queue|Provides information about creating and running job queue entries.|![check mark for feature](../developer/media/check.png)|||[See...](telemetry-job-queue-lifecycle-trace.md) |
|Long running AL method trace|Provides information about long running AL methods.|![check mark for feature](../developer/media/check.png)|![check mark for feature](../developer/media/check.png)||[See...](telemetry-al-method-trace.md) |
|Long running operation (SQL query)|Provides information about SQL queries that take longer than expected to execute.|![check mark for feature](../developer/media/check.png)|![check mark for feature](../developer/media/check.png)|![check mark for feature](../developer/media/check.png)|[See...](telemetry-long-running-sql-query-trace.md)|
|Page views|Provides information about the pages that users open in the modern client.|![check mark for feature](../developer/media/check.png)|||[See...](telemetry-page-view-trace.md)|
|Permissions|Provides information about adding, removing, and assigning permission sets.|![check mark for feature](../developer/media/check.png)|||[See...](telemetry-permission-changes-trace.md)|
|Report generation|Provides information about the execution of reports.|![check mark for feature](../developer/media/check.png)|![check mark for feature](../developer/media/check.png)|![check mark for feature](../developer/media/check.png)|[See...](telemetry-reports-trace.md)|
|Incoming web service requests|Provides information about the execution time of incoming web service requests.|![check mark for feature](../developer/media/check.png)|![check mark for feature](../developer/media/check.png)|![check mark for feature](../developer/media/check.png)|[See...](telemetry-webservices-trace.md)|
|Outgoing web service requests|Provides information about the execution time of outgoing web service requests.|![check mark for feature](../developer/media/check.png)|![check mark for feature](../developer/media/check.png)|![check mark for feature](../developer/media/check.png)|[See...](telemetry-webservices-outgoing-trace.md)|
|Web service access key authentication |Provides information about the authentication of web server access keys on web service requests.|![check mark for feature](../developer/media/check.png)|![check mark for feature](../developer/media/check.png)||[See...](telemetry-webservices-access-key-trace.md)|

<sup>1</sup><a name="1"></a>This signal is only emitted to the Application Insights resource that's specified in the extension.

<sup>2</sup><a name="2"></a>Introduced in Business Central 2020 release wave 1, version 16.3. For extension telemetry, this signal was introduced in 2020 release wave 2, version 17.1.

<!--
|Web service access key authentication |Provides information about the authentication of web server access keys on web service requests.|![check mark for feature](../developer/media/check.png)|![check mark for feature](../developer/media/check.png)||[See...](telemetry-webservices-access-key-trace.md)|
-->

## <a name="enable"></a> Enabling Application Insights

Sending telemetry data to Application Insights requires you have an Application Insights resource in Azure. Once you have the Application Insights resource, you can start to configure your tenants and extensions to send telemetry data to your Application Insights resource. The configuration is different for Online and On-premises:
 
- For [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Online, Application Insights is enabled by using the Administration Center. For more information, see [Enable Sending Telemetry to Application Insights](tenant-admin-center-telemetry.md#appinsights).

- For [!INCLUDE[prod_short](../developer/includes/prod_short.md)] On-premises, see [Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md).

- For extensions, see [Sending Extension Telemetry to Azure Application Insights](../developer/devenv-application-insights-for-extensions.md).

## <a name="viewing"></a>Viewing telemetry data in Application Insights

Telemetry from [!INCLUDE[prod_short](../developer/includes/prod_short.md)] is stored in Azure Monitor Logs in the *traces* table. You can view collected data by writing log queries. Log queries are written in the Kusto query language (KQL). For more information, see [Logs in Azure Monitor](/azure/azure-monitor/platform/data-platform-logs) and [Overview of log queries in Azure Monitor](/azure/azure-monitor/log-query/log-query-overview).

As a simple example, do the following steps: 

1. In the Azure portal, open your Application Insights resource.
2. In the **Monitoring** menu, select **Logs**.
3. On the **New Query** tab, type the following to get the last 100 traces:

    ```
    traces
    | take 100
    | sort by timestamp desc 
    ```

### <a name="customdimensions"></a>About Custom Dimensions

Each trace includes a `customDimensions` column. The `customDimensions` column, in turn, includes a set dimensions that contain metrics specific to the trace. Each of these custom dimensions has a limit of 8000 characters. If a dimension's value exceeds 8000 characters, additional dimensions will be added to the trace for containing the excess characters. There can be up to two additional parameters, each with a maximum 8000 characters. The additional dimensions will have the names that `<custom_dimension_name>_1` and `<custom_dimension_name>_2`, where `<custom_dimension_name>` is the name of the original dimension. For example, if the custom dimension is `extensionCompilationDependencyList`, then the additional dimensions would be `extensionCompilationDependencyList_1` and `extensionCompilationDependencyList_2`.

> [!NOTE]
> The 8000 character limit is governed by the [Application Insights API](/azure/azure-monitor/app/api-custom-events-metrics#limits).

## Application Insights sample code

On the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] BCTech repository on GitHub, samples of KQL code are available to make it easy to get started using Application Insights. 

For more information, see [Business Central BCTech repository on GitHub](https://github.com/microsoft/BCTech/tree/master/samples/AppInsights).

## See also

[Telemetry Event IDs](telemetry-event-ids.md)  
[Working with Administration Tools](administration.md)  
[The Business Central Administration Center](tenant-admin-center.md)  
[Managing Environments](tenant-admin-center-environments.md)  
[Managing Tenant Notifications](tenant-admin-center-notifications.md)  
[Introduction to automation APIs](itpro-introduction-to-automation-apis.md)  
[LogMessage Method](../developer/methods-auto/session/session-logmessage-string-string-verbosity-dataclassification-telemetryscope-string-string-string-string-method.md)  