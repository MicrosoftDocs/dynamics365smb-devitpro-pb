---
title: "TaskScheduler Data Type"
ms.author: solsen
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# TaskScheduler Data Type
Is a complex data type for creating and managing tasks in the task scheduler, which runs codeunits at scheduled times.


The following methods are available on the TaskScheduler data type.


|Method name|Description|
|-----------|-----------|
|[CreateTask(Integer, Integer [, Boolean] [, String] [, DateTime] [, RecordId])](taskscheduler-createtask-method.md)|Adds a task to ensure that a codeunit is not run before the specified time.|
|[TaskExists(Guid)](taskscheduler-taskexists-method.md)|Checks whether a specific task exists.|
|[CancelTask(Guid)](taskscheduler-canceltask-method.md)|Cancels and deletes a scheduled task that runs a specific codeunit.|
|[SetTaskReady(Guid [, DateTime])](taskscheduler-settaskready-method.md)|Sets a task that runs a codeunit to the ready state. The task will not run unless it is in the ready state.|
|[CanCreateTask()](taskscheduler-cancreatetask-method.md)|Checks whether it is possible to schedule tasks in this session.|


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  