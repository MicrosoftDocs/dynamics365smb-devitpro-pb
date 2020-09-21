---
title: "LogMessage Method"
description: Describes the LogMessage method in Business Central
ms.author: solsen
ms.custom: na
ms.date: 06/18/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# LogMessage Method
Log a message to a telemetry account.


## Syntax
```
 Session.LogMessage(EventId: String, Message: String, Verbosity: Verbosity, DataClassification: DataClassification, TelemetryScope: TelemetryScope, Dimension1: String, Value1: String [, Dimension2: String] [, Value2: String])
```
> [!NOTE]  
> This method can be invoked without specifying the data type name.  
## Parameters
*EventId*  
&emsp;Type: [String](../string/string-data-type.md)  
The event ID.   
*Message*  
&emsp;Type: [String](../string/string-data-type.md)  
The message logged into telemetry.   
*Verbosity*  
&emsp;Type: [Verbosity](../verbosity/verbosity-option.md)  
The verbosity of the log.   
*DataClassification*  
&emsp;Type: [DataClassification](../dataclassification/dataclassification-option.md)  
Classification of data in message.   
*TelemetryScope*  
&emsp;Type: [TelemetryScope](../telemetryscope/telemetryscope-option.md)  
Scope of emitting the telemetry.   
*Dimension1*  
&emsp;Type: [String](../string/string-data-type.md)  
Custom dimension key.   
*Value1*  
&emsp;Type: [String](../string/string-data-type.md)  
Custom dimension value.   
*Dimension2*  
&emsp;Type: [String](../string/string-data-type.md)  
Custom dimension key.   
*Value2*  
&emsp;Type: [String](../string/string-data-type.md)  
Custom dimension value.   



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

For more information about using this method, see [Creating Custom Telemetry Events for Application Insights](../../devenv-instrument-application-for-telemetry-app-insights.md).

## Example

```
trigger OnRun();
begin
    LogMessage('MyExt-0001', 'This is an critical error message', Verbosity::Critical, DATACLASSIFICATION::CustomerContent, TelemetryScope::ExtensionPublisher, 'result', 'failed', 'reason', 'critical error in code');
end;
```
## See Also
[Session Data Type](session-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)