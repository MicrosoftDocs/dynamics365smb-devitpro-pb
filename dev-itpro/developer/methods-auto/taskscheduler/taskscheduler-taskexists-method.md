---
title: "TaskScheduler.TaskExists Method"
description: "Checks whether a specific task exists."
ms.author: solsen
ms.custom: na
ms.date: 06/23/2021
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
# TaskScheduler.TaskExists Method
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
 Scheduled tasks are recorded in table **2000000175 Scheduled Task**. To see an example of TaskExists in use, refer to AL code of table **472 Job Queue Entry**.  

 For more information about tasks and TaskScheduler data type methods, see managing tasks [Task Scheduler](../../devenv-task-scheduler.md). 

## See Also
[TaskScheduler Data Type](taskscheduler-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)