---
title: "SETTASKREADY Method"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 90204123-a179-409d-921e-fc65f240596d
caps.latest.revision: 3
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# SETTASKREADY Method
Sets a task that runs a codeunit to the ready state. The task will not run unless it is in the ready state.  

## Syntax  

```  
[OK =: ]SETTASKREADY(Task[,NotBefore])  
```  

#### Parameters  
 *Task*  
 Type: GUID  

 Specifies the unique identifier of the task. The unique identifier is returned by the CREATETASK method.  

 *NotBefore*  
 Type: DateTime  

 Specifies the date and time that you want to make the task ready.  

 *RecordID*  
 Type: RecordID  

 Specifies the recordID of the record that you want to run the task on.  

## Property Value/Return Value  
 Type: Boolean  

 **true** if a task has been set to ready; otherwise, **false**.  

## Remarks  
 For more information about tasks and **TASKSCEDULER** data type methods, see managing tasks [Task Scheduler](../devenv-task-scheduler.md).  

## Example  
 The following example creates a task, and then uses the SETTASKREADY method to set the task to ready.  

 The code requires that you create the following AL variable.  

|Variable|DataType|  
|--------------|--------------|  
|TaskID|GUID|  

```  
TaskID := TASKSCHEDULER.CREATETASK(CODEUNIT::"Job Queue Dispatcher", CODEUNIT::"Job Queue Error Handler");  
TASKSCHEDULER.SETTASKREADY(taskID);  
```  

## See Also  
 [Task Scheduler](../devenv-task-scheduler.md)  
 [TaskScheduler Data Type](../datatypes/devenv-TaskScheduler-Data-Type.md)   
 [CREATETASK Method](devenv-CREATETASK-Method.md)   
 [CANCELTASK Method](devenv-CANCELTASK-Method.md)   
 [TASKEXISTS Method](devenv-TASKEXISTS-Method.md)
