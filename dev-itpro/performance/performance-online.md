---
title: "Performance in Business Central Online"
ms.custom: na
ms.date: 01/29/2020
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: KennieNP
---

# Performance in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] Online

These sections describe how settings in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] online impact the performance experience of users. 

## Performance on sandbox environments

The [!INCLUDE[prodshort](../developer/includes/prodshort.md)] service offers the ability to test code in a sandbox environment prior to deploying to a production environment. 

<!-- section partly rephrased -->
Users often cannot get the same performance and reliability in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] online, as they get in their production environments. This is due to a number of factors. Firstly, it is due to the nature of the operations that our users perform in the sandbox environments. Some typical examples of this are:

- Frequent publishing and installation of per-tenant extensions (PTEs), which are not yet of production quality
- Creating multiple companies for different users to try their scenarios
- Initializing test environments with data via RapidStart

Secondly, it is due to the sandbox services configuration with more density, and very different thresholds. Read more about sandboxes in [Managing Environments](../administration/tenant-admin-center-environments.md).

<!--
Due to the nature of the operations our users perform in the sandbox environments, such as (for instance frequent publishing and installation of per-tenant extensions (PTEs), which are not yet of production quality, creating multiple companies for different users to try their scenarios, initializing test environments with data via RapidStart, and so on etc.), and due to the Sandbox services configuration (with more density, and very different thresholds), the users will often cannot get the same performance and reliability as they get in their production environments.  -->

## Telemetry

For monitoring and analyzing performance issues in the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] service, we recommend connecting Azure AppInsights to the environments that you want to get signals from. For more information, see [Sending telemetry to Microsoft Azure Application Insights](../administration/tenant-admin-center-telemetry.md#appinsights). The following page shows an overview of currently available signal, see [Analyze long running SQL queries](../administration/telemetry-overview.md).

## See Also

[Performance Overview](performance-overview.md)  
[Performance Topics For Developers](performance-developer.md)  
[Performance of On-Premises Installations](performance-onprem.md)  
[How to Work with a Performance Problem](performance-work-perf-problem.md)  
