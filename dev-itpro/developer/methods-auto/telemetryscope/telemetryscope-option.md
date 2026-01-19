---
title: "TelemetryScope system option"
description: "Represents the emission scope of the telemetry signal."
ms.author: solsen
ms.date: 08/08/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# TelemetryScope option type
> **Version**: _Available or changed with runtime version 5.4._

Represents the emission scope of the telemetry signal.

## Members
|  Member  |  Description  |
|----------------|---------------|
|ExtensionPublisher|Emit telemetry to extensions publisher's account.|
|All|Emit telemetry to extension publisher's and partner's telemetry account .|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Examples

The following code example emits telemetry only to the extension publisher's Application Insights account. The extension publisher configures their Application Insights connection string in the extension's app.json file. Learn more in [Setting up telemetry in an app/extension](../../devenv-application-insights-for-extensions.md).

```al
Session.LogMessage('0000ABC', 'Order processed successfully', Verbosity::Normal, DataClassification::SystemMetadata, TelemetryScope::ExtensionPublisher, 'OrderProcessing');
```

The following code example emits telemetry to both extension publisher's and partner's Application Insights accounts. The partner configures their Application Insights connection string in the Business Central admin center. Learn more in [Turn environment telemetry on or off](../../../administration/telemetry-enable-application-insights.md).

```al
Session.LogMessage('0000DEF', 'Critical inventory level reached', Verbosity::Warning, DataClassification::SystemMetadata, TelemetryScope::All, 'InventoryManagement');
```

## Related information

[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
[Session.LogMessage(Text, Text, Verbosity, DataClassification, TelemetryScope, Dictionary of [Text, Text]) Method](../session/session-logmessage-string-string-verbosity-dataclassification-telemetryscope-dictionary[text,text]-method.md)  