---
title: "TaskScheduler.SetTaskReady(Guid [, DateTime]) Method"
description: "Sets a task that runs a codeunit to the ready state."
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
# TaskScheduler.SetTaskReady(Guid [, DateTime]) Method
> **Version**: _Available or changed with runtime version 1.0._

Sets a task that runs a codeunit to the ready state. The task will not run unless it is in the ready state.


## Syntax
```AL
[Ok := ]  TaskScheduler.SetTaskReady(Task: Guid [, NotBefore: DateTime])
```
## Parameters
*Task*  
&emsp;Type: [Guid](../guid/guid-data-type.md)  
  
*[Optional] NotBefore*  
&emsp;Type: [DateTime](../datetime/datetime-data-type.md)  
  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
Scheduled tasks are shown in the "Scheduled Tasks" page in the client. 

If no task exists with the provided task Guid provided to `TaskScheduler.SetTaskReady`, then the method will return false (no runtime error will occur). 

For more information about the task scheduler, see managing tasks [Task Scheduler](../../devenv-task-scheduler.md). 


## Example  
 The following example creates a task not in IsReady state, does some more work, and then uses the SetTaskReady method to set the task to ready but also only start at a later specified time (task ready time + 60 seconds + up to 3 seconds of random time).  
 
```al
var
    TaskID: GUID;
begin
    // Third parameter to TaskScheduler.CreateTask controls IsReady at task creation time
    TaskID := TaskScheduler.CreateTask(CodeUnit::MyCodeUnit, CodeUnit::MyFailureCodeUnit, false);  

    // do something more work needed before starting the task

    // set the task ready and to start after 
    TaskScheduler.SetTaskReady(TaskID, CurrentDateTime + 60*1000 + Random(3000));  
end;
```  

## See Also
[TaskScheduler Data Type](taskscheduler-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)