---
title: "CANCELTASK Function"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 6c0a6dac-ffb7-4d7c-af85-e884af819430
caps.latest.revision: 2
manager: edupont
---
# CANCELTASK Function
Cancels and deletes a scheduled task that runs a specific codeunit.  

## Syntax  

```  
[Ok] := CANCELTASK(Task)  
```  

#### Parameters  
 *Task*  
 Type: GUID  

 Specifies the unique identifier of the task. The unique identifier is returned by the CREATETASK function.  

## Property Value/Return Value  
 Type: Boolean  

 **true** if a task is deleted; otherwise, **false**.  

## Remarks  
 Scheduled tasks are recorded in table **2000000175 Scheduled Task**. CANCELTASK removes the task entry from the table.  

 CANCELTASK can only cancel pending tasks. It cannot cancel a task that is in process. To see an example of CANCELTASK in use, refer to C/AL code of table **472 Job Queue Entry**.  

 For more information about tasks and TASKSCEDULER data type functions, see managing tasks [Task Scheduler](Task-Scheduler.md).  

## See Also  
 [TaskScheduler Data Type](TaskScheduler-Data-Type.md)   
 [CREATETASK Function](CREATETASK-Function.md)   
 [TASKEXISTS Function](TASKEXISTS-Function.md)   
 [SETTASKREADY Function](SETTASKREADY-Function.md)
