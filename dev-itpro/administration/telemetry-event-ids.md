---
title: Telemetry Event IDs in Application Insights | Microsoft Docs
description: Learn about the event IDs of Business Central events emitted to Azure Application Insights.  
author: jswymer
ms.topic: article
ms.devlang: al
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 09/22/2026
ms.author: jswymer
ms.reviewer: jswymer
ai-usage: ai-assisted
---
# Telemetry event IDs in Application Insights

The following tables list the IDs of [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry trace events that are emitted to Azure Application Insights.

## Application events
[!INCLUDE[app_events](../includes/include-app-telemetry-event-ids.md)]

## Client events
[!INCLUDE[client_events](../includes/include-client-telemetry-event-ids.md)]

## Lifecycle events
[!INCLUDE[lifecycle_events](../includes/include-lifecycle-telemetry-event-ids.md)]

## Runtime events

[!INCLUDE[runtime_events](../includes/include-runtime-telemetry-event-ids.md)]

## Find AL event IDs in the application source

AL application code emits event IDs that start with `AL`. The application source passes an ID without the `AL` prefix to `Session.LogMessage`, the **Telemetry** codeunit, or the **Feature Telemetry** codeunit. [!INCLUDE[prod_short](../developer/includes/prod_short.md)] adds the `AL` prefix when it emits the event to Application Insights.

For example, the application source emits the configuration package apply event with this pattern:

```al
Dimensions.Add('PackageCode', ConfigPackage.SystemId);
Session.LogMessage(
    '0000E3N',
    Message,
    Verbosity::Normal,
    DataClassification::SystemMetadata,
    TelemetryScope::All,
    Dimensions);
```

The resulting event has these values in Application Insights:

- `eventId` is `AL0000E3N`.
- The `PackageCode` dimension is named `alPackageCode`.
- `TelemetryScope::All` sends the event to the Application Insights resources configured for the environment and the extension publisher.

To find the source of an `AL` event in the [Business Central applications repository](https://github.com/microsoft/BCApps), remove the `AL` prefix and search for the remaining ID. For example, search for `0000E3N` to find the source of `AL0000E3N`.

> [!NOTE]
> The sections on this page group events by their administrative purpose. An `AL` event can therefore appear in the **Lifecycle events** section.

## Related information

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  
[Creating custom telemetry events for Azure Application Insights](../developer/devenv-instrument-application-for-telemetry-app-insights.md)
