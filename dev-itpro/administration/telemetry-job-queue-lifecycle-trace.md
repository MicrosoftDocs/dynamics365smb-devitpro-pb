---
title: Analyzing Job Queue Lifecycle Trace Telemetry
description: Learn about the telemetry for job queue entries in Business Central  
author: jswymer
ms.topic: conceptual
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 07/05/2022
ms.author: jswymer
---

# Analyzing Job Queue Lifecycle Trace Telemetry

**APPLIES TO:** [!INCLUDE[prod_short](../includes/prod_short.md)] 2020 release wave 2, version 17.2, and later

Job queue lifecycle telemetry gathers data about the following operations: 

- A job queue entry was enqueued.
- A job queue entry was started.
- A job queue entry finished. Provides information as to whether it was successful or failed.

For information about creating and managing job queue entries, see [Use Job Queues to Schedule Tasks](/dynamics365/business-central/admin-job-queues-schedule-tasks) in the [!INCLUDE[prod_short](../includes/prod_short.md)] application help.

For technical information about how the Job Queue works, see [How the Job Queue works](../developer/devenv-job-queue.md) in the in the [!INCLUDE [prod_short](../developer/includes/prod_short.md)] developer content.

## <a name="enqueued"></a>Job queue entry enqueued

Occurs when a job queue entry is sent to the job queue to eventually be run. A job queue entry is sent to the queue when its status is changed from **On Hold** to **Ready** or if it's a recurring job queue entry. Recurring job queue entries are automatically enqueued after each run.  

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Job queue entry enqueued: {alJobQueueId}**|
|severityLevel|**1**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

The following table explains custom dimensions that are specific to this trace.

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000E24**|
|alJobQueueId|Specifies the ID of the job queue entry.|
|alJobQueueIsRecurring|Specifies whether the job queue is recurring. **Yes** indicates it's recurring. **No**  indicates it's not recurring.|
|alJobQueueObjectId|Specifies the ID of the object that the job queue entry runs.|
|alJobQueueObjectType|Specifies the type of the object that the job queue entry runs, for example **Report** or **Codeunit**.|
|alJobQueueStatus|**Ready** indicates it's a non-recurring job queue entry or the first run of a recurring job queue entry that's ready to run. **On Hold with Inactivity Timeout** indicates it's a recurring job query entry that's ready to run. |

### Error

Information if the job queue entry fails to be sent to the queue.  

#### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Job queue entry not enqueued: {alJobQueueId}**|
|severityLevel|**2**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |


#### Custom dimensions

