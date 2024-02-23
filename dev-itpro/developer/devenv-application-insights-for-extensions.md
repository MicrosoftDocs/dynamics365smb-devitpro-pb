---
title: Setting up telemetry in an app/extension 
description: Describes how to configure an extension to send telemetry data to Azure Application Insights. 
ms.custom: na
ms.date: 02/09/2024
ms.reviewer: solsen
ms.topic: conceptual
author: jswymer
---

# Setting up telemetry in an app/extension 

[!INCLUDE[2020_releasewave2.md](../includes/2020_releasewave2.md)]

This article describes how to set up an extension to send telemetry data to [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] for monitoring and analyzing. For each environment where the app/extension is installed, [!INCLUDE[prod_short](includes/prod_short.md)] emits telemetry data for several operations that occur when extension code is run. 

The app telemetry feature targets publishers of per-tenant or appsource extensions to give them insight into issues in their extensions before partners and customers report them. You get data for all customers across the install base of the app/extension. 

:::image type="content" source="media/telemetry-app.svg" alt-text="Shows how app telemetry works in Business Central" lightbox="media/telemetry-app.svg":::

Setting up telemetry in an App/Extension requires only 2-3 steps.

1. Get an Application Insights resource in Azure.
1. Add the Application Insights information to the app/extension.
1. Optionally, add feature telemetry or custom telemetry calls to your AL code.


## Get an Application Insights resource in Azure

The first thing to do is to create an Application Insights resource in Azure if you don't have one. For more information, see [Create an Application Insights resource](/azure/azure-monitor/app/create-new-resource).

The [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] resource is assigned a connection string, which you can see on the **Overview** page for the resource in Azure. Copy this connection string because you'll need it to enable telemetry in the app/extension.

## Add the Application Insights information to the app/extension

The next step is to enable telemetry in your app/extension. You do this by adding the `"applicationInsightsConnectionString"` setting to the extension's app.json as shown:

```json
"applicationInsightsConnectionString": "<connection string>"
```

Replace `<connection string>` with the string that you copied in the [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] overview. For more information about the format of the [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] connection string, see [Connection Strings](/azure/azure-monitor/app/sdk-connection-string?tabs=net).

When done, build the extension package, then publish and install it as usual. When the extension is run from [!INCLUDE[prod_short](includes/prod_short.md)], [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] gathers the telemetry data for viewing and analyzing.

### Before runtime version 7.2

Up until runtime version 7.2 you can't use the `"applicationInsightsConnectionString"` setting. Instead you have to use the `"applicationInsightsKey"` setting, which is added using only the instrumentation key from the [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] connection string as shown:

```json
"applicationInsightsKey": "<instrumentation key>"
```

Where `<instrumentation key>` is replaced by the key denoted in the connection string as `InstrumentationKey=<instrumentation key>;<some other parameters>`.

> [!NOTE]
> Transition to using connection strings for data ingestion in [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] by **31 March 2025**. On 31 March 2025, technical support for instrumentation key–based global ingestion in the [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] feature of Azure Monitor will end. After that date, your [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] resources will continue to receive data, but Microsoft no longer provide updates or customer support for instrumentation key–based global ingestion. 

## Adding feature telemetry or custom telemetry calls to your AL code

When you have enabled telemetry for your app/extension, the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] platform emits telemetry events that happen in the context of the AL code of the app/extension. For example, you get telemetry events when users interact with pages from your app/extension, when REST APIs from your app/extension are called, or when reports from your app/extension are rendered. You get telemetry events when users get error dialogs raised in pages from your app/extension, and when your AL code consumes excessive resources on the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] server or database.

You might also want to log your own events to telemetry. The easiest way to do this is to use the feature usage module in the System Application. For more information, see [Using Feature telemetry](../administration/telemetry-feature-telemetry.md). If you want full control of the structure of the events you send to telemetry, then you can also use the raw Session.LogMessage. For more information, see [Creating custom telemetry events](devenv-instrument-application-for-telemetry-app-insights.md).


## See also  

[Get started with AL](devenv-get-started.md)  
[Publishing and installing extensions](devenv-how-publish-and-install-an-extension-v2.md)  
[JSON files](devenv-json-files.md)  
[Instrumenting an application for telemetry](devenv-instrument-application-for-telemetry.md)  
[Data logged to app/extension telemetry](devenv-application-insights-for-extensions-data.md)  
[Viewing telemetry data in Azure Application Insights](../administration/telemetry-overview.md)  
[Using feature telemetry](../administration/telemetry-feature-telemetry.md)  
[Creating custom telemetry events](devenv-instrument-application-for-telemetry-app-insights.md)  