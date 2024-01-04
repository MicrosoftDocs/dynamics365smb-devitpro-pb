---
title: "TaskScheduler.TaskExists(Guid) Method"
description: "Checks whether a specific task exists."
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
# TaskScheduler.TaskExists(Guid) Method
> **Version**: _Available or changed with runtime version 1.0._

Checks whether a specific task exists.


## Syntax
```AL
Exists :=   TaskScheduler.TaskExists(Task: Guid)
```
## Parameters
*Task*  
&emsp;Type: [Guid](../guid/guid-data-type.md)  
The unique identifier of the task. The unique identifier is returned by the CREATETASK method.  


## Return Value
*Exists*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

Scheduled tasks are shown in the **Scheduled Tasks** page in the client. The `TaskScheduler.TaskExists` method looks up if the task exists on the page (the implementation is different for the on-premises version compared to the online version of [!INCLUDE[prod_short](../../includes/prod_short.md)]).  

> [!NOTE]  
> It's also possible to use `ScheduledTask.Get` on a record instance of type `ScheduledTask` to query for existance of a task. This method requires the user to have Read access to the `ScheduledTask` table, whereas the `TaskScheduler.TaskExists` method doesn't require the user to have access to the `ScheduledTask` table.

For more information about the task scheduler, see [Using the Task Scheduler](../../devenv-task-scheduler.md). 

## Example
This example shows how to use `TaskScheduler.TaskExists` to be able to safely later in the code flow  run code that assumes that the task exists.

```AL
procedure DoSomethingOnATask(ScheduledTaskId: Guid)
begin
    if not TaskScheduler.TaskExists(ScheduledTaskId) then 
    begin
        // handle error
    end;

    // code can now assume that tasks exists

    ...
end;
```

## See Also
[TaskScheduler Data Type](taskscheduler-data-type.md)  
[Using the Task Scheduler](../../devenv-task-scheduler.md)   
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)