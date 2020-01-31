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

# Telemetry and Application Insights 

[!INCLUDE[prodshort](../developer/includes/prodshort.md)] emits telemetry data that is useful for diagnosing and analyzing problems and performance on tenants. Whether [!INCLUDE[prodshort](../developer/includes/prodshort.md)] Online or On-premises, you can set up your environments to send telemetry to Application Insights, which is a service hosted within Azure that gathers telemetry data for analysis and presentation. For more information, see [What is Application Insights?](/azure/azure-monitor/app/app-insights-overview).

to help you monitor, diagnose, and analyze the health of the Finance and Operations environments that you manage.

## Available Telemetry Signals

Currently, the following signals are available: 

|Telemtery | Description |Online/On-premises|See more|
|----------|-------------|-----------------|--------|
|Authorization|Provides information about user sign-in attempts, including as success or failure indication, failure reason, user type, and more.|Online|[Authentication Operation](telemetry-authentication-trace.md). |
|Long Running Operation (SQL Query)|Provides information about SQL queries that take longer than expected to execute.|Both|[Long Running Operation (SQL Query) Operation](telemetry-long-running-sql-query-trace.md)|

## Enabling Application Insights

For [!INCLUDE[prodshort](../developer/includes/prodshort.md)] Online, see [Enable Sending Telemetry to Application Insights](tenant-admin-center-telemetry.md#appinsights).

For [!INCLUDE[prodshort](../developer/includes/prodshort.md)] On-premises, see [Enable Sending Telemetry to Application Insights](monitor-long-running-sql-queries-event-log#ApplicationInsights).


## See also

[Working with Administration Tools](administration.md)  
[The Business Central Administration Center](tenant-admin-center.md)  
[Managing Environments](tenant-admin-center-environments.md)  
[Managing Tenant Notifications](tenant-admin-center-notifications.md)  
[Introduction to automation APIs](itpro-introduction-to-automation-apis.md)  
