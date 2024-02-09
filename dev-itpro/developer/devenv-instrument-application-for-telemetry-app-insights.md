---
title: Creating Custom Telemetry Events for Azure Application Insights
description: This article describes how to add code to application objects that enables you to log  telemetry.
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.topic: conceptual
author: jswymer
---
# Creating Custom Telemetry Events for Azure Application Insights

[!INCLUDE[2020_releasewave2](../includes/2020_releasewave2.md)]

[!INCLUDE[azure-ad-to-microsoft-entra-id](~/../shared-content/shared/azure-ad-to-microsoft-entra-id.md)]

This article explains how to develop extensions to send custom telemetry trace events to [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] for viewing and analyzing.

You can add AL code in extensions to emit messages about activities or operations that users do within the application. At runtime, the messages can be picked up by an [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] resource, which you set up beforehand. In [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)], the custom telemetry events are stored in the *traces* table.   

> [!TIP]
> Consider using the *Feature usage* module from the System Application for logging events from your extension instead of using raw Session.LogMessage calls as described in this article. For more information, see [Using Feature telemetry](../administration/telemetry-feature-telemetry.md).

## The Scope for extension telemetry

Telemetry for [!INCLUDE[prod_short](includes/prod_short.md)] can be defined in two places.

- In the app.json file of the extension.

    For more information, see [Setting up Telemetry in an App/Extension ](devenv-application-insights-for-extensions.md).

- In the [!INCLUDE[prod_short](includes/prod_short.md)] environment.

    For more information, see [Enabling Telemetry on Environments](../administration/telemetry-overview.md#enable).

When you create a custom telemetry trace signal, you can specify the *scope* of the event. The telemetry scope determines if the event is only sent to the [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] resource specified in the extension's app.json or if the event is also sent to the [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] resource of the environment where the extension is installed.

<!-- INCLUDE DIAGRAM HERE -->

> [!NOTE]
> Having [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] resources configured in your app.json is not required to define custom telemetry events in AL code. 


## Create a custom telemetry event

To create a custom telemetry event, use the LogMessage method in AL code where you want to trigger the signal. The LogMessage method defines the information that is sent to [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] for a specific operation or activity.

There are two variations of the LogMessage method. The difference is that one method uses a dictionary object to define custom dimensions for the trace signal. The other method includes two overloads so you don't have to construct a dictionary. You can use these methods in any object, trigger, or method. 

The methods have the following signatures:  

### Using a dictionary

The LogMessage method for using a dictionary for dimensions has the following signature:

```al
Session.LogMessage(EventId: String, Message: String, Verbosity: Verbosity, DataClassification: DataClassification, TelemetryScope: TelemetryScope, CustomDimensions: Dictionary of [Text, Text])
```

### Using dimension overloads

The LogMessage method for using dimension overloads has the following signature:

```al
Session.LogMessage(EventId: String, Message: String, Verbosity: Verbosity, DataClassification: DataClassification, TelemetryScope: TelemetryScope, Dimension1: String, Value1: String [, Dimension2: String] [, Value2: String])
```

### Setting the parameters

Use the parameters to build the dimensions, or columns, that will show for the trace in [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)]. `Message` and `Verbosity` will appear as general dimensions. All other parameters appear as custom dimensions. 

