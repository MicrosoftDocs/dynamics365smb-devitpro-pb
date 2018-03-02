---
title: "TASKEXISTS Function"
ms.custom: na
ms.date: 22/11/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
author: jswymer
---
# TASKEXISTS Function
Checks whether a specific task exists and is waiting to be run by task scheduler.  

## Syntax  

```  
Exists := TASKEXISTS(Task)  
```  

#### Parameters  
 *Task*  
 Type: GUID  

 The unique identifier of the task. The unique identifier is returned by the CREATETASK function.  

## Property Value/Return Value  
 Type: Boolean  

 **true** if the task exists and is waiting to be run; otherwise, **false**. A task that is running or completed is not considered to be an existing task.   

## Remarks  

Scheduled tasks are recorded in table **2000000175 Scheduled Task**. To see an example of TASKEXISTS in use, refer to C/AL code of table **472 Job Queue Entry**.  

For more information about tasks and TASKSCEDULER data type functions, see managing tasks [Task Scheduler](Task-Scheduler.md).  

## See Also   
 [Task Scheduler](Task-Scheduler.md)  
 [TaskScheduler Data Type](TaskScheduler-Data-Type.md)   
 [CREATETASK Function](CREATETASK-Function.md)   
 [CANCELTASK Function](CANCELTASK-Function.md)  
 [CANCREATETASK Function](CANCREATETASK-Function.md)   
 [SETTASKREADY Function](SETTASKREADY-Function.md)
