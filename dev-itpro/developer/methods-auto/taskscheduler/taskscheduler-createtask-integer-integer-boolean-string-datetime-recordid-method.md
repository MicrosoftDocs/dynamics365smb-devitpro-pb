---
title: "TaskScheduler.CreateTask(Integer, Integer [, Boolean] [, Text] [, DateTime] [, RecordId]) Method"
description: "Adds a task to ensure that a codeunit is not run before the specified time."
ms.author: solsen
ms.custom: na
ms.date: 12/15/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# TaskScheduler.CreateTask(Integer, Integer [, Boolean] [, Text] [, DateTime] [, RecordId]) Method
> **Version**: _Available or changed with runtime version 1.0._

Adds a task to ensure that a codeunit is not run before the specified time.


## Syntax
```AL
[Task := ]  TaskScheduler.CreateTask(CodeunitId: Integer, FailureCodeunitId: Integer [, IsReady: Boolean] [, Company: Text] [, NotBefore: DateTime] [, RecordID: RecordId])
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
&emsp;Type: [Text](../text/text-data-type.md)  
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

Scheduled tasks are shown in the **Scheduled Tasks** page in the client. The `TaskScheduler.CreateTask` method creates a task and if the operation is successful, the task appears on the page (the implementation is different for the on-premises version compared to the online version of [!INCLUDE[prod_short](../../includes/prod_short.md)]).  

If one or both of the codeunits provided to `TaskScheduler.CreateTask` don't exist, then the method will throw an error at runtime.

> [!NOTE]  
> The first two parameters in `TaskScheduler.CreateTask` are integers, which represent the object IDs of codeunits. To code robustly, never supply the object ID directly in your code as numbers. Instead, use the :: operator as illustrated in the example above. With this technique, if any of the codeunits don't exist, you'll get a compile time error instead of a runtime error. 

The `TaskScheduler.CreateTask` method also has a version that allows you to set a timeout parameter. For more information, see [CreateTask(Integer, Integer, Boolean, Text, DateTime, RecordId, Duration)](taskscheduler-createtask-integer-integer-boolean-string-datetime-recordid-duration-method.md)

For more information about the task scheduler, see [Using the Task Scheduler](../../devenv-task-scheduler.md). 

## Example (create a task to run now)

The following example schedules a task to run the **MyCodeunit** codeunit right now (when resources are available) in the current company and use the codeunit **MyErrorhandlerCodeunit** as the failure codeunit. 

```AL
begin
    TaskScheduler.CreateTask(CodeUnit::MyCodeunit, CodeUnit::MyErrorhandlerCodeunit);  
end;
```  

## Example (create a task to run after a specified point in time)

The following example schedules a task to run the **MyCodeunit** codeunit after a specified point in time (60 seconds + a random part of up to three seconds) and when resources are available. It runs in the current company and use the codeunit **MyErrorhandlerCodeunit** as the failure codeunit. 

```AL
begin
    TaskScheduler.CreateTask(
        CodeUnit::MyCodeunit, 
        CodeUnit::MyErrorhandlerCodeunit, 
        true, 
        CompanyName, 
        CurrentDateTime + 60*1000 + Random(3000)
    );  
end;
```  

## See also

[CreateTask(Integer, Integer, Boolean, Text, DateTime, RecordId, Duration)](taskscheduler-createtask-integer-integer-boolean-string-datetime-recordid-duration-method.md)   
[TaskScheduler Data Type](taskscheduler-data-type.md)     
[Using the Task Scheduler](../../devenv-task-scheduler.md)   
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)