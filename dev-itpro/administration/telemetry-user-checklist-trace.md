---
title:  User Checklist Trace Telemetry | Microsoft Docs
description: Learn about the user checklist telemetry in Business Central  
author: KennieNP
ms.topic: conceptual
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 07/21/2022
ms.author: kepontop
---
# Analyzing User Checklist Telemetry

User checklist telemetry gathers data about state changes for the checklists presented to users when onboarding to [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. For more information about checklists, see [Get Users Started with the Checklist](onboarding-checklist.md).

## User checklist status updated

Occurs when the checklist status changes for the environment.

### General dimensions

|Dimension|Description or value|
|---------|-----|
|message|**User checklist status updated: {oldStatus} to {newStatus}** <br /><br /> `{oldStatus}` indicates the old status of the checklist.<br /><br /> `{newStatus}` indicates the new status of the checklist.|

### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|eventId|**AL0000EIQ**|
|alOldStatus| The old status of the checklist, for example **Not Started** or **In progress**. |
|alNewStatus| The new status of the checklist, for example **In progress** or **Completed**. |

## See also

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  
