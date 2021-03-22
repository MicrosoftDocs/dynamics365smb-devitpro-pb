---
title: "Monitoring Microsoft Dynamics 365 Business Central Server Events"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.assetid: d7d57a32-f65e-4b02-bed8-86f1dfbf2fa8
caps.latest.revision: 15
---
# Monitoring Business Central Server Events
You can monitor events on [!INCLUDE[server](../developer/includes/server.md)] to diagnose conditions and troubleshoot problems that affect operation and performance.  

## Event Logging Overview  
 [!INCLUDE[prod_short](../developer/includes/prod_short.md)] uses Event Tracing for Windows \(ETW\), which is a subsystem of Windows operating systems. ETW provides a tracing mechanism for events that are raised by an application or service. ETW enables you to use industry standard tools such as Windows Performance Monitor, PerfView, Event Viewer, and Windows PowerShell to dynamically collect data on trace events that occur on the [!INCLUDE[server](../developer/includes/server.md)].  

 Events that occur on [!INCLUDE[server](../developer/includes/server.md)] instances are recorded in Windows Event logs on the [!INCLUDE[server](../developer/includes/server.md)] computer. [!INCLUDE[prod_long](../developer/includes/prod_long.md)] uses channels on all events. Event channels provide a way to collect and view events from a specific provider, which in this case is [!INCLUDE[server](../developer/includes/server.md)], and group the events according to predefined types, such as admin, operational, and debug. For example, in Event Viewer, [!INCLUDE[server](../developer/includes/server.md)] instance events are collected in the Admin, Operational, and Debug channel logs for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] in the Applications and Services Logs.  

 For more general information about ETW and event channels, see [Event Tracing for Windows](https://go.microsoft.com/fwlink/?LinkID=313939) and [Event Logs and Channels in Windows Event Log](https://go.microsoft.com/fwlink/?LinkID=517298).  

## Monitoring Business Central Server Event Traces
Event tracing provides detailed information about what is occurring on the [!INCLUDE[server](../developer/includes/server.md)] and application when users work with [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. This can help you identify and analyze problems or conditions that affect performance. Event tracing enables you to dynamically monitor [!INCLUDE[server](../developer/includes/server.md)] without having to restart the server or [!INCLUDE[prod_short](../developer/includes/prod_short.md)] clients. By using industry-standard tools for event tracing, you can start and stop event tracing sessions, and then view the trace event data from a stored log file.  
  
You can use event tracing to track the following operations on [!INCLUDE[server](../developer/includes/server.md)] instances:  
  
-   Running [!INCLUDE[prod_short](../developer/includes/prod_short.md)] reports, queries, and XMLports.  
  
-   Execution of SQL statements by [!INCLUDE[server](../developer/includes/server.md)].  
  
-   Execution of AL functions.  

-   Telemetry. 
  
-   Windows event log events.  
  
## Event Trace Monitoring Tools  
There are various industry-standard tools that you can use to collect event trace data. The procedures in this section use Windows Performance Monitor, PerfView, Event Viewer, and Windows PowerShell to illustrate how you can collect and view event trace data. For details about how to use these tools and others, refer to the documentation available with the tool. For an overview of some of the tools, see [Tools for Monitoring Performance Counters and Events](tools-monitor-performance-counters-and-events.md). 
  
## <a name="GetStartedEvents"></a>Get Started  
  
|Task|For more information, see|  
|----------|-------------------------------|  
|Review the list of trace events that are available for monitoring [!INCLUDE[server](../developer/includes/server.md)] instances.|[Business Central Trace Events List](server-trace-events.md)|  
|Collect event trace data in an event trace log \(.etl\) file. Use the event trace monitoring tool to start an event trace session.|[Use Performance Monitor to Collect Event Trace Data](monitor-use-performance-monitor-collect-event-trace-data.md)<br /><br /> [Use PerfView to Collect Event Trace Data](monitor-use-perfview-collect-event-trace-data.md)<br /><br />[Use Logman to Collect Event Trace Data](monitor-use-logman-collect-event-trace-data.md)|  
|View event trace data that is contained in an .etl file.|[Use PerfView to View Event Trace Data](monitor-use-perfview-view-event-trace-data.md)|  
|Use Event Viewer to collect and view events |[Monitoring Business Central Server Events by Using Event Viewer](monitor-server-events-windows-event-log.md) |  
|Use Windows PowerShell to view event trace data|[Monitoring Business Central Server Events by Using Windows PowerShell](monitor-server-events-with-powershell.md)|
|Turn off or limit the amount of telemetry trace events emitted based on the severity level.|[Turn Off or Limit Telemetry Trace Events](disable-limit-telemetry-events.md)|   
  
## See Also    
[Business Central Server Trace Events](server-trace-events.md)  
[Business Central Server Admin and Operational Events](server-events.md)  
