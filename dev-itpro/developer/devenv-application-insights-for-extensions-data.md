---
title: Extension Telemetry Data in Business Central
description: Learn which Business Central events can reach an extension's Application Insights resource and how to identify signals that support extension telemetry.
ms.date: 02/09/2024
ms.reviewer: solsen
ms.topic: reference
author: kennieNP
---

# Data logged to extension telemetry

When an extension enables telemetry, [!INCLUDE[prod_short](../developer/includes/prod_short.md)] can send eligible events associated with that extension to its configured Application Insights resource. Extension telemetry isn't a feed of every event in the environment.

Examples include page views, incoming API requests, report execution, error dialogs, and AL methods or SQL queries that exceed performance thresholds.

In the following table, **Extension support** identifies signals available to extension telemetry. Event emission depends on the operation and its extension context. Feature telemetry also requires a telemetry logger registered for your publisher. Learn more in [Using feature telemetry](../administration/telemetry-feature-telemetry.md).

[!INCLUDE[prod_short](../includes/include-telemetry-by-area.md)]

## Related information

[Instrumenting an application for telemetry](devenv-instrument-application-for-telemetry.md)  
[Viewing telemetry data in Azure Application Insights](../administration/telemetry-overview.md)  
[Set up telemetry in an extension](devenv-application-insights-for-extensions.md)  
