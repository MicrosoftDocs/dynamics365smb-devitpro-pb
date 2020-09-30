---
title: Creating custom telemetry signals for Application Insights
description: This article describes how to add code to application objects that enables you to gather telemetry.
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---
# Creating Custom Telemetry Traces for Application Insights Monitoring

[!INCLUDE[2020_releasewave2](../includes/2020_releasewave2.md)]

This article explains how to develop extensions to send custom telemetry trace signals to Azure Application Insights for viewing and analyzing.

You can add AL code in extensions to emit messages about activities or operations that users do within the application. At runtime, the messages can be picked up by an Application Insights resource, which you set up in beforehand. In Application Insights, the custom telemetry events are stored in the *traces* table.   

## Set up Application Insights 

An Application Insights resource can be configured in two places:

- In the app.json file of the extension.

    For more information, see [Enabling Application Insight on an Extension](devenv-application-insights-for-extensions.md).

- In the tenant on the [!INCLUDE[server](includes/server.md)] service/server.

    For more information, see [Enabling Application Insights](../administration/telemetry-overview.md#enable).

When you create a custom telemetry trace signal, you can specify a telemetry scope. The telemetry scope enables you to send an signal only to the Application Insights resource specified in the extension's app.json. Or to all available resources.

> [!NOTE]
> Having Application Insights resources configured is not required to create custom signals in AL code. 

## Create a custom telemetry trace signal

To create a custom telemetry trace signal, use a LOGMESSAGE method in AL code where you want to trigger the signal. The LOGMESSAGE method defines the information that is sent to Application Insights for a specific operation or activity.

There are two variations of the LOGMESSAGE method. The difference is that one method uses a dictionary object to define custom dimensions for the trace signal. The other method includes two overloads so you don't have to construct a dictionary. You can use these methods in any object, trigger, or method. The methods have the following signatures:  

#### Using a dictionary

The LOGMESSAGE method for using a dictionary for dimensions has the following signature:

```
Session.LogMessage(EventId: String, Message: String, Verbosity: Verbosity, DataClassification: DataClassification, TelemetryScope: TelemetryScope, CustomDimensions: Dictionary of [Text, Text])
```

#### Using dimension overloads

The LOGMESSAGE method for using dimension overloads has the following signature:

```
Session.LogMessage(EventId: String, Message: String, Verbosity: Verbosity, DataClassification: DataClassification, TelemetryScope: TelemetryScope, Dimension1: String, Value1: String [, Dimension2: String] [, Value2: String])
```

#### Setting the parameters

Use the parameters to build the dimensions, or columns, that will show for the trace in Application Insights. `Message` and `Verbosity` will appear as general dimensions. All other parameters appear as custom dimensions. 

|Parameter|Description|Dimension|
|---------|-----------|---------------------------------|
|EventID|A text string that assigns an identifier to the telemetry trace signal. The tag can consist of letters, numbers, and special characters. Try to make your tags unique. For example, use at least 8 characters or a prefix, like Cronus-0001 and Cronus-0002.|eventId|
|Message|A text string that specifies the descriptive message for the telemetry trace signal.|message|
|Verbosity<sup>[*](#*)|An enumeration that specifies the severity level of the telemetry trace signal. The value can be `Critical`, `Error`, `Warning`, `Normal`, or `Verbose`. |severityLevel<br /><br />`4`=`Critical`<br />`3`=`Error`<br />`2`=`Warning`<br />`1`=`Normal` <br />`0`=`Verbose`<br />|
|DataClassification[*](#*)|A DataClassification data type that assigns a classification to the telemetry trace signal. For more information, see [Data Classifications](devenv-classifying-data.md#DataClassifications).|dataClassification|
|TelemetryScope|Scope of emitting the telemetry. <ul><li>`extensionpublisher` sends the custom signal only to the Application Insight resource specified in the extension's app.json file</li><li>`all` sends the custom signal to Application Insight resource specified in the extension's app.json file and on the tenant. </li></ul> |telemetryScope
|CustomDimensions|A dictionary of text that defines the custom dimensions for the trace signal in Application Insights.|
|Dimension1|A text string that specifies the name of the custom dimension.|
|Value1|A text string that specifies the value of Dimension1.|
|Dimension2|A text string that specifies the name of the custom dimension.|
|Value2|A text string that specifies the value of Dimension2.|

## Examples

The following code snippets create simple telemetry trace signals. They create a critical-level telemetry signal that is scoped to the signal publisher. For a simple test of this code, add it to the `OnRun` trigger of a codeunit, and then run the codeunit.

**Using a dictionary:**
```
trigger OnRun();
var
    CustDimension: Dictionary of [Text, Text];
begin
    CustDimension.Add('result', 'failed');
    CustDimension.Add('reason', 'critical error in code');
    LogMessage('MyExt-0001', 'This is an critical error message', Verbosity::Normal, DATACLASSIFICATION::SystemMetadata, TelemetryScope::ExtensionPublisher, CustDimension);
end;
```

**Using an overload:**

```
trigger OnRun();
begin
    LogMessage('MyExt-0001', 'This is an critical error message', Verbosity::Critical, DATACLASSIFICATION::SystemMetadata, TelemetryScope::ExtensionPublisher, 'result', 'failed', 'reason', 'critical error in code');
end;
```

## <a name="*"></a>Design considerations

- For [!INCLUDE[prodshort](../includes/prodshort.md)] on-premises, the **Diagnostic Trace Level** setting on the [!INCLUDE[server](includes/server.md)] instance controls which signals are sent, based on their severity level.

    If the **Diagnostic Trace Level** is set to **Warning** for example, then **Normal** and **Verbose** signals won't be sent to Application Insights. For more information, see [Configuring Business Central Server - General](../administration/configure-server-instance.md#General).

- For privacy reasons, events that have a `DataClassification` other than `SystemMetadata` aren't sent to Application Insight resources set up on the tenant. During development of your extension, it's good practice to have a privacy review of the use of LOGMESSAGE calls to ensure that customer data isn't mistakenly leaked into Application Insights resources. 

<!--
```  
LogMessage('MyExt-0001', 'This is an critical message', Verbosity::Critical, DATACLASSIFICATION::CustomerContent, TelemetryScope::ExtensionPublisher, 'result', 'failed', 'reason', 'critical error in code');
LogMessage('MyExt-0002', 'This is an error message', Verbosity::Error, DATACLASSIFICATION::EndUserIdentifiableInformation, TelemetryScope::ExtensionPublisher, 'result', 'failed', 'reason', 'error in code');
LogMessage('MyExt-0003', 'This is an warning message', Verbosity::Warning, DATACLASSIFICATION::AccountData, TelemetryScope::ExtensionPublisher, 'result', 'succeeded', 'reason', 'warning in code');
LogMessage('MyExt-0004', 'This is an informational message', Verbosity::Normal, DATACLASSIFICATION::OrganizationIdentifiableInformation, TelemetryScope::ExtensionPublisher, 'result', 'succeeded');
LogMessage('MyExt-0005', 'This is an verbose message', Verbosity::Verbose, DATACLASSIFICATION::SystemMetadata, TelemetryScope::ExtensionPublisher, 'result', 'succeeded');
``` 
-->

## See Also

[Instrumenting an Application for Telemetry](devenv-instrument-application-for-telemetry.md)  
[LOGMESSAGE method](methods-auto/session/session-logmessage-string-string-verbosity-dataclassification-telemetryscope-dictionary[text,text]-method.md)  
[LOGMESSAGE method](methods-auto/session/session-logmessage-string-string-verbosity-dataclassification-telemetryscope-string-string-string-string-method.md)  
[Monitoring and Analyzing Telemetry](../administration/telemetry-overview.md)  
