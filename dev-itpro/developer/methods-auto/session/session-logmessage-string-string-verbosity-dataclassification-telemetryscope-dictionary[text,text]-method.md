---
title: "Session.LogMessage Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
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
# Session.LogMessage Method
> **Version**: _Available from runtime version 5.4._

Logs a trace message to a telemetry account.


## Syntax
```
 Session.LogMessage(EventId: String, Message: String, Verbosity: Verbosity, DataClassification: DataClassification, TelemetryScope: TelemetryScope, CustomDimensions: Dictionary of [Text, Text])
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*EventId*  
&emsp;Type: [String](../string/string-data-type.md)  
The event ID of trace message.   
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
Specifies the scope of this trace message:
- ExtensionPublisher: Will emit this trace message to the Extension Publisher's telemetry account.
- All: Will emit this trace message additionally to the Partner's telemetry account.   
*CustomDimensions*  
&emsp;Type: [Dictionary of [Text, Text]](../dictionary/dictionary-data-type.md)  
Set of additional dimensions, specified as a dictionary, that will be emitted to the telemetry account and that can be used to specify filters in the query.   



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

For more information about using this method, see [Creating Custom Telemetry Events for Application Insights](../../devenv-instrument-application-for-telemetry-app-insights.md).

## Example

```
trigger OnRun();
var
    CustDimension: Dictionary of [Text, Text];
begin
    CustDimension.Add('result', 'failed');
    CustDimension.Add('reason', 'critical error in code');
    LogMessage('MyExt-0001', 'This is an critical error message', Verbosity::Normal, DATACLASSIFICATION::OrganizationIdentifiableInformation, TelemetryScope::ExtensionPublisher, CustDimension);
end;
```

## See Also
[Session Data Type](session-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)