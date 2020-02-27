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
ms.date: 11/15/2019
ms.author: jswymer
---

# Monitoring and Analyzing Telemetry  

[!INCLUDE[prodshort](../developer/includes/prodshort.md)] emits telemetry data for various activities and operations on tenants. Whether running [!INCLUDE[prodshort](../developer/includes/prodshort.md)] Online or On-premises, you can set up your tenants to send telemetry to Application Insights. Application Insights is a service hosted within Azure that gathers telemetry data for analysis and presentation. For more information, see [What is Application Insights?](/azure/azure-monitor/app/app-insights-overview).

Monitoring telemetry gives you a look at the activities and general health of your tenants. It helps you diagnose problems and analyze operations that affect performance.

## Available Telemetry

In Application Insights, telemetry from [!INCLUDE[prodshort](../developer/includes/prodshort.md)] is logged as traces. Currently, [!INCLUDE[prodshort](../developer/includes/prodshort.md)] offers telemetry on the following operations:  

|Operation | Description |Online/On-premises|See more|
|----------|-------------|-----------------|--------|
|Authorization|Provides information about user sign-in attempts. Information includes success or failure indication, reason for failure, user type, and more.|Online|[Analyzing Authentication Telemetry](telemetry-authorization-trace.md) |
|Long Running Operation (SQL Query)|Provides information about SQL queries that take longer than expected to execute.|Both|[Analyzing Long Running Operation (SQL Query) Telemetry](telemetry-long-running-sql-query-trace.md)|
|Web Service Requests|Provide information about execution time of web service requests.|Both|[Analyzing Web Service Requests Telemetry](telemetry-long-running-sql-query-trace.md)|


## Enabling Application Insights

Sending telemetry data to Application Insights requires you have an Application Insights resource in Azure. Once you have the Application Insights resource, you can start to configure your tenants to send telemetry data to your Application Insights resource. The configuration is different for Online and On-premises:

- For [!INCLUDE[prodshort](../developer/includes/prodshort.md)] Online, Application Insights is enabled by using the Administration Center. For more information, see [Enable Sending Telemetry to Application Insights](tenant-admin-center-telemetry.md#appinsights).

- For [!INCLUDE[prodshort](../developer/includes/prodshort.md)] On-premises, see [Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md).

## Viewing Telemetry Data in Application Insights

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

## See also

[Working with Administration Tools](administration.md)  
[The Business Central Administration Center](tenant-admin-center.md)  
[Managing Environments](tenant-admin-center-environments.md)  
[Managing Tenant Notifications](tenant-admin-center-notifications.md)  
[Introduction to automation APIs](itpro-introduction-to-automation-apis.md)  
