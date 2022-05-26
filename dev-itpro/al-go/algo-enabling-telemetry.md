---
title: "Enabling Telemetry"
description: "Enable partner telemetry by adding Application Insights to AL-Go for Business Central."
author: freddyk
ms.custom: na
ms.date: 12/30/2021
ms.reviewer: solsen
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Enabling Telemetry

If you want to enable partner telemetry, you must add your Application Insights connection string to the AL-Go settings file. the settings structure is the following:

```json
"PartnerTelemetryConnectionString":  "<connection string to your Application Insights>"
```

You can also decide to send extended telemetry to Microsoft. This is helpful in order to investigate an issue. To enable the extended telemetry add the following property to the AL-Go settings file:

```json
"SendExtendedTelemetryToMicrosoft" : true
```

Each workflow begins with an initialization task and ends with a post-process task. During the initialization an operation ID(Guid) is generated and added to all the tasks in the workflow as ParentID. This property can be used to see all the signals sent for a workflow. The post-process task sends the signal and duration of a workflow. Additionally, each task has its own signal and operationId. This could be used to investigate a task.

The following table lists the telemetry signals for different tasks:

|Event ID|Description|
|--------|-----------
|DO0070 |AL-Go action ran: AddExistingApp |
|DO0071 |AL-Go action ran: CheckForUpdates |
|DO0072 |AL-Go action ran: CreateApp |
|DO0073 |AL-Go action ran: CreateDevelopmentEnvironment |
|DO0074 |AL-Go action ran: CreateReleaseNotes |
|DO0075 |AL-Go action ran: Deploy |
|DO0076 |AL-Go action ran: IncrementVersionNumber |
|DO0077 |AL-Go action ran: PipelineCleanup |
|DO0078 |AL-Go action ran: ReadSecrets |
|DO0079 |AL-Go action ran: ReadSettings |
|DO0080 |AL-Go action ran: RunPipeline |

The following table lists the telemetry signals for different workflows:

|Event ID|Description|
|--------|-----------|
|DO0090	|AL-Go workflow ran: AddExistingAppOrTestApp |
|DO0091	|AL-Go workflow ran: CiCd |
|DO0092	|AL-Go workflow ran: CreateApp |
|DO0093	|AL-Go workflow ran: CreateOnlineDevelopmentEnvironment |
|DO0094	|AL-Go workflow ran: CreateRelease |
|DO0095	|AL-Go workflow ran: CreateTestApp |
|DO0096	|AL-Go workflow ran: IncrementVersionNumber |
|DO0097	|AL-Go workflow ran: PublishToEnvironment |
|DO0098	|AL-Go workflow ran: UpdateGitHubGoSystemFiles |
|DO0099	|AL-Go workflow ran: NextMajor |
|DO0100	|AL-Go workflow ran: NextMinor |
|DO0101	|AL-Go workflow ran: Current |


## See also

[AL-Go Overview](algo-overview.md)  