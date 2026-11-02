---
title: Asynchronous Processing in AL for Business Central
description: Compare asynchronous processing options in Business Central. Choose page background tasks, background sessions, scheduled tasks, or job queues for your AL code.
ms.date: 10/23/2026
ms.reviewer: jswymer
ms.topic: overview
author: KennieNP
ms.author: kepontop
---

# Asynchronous (async) processing overview

[!INCLUDE[async-overview](../includes/include-async-overview.md)]

## Operational limits for Business Central online

Each asynchronous processing mechanism has its own concurrency and timeout controls. Use the following table to identify the applicable limits. Learn more about current values in [Operational limits for Business Central online](../administration/operational-limits-online.md).

| Mechanism | Limits to check |
|-----------|-----------------|
| Page background task | [Asynchronous task limits](../administration/operational-limits-online.md#Task): child sessions max concurrency and max queue length, per parent session; page background task default and maximum timeouts. |
| `Session.StartSession` | [Asynchronous task limits](../administration/operational-limits-online.md#Task): background sessions max concurrency, max queue length, and default waiting timeout. |
| Task scheduler | [Scheduled task limits per user](../administration/operational-limits-online.md#TaskUser): concurrent execution of scheduled tasks. |
| Job queue | [Scheduled task limits per user](../administration/operational-limits-online.md#TaskUser), because scheduled job queue processing uses the task scheduler. |

Scheduled tasks run in background sessions, but they don't use the same concurrency limit as sessions started with `Session.StartSession`. Scheduled-task concurrency limits control how many tasks can run at the same time, not how many tasks can be stored for later execution.

## Configure limits for Business Central on-premises

For on-premises environments, configure the corresponding server instance settings.

| Mechanism | Settings to check |
|-----------|-------------------|
| Page background task | `ChildSessionsMaxConcurrency`, `ChildSessionsMaxQueueLength`, `PageBackgroundTaskDefaultTimeout`, and `PageBackgroundTaskMaxTimeout`. |
| `Session.StartSession` | `BackgroundSessionsMaxConcurrent`, `BackgroundSessionsMaxQueued`, and `BackgroundSessionsDefaultWaitTimeout`. `BackgroundSessionsDefaultTimeout` sets the execution timeout when the method call doesn't specify one. |
| Task scheduler | `TaskSchedulerMaximumConcurrentRunningTasks` limits concurrent execution per server instance. `DefaultTaskSchedulerSessionTimeout` and `MaxTaskSchedulerSessionTimeout` control execution timeouts. Task scheduling must be enabled with `EnableTaskScheduler`. |
| Job queue | The task-scheduler concurrency and maximum-timeout settings apply. The job queue supplies its job timeout when it creates the scheduled task. |

Learn more about these settings in [Business Central Server instance settings](../administration/server-instance-settings.md). Learn more about changing them in [Configure Business Central Server](../administration/configure-server-instance.md).

## Related information

[Job queue](devenv-job-queue.md)  
[Page background tasks](devenv-page-background-tasks.md)  
[Task scheduler](devenv-task-scheduler.md)  
[Operational limits for Business Central online](../administration/operational-limits-online.md)  
[Performance articles for developers](../performance/performance-developer.md)  