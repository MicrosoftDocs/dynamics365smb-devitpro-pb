---
title: Creating Custom Telemetry Events for the Event Log
description: Create custom telemetry events with SendTraceTag in Business Central on-premises, view them in Windows event logs, and control logging severity.
ms.date: 11/17/2026
ms.topic: concept-article
author: jswymer
ai-usage: ai-assisted
---
# Creating custom telemetry events for event log monitoring

[!INCLUDE[on_prem_only_v2](includes/on_prem_only_v2.md)].

This article explains how to create custom telemetry trace events in AL code that will be sent to the Event Log of the [!INCLUDE[server](includes/server.md)] machine.

> [!NOTE]
> The `SendTraceTag` method is marked as obsolete in [!INCLUDE[prod_short](includes/prod_short.md)] 2020 release wave 2 (v17). You can still use it, but we recommend that you send traces to Application Insights using the `LogMessage` method instead. Learn more in [Creating Custom Telemetry Traces for Application Insights Monitoring](devenv-instrument-application-for-telemetry-app-insights.md).

## Create custom telemetry events

To create a custom telemetry event, you use the [SendTraceTag method](methods-auto/session/session-sendtracetag-method.md) in code. You can use the `SendTraceTag` method in any object, trigger, or method. The `SendTraceTag` method has the following syntax:

```AL  
SENDTRACETAG(Tag, Category, Verbosity, Message[, DataClassification])  
```  

You use the parameters to define the information about the telemetry trace event. This information can be consumed by event logging tools and presented in different ways.

|Parameter|Description|
|---------|-----------|
|Tag|A text string that assigns an identifier to the telemetry trace event. The tag can consist of letters, numbers, and special characters. [!INCLUDE[prod_short](includes/prod_short.md)] system telemetry events use an auto-generated, auto-incremented, 7-character tag that includes numbers and letters, such as 000002Q and 000013P. Try to make your tags unique from these telemetry event tags by, for example, using at least 8 characters or a prefix, like Cronus-0001 and Cronus-0002.  |
|Category|A text string that assigns the telemetry trace event to a category that you define. For example, you could have a category for upgrading, user activity, or reporting.|
|Verbosity|An enumeration that specifies the severity level of the telemetry trace event. The value can be Critical, Error, Warning, Normal, or Verbose. This severity level can be used by [!INCLUDE[server](includes/server.md)] to filter out lower-level telemetry trace events from being emitted. See [Viewing and collecting telemetry data](#ViewTelemetry). |
|Message|A text string that specifies the descriptive message for the telemetry trace event.|
|DataClassification|A DataClassification data type that assigns a classification to the telemetry trace event. Learn more in the [Business Central developer documentation](/dynamics365/business-central/dev-itpro/developer).|

For example, the following code creates simple telemetry trace events for the five different severity levels. 

```AL 
SENDTRACETAG('Cronus-0001', 'Action', VERBOSITY::Critical, 'This is a critical message.', DATACLASSIFICATION::CustomerContent);
SENDTRACETAG('Cronus-0002', 'Action', VERBOSITY::Error, 'This is an error message.',  DATACLASSIFICATION::EndUserIdentifiableInformation);
SENDTRACETAG('Cronus-0003', 'Action', VERBOSITY::Warning, 'This is a warning message.', DATACLASSIFICATION::AccountData);
SENDTRACETAG('Cronus-0004', 'Action', VERBOSITY::Normal, 'This is an informational message.', DATACLASSIFICATION::OrganizationIdentifiableInformation);
SENDTRACETAG('Cronus-0005', 'Action', VERBOSITY::Verbose, 'This is a verbose message.', DATACLASSIFICATION::SystemMetadata);
```  

For a simple test of this code, add it to the `OnRun` trigger of a codeunit, and then run the codeunit. Of course, you can also call the code from other objects, triggers or functions as well.

## <a name="ViewTelemetry"></a>View and collect telemetry data

Viewing and collecting telemetry data is done the same way as with other trace events emitted by [!INCLUDE[prod_short](includes/prod_short.md)], for example, by using tools like Event Viewer, Performance Monitor, PerfView, or logman.

-   In Event Viewer, telemetry trace events can be viewed from **Applications and Services Logs** > **Microsoft** > **DynamicsNAV** > **Common**. The **Admin** log records events with severity levels of Warning, Error, and Critical. Normal and Verbose events use the **Debug** log, which must be enabled to view them. The `TraceLevel` setting must also allow the event's severity.

    Learn more in [Monitoring Business Central Server Events Using Event Viewer](../administration/monitor-server-events-windows-event-log.md).

-   With other tools like Performance Monitor, PerfView, and logman, you can collect telemetry data by using **Microsoft-DynamicsNAV-Common** as the event trace provider.

    Learn more in [Get Started Monitoring Events](../administration/monitor-server-events.md#GetStartedEvents).

> [!IMPORTANT]  
>  The [!INCLUDE[server](includes/server.md)] instance includes a configuration setting called `TraceLevel` in the customsettings.config file. Use this setting to specify the lowest severity level of telemetry events to record in the event log, or to turn off telemetry event logging altogether. If you don't see the expected events, verify the [!INCLUDE[server](includes/server.md)] instance configuration with an administrator. Learn more in [Configuring Business Central Server](../administration/configure-server-instance.md). 

## Related information

[Instrumenting an Application for Telemetry](devenv-instrument-application-for-telemetry.md)  
[Monitoring and Analyzing Telemetry](../administration/telemetry-overview.md)  
[Monitoring Business Central Server Events](../administration/monitor-server-events.md)  
