---
title: "CREATETASK Function"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: f05636df-7b5c-45cf-80bf-a6c9dbd20485
caps.latest.revision: 3
manager: edupont
---
# CREATETASK Function
Adds a task to run a codeunit at a specific time.  

## Syntax  

```  
[Task =: ]CREATETASK(CodeunitId, FailureCodeunitId[, IsReady][, Company][, NotBefore][, RecordID])  
```  

#### Parameters  
 *CodeunitId*  
 Type: Integer  

 Specifies the ID of the codeunit to run.  

 *FailureCodeunitId*  
 Type: Integer  

 Specifies the ID of the codeunit to run if the task fails. If you do not want to provide a failure codeunit, then use **0**.  

 *IsReady*  
 Type: Boolean  

 Sets the task to the ready state. A task cannot run unless it is ready.  

 *Company*  
 Type: Text  

 Specifies the company to run the task for. If you do not specify a company, the task will run in the user’s current company.  

 *NotBefore*  
 Type: DateTime  

 Specifies the date and time that you want to run the task. When the task actually runs will depend on whether other tasks are running at the same time. The task will run the first opportunity on or after the date and time that you specify.  

 *RecordID*  
 Type: RecordID  

 Specifies the recordID of the record that you want to run the task on.  

## Property Value/Return Value  
 Type: GUID  

 The unique identifier that is assigned to the task.  

## Remarks  
 Scheduled tasks are recorded in table **2000000175 Scheduled Task**.  For more information about tasks and task scheduler, see managing tasks [Task Scheduler](Task-Scheduler.md).  

## Example  
 The following example schedules a task to run the **Job Queue Dispatcher** and uses codeunit **Job Queue Error Handler** as the failure codeunit. The code requires that you create the following C/AL variable.  

|Variable|DataType|SubType|  
|--------------|--------------|-------------|  
|JobQueueEntry|Record|Job Queue Entry|  

```  
TASKSCHEDULER.CREATETASK(CODEUNIT::"Job Queue Dispatcher", CODEUNIT::"Job Queue Error Handler", TRUE, COMPANYNAME, CURRENTDATETIME + 1000 + RANDOM(3000), JobQueueEntry.RECORDID);  
```  

 To see this code in use, you can look at the C/AL code in codeunit **448 Job Queue Dispatcher** in the [!INCLUDE[demolong](includes/demolong_md.md)].  

## See Also  
 [Task Scheduler](Task-Scheduler.md)  
 [TaskScheduler Data Type](TaskScheduler-Data-Type.md)   
 [CANCELTASK Function](CANCELTASK-Function.md)  
 [CANCREATETASK Function](CANCREATETASK-Function.md)    
 [SETTASKREADY Function](SETTASKREADY-Function.md)   
 [TASKEXISTS Function](TASKEXISTS-Function.md)
