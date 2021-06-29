---
title: "Task Scheduler"
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# Task Scheduler
The task scheduler enables you to control when certain operations or processes (in other words *tasks*) are run. Basically, a task is a codeunit or report that is scheduled to run at a specific data and time. Tasks run in a background session between the [!INCLUDE[d365fin_server_md](includes/d365fin_server_md.md)] instance and database. Behind the scenes, the task scheduler is used by the job queue to process job queue entries that are created and managed from the clients.  

In AL code, you create and manage tasks by using the AL methods that are available for the **TASKSCHEDULER** data type.  

|Method|Description|For more information, see|  
|--------------|-----------------|-------------------------------|  
|CreateTask|Adds a task to run a codeunit at a specified date and time.|[CreateTask Method](methods-auto/taskscheduler/taskscheduler-createtask-method.md)|  
|SetTaskReady|Sets a task to the **Ready** state. A task cannot run until it is **Ready**.|[SetTaskReady Method](methods-auto/taskscheduler/taskscheduler-settaskready-method.md)|  
|TaskExists|Checks whether a specific task exists.|[TaskExists Method](methods-auto/taskscheduler/taskscheduler-taskexists-method.md)|  
|CancelTask|Cancels a scheduled task.|[CancelTask Method](methods-auto/taskscheduler/taskscheduler-canceltask-method.md)|  

## How task scheduler works  
To set up a task, you create a codeunit that contains the logic that you want to run at a scheduled time. Optionally, you can create a second codeunit that contains the logic to handle the task if an error occurs for any reason. This codeunit is referred to as a *failure codeunit*. Once you have the codeunits, you can add AL code to the application that calls the CREATETASK method to schedule a task to run the codeunits. The [CreateTask](methods-auto/taskscheduler/taskscheduler-createtask-method.md) method can also specify the earliest date to run the task, and whether the task is in the ready state.  

### Task flow  
 Here is an overview of the process that a task goes through:  

1. After you add a task, the task is recorded in table **2000000175 Scheduled Task** of the database.  

2. If the task is in the ready state, when the scheduled time occurs, a new background session is started and the task codeunit is run.  

     You can view the session in the table **2000000111 Session Event**.  

3. If an error occurs, the following happens:  

    1.  If a failure codeunit is not specified, then the retry flow is initiated.  

    2.  If a failure codeunit has been specified, the error is passed in a call to the failure codeunit, and the failure codeunit is run.  

         If the failure codeunit does not handle the error or fails itself, then the retry flow is initiated.  

### Error conditions and retry process  
 A task can fail under the following conditions:  

- The company cannot be opened.  

- A SQL connection or transient error occurred with the database.  

- The [!INCLUDE[d365fin_server_md](includes/d365fin_server_md.md)] instance restarted while the task was being run.  

<!--NAV You can view these errors in the event log of the computer that is running the [!INCLUDE[d365fin_server_md](includes/d365fin_server_md.md)] instance. For more information, see [Monitoring Dynamics NAV Server Events Using Event Viewer](Monitoring-Microsoft-Dynamics-NAV-Server-Events-in-the-Windows-Event-Log.md). --> 

When an error occurs, unless the task is interrupted by the failure codeunit, the server instance will rerun the task according to the following retry flow:  

1. Two minutes after the first failure.  

2. Four minutes after the second failure.  

3. Fifteen minutes after the third failure and any subsequent failures up to a maximum of 10 times, after which the task is canceled.  

## About task sessions and permissions  
The task runs in a background session, which means that there is no user interface. The behavior is similar to that of the STARTSESSION method, where any dialog boxes that would normally appear are suppressed. For more information about specific dialog boxes, see [StartSession](methods-auto/session/session-startsession-method.md) method.  

The session runs by using the same user/credentials that are used when calling AL code. The user must have appropriate permissions to the codeunit and any other objects that are associated with the operation of the codeunit.

## See Also
[Task Scheduler Data Type](methods-auto/taskscheduler/taskscheduler-data-type.md)   
[Developing Extensions](devenv-dev-overview.md)  
[Getting Started with AL](devenv-get-started.md) 