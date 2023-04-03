---
title:  Analyzing client action telemetry
description: Learn about the telemetry from client action in Business Central  
author: jswymer
ms.topic: conceptual
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 03/07/2023
ms.author: kepontop
---
# Analyzing client action telemetry

**INTRODUCED IN:** [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2023 release wave 1, version 22.0. 

Client action telemetry gathers data about actions that users select on pages in the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] client. Each action event tells you the type of action, on which page it was triggered, information about the user's environment, and more.

Use the data to gather statistics about usage of client features by users.


## Client action invoked

Occurs when an action on a page in the client was invoked.  

### General dimensions

The pageViews table is a built-in table in Application Insights. Here are some of the fields most used in analysis of the signal:

|Field|Description or value|
|---------|-----|
|message|**Client action invoked: {Action}**|


### Custom dimensions

|Dimension|Description or value|
|---------|-----|
|aadTenantId|[!INCLUDE[aadTenantId](../includes/include-telemetry-dimension-aadtenantid.md)]|
|alObjectId|[!INCLUDE[objectId](../includes/include-telemetry-dimension-page-object-id.md)]|
|alObjectName|[!INCLUDE[objectName](../includes/include-telemetry-dimension-page-object-name.md)]|
|alObjectType|**Page**|
|appId|[!INCLUDE[appId](../includes/include-telemetry-dimension-page-app-id.md)]|
|appName|[!INCLUDE[appName](../includes/include-telemetry-dimension-page-app-name.md)]|
|appPublisher|[!INCLUDE[appPublisher](../includes/include-telemetry-dimension-page-app-publisher.md)]|
|appVersion|[!INCLUDE[appVersion](../includes/include-telemetry-dimension-page-app-version.md)]|
|clientAction|Specifies the type of action that was invoked in the client such as **UI.AnalysisMode.Disabled** or **UI.AnalysisMode.Enabled**. |
|clientType| [!INCLUDE[clientType](../includes/include-telemetry-dimension-client-type.md)] |
|companyName|[!INCLUDE[companyName](../includes/include-telemetry-dimension-company-name.md)]|
|environmentName|[!INCLUDE[environmentName](../includes/include-telemetry-dimension-environment-name.md)]|
|environmentType|[!INCLUDE[environmentType](../includes/include-telemetry-dimension-environment-type.md)]|
|eventId|**CL0003** |


## See also

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Enable Sending Telemetry to Application Insights](telemetry-enable-application-insights.md)  
