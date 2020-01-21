---
title: "Performance Online"
ms.custom: na
ms.date: 01/14/2020
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: KennieNP
---

# Performance in the Online Version of [!INCLUDE[prodshort](../developer/includes/prodshort.md)]
These sections describe how settings in the online version of [!INCLUDE[prodshort](../developer/includes/prodshort.md)] affects impact the performance experience of users. 

## Client-side performance
There are three things of importance when dealing with client performance in [!INCLUDE[prodshort](../developer/includes/prodshort.md)]

- Hardware of the computer running the client
- Choice of browser
- Network bandwidth and latency between the client and the data center running [!INCLUDE[prodshort](../developer/includes/prodshort.md)]

MIKE BORG WILL WRITE CONTENT HERE
- Hardware
- Browser

MIKE BORG WILL WRITE CONTENT HERE
- Latency
- Bandwidth 
- How to measure this


## Performance on sandbox environments
The [!INCLUDE[prodshort](../developer/includes/prodshort.md)] service offers the ability to test code in a sandbox environment prior to deploying to a production environment. 

Due to the nature of the operations our users perform in the Sandbox environments, such as (for instance frequent publishing and installation of per-tenant extensions (PTEs), which are not yet of production quality, creating multiple companies for different users to try their scenarios, initializing test environments with data via RapidStart, and so on etc.), and due to the Sandbox services configuration (with more density, and very different thresholds), the users will often cannot get the same performance and reliability as they get in their production environments.  

Read more about sandboxes here:
- [Managing Environments](../administration/tenant-admin-center-environments.md)

## Telemetry
For monitoring and analyzing performance issues in the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] service, we recommend connecting Azure AppInsights to the environments that you want to get signal from:

- [Sending telemetry to Microsoft Azure Application Insights (Preview)](../administration/tenant-admin-center-telemetry.md#sending-telemetry-to-microsoft-azure-application-insights-preview)

This page shows an overview of currently available signal:
- [Analyze long running SQL queries](../administration/tenant-admin-center-telemetry#analyze-long-running-sql-queries.md)

TODO: Need to change this link once 15.3 docs is available

## See Also

[Performance Overview](performance-overview.md)  
[Performance Topics For Developers](performance-developer.md)  
[Performance of On-Premises Installations](performance-onprem.md)  
[How to Work with a Performance Problem](performance-work-perf-problem.md)  
