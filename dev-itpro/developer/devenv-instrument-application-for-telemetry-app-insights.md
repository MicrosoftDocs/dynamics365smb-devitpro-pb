---
title: Creating custom telemetry events for the Event Log
description: This topic describes how to add code to application objects that enables you to gather telemetry.
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---
# Creating custom telemetry events for Application Insights

[!INCLUDE[2020_releasewave2](../includes/2020_releasewave2.md)]

This article explains how to create custom telemetry trace events in AL code that will be sent to Application Insights. 

## Overview



## Create custom telemetry events

To create a custom telemetry event, you use a LOGMESSAGE method in code where you want to trigger the event. There are two variations of the LOGMESSAGE method. The difference is that one method uses a dictionary object to define custom dimensions for the trace event. The other method includes two overloads so you don't have to construct a dictionary. You can use these methods in any object, trigger, or method. The methods have the following signatures:  

With dictionary:
```
Session.LogMessage(EventId: String, Message: String, Verbosity: Verbosity, DataClassification: DataClassification, TelemetryScope: TelemetryScope, CustomDimensions: Dictionary of [Text, Text])
```

With dimension overloads:

```
Session.LogMessage(EventId: String, Message: String, Verbosity: Verbosity, DataClassification: DataClassification, TelemetryScope: TelemetryScope, Dimension1: String, Value1: String [, Dimension2: String] [, Value2: String])
```

Use the parameters to build the dimensions, or columns, that will show for the event trace in Application Insights. `Message` and `Verbosity` will appear as general dimensions. All other parameters appear as custom dimensions. 

|Parameter|Description|Dimension|
|---------|-----------|---------------------------------|
|EventID|A text string that assigns an identifier to the telemetry trace event. The tag can consist of letters, numbers, and special characters. Try to make your tags unique from these telemetry event tags by, for example, using at least 8 characters or a prefix, like Cronus-0001 and Cronus-0002.|eventId|
|Message|A text string that specifies the descriptive message for the telemetry trace event.|message|
|Verbosity|An enumeration that specifies the severity level of the telemetry trace event. The value can be `Critical`, `Error`, `Warning`, `Normal`, or `Verbose`. |severityLevel<br /><br />`4`=`Critical`<br />`3`=`Error`<br />`2`=`Warning`<br />`1`=`Normal` <br />`0`=`Verbose`<br />For [!INCLUDE[prodshort](../includes/prodshort.md)] on-premises, the **Diagnostic Trace Level** setting on the [!INCLUDE[server](includes/server.md)] instance control severity levels are sent.|
|DataClassification|A DataClassification data type that assigns a classification to the telemetry trace event. For more information, see [Data Classifications](devenv-classifying-data.md#DataClassifications).|
|TelemetryScope|Scope of emitting the telemetry. There are two values: `all` and  |
|CustomDimensions|A dictionary of text that defines the custom dimensions for the trace event in Application Insights.|
|Dimension1|The name of the custom dimension.|
|Value1|The value of Dimension1.|
|Dimension2|The name of the custom dimension.|
|Value2|The value of Dimension2.|

The following code snippets creates simple telemetry trace events for critical-level telemetry event that is scoped to the event publisher. For a simple test of this code, add it to the `OnRun` trigger of a codeunit, and then run the codeunit. Of course, you can also call the code from other objects, triggers or function.

**Using a dictionary:**
```
trigger OnRun();
var
    CustDimension: Dictionary of [Text, Text];
begin
    CustDimension.Add('result', 'failed');
    CustDimension.Add('reason', 'error in code');
    LogMessage('MyExt-0002', 'This is an informational message', Verbosity::Normal, DATACLASSIFICATION::OrganizationIdentifiableInformation, TelemetryScope::ExtensionPublisher, CustDimension);

end;
```

**Using an overload:**

```
trigger OnRun();
var
    CustDimension: Dictionary of [Text, Text];
begin
    LogMessage('MyExt-0001', 'This is an critical message', Verbosity::Critical, DATACLASSIFICATION::CustomerContent, TelemetryScope::ExtensionPublisher, 'result', 'failed', 'reason', 'critical error in code');
end;

``` 
<!--
```  
LogMessage('MyExt-0001', 'This is an critical message', Verbosity::Critical, DATACLASSIFICATION::CustomerContent, TelemetryScope::ExtensionPublisher, 'result', 'failed', 'reason', 'critical error in code');
LogMessage('MyExt-0002', 'This is an error message', Verbosity::Error, DATACLASSIFICATION::EndUserIdentifiableInformation, TelemetryScope::ExtensionPublisher, 'result', 'failed', 'reason', 'error in code');
LogMessage('MyExt-0003', 'This is an warning message', Verbosity::Warning, DATACLASSIFICATION::AccountData, TelemetryScope::ExtensionPublisher, 'result', 'succeeded', 'reason', 'warning in code');
LogMessage('MyExt-0004', 'This is an informational message', Verbosity::Normal, DATACLASSIFICATION::OrganizationIdentifiableInformation, TelemetryScope::ExtensionPublisher, 'result', 'succeeded');
LogMessage('MyExt-0005', 'This is an verbose message', Verbosity::Verbose, DATACLASSIFICATION::SystemMetadata, TelemetryScope::ExtensionPublisher, 'result', 'succeeded');
``` 
-->

s as well.

## See Also

[Instrumenting an Application for Telemetry](devenv-instrument-application-for-telemetry.md)  
[LOGMESSAGE method](methods-auto/session/session-logmessage-string-string-verbosity-dataclassification-telemetryscope-dictionary[text,text]-method.md)  
[LOGMESSAGE method](methods-auto/session/session-logmessage-string-string-verbosity-dataclassification-telemetryscope-string-string-string-string-method.md)  
