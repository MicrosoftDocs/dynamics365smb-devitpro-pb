---
title:  Analyzing client control add-in exception telemetry
description: Learn about the telemetry from client add-in exceptions in Business Central  
author: kennieNP
ms.topic: conceptual
ms.devlang: al
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 03/07/2025
ms.author: kepontop
ms.reviewer: jswymer
---
# Analyzing client control add-in exception telemetry

[!INCLUDE[prod_short](../developer/includes/introduced_in_2025rw1.md)]

Client control add-in exception telemetry gathers data about exceptions thrown in control add-ins. Each event tells you the type of exception, in which add-in it was triggered, information about the user's environment, and more.

Use the data to gather statistics about exceptions in control add-ins for troubleshooting and error mitigation.

> [!NOTE]
> In [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)], telemetry about client add-in exceptions is logged to the **exceptions** table and not the **traces** table like other [!INCLUDE[prod_short](../developer/includes/prod_short.md)] traces. This also means that you can use the built-in pages in the **Failures** page of the [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] for troubleshooting. For more information, see [Failures and Performance views](/azure/azure-monitor/app/failures-and-performance-views?tabs=failures-view).


## Exception raised inside a control add-in

Occurs when an exception was raised inside a control add-in.

### General dimensions

The exceptions table is a built-in table in [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)]. Here are some of the fields most used in analysis of the signal:

|Field|Description or value|
|---------|-----|
|user_Id|[!INCLUDE[user_Id](../includes/include-telemetry-user-id.md)] |


### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|alObjectId|[!INCLUDE[objectId](../includes/include-telemetry-dimension-page-object-id.md)]|
|alObjectName|[!INCLUDE[objectName](../includes/include-telemetry-dimension-page-object-name.md)]|
|appId|[!INCLUDE[appId](../includes/include-telemetry-dimension-page-app-id.md)]|
|appName|[!INCLUDE[appName](../includes/include-telemetry-dimension-page-app-name.md)]|
|appPublisher|[!INCLUDE[appPublisher](../includes/include-telemetry-dimension-page-app-publisher.md)]|
|appVersion|[!INCLUDE[appVersion](../includes/include-telemetry-dimension-page-app-version.md)]|
|clientType| [!INCLUDE[clientType](../includes/include-telemetry-dimension-client-type.md)] |
|companyName|[!INCLUDE[companyName](../includes/include-telemetry-dimension-company-name.md)]|
|controlAddInName| The name of the control add-in from which the exception was thrown. |
|deviceScreenResolution| [!INCLUDE[deviceScreenResolution](../includes/include-telemetry-dimension-device-screen-resolution.md)] |
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|eventId|**CL0005** |
|hostType| [!INCLUDE[hostType](../includes/include-telemetry-dimension-host-type.md)]|


All error information is stored in the following properties. 

|Property|Description or value|
|---------|-----|
| problemId | The problem ID identifies where the exception was thrown in code. It's used for exceptions grouping. Typically, it's a combination of an exception type and a function from the call stack. |
| type | The type of the error that occurred. |
| assembly| The web assembly where the error occurred. |
| method| The JavaScript method where error occurred. |
| outerType | The top level error type on the stack trace. |
| outerMessage | The top level error message on the stack trace. |
| outerAssembly | The top level assembly on the stack trace. |
| outerMethod | The top level method on the stack trace. |
| innermostType | The inner most error type on the stack trace. |
| innermostMessage | The inner most error message on the stack trace. |
| innermostAssembly | The inner most assembly on the stack trace. |
| innermostMethod | The inner most method on the stack trace. |
| details | JSON structure with more information, such as stack traces. |


## Sample KQL code (client add-in exceptions)

This KQL code can help you get started analyzing client add-in exceptions:

```kql
exceptions 
| where timestamp > ago(60d) // adjust as needed
| where customDimensions.eventId == 'CL0005' 
| order by timestamp desc 
| take 5
| project timestamp
// in which environment/company did it happen
, aadTenantId = customDimensions.aadTenantId 
, environmentName = customDimensions.environmentName 
, environmentType = customDimensions.environmentType
, companyName = customDimensions.companyName
// in which extension/app
, appId = customDimensions.appId
, appName = customDimensions.appName
, appPublisher = customDimensions.appPublisher
, appVersion = customDimensions.appVersion
// in which object
, alObjectId = customDimensions.alObjectId 
, alObjectName = customDimensions.alObjectName
, alObjectType = customDimensions.alObjectType
// which add-in
, controlAddInName = customDimensions.controlAddInName
// which client (browser, tablet, phone, ...)
, clientType = customDimensions.clientType
, hostType = customDimensions.hostType
// device info
, deviceScreenResolution = customDimensions.screenRes
, hostType = customDimensions.hostType
// error information
, problemId 
, type
, assembly
, method
, outerType 
, outerMessage 
, outerAssembly 
, outerMethod 
, innermostType 
, innermostMessage 
, innermostAssembly 
, innermostMethod 
, details // json structure with more information, such as stack traces
// which user got the error
, usertelemetryId = user_Id 
```

## Related information

[Control add-in object](../developer/devenv-control-addin-object.md)  
[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  