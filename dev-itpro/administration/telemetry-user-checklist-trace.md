---
title: User Checklist Trace Telemetry Reference
description: Analyze user checklist telemetry in Business Central to track checklist status changes and identify the guided experience items associated with them.
author: KennieNP
ms.topic: reference
ai-usage: ai-assisted
ms.devlang: al
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 11/17/2026
ms.author: kepontop
ms.reviewer: jswymer
---
# Analyzing user checklist telemetry

User checklist telemetry gathers data about state changes for the checklists presented to users when onboarding to [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. Learn more in [Get Users Started with the Checklist](onboarding-checklist.md).

These events use normal verbosity (`severityLevel` **1**) and `TelemetryScope::All`.

## User checklist status updated

Occurs when the checklist status changes for a user and their current role.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**User checklist status updated: {oldStatus} to {newStatus}** <br /><br /> `{oldStatus}` indicates the old status of the checklist.<br /><br /> `{newStatus}` indicates the new status of the checklist.|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|eventId|**AL0000EIQ**|
|alOldStatus| The old status of the checklist, for example **Not Started** or **In progress**. |
|alNewStatus| The new status of the checklist, for example **In progress** or **Completed**. |

## Checklist item status updated

Occurs when the status of a checklist item changes.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Checklist item status updated: {oldStatus} to {newStatus}** <br /><br /> `{oldStatus}` indicates the old status of the checklist item.<br /><br /> `{newStatus}` indicates the new status of the checklist item.|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|eventId|**AL0000EIT**|
|alOldStatus| The old status of the checklist item: **Not Started**, **Started**, **Skipped**, or **Completed**. |
|alNewStatus| The new status of the checklist item: **Not Started**, **Started**, **Skipped**, or **Completed**. |

## Checklist item status updated (with guided experience item)

Occurs when the status of a checklist item changes and the guided experience item is found.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**Checklist item status updated: {oldStatus} to {newStatus}** <br /><br /> `{oldStatus}` indicates the old status of the checklist item.<br /><br /> `{newStatus}` indicates the new status of the checklist item.|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|eventId|**AL0000EIR**|
|alOldStatus| The old status of the checklist item: **Not Started**, **Started**, **Skipped**, or **Completed**. |
|alNewStatus| The new status of the checklist item: **Not Started**, **Started**, **Skipped**, or **Completed**. |
|alChecklistItemTitle|The title of the guided experience item.|
|alChecklistItemShortTitle|The short title of the guided experience item.|
|alChecklistItemDescription|The description of the guided experience item.|
|alChecklistItemExtensionId|The ID of the extension that provides the guided experience item.|
|alChecklistItemExtensionName|The name of the extension that provides the guided experience item.|
|alGuidedExperienceType|The type of guided experience, such as assisted setup or a tour.|
|alObjectTypeToRun|The type of object associated with the guided experience item.|
|alObjectIdToRun|The ID of the object associated with the guided experience item.|
|alLinkToRun|The link associated with the guided experience item.|
|alSpotlightTourType|The spotlight tour type associated with the guided experience item.|
|alVideoUrl|The video URL associated with the guided experience item.|

## Related information

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  
