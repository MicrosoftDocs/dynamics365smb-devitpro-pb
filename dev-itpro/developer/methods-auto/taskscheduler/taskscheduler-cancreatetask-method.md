---
title: "TaskScheduler.CanCreateTask() Method"
description: "Checks whether it is possible to schedule tasks in this session."
ms.author: solsen
ms.custom: na
ms.date: 07/07/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# TaskScheduler.CanCreateTask() Method
> **Version**: _Available or changed with runtime version 1.0._

Checks whether it is possible to schedule tasks in this session.


## Syntax
```AL
Ok :=   TaskScheduler.CanCreateTask()
```


## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Remarks  
`TaskScheduler.CanCreateTask` checks if tasks are allowed to be created by the user/app of the current session. 

For more information about the task scheduler, see managing tasks [Task Scheduler](../../devenv-task-scheduler.md). 

## Example
This example shows how to use `TaskScheduler.CanCreateTask` to safely run code that creates tasks.

```AL
procedure CreateTask()
begin
    if not CanCreateTask() then 
    begin
        // handle error
    end;

    // code can now assume that tasks can be created

    ...
end;
```

## See Also
[TaskScheduler Data Type](taskscheduler-data-type.md)  
[Task Scheduler](../../devenv-task-scheduler.md)   
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)