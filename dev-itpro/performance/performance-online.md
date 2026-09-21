---
title: Performance in Business Central Online Environments
description: Learn how sandbox environment configuration, service scalability, and operational limits affect performance in Business Central online.
ms.reviewer: solsen
ms.topic: reference
author: KennieNP
ms.date: 04/25/2024
---

# Performance in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online

These sections describe how settings in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online affects the performance experience of users. 

## Performance on sandbox environments

The [!INCLUDE[prod_short](../developer/includes/prod_short.md)] service offers the ability to test code in a sandbox environment before deploying to a production environment. 

Users often can't get the same performance and reliability in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online as they get in their production environments. This discrepancy is caused by a couple of factors.

Firstly, it's the nature of the operations that our users do in the sandbox environments. Some typical examples of this are:

- Frequent publishing and installation of per-tenant extensions (PTEs), which aren't yet of production quality
- Creating multiple companies for different users to try their scenarios
- Initializing test environments with data via RapidStart

Secondly, it's because of the sandbox services' configuration. Sandbox configurations tend to be more dense and have different thresholds than production. Read more about sandboxes in [Managing Environments](../administration/tenant-admin-center-environments.md).

## Service scalability

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] online is a modern, global, robust, and scalable solution for small and mid-sized organizations, providing resource elasticity to support current and future demands of modern businesses.

Scalability is related to performance in situations where slowness of a process in a system isn't related to an algorithm (how a process is implemented), but on scarcity of resources. The way to mitigate such issues is to make more of that type of resource available, and this is what the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online service does for many resource types, such as database compute or memory, server CPU cores, web service capacity, and background tasks/jobs. Learn more about [!INCLUDE[prod_short](../developer/includes/prod_short.md)] service scalability in [Service scalability for Business Central online](../service-scalability.md).

## Operational limits

Large-scale cloud services use shared resources to achieve the best possible use of resources – like IO, CPU, and memory. To ensure that tenants run smoothly, limits are applied to various operations. These limits control things like: how long an operation can run before being canceled, or how many operations can run at the same time. Some of the operations include:

- Web service requests
- Report and query generation
- Client connections
- Background task execution

Without limits, one tenant could use many more resources than other tenants. Other tenants running on the same resources might experience slower performance. Although you can't change these limits, it's useful to be aware of them. Learn more about the limits in [Operational Limits for Business Central Online](../administration/operational-limits-online.md).


## Related information

[Performance overview](performance-overview.md)  
[Performance articles for developers](performance-developer.md)  
[Performance of on-premises installations](performance-onprem.md)  
[How to work with a performance problem](performance-work-perf-problem.md)  
[Performance tips for business users](performance-users.md)  
[How application configurations affect performance](performance-application.md)  
