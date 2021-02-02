---
title: "TaskScheduler.SetTaskReady Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# TaskScheduler.SetTaskReady Method
> **Version**: _Available from runtime version 1.0._

Sets a task that runs a codeunit to the ready state. The task will not run unless it is in the ready state.


## Syntax
```
[Ok := ]  TaskScheduler.SetTaskReady(Task: Guid [, NotBefore: DateTime])
```
## Parameters
*Task*  
&emsp;Type: [Guid](../guid/guid-data-type.md)  
  
*NotBefore*  
&emsp;Type: [DateTime](../datetime/datetime-data-type.md)  
  


## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 For more information about tasks and **TaskScheduler** data type methods, see managing tasks [Task Scheduler](../../devenv-task-scheduler.md).  

## Example  
 The following example creates a task, and then uses the SetTaskReady method to set the task to ready.  
 
```al
var
    TaskID: GUID;
begin
    TaskID := TaskScheduler.CreateTASK(CodeUnit::"Job Queue Dispatcher", CodeUnit::"Job Queue Error Handler");  
    TaskScheduler.SetTaskReady(taskID);  
end;
```  

## See Also
[TaskScheduler Data Type](taskscheduler-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)