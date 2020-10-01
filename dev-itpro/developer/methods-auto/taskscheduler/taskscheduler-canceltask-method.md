---
title: "TaskScheduler.CancelTask Method"
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
# TaskScheduler.CancelTask Method
Cancels and deletes a scheduled task that runs a specific codeunit.


## Syntax
```
[Ok := ]  TaskScheduler.CancelTask(Task: Guid)
```
## Parameters
*Task*  
&emsp;Type: [Guid](../guid/guid-data-type.md)  
Specifies the unique identifier of the task. The unique identifier is returned by the CREATETASK method.
          


## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 Scheduled tasks are recorded in table **2000000175 Scheduled Task**. CANCELTASK removes the task entry from the table.  

 CANCELTASK can only cancel pending tasks. It cannot cancel a task that is in process. To see an example of CANCELTASK in use, refer to AL code of table **472 Job Queue Entry**.  

 For more information about tasks and TASKSCEDULER data type methods, see managing tasks [Task Scheduler](../../devenv-task-scheduler.md).  

## See Also
[TaskScheduler Data Type](taskscheduler-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)