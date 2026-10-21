---
title: Set Up Extension Telemetry in Business Central
description: Configure a Business Central extension to send telemetry to Azure Application Insights, monitor deployed apps, and add feature or custom telemetry events.
ms.date: 10/09/2026
ms.reviewer: solsen
ms.topic: how-to
author: jswymer
ms.custom: sfi-ropc-nochange
---

# Set up telemetry in an extension

[!INCLUDE[2020_releasewave2.md](../includes/2020_releasewave2.md)]

Configure an extension to send telemetry to [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] so that you can monitor its use, errors, and performance. The configured resource can receive eligible extension telemetry from environments where the extension is installed and telemetry emission is enabled.

Extension telemetry helps publishers of per-tenant extensions and Marketplace apps investigate issues before partners and customers report them.

:::image type="content" source="media/telemetry-app.svg" alt-text="Diagram of extension telemetry from multiple Business Central environments flowing to one Application Insights resource." lightbox="media/telemetry-app.svg":::

To set up extension telemetry:

1. Get an Application Insights resource in Azure.
1. Add the Application Insights information to the app/extension.
1. Optionally, add feature telemetry or custom telemetry calls to your AL code.

## Get an Application Insights resource in Azure

Create an Application Insights resource in Azure if you don't have one. Learn more in [Create an Application Insights resource](/azure/azure-monitor/app/create-workspace-resource).

The [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] resource is assigned a connection string, which you can see on the **Overview** page for the resource in Azure. Copy this connection string because you'll need it to enable telemetry in the app/extension.

## Add the connection string to your extension

Starting with runtime 7.2, add the `applicationInsightsConnectionString` property to your extension's `app.json` file, as shown in this excerpt:

```json
{
    "applicationInsightsConnectionString": "<ConnectionString>"
}
```

Replace `<ConnectionString>` with the connection string that you copied from the Application Insights resource. Learn more about its format in [Connection strings in Application Insights](/azure/azure-monitor/app/connection-strings).

Build the extension package, and then publish and install it. When the extension runs, it sends eligible telemetry events to the configured resource.

### Before runtime version 7.2

For runtime versions earlier than 7.2, use the legacy `applicationInsightsKey` property instead. Set it to the instrumentation key from the Application Insights connection string, as shown in this excerpt:

```json
{
    "applicationInsightsKey": "<InstrumentationKey>"
}
```

Replace `<InstrumentationKey>` with the value of `InstrumentationKey` in the connection string. Don't specify both `applicationInsightsKey` and `applicationInsightsConnectionString` in the same manifest.

> [!NOTE]
> Support for instrumentation key-based ingestion ended on March 31, 2025. Ingestion continues to work, but Microsoft no longer provides updates or support for that feature. We recommend using connection strings. Learn more in [Connection strings in Application Insights](/azure/azure-monitor/app/connection-strings).

## Add feature or custom telemetry to your AL code

The platform emits eligible events associated with your extension, such as page views, incoming API requests, report execution, error dialogs, and threshold-triggered performance events. Learn more in [Data logged to extension telemetry](devenv-application-insights-for-extensions-data.md).

To log your own feature events, use the Feature Telemetry module in the System Application. Register a telemetry logger for your publisher before adding feature telemetry calls. Learn more in [Using feature telemetry](../administration/telemetry-feature-telemetry.md).

To specify custom event IDs, messages, and dimensions, use `Session.LogMessage`. Telemetry data-classification and privacy rules still apply. Learn more in [Creating custom telemetry events](devenv-instrument-application-for-telemetry-app-insights.md).

## Related information

[Get started with AL](devenv-get-started.md)  
[Publishing and installing extensions](devenv-how-publish-and-install-an-extension-v2.md)  
[JSON files](devenv-json-files.md)  
[Instrumenting an application for telemetry](devenv-instrument-application-for-telemetry.md)  
[Data logged to extension telemetry](devenv-application-insights-for-extensions-data.md)  
[Viewing telemetry data in Azure Application Insights](../administration/telemetry-overview.md)  
[Using feature telemetry](../administration/telemetry-feature-telemetry.md)  
[Creating custom telemetry events](devenv-instrument-application-for-telemetry-app-insights.md)  
