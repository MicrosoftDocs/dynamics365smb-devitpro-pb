---
title: Analyzing Task Scheduler Telemetry
description: Learn about the task scheduler telemetry in Business Central  
author: jswymer
ms.service: dynamics365-business-central
ms.topic: conceptual
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 04/01/2021
ms.author: jswymer
---

# Analyzing Task Scheduler Telemetry

[!INCLUDE[2021_releasewave2.md](../includes/2021_releasewave2.md)]

Task scheduler telemetry gathers information about the execution of scheduled tasks. The data gives insight into what happens in background sessions that are coming from scheduled tasks. It provides information that let's you troubleshoot failures. The data can also help you determine whether tasks would be better scheduled for off hours to limit the load on the service.  

For an overview of task scheduler to understand the flow related to these traces, see [Task Scheduler](../developer/devenv-task-scheduler.md).

> [!NOTE]
> In this article, *main codeunit* refers to the codeunit that's run by the TaskScheduler.CreateTask method.

Each scheduled task is assigned a unique identifier (ID), which is included in each trace related to the task. Using the ID makes it easy to query the flow of a task.

## Task created

Occurs when a task was created by a TaskScheduler.CreateTask method call in AL code.

### General dimensions

The following table explains the general dimensions of this trace.

|Dimension|Description or value|
|---------|-----|
|message|**Task {taskId} created: {codeunitObjectId} scheduled to run after {notBefore}. Ready to run: {isReady}**|
|severityLevel|**1**|

### Custom dimensions

<!--
{"telemetrySchemaVersion":"0.1","componentVersion":"18.0.29040.0","environmentType":"Production","failureCodeunitObjectId":"50206","aadTenantId":"common","companyName":"CRONUS International Ltd.","codeunitObjectId":"50205","component":"Dynamics 365 Business Central Server","eventId":"LC0030","languageId":"1033","notBefore":"2021-08-17T08:28:01.5480000Z","formatId":"1033","isReady":"True","timeout":"12:00:00","taskId":"63d1f8bc-9f75-4c6e-8646-339c796210f0"}
-->

|Dimension|Description or value|
|---------|-----|-----------|
|eventId|**LC0040**|
|codeunitObjectId|Specifies the ID of the task's main codeunit.|
|failureCodeunitObjectId|Specifies the ID of the task's failure codeunit. **0** indicates that there's no failure codeunit.|
|isReady|Specifies whether the task was in the the ready state when created. **True** indicates that the task is in the ready state. **False** indicates that the task isn't in the ready state.|
|notBefore|Specifies the earliest date and time the task was scheduled to run.|
|taskId|Specifies the unique identifier assigned to the task.|
|timeout|Specifies the timeout that was set on the task. If a task takes longer to complete than the specified time, it's canceled. The time has the format hh:mm:ss.sssssss.|

<a name="other"></a>**Common custom dimensions**

The following table explains other custom dimensions that are common to all task scheduler traces. 

|Dimension|Description or value|
|---------|-----|
|aadTenantId|Specifies that Azure Active Directory (Azure AD) tenant ID used for Azure AD authentication. For on-premises, if you aren't using Azure AD authentication, this value is **common**. |
|companyName|Specifies the display name of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] company in which the task was run.|
|component|**Dynamics 365 Business Central Server**.|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
|formatId|Specifies the regional setting of the session. The value is a culture identifiers (LCIDs), such as 1033 for English - United States.|
|languageId|Specifies the language version of Business Central on which the task is run. The value is a culture identifiers (LCIDs), such as 1033 for English - United States.|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|

## Task ready

Occurs when a task is set to the ready state by TaskScheduler.SetTaskReady method call in AL code. A task can't be run until it's in the ready state.

### General dimensions

The following table explains the general dimensions of this trace.

|Dimension|Description or value|
|---------|-----|
|message|**Task {taskId} ready: {codeunitObjectId} set ready to run after {notBefore}.**|
|severityLevel|**1**|

### Custom dimensions

<!--
{"component":"Dynamics 365 Business Central Server","telemetrySchemaVersion":"0.1","componentVersion":"18.0.29040.0","environmentType":"Production","failureCodeunitObjectId":"50206","aadTenantId":"common","companyName":"CRONUS International Ltd.","codeunitObjectId":"50205","eventId":"LC0031","languageId":"1033","notBefore":"2021-08-16T09:49:24.4300000Z","formatId":"1033","timeout":"12:00:00","isReady":"True","taskId":"b648d856-bc54-4568-9011-12bdd2837b09"}

