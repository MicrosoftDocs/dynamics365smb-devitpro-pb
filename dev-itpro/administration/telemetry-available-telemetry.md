---
title: Available Telemetry
description: Get an overview of available telemetry in Business Central
author: jswymer
ms.topic: overview
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 07/09/2021
ms.author: jswymer
---

# Available telemetry
In Application Insights, telemetry from [!INCLUDE[prod_short](../developer/includes/prod_short.md)] is logged into the traces or pageview tables. 

## Telemetry by area
Currently, [!INCLUDE[prod_short](../developer/includes/prod_short.md)] offers telemetry on the following operations:  

[!INCLUDE[prod_short](../includes/include-telemetry-by-area.md)]

## Telemetry by Event Id
The following tables list the Ids of [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry events that are emitted into Azure Application Insights.

### Application events
[!INCLUDE[app_events](../includes/include-app-telemetry-event-ids.md)]

### Client events
[!INCLUDE[client_events](../includes/include-client-telemetry-event-ids.md)]

### Lifecycle events
[!INCLUDE[lifecycle_events](../includes/include-lifecycle-telemetry-event-ids.md)]

### Runtime events
[!INCLUDE[runtime_events](../includes/include-runtime-telemetry-event-ids.md)]

    
## See also
[Telemetry Event IDs](telemetry-event-ids.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  
