---
title: "Session.SendTraceTag Method"
description: "Send a trace tag to the telemetry service."
ms.author: solsen
ms.custom: na
ms.date: 06/23/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Session.SendTraceTag Method
> **Version**: _Available or changed with runtime version 1.0 until version 6.0 where it was deprecated for the following reason: "Use LogMessage instead."_

Send a trace tag to the telemetry service.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```AL
 Session.SendTraceTag(Tag: String, Category: String, Verbosity: Verbosity, Message: String [, DataClassification: DataClassification])
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*Tag*  
&emsp;Type: [String](../string/string-data-type.md)  
The tag.
        
*Category*  
&emsp;Type: [String](../string/string-data-type.md)  
The category.
        
*Verbosity*  
&emsp;Type: [Verbosity](../verbosity/verbosity-option.md)  
The verbosity.
        
*Message*  
&emsp;Type: [String](../string/string-data-type.md)  
The message.
        
*[Optional] DataClassification*  
&emsp;Type: [DataClassification](../dataclassification/dataclassification-option.md)  
Classification of data in message.   



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks 
You use the SendTraceTag method for instrumenting the application for telemetry. When the SendTraceTag method called, a telemetry trace event is emitted. The event can then be recorded in the Windows event log or collected by other event trace collection tools, like PerfView, Logman, and Performance Monitor. 

A telemetry event is given one of the following event IDs, depending on the `DataClassification`and `Verbosity`:

|  DataClassification |  Verbosity |  ID  |
|---------------------|------------|------|
|All except `CustomerContent` and `EndUserIdentifiableInformation`|Critical|700|
||Error|701|
||Informational|702|
||Verbose|704|
||Warning|705|
|`CustomerContent` or `EndUserIdentifiableInformation`|Critical|707|
||Error|708|
||Informational|709|
||Verbose|711 |
||Warning|712 |


<!-- For more information about instrumenting and monitoring telemetry, see [Instrumenting an Application for Telemetry](../../instrumenting-application-for-telemetry.md) and [Monitoring-Dynamics NAV Server Events](../../Monitoring-Microsoft-Dynamics-NAV-Server-Events.md). -->

> [!NOTE]
> The SendTraceTag method is marked as obsolete in [!INCLUDE[prod_short](../../includes/prod_short.md)] 2020 release wave 2 (v17). You can still use it, but we recommend that you send traces to Application Insights using the LOGMessage method instead. For more information, see [Creating Custom Telemetry Traces for Application Insights Monitoring](../../devenv-instrument-application-for-telemetry-app-insights.md).

## Example 
The following code defines simple telemetry events for the five different severity levels. 
```al
SendTraceTag('Cronus-0001', 'Action', Verbosity::Critical, 'This is a critical message.', DataClassification::CustomerContent);
SendTraceTag('Cronus-0002', 'Action', Verbosity::Error, 'This is an error message.',  DataClassification::EndUserIdentifiableInformation);
SendTraceTag('Cronus-0003', 'Action', Verbosity::Warning, 'This is a warning message.', DataClassification::AccountData);
SendTraceTag('Cronus-0004', 'Action', Verbosity::Normal, 'This is an informational message.', DataClassification::OrganizationIdentifiableInformation);
SendTraceTag('Cronus-0005', 'Action', Verbosity::Verbose, 'This is a verbose message.', DataClassification::SystemMetadata);
```  

The events emitted by this code will have the events IDs (listed in the order that the are called): 707, 708, 705, 702, and 704.


## See Also
[Session Data Type](session-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)