-->

|Dimension|Description or value|
|---------|-----|-----------|
|eventId|**LC0041**|
|codeunitObjectId|Specifies the ID of the task's main codeunit.|
|failureCodeunitObjectId|Specifies the ID of the task's failure codeunit. **0** indicates that there's no failure codeunit.|
|isReady|**True**|
|notBefore|Specifies the earliest date and time that was scheduled to run.|
|taskId|Specifies the unique identifier assigned to the task.|
|timeout|Specifies the timeout that was set on the task. If a task takes longer to complete than the specified time, it's canceled. The time has the format hh:mm:ss.sssssss.|
|[See common custom dimensions](#other)||

<!--Task b648d856-bc54-4568-9011-12bdd2837b09 ready: 50205 set ready to run after 2021-08-16 09:49:24Z.-->

## Task removed

Occurs when a task is deleted by a TaskScheduler.CancelTask method call in AL code.

### General dimensions

The following table explains the general dimensions of this trace.

|Dimension|Description or value|
|---------|-----|
|message|**Task {taskId} removed: {codeunitObjectId}.**|
|severityLevel|**1**|

### Custom dimensions

<!--
{"telemetrySchemaVersion":"0.1","componentVersion":"18.0.29040.0","failureCodeunitObjectId":"450","environmentType":"Production","aadTenantId":"common","companyName":"CRONUS ÆØÅ Company","codeunitObjectId":"448","component":"Dynamics 365 Business Central Server","eventId":"LC0032","languageId":"1033","notBefore":"2021-08-17T09:38:25.9970000Z","formatId":"1033","timeout":"12:00:00","isReady":"True","taskId":"caefe853-186c-4fc1-a875-70e8c22a90b8"}
-->

|Dimension|Description or value|
|---------|-----|-----------|
|eventId|**LC0042**|
|codeunitObjectId|Specifies the ID of the task's main codeunit.|
|failureCodeunitObjectId|Specifies the ID of the task's failure codeunit. **0** indicates that there's no failure codeunit.|
|isReady|Specifies whether the task was in the ready state when removed. **True** indicates that the task was in the ready state. **False** indicates that the task wasn't in the ready state.|
|notBefore|Specifies the earliest date and time that was scheduled to run.|
|taskId|Specifies the unique identifier assigned to the task.|
|timeout|Specifies the timeout that was set on the task. The time has the format hh:mm:ss.sssssss.|
|[See common custom dimensions](#other)||

## Task canceled

Occurs when the execution of a task's main or failure codeunit is canceled by the service or by a user.

For example, the service cancels a task when:

- It takes longer to complete than the specified timeout. The timeout is specified on the task when it's created. Or if no timeout is specified, then the default timeout of the service is used. For online, the default task timeout is 12 hours. For on-premises, the default timeout is specified by the **Default Task Scheduler Session Timeout** setting on the Business Central Server instance.
- The Session.StopSession method was called from AL code.

Users can cancel a task a couple ways. For example, with Business Central online, they can use the Business Central admin center. With on-premises, they can run the the [Remove-NAVSession cmdlet](/powershell/module/microsoft.dynamics.nav.management/remove-navserversession).

### General dimensions

The following table explains the general dimensions of this trace.

|Dimension|Description or value|
|---------|-----|
|message|The messages will depend on whether the error occurred in the main codeunit ot failure codeunit. <br><br>*Main codeunit*<br>**Task {taskId} main codeunit {codeunitObjectId} canceled. It will not be retried and the failure codeunit {failureCodeunitObjectId} will be run. Reason: Exception is not retriable.**<br><br>**Task {taskId} main codeunit {codeunitObjectId} canceled. It will be retried. Reason: Exception is retriable.**<br><br>**Task {taskId} main codeunit {codeunitObjectId} canceled. It will not be retried. Reason: Exception is retriable but the maximum number of attempts has been reached.**<br><br>*Failure codeunit*<br>**Task {taskId} failure codeunit {failureCodeunitObjectId} canceled. It will not be retried. Reason: Exception is not retriable.**<br><br>**Task {taskId} failure codeunit {failureCodeunitObjectId} canceled. It will be retried. Reason: Exception is retriable.**<br><br>**Task {taskId} failure codeunit {failureCodeunitObjectId} canceled. It will not be retried. Reason: Exception is retriable but the maximum number of attempts has been reached.**|
|severityLevel|**2**|

### Custom dimensions

<!--
{"component":"Dynamics 365 Business Central Server","result":"Canceled","telemetrySchemaVersion":"0.1","componentVersion":"18.0.29040.0","environmentType":"Production","serverExecutionTime":"00:00:30.2988571","failureCodeunitObjectId":"50204","companyName":"CRONUS International Ltd.","aadTenantId":"common","codeunitObjectId":"50203","sqlExecutes":"8","sqlRowsRead":"5","eventId":"LC0034","totalTime":"00:00:30.2988571","languageId":"1033","notBefore":"2021-08-16T07:28:53.7400000Z","formatId":"1033","attemptNumber":"0","sessionId":"21","timeout":"00:00:30","isReady":"True","taskId":"6e78429a-cd58-4496-8595-b525f1bb9f27","cancelReasonMessage":"The operation was canceled because it took longer to complete than the specified threshold (00:00:30).","cancelReason":"MaxTimeExceeded"}

-->

|Dimension|Description or value|
|---------|-----|-----------|
|eventId|**LC0044**|
|attemptNumber|Specifies the run attempt on the codeunit. **0** indicates the first run of the codeunit. Any value other than **0** indicates a retry.|
|cancelReason|Specifies why the task was canceled.|
|cancelReasonMessage|Specifies the exception that caused the cancellation.|
|codeunitObjectId|Specifies the ID of the task's main codeunit.|
|failureCodeunitObjectId|Specifies the ID of the task's failure codeunit. **0** indicates that there's no failure codeunit.|
|isReady|**True**|
|notBefore|Specifies the earliest date and time to the task was scheduled to run.|
|result|**Canceled** |
|serverExecutionTime|Specifies the amount of time it took the server to run the codeunit. The time has the format hh:mm:ss.sssssss.|
|sessionId|Specifies the unique identifier of the session in which the task's codeunit was run.|
|sqlExecutes|Specifies the number of SQL statements that were executed by the codeunit before the task was canceled.|
|sqlRowsRead|Specifies the number of table rows that were read by the SQL statements before the task was canceled.|
|taskId|Specifies the unique identifier assigned to the task.|
|timeout|Specifies the timeout that was set on the task. The time has the format hh:mm:ss.sssssss.|
|totalTime|Specifies the amount of time it took before the task was canceled. The time has the format hh:mm:ss.sssssss.|
|[See common custom dimensions](#other)||

## Task failed

Occurs when the execution of task's main codeunit or failure codeunit fails because of an exception.

### General dimensions

The following table explains the general dimensions of this trace.

|Dimension|Description or value|
|---------|-----|
|message|The messages will depend on whether the error occurred in the main codeunit ot failure codeunit. <br><br>*Main codeunit*<br>**Task {taskId} main codeunit {codeunitObjectId} failed. It will not be retried and the failure codeunit {failureCodeunitObjectId} will be run. Reason: Exception is not retriable.**<br><br>**Task {taskId} main codeunit {codeunitObjectId} failed. It will be retried. Reason: Exception is retriable.**<br><br>**Task {taskId} main codeunit {codeunitObjectId} failed. It will not be retried. Reason: Exception is retriable but the maximum number of attempts has been reached.**<br><br>*Failure codeunit*<br>**Task {taskId} failure codeunit {codeunitObjectId} failed. It will not be retried. Reason: Exception is not retriable.**<br><br>**Task {taskId} failure codeunit {failureCodeunitObjectId} failed. It will be retried. Reason: Exception is retriable**<br><br>**Task {taskId} failure codeunit {failureCodeunitObjectId} failed. It will not be retried. Reason: Exception is retriable but the maximum number of attempts has been reached.**|
|severityLevel|**3**|

### Custom dimensions

<!--
{"telemetrySchemaVersion":"0.1","componentVersion":"18.0.29040.0","environmentType":"Production","serverExecutionTime":"00:00:00.0688227","failureCodeunitObjectId":"50206","aadTenantId":"common","companyName":"CRONUS International Ltd.","codeunitObjectId":"50205","component":"Dynamics 365 Business Central Server","sqlRowsRead":"5","sqlExecutes":"8","eventId":"LC0035","totalTime":"00:00:00.0688227","languageId":"1033","notBefore":"2021-08-17T09:29:22.5230000Z","formatId":"1033","result":"Failure","isReady":"True","timeout":"12:00:00","attemptNumber":"0","taskId":"54904eef-e20a-41f7-bba1-d451480ac4bf","sessionId":"2634","failureReason":"NavNCLDialogException"}

-->

|Dimension|Description or value|
|---------|-----|-----------|
|eventId|**LC0045**|
|attemptNumber|Specifies the retry attempt on the codeunit. **0** indicates the initial run of the codeunit, not a retry.|
|codeunitObjectId|Specifies the ID of the task's main codeunit.|
|failureCodeunitObjectId|Specifies the ID of the task's failure codeunit. **0** indicates that there's no failure codeunit.|
|failureReason|Specifies the exception that thrown as a result of the error.|
|isReady|Specifies whether the task is in the ready state. **True** indicates that the task is in the ready state. **False** indicates that the task isn't in the ready state.|
|notBefore|Specifies the earliest date and time that was scheduled to run.|
|result|**Failure** |
|serverExecutionTime|Specifies the amount of time it took the server to run the codeunit. The time has the format hh:mm:ss.sssssss.|
|sessionId|Specifies the unique identifier of the session in which the task's codeunit was run.|
|sqlExecutes|Specifies the number of SQL statements that were executed before the task failed.|
|sqlRowsRead|Specifies the number of table rows that were read by the SQL statements before the task failed.|
|taskId|Specifies the unique identifier assigned to the task.|
|timeout|Specifies the timeout that was set on the task. The time has the format hh:mm:ss.sssssss.|
|totalTime|Specifies the amount of time it took to create the company. The time has the format hh:mm:ss.sssssss.|
|[See common custom dimensions](#other)||

## Task completed

Occurs when the execution of a task's main codunit or failure codeunit succeeds with no errors. 

### General dimensions

The following table explains the general dimensions of this trace.

|Dimension|Description or value|
|---------|-----|
|message|**Task {taskId} main codeunit {codeunitObjectId} completed.** - This message indicates that the task was fully executed successfully.<br><br>**Task {taskId} failure codeunit {failureCodeunitObjectId} completed.** - This message indicates that an error occurred in the task, but it was successfully handled by the failure codeunit.|
|severityLevel|**1**|

### Custom dimensions

<!--
{"telemetrySchemaVersion":"0.1","componentVersion":"18.0.29040.0","environmentType":"Production","serverExecutionTime":"00:00:00.0506101","failureCodeunitObjectId":"50206","aadTenantId":"common","companyName":"CRONUS International Ltd.","codeunitObjectId":"50205","component":"Dynamics 365 Business Central Server","sqlExecutes":"13","sqlRowsRead":"7","eventId":"LC0033","totalTime":"00:00:00.0506101","languageId":"1033","notBefore":"2021-08-17T08:28:01.5470000Z","formatId":"1033","result":"Success","isReady":"True","timeout":"12:00:00","attemptNumber":"0","taskId":"63d1f8bc-9f75-4c6e-8646-339c796210f0","sessionId":"2452"}
-->

|Dimension|Description or value|
|---------|-----|-----------|
|eventId|**LC0043**|
|attemptNumber|Specifies the retry attempt on the codeunit. **0** indicates the initial run of the codeunit, not a retry.|
|codeunitObjectId|Specifies the ID of the task's main codeunit.|
|failureCodeunitObjectId|Specifies the ID of the task's failure codeunit. **0** indicates that there's no failure codeunit.|
|isReady|Specifies whether the task is in the ready state. **True** indicates that the task is in the ready state. **False** indicates that the task isn't in the ready state.|
|notBefore|Specifies the earliest date and time that was scheduled to run.|
|result| **Success**|
|serverExecutionTime|Specifies the amount of time it took the server to run the codeunit. The time has the format hh:mm:ss.sssssss.|
|sessionId|Specifies the unique identifier of the session in which the task was run.|
|sqlExecutes|Specifies the number of SQL statements that were executed.|
|sqlRowsRead|Specifies the number of table rows that were read by the SQL statements.|
|taskId|Specifies the unique identifier assigned to the task.|
|timeout|Specifies the timeout that was set on the task. The time has the format hh:mm:ss.sssssss.|
|totalTime|Specifies the amount of time it took to run the codeunit. The time has the format hh:mm:ss.sssssss.|
|[See common custom dimensions](#other)||

## See also

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  