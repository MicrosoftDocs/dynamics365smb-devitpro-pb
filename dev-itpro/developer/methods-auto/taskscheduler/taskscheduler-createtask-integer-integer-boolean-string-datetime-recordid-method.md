---
title: "TaskScheduler.CreateTask(Integer, Integer [, Boolean] [, String] [, DateTime] [, RecordId]) Method"
description: "Adds a task to ensure that a codeunit is not run before the specified time."
ms.author: solsen
ms.custom: na
ms.date: 07/07/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# TaskScheduler.CreateTask(Integer, Integer [, Boolean] [, String] [, DateTime] [, RecordId]) Method
> **Version**: _Available or changed with runtime version 1.0._

Adds a task to ensure that a codeunit is not run before the specified time.


## Syntax
```AL
[Task := ]  TaskScheduler.CreateTask(CodeunitId: Integer, FailureCodeunitId: Integer [, IsReady: Boolean] [, Company: String] [, NotBefore: DateTime] [, RecordID: RecordId])
```
## Parameters
*CodeunitId*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
Specifies the ID of the codeunit to run.
          
*FailureCodeunitId*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
 Specifies the ID of the codeunit to run if the task fails. If you do not want to provide a failure codeunit, then use 0.
          
*[Optional] IsReady*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Sets the task to the ready state. A task cannot run unless it is ready.
          
*[Optional] Company*  
&emsp;Type: [String](/dynamics365/business-central/dev-itpro/developer/methods-auto/text/text-data-type)  
Specifies the company to run the task for. If you do not specify a company, the task will run in the user’s current company.
          
*[Optional] NotBefore*  
&emsp;Type: [DateTime](../datetime/datetime-data-type.md)  
Specifies the date and time that you want to run the task. When the task actually runs will depend on whether other tasks are running at the same time. The task will run the first opportunity on or after the date and time that you specify.
          
*[Optional] RecordID*  
&emsp;Type: [RecordId](../recordid/recordid-data-type.md)  
Specifies the recordID of the record that you want to run the task on.
          


## Return Value
*[Optional] Task*  
&emsp;Type: [Guid](../guid/guid-data-type.md)  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Remarks  
Scheduled tasks are recorded in table **2000000175 Scheduled Task**.  For more information about tasks and task scheduler, see managing tasks [Task Scheduler](../../devenv-task-scheduler.md).  

## Example  
The following example schedules a task to run the **Job Queue Dispatcher** and uses codeunit **Job Queue Error Handler** as the failure codeunit. 

```al
var
    JobQueueEntry: Record "Job Queue Entry";
begin
    TaskScheduler.CreateTASK(CodeUnit::"Job Queue Dispatcher", CodeUnit::"Job Queue Error Handler", True, CompanyName, CurrentDateTime + 1000 + Random(3000), JobQueueEntry.RecordID);  
end;
```  


## See Also
[TaskScheduler Data Type](taskscheduler-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)