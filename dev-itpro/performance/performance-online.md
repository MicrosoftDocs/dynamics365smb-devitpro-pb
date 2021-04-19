---
title: "Performance in Business Central Online"
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: KennieNP
---

# Performance in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Online

These sections describe how settings in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online impact the performance experience of users. 

## Performance on sandbox environments

The [!INCLUDE[prod_short](../developer/includes/prod_short.md)] service offers the ability to test code in a sandbox environment before to deploying to a production environment. 

<!-- section partly rephrased -->
Users often can't get the same performance and reliability in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online as they get in their production environments. This discrepancy is caused by a couple factors.

Firstly, it's the nature of the operations that our users do in the sandbox environments. Some typical examples of this are:

- Frequent publishing and installation of per-tenant extensions (PTEs), which aren't yet of production quality
- Creating multiple companies for different users to try their scenarios
- Initializing test environments with data via RapidStart

Secondly, it is because the sandbox services configuration. Sandbox configurations tend to be more dense and have different thresholds than production. Read more about sandboxes in [Managing Environments](../administration/tenant-admin-center-environments.md).

<!--
Due to the nature of the operations our users perform in the sandbox environments, such as (for instance frequent publishing and installation of per-tenant extensions (PTEs), which are not yet of production quality, creating multiple companies for different users to try their scenarios, initializing test environments with data via RapidStart, and so on etc.), and due to the Sandbox services configuration (with more density, and very different thresholds), the users will often cannot get the same performance and reliability as they get in their production environments.  -->

## Telemetry

For monitoring and analyzing performance issues in the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] service, we recommend connecting Azure AppInsights to the environments that you want to get signals from. For more information, see [Sending telemetry to Microsoft Azure Application Insights](../administration/tenant-admin-center-telemetry.md#appinsights). 

Here are some ways where telemetry can help troubleshoot performance issues:

| Area | Telemetry | Why |
|---------------------------|------------|------------|
| Page Background Task      | [Authorization signal](../administration/telemetry-authorization-trace.md)   | Each page background task will open a new session. Any expensive action in the OnCompanyOpen trigger will slow down opening new sessions. | 
| Sign-in      | [Authorization signal](../administration/telemetry-authorization-trace.md)   | Any expensive action in the OnCompanyOpen trigger will slow down opening new sessions. | 
| Something was slow during this period of time | [Company lifecycle signal](../administration/telemetry-company-lifecycle-trace.md) | Check whether a copy-company operation was running while the performance issue occurred. |
| Something was slow during this period of time | [Database locks signal](../administration/telemetry-database-locks-trace.md) | Maybe the performance issue was because of locking in the database. |
| Suddenly the XYZ page is slow | [Extension lifecycle signal](../administration/telemetry-extension-update-trace.md) | Maybe an extension was installed that interferes with the page in question.|
| Some pages or reports are slow to load | [Long running SQL queries](../administration/telemetry-long-running-sql-query-trace.md) | Investigate whether the data operations on the page or report are taking a long time to complete. |
| A report is slow | [Report signal](../administration/telemetry-reports-trace.md)  | Check whether the report is reading more data than you expected. |
| System UI feels slow | [Web service requests signal](../administration/telemetry-webservices-trace.md) | Calling your environment too  aggressively with web service requests can affect performance of the system. |



This page shows an overview of all currently available signals: [Monitoring and Analyzing Telemetry](../administration/telemetry-overview.md).

## Operational Limits

Large-scale cloud services use shared resources to achieve the best possible use of resources – like IO, CPU, and memory. To ensure that tenants run smoothly, limits are applied to various operations. These limits control things like: how long an operation can run before being canceled, or how many operations can run at the same time. Some of the operations include:

- Web service requests
- Report and query generation
- Client connections
- Background task execution

Without limits, one tenant could use many more resources than other tenants. Other tenants running on the same resources might experience slower performance. Although you can't change these limits, it's useful to be aware of them. For more information about the limits, see [Operational Limits for Business Central Online](../administration/operational-limits-online.md).

## See Also

[Performance Overview](performance-overview.md)  
[Performance Articles For Developers](performance-developer.md)  
[Performance of On-Premises Installations](performance-onprem.md)  
[How to Work with a Performance Problem](performance-work-perf-problem.md)  
[Performance tips for business users](performance-users.md)  
