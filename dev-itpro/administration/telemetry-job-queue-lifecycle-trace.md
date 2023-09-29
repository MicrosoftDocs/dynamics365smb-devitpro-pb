---
title: Analyzing Job Queue Lifecycle Trace Telemetry
description: Learn about the telemetry for job queue entries in Business Central  
author: kennienp
ms.topic: conceptual
ms.service: dynamics365-business-central
ms.reviewer: jswymer
ms.custom: bap-template
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 08/21/2023
ms.author: kepontop
---

# Analyzing job queue lifecycle telemetry

**APPLIES TO:** [!INCLUDE[prod_short](../includes/prod_short.md)] 2020 release wave 2, version 17.2, and later

[!INCLUDE[job_queue_telemetry](../includes/include-telemetry-job-queue.md)]

For information about creating and managing job queue entries, see [Use Job Queues to Schedule Tasks](/dynamics365/business-central/admin-job-queues-schedule-tasks) in the [!INCLUDE[prod_short](../includes/prod_short.md)] application help.

For technical information about how the Job Queue works, see [How the Job Queue works](../developer/devenv-job-queue.md) in the in the [!INCLUDE [prod_short](../developer/includes/prod_short.md)] developer content.

## Job queue telemetry events

[!INCLUDE[job_queue_telemetry_events](../includes/include-telemetry-job-queue-events.md)]


## <a name="other"></a>Common custom dimensions to all job queue events

The following table explains custom dimensions that are common to all job queue entry telemetry events described below.  

|Dimension|Description or value|
|---------|-----| 
|alCategory|**AL JobQueueEntries**|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|companyName| [!INCLUDE[companyName](../includes/include-telemetry-dimension-company-name.md)] |
|alJobQueueScheduledTaskId|Specifies the ID of the scheduled task.|
|alJobQueueEarliestStartDateTime|Specifies the earliest start date/time for the job queue entry.|
|alJobQueueId|Specifies the ID of the job queue entry.|
|alJobQueueIsRecurring|Specifies if the job queue is recurring. **True** indicates it's recurring. **False** indicates it's not recurring. Note that the values in the dimension is localized to the language of the user session. |
|alJobQueueObjectId|Specifies the ID of the object that the job queue entry runs.|
|alJobQueueObjectName|Specifies the name of the object that the job queue entry runs. </br></br>This dimension was introduced in version 22.0.|
|alJobQueueObjectType|Specifies the type of the object that the job queue entry runs, for example **Report** or **Codeunit**.|
|alJobQueueObjectDescription|Specifies the description of the object that the job queue entry runs. </br></br>This dimension was introduced in version 22.2.|
|alJobQueueStackTrace|Specifies the AL stack trace of the job queue entry. </br></br>This dimension was introduced in version 21.3. |
|alJobQueueStatus|**Ready** indicates it's a non-recurring job queue entry or the first run of a recurring job queue entry that's ready to run. **In Process** indicates it's being run. **Error** indicates it encountered an error while running. **On Hold** indicates it's being queued. **Finished** indicates it's finished without error. **On Hold with Inactivity Timeout** indicates it's a recurring job query entry that's ready to run.|

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
|alJobQueueObjectId| Specifies the ID of the object that the job queue entry runs. |
|alJobQueueObjectType|Specifies the type of the object that the job queue entry runs, for example **Report** or **Codeunit**.|
|alJobQueueObjectDescription|Specifies the description of the object that the job queue entry runs. This dimension was introduced in Business Central 2023 release wave 1, version 22.2. |
|alJobQueueStatus|**Ready** indicates it's a non-recurring job queue entry or the first run of a recurring job queue entry that's ready to run. **On Hold with Inactivity Timeout** indicates it's a recurring job query entry that's ready to run. |

## <a name="enqueueError"></a>Job queue entry failed to be enqueued

Information if the job queue entry fails to be sent to the queue.  

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Job queue entry not enqueued: {alJobQueueId}**|
|severityLevel|**2**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |


### Custom dimensions

The following table explains custom dimensions that are specific to this trace.

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000FNY**|
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
This KQL code can help you get started troubleshooting job queue errors. Note that these failed entries might be restarted.