|Parameter|Description|Dimension|
|---------|-----------|---------------------------------|
|EventID|A text string that assigns an identifier to the telemetry trace signal. The tag can consist of letters, numbers, and special characters. Try to make your tags unique. For example, use at least 8 characters or a prefix, like Cronus-0001 and Cronus-0002.|eventId|
|Message|A text string that specifies the descriptive message for the telemetry trace signal.|message|
|Verbosity<sup>[*](#*)|An enumeration that specifies the severity level of the telemetry trace signal. The value can be `Critical`, `Error`, `Warning`, `Normal`, or `Verbose`. |severityLevel<br /><br />`4`=`Critical`<br />`3`=`Error`<br />`2`=`Warning`<br />`1`=`Normal` <br />`0`=`Verbose`<br />|
|DataClassification[*](#*)|A DataClassification data type that assigns a classification to the telemetry trace signal. For more information, see [Data Classifications](devenv-classifying-data.md#DataClassifications).|dataClassification|
|TelemetryScope|Scope of emitting the telemetry. <ul><li>`extensionpublisher` sends the custom signal only to the [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] resource specified in the extension's app.json file</li><li>`all` sends the custom signal to the [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] resource specified in the extension's app.json file and on the environment. </li></ul> |telemetryScope
|CustomDimensions|A dictionary of text that defines the custom dimensions for the trace signal in Application Insights. There are several CustomDimensions that will be included in traces by default. See [Default dimensions in CustomDimensions](#default-dimensions-in-customdimensions)|
|Dimension1|A text string that specifies the name of the custom dimension.|
|Value1|A text string that specifies the value of Dimension1.|
|Dimension2|A text string that specifies the name of the custom dimension.|
|Value2|A text string that specifies the value of Dimension2.|

[!INCLUDE[telemetry_dimension_naming](./includes/include-telemetry-dimension-naming.md)]

### Default dimensions in CustomDimensions

The following table explains the default dimensions that are automatically included in CustomDimensions for telemetry events sent from AL code.

<!--{"telemetrySchemaVersion":"1.2","componentVersion":"20.0.36722.0","environmentType":"Production","aadTenantId":"d88985a1-c863-442c-bb5f-dc622e480a8d","companyName":"CRONUS International Ltd.","component":"Dynamics 365 Business Central Server","eventId":"ALMyExt-0001","clientType":"WebClient","extensionName":"ALlogmessage","alCallerAppName":"Base Application","alObjectId":"50110","alDataClassification":"SystemMetadata","alCallerPublisher":"Microsoft","alresult":"failed","alObjectType":"PageExtension","alCallerAppVersion":"20.0.36796.0","extensionPublisher":"Default publisher","alObjectName":"CustomerListExt","extensionVersion":"1.0.0.0","extensionId":"f2ae006d-deef-4990-828e-4c76906e7171","alreason":"critical error in code"}
 -->
|Dimension|Description or value|
|---------|-----|
|aadTenantId|Specifies the Microsoft Entra tenant ID used for Microsoft Entra authentication. For on-premises, if you aren't using Microsoft Entra authentication, this value is **common**. |
|alCallerAppName|Specifies the name of the extension that emitted the telemetry signal to Application Insights. This is typically the base application.|
|alCallerAppPublishser|Specifies the publisher of the extension that emitted the telemetry signal to Application Insights. This is typically the publisher of the base application, which is `Microsoft`.|
|alCallerAppVersion|Specifies the version number of the extension that emitted the telemetry signal to Application Insights. This is typically the version of the base application.|
|alObjectId|Specifies the ID of the object that called the LOGMESSAGE method.|
|alObjectName|Specifies the name of the object that called the LOGMESSAGE method.|
|alObjectType|Specifies the type of the object that called the LOGMESSAGE method, like `PageExtension` for a page extension object. |
|clientType|Specifies the type of client that ran LOGMESSAGE method, such as **Background** or **Web**. For a list of the client types, see [ClientType Option Type](../developer/methods-auto/clienttype/clienttype-option.md).|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|companyName|Specifies the company in Business Central|
|component|**Dynamics 365 Business Central Server**.|
|componentVersion|Specifies the version number of the component that emits telemetry (see the component dimension.)|
|environmentName|Specifies the name of the tenant environment. See [Managing Environments](../administration/tenant-admin-center-environments.md).|
|environmentType|Specifies the environment type for the tenant, such as **Production**, **Sandbox**, **Trial**. See [Environment Types](../administration/tenant-admin-center-environments.md#types-of-environments)|
| extensionName|Specifies the name of the extension that called the LOGMESSAGE method.|
| extensionId|Specifies the ID of the extension that called the LOGMESSAGE method.|
| extensionPublisher|Specifies the publisher of the extension that called the LOGMESSAGE method.|
| extensionVersion|Specifies the version of the compiled extension.|
|deprecatedKeys|A comma-separated list of all the keys that have been deprecated. The keys in this list are still supported but will eventually be removed in the next major release. We recommend that update any queries that use these keys to use the new key name.|
|telemetrySchemaVersion|Specifies the version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry schema.|


## Best practices for designing telemetry for your app/extensions

When the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] product team designed the partner telemetry feature, we build the following characteristics into it: 
* Telemetry event definitions must treated as an API. Changing custom dimensions is a breaking change (someone might have built reporting or alerting on top of it).
* Telemetry events must be discoverable in docs. If you see someting in telemetry, it should be easy to learn more about it in documentation. We added the custom dimension eventId because of this. It is good practice to keep eventIds unique, also across apps/extensions. 
* Documented: each telemetry event has good documentation, preferably with guidance on how to react on this event.
* Actionable (if possible): before we add a new telemetry event, we ask "what can a customer/partner do with this?" If no good answers come to mind, we do not add the event. 

### Convention for Message column

Try to use the “Object ActionInPastTense” pattern for the Message part of a LogMessage call. This makes reading the output from a KQL query ordered by timestamp much easier.

Here are some examples from the built-in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry: 
- Web Service Called 
- Report cancelled: {report name name}
- Extension published: {Extension name}

Consider also adding some of the dimension values into the message itself. This makes it easier to browse the events by message column alone (no need to open up custom dimensions for every single event to see e.g. which page it was about). 

### Convention for eventId dimension

It is considered good practice to use unique eventID values for each LogMessage call in your code (also when you use the feature telemetry module from the System Application). When analyzing data from your telemetry, using unique eventIDs makes it very easy for you to identify where in the code the telemetry was emitted from.

Also, consider using a prefix unique to your app/extension. This will help consumers when your events are emitted to per-environment telemetry, where the environment admin might get telemetry data from multiple apps/extensions.


### Conventions for dimension names

When logging events to [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)], [!INCLUDE[prod_short](includes/prod_short.md)] server prefixes the name of custom dimension keys from AL with the string `al`. For example, if the dimension key you define in code is `Result`, then in the event logged in [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)], the key name appears as `alResult`. 

It is therefore considered good practice to use PascalCasing for your dimension key names. This way, your dimension key names in [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] will conform to the standard naming of dimension keys in [!INCLUDE[prod_short](includes/prod_short.md)] telemetry.

Also, do not use dimension key names with spaces in them. It makes KQL queries more difficult to write. 


## Examples

The following code snippets create simple telemetry events from AL. They create a critical-level telemetry signal that is scoped to the app/extension publisher. For a simple test of this code, add it to the `OnRun` trigger of a codeunit, and then run the codeunit.

**Using a dictionary:**
```AL
var
  CustDimension: Dictionary of [Text, Text];
begin
  CustDimension.Add('Result', 'failed');
  CustDimension.Add('Reason', 'critical error in code');
  LogMessage(
    'MyExt-0002', 
    'Critical error happened: MyExt module 1', 
    Verbosity::Normal, 
    DataClassification::SystemMetadata, 
    TelemetryScope::ExtensionPublisher, // this event will only go to app telemetry
    CustDimension
  );
end;
```

**Using an overload:**

```AL
begin
  LogMessage(
    'MyExt-0002', 
    'Critical error happened: MyExt module 2', 
    Verbosity::Critical, 
    DataClassification::SystemMetadata, 
    TelemetryScope::ExtensionPublisher, // this event will only go to app telemetry
    'Result', 'failed',     
    'Reason', 'critical error in code'
  );
end;
```

## <a name="*"></a>Conditions on when events are sent

### Using DataClassification for privacy 
For privacy reasons, events that have a `DataClassification` other than `SystemMetadata` aren't sent to [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)]. During development of your extension, it's good practice to have a privacy review of the use of LogMessage calls to ensure that customer data isn't mistakenly leaked into [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] resources. 

### Diagnostic Trace Level (on-premises only)
For [!INCLUDE[prod_short](../includes/prod_short.md)] on-premises, the **Diagnostic Trace Level** setting on the [!INCLUDE[server](includes/server.md)] instance controls which signals are sent, based on their severity level.

If the **Diagnostic Trace Level** is set to **Warning** for example, then **Normal** and **Verbose** signals won't be sent to Application Insights. For more information, see [Configuring Business Central Server - General](../administration/configure-server-instance.md#general-settings).


<!--
```  
LogMessage('MyExt-0001', 'This is a critical message', Verbosity::Critical, DATACLASSIFICATION::CustomerContent, TelemetryScope::ExtensionPublisher, 'result', 'failed', 'reason', 'critical error in code');
LogMessage('MyExt-0002', 'This is an error message', Verbosity::Error, DATACLASSIFICATION::EndUserIdentifiableInformation, TelemetryScope::ExtensionPublisher, 'result', 'failed', 'reason', 'error in code');
LogMessage('MyExt-0003', 'This is an warning message', Verbosity::Warning, DATACLASSIFICATION::AccountData, TelemetryScope::ExtensionPublisher, 'result', 'succeeded', 'reason', 'warning in code');
LogMessage('MyExt-0004', 'This is an informational message', Verbosity::Normal, DATACLASSIFICATION::OrganizationIdentifiableInformation, TelemetryScope::ExtensionPublisher, 'result', 'succeeded');
LogMessage('MyExt-0005', 'This is an verbose message', Verbosity::Verbose, DATACLASSIFICATION::SystemMetadata, TelemetryScope::ExtensionPublisher, 'result', 'succeeded');
``` 
-->

## See Also

[Using Feature telemetry](../administration/telemetry-feature-telemetry.md)
[LogMessage method](methods-auto/session/session-logmessage-string-string-verbosity-dataclassification-telemetryscope-dictionary[text,text]-method.md)  
[LogMessage method](methods-auto/session/session-logmessage-string-string-verbosity-dataclassification-telemetryscope-string-string-string-string-method.md)  
[Instrumenting an Application for Telemetry](devenv-instrument-application-for-telemetry.md)  
[Monitoring and Analyzing Telemetry](../administration/telemetry-overview.md)  


