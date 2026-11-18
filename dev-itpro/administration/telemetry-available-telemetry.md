---
title: Available Business Central Telemetry
description: Find Business Central telemetry by area or event ID to monitor environments and extensions, diagnose errors, and analyze performance.
author: jswymer
ms.topic: overview
ms.devlang: al
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 11/17/2026
ms.author: jswymer
ms.reviewer: jswymer
ai-usage: ai-assisted
---

# Available telemetry
In Application Insights, telemetry from [!INCLUDE[prod_short](../developer/includes/prod_short.md)] is logged into the `traces` or `pageViews` tables.

## Telemetry by area
Currently, [!INCLUDE[prod_short](../developer/includes/prod_short.md)] offers telemetry on the following operations:  

[!INCLUDE[prod_short](../includes/include-telemetry-by-area.md)]

## Telemetry by event ID

The following tables list the IDs of [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry events that are emitted into Azure Application Insights.

### Application events

[!INCLUDE[app_events](../includes/include-app-telemetry-event-ids.md)]

### Client events

[!INCLUDE[client_events](../includes/include-client-telemetry-event-ids.md)]

### Lifecycle events

[!INCLUDE[lifecycle_events](../includes/include-lifecycle-telemetry-event-ids.md)]

### Runtime events

[!INCLUDE[runtime_events](../includes/include-runtime-telemetry-event-ids.md)]

## Related information

[Telemetry Event IDs](telemetry-event-ids.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  
