---
title: "CANCREATETASK Function"
ms.custom: na
ms.date: 11/08/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
author: jswymer
---
# CANCREATETASK Function
Indicates whether the user that has permission to create or run scheduled tasks.  

## Syntax  

```  
[Ok =: ]CANCREATETASK(Task)  
```  

## Property Value/Return Value  
 Type: Boolean  

 **true** if the user is permitted to create or run scheduled tasks, **false**.  

## Remarks  
This is only relavant when using Azure Active Directory (AD) for authenticating users. If the user is granted access by a delegated administrator role in Azure AD, the function returns **false**. In all other cases, it returns true.  

For more information about tasks and **TASKSCEDULER** data type functions, see managing tasks [Task Scheduler](Task-Scheduler.md).  

## Example  
 The following example uses the CANCREATETASK function in code that creates a task, and then uses the SETTASKREADY function to set the task to ready.  

 The code requires that you create the following C/AL variable.  

|Variable|DataType|  
|--------------|--------------|  
|TaskID|GUID|  

```  
IF TASKSCHEDULER.CANCREATETASK THEN
  TaskID := TASKSCHEDULER.CREATETASK(CODEUNIT::"Job Queue Dispatcher", CODEUNIT::"Job Queue Error Handler");  
  TASKSCHEDULER.SETTASKREADY(taskID);  
```  

## See Also  
 [Task Scheduler](Task-Scheduler.md)  
 [TaskScheduler Data Type](TaskScheduler-Data-Type.md)   
 [CREATETASK Function](CREATETASK-Function.md)   
 [CANCELTASK Function](CANCELTASK-Function.md)
 [SETTASKREADY Function](settaskready-function.md)   
 [TASKEXISTS Function](TASKEXISTS-Function.md)
