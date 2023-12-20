---
title: "TaskScheduler.CancelTask(Guid) Method"
description: "Cancels and deletes a scheduled task that runs a specific codeunit."
ms.author: solsen
ms.custom: na
ms.date: 12/15/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# TaskScheduler.CancelTask(Guid) Method
> **Version**: _Available or changed with runtime version 1.0._

Cancels and deletes a scheduled task that runs a specific codeunit.


## Syntax
```AL
[Ok := ]  TaskScheduler.CancelTask(Task: Guid)
```
## Parameters
*Task*  
&emsp;Type: [Guid](../guid/guid-data-type.md)  
Specifies the unique identifier of the task. The unique identifier is returned by the CREATETASK method.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

Scheduled tasks are shown in the **Scheduled Tasks** page in the client. The `TaskScheduler.CancelTask` method removes the task entry from the page (the implementation is different for the on-premises version compared to the online version of [!INCLUDE[prod_short](../../includes/prod_short.md)]).  

The `TaskScheduler.CancelTask` method can only cancel pending tasks. 

If no task exists with the provided task GUID provided to `TaskScheduler.CancelTask`, then the method returns false (no runtime error occurs). 

For more information about the task scheduler, see [Using the Task Scheduler](../../devenv-task-scheduler.md). 

## Example

This example shows how to use `TaskScheduler.CancelTask` to force canceling a task.

```AL
procedure CancelTasks(ScheduledTaskId: Guid)
begin
    TaskScheduler.CancelTask(ScheduledTaskId); // Force cancel task 
end;
```

## See also

[TaskScheduler Data Type](taskscheduler-data-type.md)    
[Using the Task Scheduler](../../devenv-task-scheduler.md)   
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)