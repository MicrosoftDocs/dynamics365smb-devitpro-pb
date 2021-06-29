---
title: Developing telemetry into your Business Central application
description: This topic desscribes how to add code to application objects that enables you to gather telemetry.
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: jswymer
---
# Instrumenting an Application for Telemetry

This article describes how you can implement custom telemetry signals in your application for emitting telemetry data.. This data can then be collected and visualized for analyzing the application against the desired business goals, troubleshooting, and more.

## Telemetry overview

One aspect of event logging is collecting data about how the application and your deployment infrastructure is working in order to diagnose conditions and troubleshoot problems that affect operation and performance. For example, this type of event logging includes [!INCLUDE[server](includes/server.md)] events and trace events like SQL and AL method (function) traces.

Another aspect of logging is *telemetry*, which is collecting data about how your application functions and how it is being used in production. Telemetry can tell you about specific activities that users perform within the application in the production environment. Telemetry is also a useful tool for troubleshooting, especially instances where you are not able to reproduce the conditions experienced by the user or have no access to the user's environment. Telemetry can be divided into different levels or categories, like: telemetry for engineering, telemetry about the business, telemetry for customers.

## Creating custom telemetry signal

There are two different resources where telemetry trace signals can be sent for monitoring and analyzing: Event Log and Microsoft Azure Application Insights. By default, the [!INCLUDE[prod_short](includes/prod_short.md)] application is instrumented to emit several system telemetry trace signals to these destinations. Custom telemetry trace signals enable you to send telemetry data from anywhere in the application code to either of these destinations.

The procedure for creating custom telemetry signals is different for each resource. Your choice might also depend on whether you are developing for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online or on-premises.

|Reource|Description|Online|On-premises|More information|
|-----------|-----------|------|-----------|----------------|
|Application Insights|Create custom telemetry signals that are sent to an Application Insights resource in Azure. [Application Insights](/azure/azure-monitor/app/app-insights-overview) is a service hosted within Azure that gathers telemetry data for analysis and presentation. <br /><br />Extension developers can specify whether the signal is only sent to the extension publisher or also to the VAR partner telemetry resource.<br /><br />You create these custom trace signals by using the LOGMESSAGE method in code.|![check mark for feature](media/check.png)|![check mark for feature](media/check.png)|[See...](devenv-instrument-application-for-telemetry-app-insights.md)|
|Event Log| Create custom telemetry trace signals that are sent to the Event Log of the [!INCLUDE[server](includes/server.md)] machine. You create these custom trace signals by using the [SENDTRACETAG method](methods-auto/session/session-sendtracetag-method.md) in code.||![check mark for feature](media/check.png)|[See...](devenv-instrument-application-for-telemetry-event-log.md)|

> [!NOTE]
> Using Application Insights is recommended. 

## See Also

[Monitoring and Analyzing Telemetry](../administration/telemetry-overview.md)  
[Monitoring Business Central Server Events](../administration/monitor-server-events.md)  
