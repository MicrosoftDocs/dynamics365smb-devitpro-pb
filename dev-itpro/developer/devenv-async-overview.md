---
title: Async Processing Overview for Business Central
description: Compare asynchronous processing options in AL, including page background tasks, background sessions, scheduled tasks, and job queues in Business Central.
ms.date: 10/15/2026
ms.reviewer: jswymer
ms.topic: overview
author: KennieNP
ms.author: kepontop
---

# Asynchronous (async) processing overview

[!INCLUDE[async-overview](../includes/include-async-overview.md)]

## Operational limits for Business Central online

To help maintain service availability and quality, [!INCLUDE[prod_short](includes/prod_short.md)] online limits asynchronous operations. The comparison table identifies the limits for each option. Learn more about the current limits in [Asynchronous task limits](../administration/operational-limits-online.md#Task) and [Scheduled task limits](../administration/operational-limits-online.md#TaskUser).

## Operational limits for Business Central on-premises

For [!INCLUDE[prod_short](includes/prod_short.md)] on-premises, you can configure child session concurrency and queue limits, background session concurrency and queue limits, page background task timeouts, and scheduled task concurrency. Learn more in [Run background sessions and page tasks](../administration/server-instance-settings.md#run-background-sessions-and-page-tasks) and [Schedule server tasks](../administration/server-instance-settings.md#schedule-server-tasks).

## Related information

[Job queue](devenv-job-queue.md)  
[Page background tasks](devenv-page-background-tasks.md)  
[Task scheduler](devenv-task-scheduler.md)  
[Operational limits for Business Central online](../administration/operational-limits-online.md)  
[Performance articles for developers](../performance/performance-developer.md)  