The following table explains custom dimensions that are specific to this trace.

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000FNY**|
|[See common custom dimensions](#other)||

### Success

Information if the job queue entry was successfully sent to the queue.  

#### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Job queue entry enqueued: {alJobQueueId}**|
|severityLevel|**1**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

#### Custom dimensions

The following table explains custom dimensions that are specific to this trace.

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000E24**|
|[See common custom dimensions](#other)||

## <a name="started"></a>Job queue entry started

Occurs when a job queue entry starts to run.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Job queue entry started: {alJobQueueId}**|
|severityLevel|**1**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |


### Custom dimensions

The following table explains custom dimensions that are specific to this trace. 

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000E25**|
|[See common custom dimensions](#other)||


## <a name="finishedrequest"></a>Job queue entry finished (request)

Occurs when a request for a job queue entry finishes running.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Job queue entry finished: {alJobQueueId}**|
|severityLevel|**1**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |


### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000E26**|
|alJobQueueExecutionTimeInMs|Specifies how many milliseconds it took to run the job queue entry.|
|[See common custom dimensions](#other)||

## <a name="finished"></a>Job queue entry finished (run)

Occurs when a job queue entry finishes running.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**JobID =  {alJobQueueId}, ObjectType =  {alJobQueueObjectType}, ObjectID =  {alJobQueueObjectId}, Status = Finished, Result = Success, Company =  {alJobQueueCompanyName}, Scheduled Task Id =  {alJobQueueScheduledTaskId}**|
|severityLevel|**1**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000E26**|
|[See common custom dimensions](#other)||


## <a name="error"></a>Job queue entry failed with error

Occurs when a job queue entry fails to run.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Job queue entry errored: {alJobQueueId}**|
|severityLevel|**2**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000HE7**|
|[See common custom dimensions](#other)||

### Sample KQL code 
This KQL code can help you get started troubleshooting job queue errors

```kql
traces
| where timestamp > ago(60d) // adjust as needed
| where customDimensions has 'AL0000HE7' // for faster query performance
| where customDimensions.eventId == 'AL0000HE7'
| project timestamp
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, alJobQueueId = customDimensions.alJobQueueId 	
, alJobQueueObjectId = customDimensions.alJobQueueObjectId 	
, alJobQueueObjectName = customDimensions.alJobQueueObjectName // added in 22.0 
, alJobQueueObjectType = customDimensions.alJobQueueObjectType
, alJobQueueObjectDescription = customDimensions.alJobQueueObjectDescription // added in 22.2
, alJobQueueStatus = customDimensions.alJobQueueStatus
, alJobQueueExecutionTimeInMs = customDimensions.alJobQueueExecutionTimeInMs
, alJobQueueStacktrace = customDimensions.alJobQueueStacktrace // stack trace added in 21.3
, taskId = customDimensions.alJobQueueScheduledTaskId // you can join to task scheduler telemetry on the taskId
```

## <a name="other"></a>Common custom dimensions

The following table explains custom dimensions that are common to all job queue entry traces.  

|Dimension|Description or value|
|---------|-----| 
|alCategory|**AL JobQueueEntries**|
|alJobQueueCompanyName|Specifies the current company.|
|alJobQueueScheduledTaskId|Specifies the ID of the scheduled task.|
|alJobQueueEarliestStartDateTime|Specifies the earliest start date/time for the job queue entry.|
|alJobQueueId|Specifies the ID of the job queue entry.|
|alJobQueueIsRecurring|Specifies if the job queue is recurring. **True** indicates it's recurring. **False** indicates it's not recurring.|
|alJobQueueObjectId|Specifies the ID of the object that the job queue entry runs.|
|alJobQueueObjectName|Specifies the name of the object that the job queue entry runs. </br></br>This dimension was introduced in version 22.0.|
|alJobQueueObjectType|Specifies the type of the object that the job queue entry runs, for example **Report** or **Codeunit**.|
|alJobQueueObjectDescription|Specifies the description of the object that the job queue entry runs. </br></br>This dimension was introduced in version 22.2.|
|alJobQueueStackTrace|Specifies the AL stack trace of the job queue entry. </br></br>This dimension was introduced in version 21.3. |
|alJobQueueStatus|**Ready** indicates it's a non-recurring job queue entry or the first run of a recurring job queue entry that's ready to run. **In Process** indicates it's being run. **Error** indicates it encountered an error while running. **On Hold** indicates it's being queued. **Finished** indicates it's finished without error. **On Hold with Inactivity Timeout** indicates it's a recurring job query entry that's ready to run.|
|alObjectId|**1351**, which is the ID of the system application codeunit that subscribes to the telemetry events.|
|alObjectName|**Telemetry Subscribers**, which is the name of the system application codeunit that subscribes to the telemetry events.|
|alObjectType|**CodeUnit**|
|component|**Dynamics 365 Business Central Server**.|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|deprecatedKeys|A comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We recommend that update any queries that use these keys to use the new key name.|
|environmentName|Specifies the name of the tenant environment. See [Managing Environments](tenant-admin-center-environments.md).|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](tenant-admin-center-environments.md#types-of-environments)|
|extensionName|Specifies the name of the extension that contains the object run by the job queue entry.|
|extensionId|Specifies the ID of the extension that contains the object run by the job queue entry.|
|extensionVersion|Specifies the version of the extension that contains the object run by the job queue entry.|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|


## Event Ids

The following table describes the event IDs that are currently emitted.  

|Job queue status  |Event ID  |Description  |
|---------|---------|---------|
|Enqueued |AL0000FNY | Occurs when a job queue entry fails to enqueue and this happens if no task scheduler is created behind it.|
|Enqueued|AL0000E24  |Occurs when a job queue entry successfully enqueues and will after the specified alJobQueueEarliestStartDateTime.|
|Started |AL0000E25 |Occurs right before the `Job Queue Start codeunit` is triggered and that codeunit will run the specified `Object ID to run`.|
|Finished successfully   |AL0000E26 |Occurs at the very end of the job queue run.|
|Error|AL0000HE7|Occurs when a job queue errors, and this is the first thing that is triggered before the updating of records.|

## Troubleshooting Job Queue issues with telemetry

The reason for a failed job queue entry could be in the code that is running. You can find the owner (also called publisher) of the code in the AL stack trace dimension in the Job Queue Error event AL0000HE7. If the error comes from an app/extension, you need to contact the owner of the code to get it resolved. If the error comes from the Microsoft application, then you need to open a support request with Microsoft to get it resolved.

See [event AL0000HE7](#error) above for sample KQL code to analyze further.


## Alerting on Job Queue issues with telemetry

[!INCLUDE[alerts](../includes/include-telemetry-alerting.md)]

There exists at least two job queue error scenarios where you might want to setup alerts:

1. Some job queue entries fail
2. No job queue entries are running

In the table below, you can read more about the scenarios and get sample KQL code for the alerting conditions in your alerts.

| Condition | Area | Relevant for | Description | Event Id(s) | KQL sample code (*CTRL+click* to open in new page) |
| --------- | -----| ------------ | ----------- | --------------- | ------------ |
| Job Queue errors | Errors | VAR | Get alerted on job queue entries fail. | AL0000E26 | [JobQueueFailures.kql](https://github.com/microsoft/BCTech/blob/master/samples/AppInsights/Alerts/AlertingKQLSamples/JobQueueFailures.kql) |
| Job Queue errors | Errors | VAR | Get alerted if no job queue entries have been started in a given time period. | AL0000E26 | [NoJobQueueRuns.kql](https://github.com/microsoft/BCTech/blob/master/samples/AppInsights/Alerts/AlertingKQLSamples/NoJobQueueRuns.kql) |


For more information about how to setup alerts on telemetry, see [Alert on Telemetry](telemetry-alert.md).

## See also

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  
[Alert on Telemetry](telemetry-alert.md)  
[Use Job Queues to Schedule Tasks](/dynamics365/business-central/admin-job-queues-schedule-tasks)  
[How the Job Queue works](../developer/devenv-job-queue.md)
