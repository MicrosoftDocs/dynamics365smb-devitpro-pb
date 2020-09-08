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

[!INCLUDE[prodshort](../developer/includes/prodshort.md)] emits telemetry data for various activities and operations on tenants. Whether running [!INCLUDE[prodshort](../developer/includes/prodshort.md)] Online or On-premises, you can set up your tenants to send telemetry to Application Insights. Application Insights is a service hosted within Azure that gathers telemetry data for analysis and presentation. For more information, see [What is Application Insights?](/azure/azure-monitor/app/app-insights-overview).

Monitoring telemetry gives you a look at the activities and general health of your tenants. It helps you diagnose problems and analyze operations that affect performance.

## Available telemetry

In Application Insights, telemetry from [!INCLUDE[prodshort](../developer/includes/prodshort.md)] is logged as traces. Currently, [!INCLUDE[prodshort](../developer/includes/prodshort.md)] offers telemetry on the following operations:  

|Area | Description |Online/On-premises|See more|
|----------|-------------|-----------------|--------|
|Authorization|Provides information about user sign-in attempts. Information includes success or failure indication, reason for failure, user type, and more.|Online|[Analyzing Authentication Telemetry](telemetry-authorization-trace.md) |
|Company lifecycle|Provides information about creating, copying, and deleting of companies.|Both|[Analyzing Company Lifecycle Telemetry](telemetry-company-lifecycle-trace.md) |
|Database lock timeouts|Provides information about database locks that have timed out. |Both|[Database Lock Timeout Telemetry](telemetry-database-locks-trace.md)|
|Extension lifecycle|Provides information about the success or failure of extension-related operations, like publishing, synchronizing, installing, and more.|Both|[Analyzing Extension Lifecycle Telemetry](telemetry-extension-lifecycle-trace.md) |
|Extension update|Provides information about errors that occur when upgrading an extension.|Both|[Analyzing Extension Upgrade Telemetry](telemetry-extension-update-trace.md) |
|Long running AL methods| Provides information about long running AL methods|Both|[Analyzing AL Methods Telemetry](telemetry-al-method-trace.md) |
|Long running operation (SQL query)|Provides information about SQL queries that take longer than expected to execute.|Both|[Analyzing Long Running Operation (SQL Query) Telemetry](telemetry-long-running-sql-query-trace.md)|
|Page views|Provides information about the pages that users open in the modern client.|Online|[Analyzing Page View Telemetry](telemetry-page-view-trace.md)|
|Report generation|Provides information about the execution of reports.|Both|[Analyzing Report Generation Telemetry](telemetry-reports-trace.md)|
|Web service requests|Provides information about the execution time of web service requests.|Both|[Analyzing Web Service Requests Telemetry](telemetry-webservices-trace.md)|

## Enabling Application Insights

Sending telemetry data to Application Insights requires you have an Application Insights resource in Azure. Once you have the Application Insights resource, you can start to configure your tenants to send telemetry data to your Application Insights resource. The configuration is different for Online and On-premises:

- For [!INCLUDE[prodshort](../developer/includes/prodshort.md)] Online, Application Insights is enabled by using the Administration Center. For more information, see [Enable Sending Telemetry to Application Insights](tenant-admin-center-telemetry.md#appinsights).

- For [!INCLUDE[prodshort](../developer/includes/prodshort.md)] On-premises, see [Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md).

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