```kql
// Job queue entry run failed
traces
| where timestamp > ago(60d) // adjust as needed
| where customDimensions.eventId == 'AL0000HE7'
| project timestamp
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
// jobQueueApp* dimensions contains the information about the app where the jobQueueObject* is located
, jobQueueAppId = customDimensions.alCallerAppId
, jobQueueAppName = customDimensions.alCallerAppName
, jobQueueAppPublisher = customDimensions.alCallerPublisher
, jobQueueAppVersion = customDimensions.alCallerAppVersion
// jobQueueObject* dimensions contains the information about the object containing the code being run
, jobQueueObjectId = customDimensions.alJobQueueObjectId 	
, jobQueueObjectName = customDimensions.alJobQueueObjectName // added in 22.0 
, jobQueueObjectType = customDimensions.alJobQueueObjectType
// jobQueueExecution dimensions contain information about the job queue entry definition
, jobQueueEntryId = customDimensions.alJobQueueId 	
, jobQueueEntryIsRecurring = customDimensions.alJobQueueIsRecurring
, jobQueueEntryDescription = customDimensions.alJobQueueObjectDescription // added in 22.2
, jobQueueEntryMaxNumberOfAttemptsToRun = customDimensions.alJobQueueMaxNumberOfAttemptsToRun // added in 21.5
// jobQueueExecution dimensions contain information about the attempted run of the job queue entry
, jobQueueExecutionNumberOfAttemptsToRun = customDimensions.alJobQueueNumberOfAttemptsToRun // added in 21.5
, jobQueueExecutionStacktrace = customDimensions.alJobQueueStacktrace
, jobQueueExecutionStatus = customDimensions.alJobQueueStatus
, jobQueueExecutionTaskId = customDimensions.alJobQueueScheduledTaskId // you can join to task scheduler telemetry on the taskId
```


