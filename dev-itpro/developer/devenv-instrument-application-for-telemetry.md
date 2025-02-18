---
title: Developing telemetry into your Business Central application
description: This article describes how to add code to application objects that enables you to gather telemetry.
ms.date: 02/09/2024
ms.reviewer: solsen
ms.topic: conceptual
author: jswymer
---

# Instrumenting an application with telemetry

This article describes how you can implement telemetry signals in your application for emitting telemetry data. This data can then be collected and visualized for analyzing the application against the desired business goals, troubleshooting, and more.

## Event logging vs. Telemetry

One aspect of *event logging* is the data collection about the working and deployment infrastructure of an application to diagnose conditions and troubleshoot problems that affect its operation and performance. For example, this type of event logging includes [!INCLUDE[server](includes/server.md)] events and events from SQL Server. For on-premises installations, the Windows event log has traditionally been the place where such data was logged and analyzed.

A newer aspect of logging is *telemetry*, which is the collection of data about how your application works in production. Telemetry can tell you about specific activities that users perform within the application in the production environment. Telemetry also helps troubleshooting in those situations where you aren't able to reproduce the conditions experienced by the user or have no access to the user's environment. Telemetry can be divided into different categories, like: telemetry for usage, telemetry for errors, telemetry for performance, and telemetry for lifecycle events.

## Resources where telemetry can be logged

There are two different resources where log data can be sent for monitoring and analyzing: 
- Event Log (only for on-premises), and
- Microsoft [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] (both for on-premises and for online). 

By default, the [!INCLUDE[prod_short](includes/prod_short.md)] server and application is instrumented to emit several system telemetry events to these destinations. Custom telemetry events enable you to send telemetry data from anywhere in the application code to either of these destinations.

The procedure for creating custom telemetry signals is different for each type of resource. Your choice might also depend on whether you're developing for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online or on-premises.

|Resource|Description|Online|On-premises|More information|
|-----------|-----------|------|-----------|----------------|
|[!INCLUDE[appinsights](../includes/azure-appinsights-name.md)]|Create custom telemetry signals that are sent to an Application Insights resource in Azure. [Application Insights](/azure/azure-monitor/app/app-insights-overview) is a service hosted within Azure that gathers telemetry data for analysis and presentation. <br /><br />Extension developers can specify whether the signal is only sent to the extension publisher or also to the VAR partner telemetry resource.<br /><br />You create these custom trace signals by using the LOGMESSAGE method in the code.|![check mark for feature.](media/check.png)|![check mark for feature](media/check.png)|[See...](devenv-instrument-application-for-telemetry-app-insights.md)|
|Event Log| Create custom telemetry trace signals that are sent to the Event Log of the [!INCLUDE[server](includes/server.md)] machine. You create these custom trace signals by using the [SendTraceTag method](methods-auto/session/session-sendtracetag-method.md) in the code.||![check mark for feature.](media/check.png)|[See...](devenv-instrument-application-for-telemetry-event-log.md)|

> [!NOTE]
> Using [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] is recommended. 

## Using telemetry in your apps/extensions

The articles in this section describe the key concepts and techniques for using telemetry in your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] apps/extensions.

|To|See|  
|--------|---------|  
| Learn how to enable telemetry in your app/extension. | [Setting up Telemetry in an App/Extension](devenv-application-insights-for-extensions.md) |  
|Learn how to administer [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)], how to analyze telemetry data with Power BI or KQL, and how to set up alerts on telemetry events from your app/extension. | [Monitoring and Analyzing Telemetry](../administration/telemetry-overview.md) |
|Learn about what data is logged out of the box to [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] from your app/extension. | [Data logged to app/extension telemetry](devenv-application-insights-for-extensions-data.md) |
|Learn about what privacy of out of the box telemetry data| [FAQ: What about privacy laws and regulations (for telemetry)?](../administration/telemetry-faq.md#what-about-privacy-laws-and-regulations) |
| Learn how to use the feature usage system module in your app/extension. | [Using Feature telemetry](../administration/telemetry-feature-telemetry.md) |
|Learn how to send custom telemetry events from your app/extension. | [Creating custom telemetry events](devenv-instrument-application-for-telemetry-app-insights.md) |  
|Learn how to send custom events from your app/extension to the Windows event log (on-premises only). | [Creating custom events for Windows event log (on-premises only)](devenv-instrument-application-for-telemetry-event-log.md) |


## Related information

[Telemetry FAQ](../administration/telemetry-faq.md)  
[Monitoring and Analyzing Telemetry](../administration/telemetry-overview.md)  
[Monitoring Business Central Server Events](../administration/monitor-server-events.md)  
