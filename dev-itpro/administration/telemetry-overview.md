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
ms.date: 04/01/2020
ms.author: jswymer
---

# Monitoring and Analyzing Telemetry

[!INCLUDE[2019_releasewave2.md](../includes/2019_releasewave2.md)]

[!INCLUDE[prodshort](../developer/includes/prodshort.md)] emits telemetry data for various activities and operations on tenants and extensions. Whether running [!INCLUDE[prodshort](../developer/includes/prodshort.md)] Online or On-premises, you can set up your tenants to send telemetry to Application Insights. Application Insights is a service hosted within Azure that gathers telemetry data for analysis and presentation. For more information, see [What is Application Insights?](/azure/azure-monitor/app/app-insights-overview). Monitoring telemetry gives you a look at the activities and general health of your tenants. It helps you diagnose problems and analyze operations that affect performance.

## Tenant-level and extension-level telemetry

Application Insights can be enabled on two different levels: tenant and extension. When enabled on the tenant, either for a [!INCLUDE[prodshort](../developer/includes/prodshort.md)] online tenant or on-premises [!INCLUDE[server](../developer/includes/server.md)] instance, telemetry is emitted to a single Application Insights resource for gathering data on tenant-wide operations. 

With [!INCLUDE[prodshort](../developer/includes/prodshort.md)] 2020 release wave 2 and later, Application Insights can also be enabled on a per-extension basis. An Application Insights key is set in the extension's manifest (app.json file). At runtime, certain events related to the extension are emitted to the Application Insights resource. This feature targets publishers of per-tenant extensions to give them insight into issues in their extension before partners and customers report them.

## Available telemetry

In Application Insights, telemetry from [!INCLUDE[prodshort](../developer/includes/prodshort.md)] is logged as traces. Currently, [!INCLUDE[prodshort](../developer/includes/prodshort.md)] offers telemetry on the following operations:  

|Area | Description |Online|On-premises|Extension support|More information|
|-----|-------------|------|-----------|-----------------|--------|
|AL method trace|Provides information about long running AL methods.|![check](../developer/media/check.png)|![check](../developer/media/check.png)||[See...](telemetry-al-function-trace.md) |
|App key vault secrets |Provides information about the retrieval of secrets from Azure Key Vaults by extensions.|![check](../developer/media/check.png)<sup>[\[1\]](#1)|![check](../developer/media/check.png)<sup>[\[1\]](#1)|![check](../developer/media/check.png)|[See...](telemetry-extension-key-vault-trace.md) |
|Authorization|Provides information about user sign-in attempts. Information includes success or failure indication, reason for failure, user type, and more.|![check](../developer/media/check.png)|||[See...](telemetry-authorization-trace.md) |
|Company lifecycle|Provides information about creating, copying, and deleting of companies.|![check](../developer/media/check.png)|![check](../developer/media/check.png)||[See...](telemetry-company-lifecycle-trace.md) |
|Database lock timeouts|Provides information about database locks that have timed out. |![check](../developer/media/check.png)|![check](../developer/media/check.png)||[See...](telemetry-database-locks-trace.md)|
|Extension lifecycle|Provides information about the success or failure of extension-related operations, like publishing, synchronizing, installing, and more.|![check](../developer/media/check.png)|![check](../developer/media/check.png)||[See...](telemetry-extension-lifecycle-trace.md) |
|Extension update|Provides information about errors that occur when upgrading an extension.|![check](../developer/media/check.png)|![check](../developer/media/check.png)|![check](../developer/media/check.png)|[See...](telemetry-extension-update-trace.md) |
|Long running operation (SQL query)|Provides information about SQL queries that take longer than expected to execute.|![check](../developer/media/check.png)|![check](../developer/media/check.png)|![check](../developer/media/check.png)|[See...](telemetry-long-running-sql-query-trace.md)|
|Page views|Provides information about the pages that users open in the modern client.|![check](../developer/media/check.png)|||[See...](telemetry-page-view-trace.md)|
|Report generation|Provides information about the execution of reports.|![check](../developer/media/check.png)|![check](../developer/media/check.png)|![check](../developer/media/check.png)|[See...](telemetry-reports-trace.md)|
|Incoming web service requests|Provides information about the execution time of incoming web service requests.|![check](../developer/media/check.png)|![check](../developer/media/check.png)|![check](../developer/media/check.png)|[See...](telemetry-webservices-trace.md)|
|Outgoing web service requests|Provides information about the execution time of outgoing web service requests.|![check](../developer/media/check.png)|![check](../developer/media/check.png)|![check](../developer/media/check.png)|[See...](telemetry-webservices-outgoing-trace.md)|

<sup>1</sup><a name="1"></a>This signal is only emitted to the Application Insights resource that's specified in the extension.

<!--
|Web service access key authentication |Provides information about the authentication of web server access keys on web service requests.|![check](../developer/media/check.png)|![check](../developer/media/check.png)||[See...](telemetry-webservices-access-key-trace.md)|
-->

## Enabling Application Insights

Sending telemetry data to Application Insights requires you have an Application Insights resource in Azure. Once you have the Application Insights resource, you can start to configure your tenants and extensions to send telemetry data to your Application Insights resource. The configuration is different for Online and On-premises:
 
- For [!INCLUDE[prodshort](../developer/includes/prodshort.md)] Online, Application Insights is enabled by using the Administration Center. For more information, see [Enable Sending Telemetry to Application Insights](tenant-admin-center-telemetry.md#appinsights).

- For [!INCLUDE[prodshort](../developer/includes/prodshort.md)] On-premises, see [Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md).

- For extensions, see [Sending Extension Telemetry to Azure Application Insights](../developer/devenv-application-insights-for-extensions.md).

## Viewing telemetry data in Application Insights

Telemetry from [!INCLUDE[prodshort](../developer/includes/prodshort.md)] is stored in Azure Monitor Logs in the *traces* table. You can view collected data by writing log queries. Log queries are written in the Kusto query language (KQL). For more information, see [Logs in Azure Monitor](/azure/azure-monitor/platform/data-platform-logs) and [Overview of log queries in Azure Monitor](/azure/azure-monitor/log-query/log-query-overview).

As a simple example, do the following steps: 

1. In the Azure portal, open your Application Insights resource.
2. In the **Monitoring** menu, select **Logs**.
3. On the **New Query** tab, type the following to get the last 100 traces:

    ```
    traces
    | take 100
    | sort by timestamp desc 
    ```

## Application Insights sample code

On the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] BCTech repository on GitHub, samples of KQL code are available to make it easy to get started using Application Insights. 

For more information, see [Business Central BCTech repository on GitHub](https://github.com/microsoft/BCTech/tree/master/samples/AppInsights).

## See also

[Telemetry Event IDs](telemetry-event-ids.md)  
[Working with Administration Tools](administration.md)  
[The Business Central Administration Center](tenant-admin-center.md)  
[Managing Environments](tenant-admin-center-environments.md)  
[Managing Tenant Notifications](tenant-admin-center-notifications.md)  
[Introduction to automation APIs](itpro-introduction-to-automation-apis.md)  
[LogMessage Method](../developer/methods-auto/session/session-logmessage-string-string-verbosity-dataclassification-telemetryscope-string-string-string-string-method.md)  