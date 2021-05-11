---
title: Sending Extension Telemetry to Azure Application Insights 
description: Describes how to configure an extension to send telemetry data to Azure Application Insights. 
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: jswymer
---

# Sending Extension Telemetry to Azure Application Insights

[!INCLUDE[2020_releasewave2.md](../includes/2020_releasewave2.md)]

This article describes how to develop an extension to send telemetry data to Azure Application Insights for monitoring and analyzing. [!INCLUDE[prod_short](includes/prod_short.md)] emits telemetry data for several operations that occur when extension code is run. You can configure an extension to send this telemetry data to a specific Application Insights resource on Microsoft Azure. For an overview about the telemetry with Application Insights, see [Monitoring and Analyzing Telemetry](../administration/telemetry-overview.md).

This feature targets publishers of per-tenant extensions to give them insight into issues in their extensions before partners and customers report them.

## Get an Application Insights resource in Azure

The first thing to do is to create an Application Insights resource in Azure if you don't have one. For more information, see [Create an Application Insights resource](/azure/azure-monitor/app/create-new-resource).

The Application Insights resource is assigned a connection string, which you can see on the **Overview** page for the resource in Azure. Copy this connection string because you'll need it to enable Application Insights in the extension.

## Add the Application Insights Key to the extension's app.json

The next step is to add the `"applicationInsightsConnectionString"` setting the extension's app.json as shown:

```json
"applicationInsightsConnectionString": "<connection string>"
```

Replace `<connection string>` with the string you copied in the Azure Application Insights overview. For more information on the format of the Application Insight connection string, please visit [Connection Strings](azure/azure-monitor/app/sdk-connection-string).

When done, build the extension package, then publish and install it as usual. When the extension is run from [!INCLUDE[prod_short](includes/prod_short.md)], Application Insights gathers the telemetry data for viewing and analyzing.

### Prior to Runtime version 7.2

Up until runtime version 7.2 you could not use the `"applicationInsightsConnectionString"` setting. Instead you had to use the `"applicationInsightsKey"` setting which was added using only the instrumentation key from the Application Insights connection string as shown:

```json
"applicationInsightsKey": "<instrumentation key>"
```

Where `<instrumentation key>` is replaced by the key denoted in the connection string as `InstrumentationKey=<instrumentation key>;<some other parameters>`.

## See Also  
[Getting Started with AL](devenv-get-started.md)  
[Publishing and Installing Extensions](devenv-how-publish-and-install-an-extension-v2.md)  
[JSON Files](devenv-json-files.md)  
[Viewing telemetry data in Application Insights](../administration/telemetry-overview.md)  
[LogMessage Method](../developer/methods-auto/session/session-logmessage-string-string-verbosity-dataclassification-telemetryscope-string-string-string-string-method.md)  
