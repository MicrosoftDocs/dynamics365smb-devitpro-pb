---
title: "SETTASKREADY Function"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 90204123-a179-409d-921e-fc65f240596d
caps.latest.revision: 3
manager: edupont
---
# SETTASKREADY Function
Sets a task that runs a codeunit to the ready state. The task will not run unless it is in the ready state.  

## Syntax  

```  
[OK =: ]SETTASKREADY(Task[,NotBefore])  
```  

#### Parameters  
 *Task*  
 Type: GUID  

 Specifies the unique identifier of the task. The unique identifier is returned by the CREATETASK function.  

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
 For more information about tasks and **TASKSCEDULER** data type functions, see managing tasks [Task Scheduler](Task-Scheduler.md).  

## Example  
 The following example creates a task, and then uses the SETTASKREADY function to set the task to ready.  

 The code requires that you create the following C/AL variable.  

|Variable|DataType|  
|--------------|--------------|  
|TaskID|GUID|  

```  
TaskID := TASKSCHEDULER.CREATETASK(CODEUNIT::"Job Queue Dispatcher", CODEUNIT::"Job Queue Error Handler");  
TASKSCHEDULER.SETTASKREADY(taskID);  
```  

## See Also  
 [Task Scheduler](Task-Scheduler.md)  
 [TaskScheduler Data Type](TaskScheduler-Data-Type.md)   
 [CREATETASK Function](CREATETASK-Function.md)   
 [CANCELTASK Function](CANCELTASK-Function.md)  
 [CANCREATETASK Function](CANCREATETASK-Function.md)   
 [TASKEXISTS Function](TASKEXISTS-Function.md)