## <a name="errorStopped"></a>Job queue entry {Job Queue Id} errored after {attempt number} attempts
Occurs when a job queue entry fails to run. This telemetry event was introduced in version 21.5.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Job queue entry {Job Queue Id} errored after {attempt number} attempts**|
|severityLevel|**2**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000JRG**|
|[See common custom dimensions](#other)||

### Sample KQL code 

This KQL code can help you get started troubleshooting job queue errors where the entry has been vstopped because it failed  for the last time before being set in `Error` state. As an administrator, you want to know about job queue entries that are going into the final failed state and require manual intervention (restarting etc).

```kql
// Job queue entry {Job Queue Id} errored after {attempt number} attempts
traces
| where timestamp > ago(60d) // adjust as needed
| where customDimensions.eventId == 'AL0000JRG'
| project timestamp
, aadTenantId = customDimensions.aadTenantId
, environmentName = customDimensions.environmentName
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
// jobQueueApp* dimensions contains the information about the app where the jobQueueObject* is located
, jobQueueAppId = customDimensions.alCallerAppId
, jobQueueAppName = customDimensions.alCallerAppName
, jobQueueAppPublisher = customDimensions.alCallerPublisher
, jobQueueAppVersion = customDimensions.alCallerAppVersion
// jobQueueObject* dimensions contains the information about the object containing the code being run
, jobQueueObjectId = customDimensions.alJobQueueObjectId 	
, jobQueueObjectName = customDimensions.alJobQueueObjectName // added in 22.0 
, jobQueueObjectType = customDimensions.alJobQueueObjectType
// jobQueueExecution dimensions contain information about the job queue entry definition
, jobQueueEntryId = customDimensions.alJobQueueId 	
, jobQueueEntryIsRecurring = customDimensions.alJobQueueIsRecurring
, jobQueueEntryDescription = customDimensions.alJobQueueObjectDescription // added in 22.2
, jobQueueEntryMaxNumberOfAttemptsToRun = customDimensions.alJobQueueMaxNumberOfAttemptsToRun // added in 21.5
// jobQueueExecution dimensions contain information about the attempted run of the job queue entry
, jobQueueExecutionNumberOfAttemptsToRun = customDimensions.alJobQueueNumberOfAttemptsToRun // added in 21.5
, jobQueueExecutionStatus = customDimensions.alJobQueueStatus
, jobQueueExecutionStacktrace = customDimensions.alJobQueueStacktrace
, jobQueueExecutionTaskId = customDimensions.alJobQueueScheduledTaskId // you can join to task scheduler telemetry on the taskId
```


## <a name="runOnce"></a>Job queue entry run by user
Occurs when the "Run once (Foreground)" action is clicked in Job Queue Entries/Card pages by a user. This telemetry event was introduced in version 22.2.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Running job queue once**|
|severityLevel|**2**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000FMG**|
|[See common custom dimensions](#other)||


## <a name="rescheduledOnLogin"></a>Job queue entry rescheduled on login
Occurs when a job queue entry was rescheduled on login of a user. This telemetry event was introduced in version 22.0

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Job queue entry rescheduled on login: {job queue entry id}**|
|severityLevel|**2**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000I49**|
|[See common custom dimensions](#other)||


## <a name="cancelled"></a>Job queue entry cancelled

Occurs when a job queue entry was cancelled. This telemetry event was introduced in version 23.0.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Job queue entry cancelled: {job queue entry id}**|
|severityLevel|**2**|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000KZV**|
|[See common custom dimensions](#other)||


## Troubleshooting Job queue issues with telemetry

The reason for a failed job queue entry could be in the code that is running. You can find the owner (also called publisher) of the code in the AL stack trace dimension in the job queue error event AL0000HE7. If the error comes from an app/extension, you need to contact the owner of the code to get it resolved. If the error comes from the Microsoft application, then you need to open a support request with Microsoft to get it resolved. 

See [event AL0000HE7](#error) above for sample KQL code to analyze further.


If a job queue entry fails after the maximum number of retry attempts has been done, the telemetry event AL0000JRG is emitted and the job queue entry is set to permanently being stopped. As an administrator, you want to know about these job queue entries that are going into the final failed state and require manual intervention (restarting etc).

See [event AL0000JRG](#errorStopped) above for sample KQL code to analyze further.


## Alerting on Job queue issues with telemetry

[!INCLUDE[alerts](../includes/include-telemetry-alerting.md)]

There exists at least three job queue error scenarios where you might want to setup alerts:

1. Some job queue entries fail
2. Some job queue entries failed and have been stopped
3. No job queue entries are running

In the table below, you can read more about the scenarios and get sample KQL code for the alerting conditions in your alerts.

| Condition | Area | Relevant for | Description | Event Id(s) | KQL sample code (*CTRL+click* to open in new page) |
| --------- | -----| ------------ | ----------- | --------------- | ------------ |
| Job queue errors | Errors | VAR | Get alerted on job queue entries fail. | AL0000E26 | [JobQueueFailures.kql](https://github.com/microsoft/BCTech/blob/master/samples/AppInsights/Alerts/AlertingKQLSamples/JobQueueFailures.kql) |
| Job queue stopped due to errors errors | Errors | VAR | Get alerted on job queue entries that are stopped due to recurring errors (because they have failed for all retry attempts). | AL0000JRG | [JobQueueFailures.kql](https://github.com/microsoft/BCTech/blob/master/samples/AppInsights/Alerts/AlertingKQLSamples/JobQueueFailures.kql) |
| Job queue not running | Errors | VAR | Get alerted if no job queue entries have been started in a given time period. | AL0000E26 | [NoJobQueueRuns.kql](https://github.com/microsoft/BCTech/blob/master/samples/AppInsights/Alerts/AlertingKQLSamples/NoJobQueueRuns.kql) |


For more information about how to setup alerts on telemetry, see [Alert on Telemetry](telemetry-alert.md).

## See also

[Use Job Queues to Schedule Tasks](/dynamics365/business-central/admin-job-queues-schedule-tasks)   
[How the Job Queue works](../developer/devenv-job-queue.md)   
[Telemetry overview](telemetry-overview.md)  
[Enabling Telemetry](telemetry-enable-application-insights.md)  
[Alert on Telemetry](telemetry-alert.md)  
