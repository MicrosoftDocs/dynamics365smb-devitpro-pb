---
title: "TaskScheduler.CreateTask(Integer, Integer, Boolean, String, DateTime, RecordId, Duration) Method"
description: "Adds a task to ensure that a codeunit is not run before the specified time."
ms.author: solsen
ms.custom: na
ms.date: 07/07/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# TaskScheduler.CreateTask(Integer, Integer, Boolean, String, DateTime, RecordId, Duration) Method
> **Version**: _Available or changed with runtime version 7.0._

Adds a task to ensure that a codeunit is not run before the specified time.


## Syntax
```AL
[Task := ]  TaskScheduler.CreateTask(CodeunitId: Integer, FailureCodeunitId: Integer, IsReady: Boolean, Company: String, NotBefore: DateTime, RecordID: RecordId, Timeout: Duration)
```
## Parameters
*CodeunitId*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
Specifies the ID of the codeunit to run.
          
*FailureCodeunitId*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
 Specifies the ID of the codeunit to run if the task fails. If you do not want to provide a failure codeunit, then use 0.
          
*IsReady*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Sets the task to the ready state. A task cannot run unless it is ready.
          
*Company*  
&emsp;Type: [String](../string/string-data-type.md)  
Specifies the company to run the task for. If you do not specify a company, the task will run in the user’s current company.
          
*NotBefore*  
&emsp;Type: [DateTime](../datetime/datetime-data-type.md)  
Specifies the date and time that you want to run the task. When the task actually runs will depend on whether other tasks are running at the same time. The task will run the first opportunity on or after the date and time that you specify.
          
*RecordID*  
&emsp;Type: [RecordId](../recordid/recordid-data-type.md)  
Specifies the recordID of the record that you want to run the task on.
          
*Timeout*  
&emsp;Type: [Duration](../duration/duration-data-type.md)  
Specifies the timeout of the created session. If not specified a default timeout will be used; for OnPrem, the default timeout is set on the server, for SaaS the current default timeout is 12 hours, and may change in the future.  


## Return Value
*[Optional] Task*  
&emsp;Type: [Guid](../guid/guid-data-type.md)  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[TaskScheduler Data Type](taskscheduler-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
[Configuring Business Central Server - Default Task Scheduler Session Timeout](../../../administration/configure-server-instance.md#Task)  