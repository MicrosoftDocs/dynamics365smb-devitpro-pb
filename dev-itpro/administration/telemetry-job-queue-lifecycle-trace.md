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

## <a name="enqueued"></a>Job queue entry enqueued

Occurs when a job queue entry is sent to the job queue to eventually be run. A job queue entry is sent to the queue when its status is changed from **On Hold** to **Ready** or if it's a recurring job queue entry. Recurring job queue entries are automatically enqueued after each run.  

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Job queue entry enqueued: {alJobQueueId}**|
|severityLevel|**1**|

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

### Custom dimensions

The following table explains custom dimensions that are specific to this trace. 

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000E25**|
|[See common custom dimensions](#other)||


<!--

{"Telemetry schema version":"1.0","telemetrySchemaVersion":"1.0","Component version":"17.0.19353.19391","Environment type":"Production","componentVersion":"17.0.19353.19391","Environment name":"Production","environmentType":"Production","environmentName":"Production","deprecatedKeys":"AadTenantId, Environment name, Environment type, Telemetry schema version, Component, Component version, Telemetry schema version, AadTenantId, Environment name, Environment type","aadTenantId":"67209ede-2a69-4691-b243-512349eb5f66","AadTenantId":"67209ede-2a69-4691-b243-512349eb5f66","component":"Dynamics 365 Business Central Server","Component":"Dynamics 365 Business Central Server","eventId":"AL0000E25","alObjectId":"1351","extensionPublisher":"Microsoft","alObjectType":"CodeUnit","alObjectName":"Telemetry Subscribers","Extension version":"17.2.19367.19396","extensionVersion":"17.2.19367.19396","Extension App Id":"437dbf0e-84ff-417a-965d-ed2bb9650972","Extension name":"Base Application","extensionName":"Base Application","alJobQueueObjectType":"Codeunit","alDataClassification":"SystemMetadata","extensionId":"437dbf0e-84ff-417a-965d-ed2bb9650972","alJobQueueObjectId":"5339","alJobQueueStatus":"In Process","alJobQueueId":"3cc8faa7-e064-4daf-a84d-cb8a64690de9","alCategory":"AL JobQueueEntries"}

-->

## <a name="finishedrequest"></a>Job queue entry finished (request)

Occurs when a request for a job queue entry finishes running.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Job queue entry finished: {alJobQueueId}**|
|severityLevel|**1**|

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

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000E26**|
|[See common custom dimensions](#other)||

<!--
{"Telemetry schema version":"1.0","telemetrySchemaVersion":"1.0","Component version":"17.0.19353.19391","Environment type":"Production","componentVersion":"17.0.19353.19391","Environment name":"Production","environmentType":"Production","environmentName":"Production","deprecatedKeys":"AadTenantId, Environment name, Environment type, Telemetry schema version, Component, Component version, Telemetry schema version, AadTenantId, Environment name, Environment type","aadTenantId":"67209ede-2a69-4691-b243-512349eb5f66","AadTenantId":"67209ede-2a69-4691-b243-512349eb5f66","component":"Dynamics 365 Business Central Server","Component":"Dynamics 365 Business Central Server","eventId":"AL0000E26","alObjectId":"1351","extensionPublisher":"Microsoft","alObjectType":"CodeUnit","alObjectName":"Telemetry Subscribers","Extension version":"17.2.19367.19396","extensionVersion":"17.2.19367.19396","Extension App Id":"437dbf0e-84ff-417a-965d-ed2bb9650972","Extension name":"Base Application","extensionName":"Base Application","alJobQueueObjectType":"Codeunit","alDataClassification":"SystemMetadata","extensionId":"437dbf0e-84ff-417a-965d-ed2bb9650972","alJobQueueObjectId":"5339","alJobQueueStatus":"On Hold with Inactivity Timeout","alJobQueueId":"fe2b938c-60a9-45b7-b5e1-28afab72f336","alCategory":"AL JobQueueEntries","alJobQueueExecutionTimeInMs":"923","alJobQueueResult":"Success"}

-->

## Job queue entry failed with error

Occurs when a job queue entry fails to run.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Job queue entry errored: {alJobQueueId}**|
|severityLevel|**2**|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|eventId|**AL0000HE7**|
|[See common custom dimensions](#other)||

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
|alJobQueueObjectType|Specifies the type of the object that the job queue entry runs, for example **Report** or **Codeunit**.|
|alJobQueueStackTrace|Specifies the AL stack trace of the job queue entry. This dimension was introduced in version 20.5. |
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

<!--
{"Telemetry schema version":"1.0","telemetrySchemaVersion":"1.0","Component version":"17.0.19353.19391","Environment type":"Production","componentVersion":"17.0.19353.19391","Environment name":"Production","environmentType":"Production","environmentName":"Production","deprecatedKeys":"AadTenantId, Environment name, Environment type, Telemetry schema version, Component, Component version, Telemetry schema version, AadTenantId, Environment name, Environment type","aadTenantId":"67209ede-2a69-4691-b243-512349eb5f66","AadTenantId":"67209ede-2a69-4691-b243-512349eb5f66","component":"Dynamics 365 Business Central Server","Component":"Dynamics 365 Business Central Server","eventId":"AL0000E24","alObjectId":"1351","extensionPublisher":"Microsoft","alObjectType":"CodeUnit","alObjectName":"Telemetry Subscribers","Extension version":"17.2.19367.19396","extensionVersion":"17.2.19367.19396","Extension App Id":"437dbf0e-84ff-417a-965d-ed2bb9650972","Extension name":"Base Application","extensionName":"Base Application","alJobQueueObjectType":"Codeunit","alDataClassification":"SystemMetadata","extensionId":"437dbf0e-84ff-417a-965d-ed2bb9650972","alJobQueueObjectId":"5339","alJobQueueStatus":"On Hold with Inactivity Timeout","alJobQueueId":"fe2b938c-60a9-45b7-b5e1-28afab72f336","alCategory":"AL JobQueueEntries","alJobQueueIsRecurring":"Yes"}
-->

## Event IDs

The following table describes the event IDs that are currently emitted.  

|Job queue status  |Event ID  |Description  |
|---------|---------|---------|
|Enqueued |AL0000FNY | Occurs when a job queue entry fails to enqueue and this happens if no task scheduler is created behind it.|
|Enqueued|AL0000E24  |Occurs when a job queue entry successfully enqueues and will after the specified alJobQueueEarliestStartDateTime.|
|Started |AL0000E25 |Occurs right before the `Job Queue Start codeunit` is triggered and that codeunit will run the specified `Object ID to run`.|
|Finished successfully   |AL0000E26 |Occurs at the very end of the job queue run.|
|Error|AL0000HE7|Occurs when a job queue errors, and this is the first thing that is triggered before the updating of records.|

## See also

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  
[Use Job Queues to Schedule Tasks](/dynamics365/business-central/admin-job-queues-schedule-tasks)  
