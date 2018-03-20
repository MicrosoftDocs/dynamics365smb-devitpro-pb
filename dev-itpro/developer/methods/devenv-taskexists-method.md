---
title: "TASKEXISTS Method"
ms.custom: na
ms.date: 22/11/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
author: jswymer
---

 

# TASKEXISTS Method
Checks whether a specific task exists and is waiting to be run by task scheduler.   

## Syntax  

```  
Exists := TASKEXISTS(Task)  
```  

#### Parameters  
 *Task*  
 Type: GUID  

 The unique identifier of the task. The unique identifier is returned by the CREATETASK method.  

## Property Value/Return Value  
 Type: Boolean  

 **true** if the task exists and is waiting to be run; otherwise, **false**. A task that is running or completed is not considered to be an existing task. 

## Remarks  
 Scheduled tasks are recorded in table **2000000175 Scheduled Task**. To see an example of TASKEXISTS in use, refer to AL code of table **472 Job Queue Entry**.  

 For more information about tasks and TASKSCEDULER data type methods, see managing tasks [Task Scheduler](../devenv-task-scheduler.md).  

## See Also  
 [Task Scheduler](../devenv-task-scheduler.md)  
 [TaskScheduler Data Type](../datatypes/devenv-TaskScheduler-Data-Type.md)   
 [CREATETASK Method](devenv-CREATETASK-Method.md)   
 [CANCELTASK Method](devenv-CANCELTASK-Method.md)   
 [SETTASKREADY Method](devenv-SETTASKREADY-Method.md)
