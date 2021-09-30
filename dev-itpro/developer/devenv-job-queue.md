---
title: "Job Queue"
description: Learn about how the job queue works
ms.custom: na
ms.date: 09/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: jswymer
---
# Job Queue

This article describes how the job queue works in [!INCLUDE[prod_short](includes/prod_short.md)]. A job queue is basically an abstraction that uses the [task scheduler](devenv-task-scheduler.md) from the platform to enable end users to view, create, or modify jobs that are set to run in the background. These jobs can be set to run on a recurring schedule.

For information about how users work with the job queue in the client, see [Use Job Queues to Schedule Tasks](/dynamics365/business-central/admin-job-queues-schedule-tasks).

## Job queue flow

The following diagram illustrates the flow of the job queue:

[ ![Shows the job queue activity flow.](media/job-queue-activity-flow.png) ](media/job-queue-activity-flow.png)

<!--
## Create and manage job queue



.. Add some examples
-->
## How job queue works

This section describes the flow that a job queue goes through.

### General flow

A job is run when the task scheduler's task is run. For more information, see [Task scheduler - detailed flow](devenv-task-scheduler.md#detailed-flow).

Here's a general overview of the process:

1. When a job queue is created and set to ready state, a scheduled task is created to run, but not before the **Earliest Start Date/Time**.
2. When the scheduled task is picked up by the task scheduler to run, a new background session is started.
3. The background session is run by the **Job Queue Dispatcher** codeunit:
    1. It first checks whether the job should be run or rescheduled.

        If the job shouldn't run, it's deleted. Or, in the case of an already running "Category Code", it's rescheduled.
    2. The job queue entry is updated to the **In-Progress** state, and a job queue log entry is created.
    3. The specified **Object ID to Run** is then started.

       If an exception occurs, none of the subsequent steps in the Job Queue Dispatcher path will be run, but instead, the failure codeunit path will be run.
4. The failure codeunit path runs as follows:
    1. An exception is raised and surfaced.
    2. The **Job Queue Error Handler** codeunit is run in a new background session.
        1. The job queue entry is updated to the **Error** state.
        2. The errors are saved by using **Error Message Management**.
        3. The job queue entry and job queue log entry are updated with the error.
        4. The job queue then either stays in the **Error** state or is rescheduled:
            - It will stay in **Error** state if the **Maximum No. of Attempts** has been exceeded, it's not a recurring job.
            - It will be rescheduled if the maximum attempts have not been exceeded and it's a recurring job.

## About job queue sessions and permissions

The session runs using the same user/credentials that are used when calling AL code. The user that is used is the user that sets the job to ready state. The user must have appropriate permissions to run the job queue and any other objects that are associated with the operation of the specified object.

For more information about assigning permissions, see [Assign Permissions to Users and Groups](/dynamics365/business-central/ui-define-granular-permissions) in the business functionality help.

## Monitor and troubleshoot

Business Central offers two ways to monitor the flow of job queues: Azure Application Insights and the Session Event table. These tools let you follow the execution of a job and investigate errors in failure codeunits.

### Application Insights

You can set up Business Central to send telemetry traces to an Application Insights resource in Azure. Once set up, telemetry data will be sent to the resource as job queue moves through the flow. For more information, see:

[Enable Sending Telemetry to Application Insights](../administration/telemetry-enable-application-insights.md) 

[Analyzing Task Scheduler Telemetry](../administration/telemetry-task-scheduler-trace.md)

### Session Event Table

From the Business Central web client, you can open the Session Events table by adding `table=2000000111` to the URL. For example: [https://businesscentral.dynamics.com/?table=2000000111](https://businesscentral.dynamics.com/?table=2000000111).

## See Also

[Task Scheduler](devenv-task-scheduler.md).
[Task Scheduler Data Type](methods-auto/taskscheduler/taskscheduler-data-type.md)   
[Developing Extensions](devenv-dev-overview.md)  
[Getting Started with AL](devenv-get-started.md) 