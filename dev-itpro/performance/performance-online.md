---
title: "Performance in Business Central Online"
description: Learn about how you can improve performance for environments in Business Central online. 
ms.reviewer: solsen
ms.topic: conceptual
author: KennieNP
ms.date: 04/01/2021
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


## Service scalability

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] online is a modern, global, robust, and scalable solution for small and mid-sized organizations, providing resource elasticity to support current and future demands of modern businesses.

Scalability is related to performance in situations where slowness of a process in a system is not related to an algorithm (how a process is implemented), but on scarcety of resources. The way to mitigate such issues is to make more of that type of resource available, and this is what the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online service does for a number of resource types, such as database compute or memory, server CPU cores, web service capacity, and background tasks/jobs. For more information about [!INCLUDE[prod_short](../developer/includes/prod_short.md)] service scalability, see [Service scalability for Business Central online](../service-scalability.md).


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
