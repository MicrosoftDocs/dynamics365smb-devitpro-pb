---
title: "CANCELTASK Method"
ms.custom: na
ms.date: 07/04/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 6c0a6dac-ffb7-4d7c-af85-e884af819430
author: SusanneWindfeldPedersen
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# CANCELTASK Method
Cancels and deletes a scheduled task that runs a specific codeunit.  

## Syntax  

```  
[Ok] := CANCELTASK(Task)  
```  

#### Parameters  
 *Task*  
 Type: GUID  

 Specifies the unique identifier of the task. The unique identifier is returned by the CREATETASK method.  

## Property Value/Return Value  
 Type: Boolean  

 **True** if a task is deleted; otherwise, **false**.  

## Remarks  
 Scheduled tasks are recorded in table **2000000175 Scheduled Task**. CANCELTASK removes the task entry from the table.  

 CANCELTASK can only cancel pending tasks. It cannot cancel a task that is in process. To see an example of CANCELTASK in use, refer to AL code of table **472 Job Queue Entry**.  

 For more information about tasks and TASKSCEDULER data type methods, see managing tasks [Task Scheduler](../devenv-task-scheduler.md).  

## See Also  
 [TaskScheduler Data Type](../datatypes/devenv-TaskScheduler-Data-Type.md)   
 [CREATETASK Method](devenv-CREATETASK-Method.md)   
 [TASKEXISTS Method](devenv-TASKEXISTS-Method.md)   
 [SETTASKREADY Method](devenv-SETTASKREADY-Method.md)
