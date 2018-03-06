---
title: "Monitoring Microsoft Dynamics NAV Server Events"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: d7d57a32-f65e-4b02-bed8-86f1dfbf2fa8
caps.latest.revision: 15
---
# Monitoring Microsoft Dynamics NAV Server Events
You can monitor events on [!INCLUDE[nav_server](includes/nav_server_md.md)] to diagnose conditions and troubleshoot problems that affect operation and performance.  

## Event Logging Overview  
 [!INCLUDE[navnow](includes/navnow_md.md)] uses Event Tracing for Windows \(ETW\), which is a subsystem of Windows operating systems. ETW provides a tracing mechanism for events that are raised by an application or service. ETW enables you to use industry standard tools such as Windows Performance Monitor, PerfView, Event Viewer, and Windows PowerShell to dynamically collect data on trace events that occur on the [!INCLUDE[nav_server](includes/nav_server_md.md)].  

 Events that occur on [!INCLUDE[nav_server](includes/nav_server_md.md)] instances are recorded in Windows Event logs on the [!INCLUDE[nav_server](includes/nav_server_md.md)] computer. [!INCLUDE[navnowlong](includes/navnowlong_md.md)] uses channels on all events. Event channels provide a way to collect and view events from a specific provider, which in this case is [!INCLUDE[nav_server](includes/nav_server_md.md)], and group the events according to predefined types, such as admin, operational, and debug. For example, in Event Viewer, [!INCLUDE[nav_server](includes/nav_server_md.md)] instance events are collected in the Admin, Operational, and Debug channel logs for Dynamics NAV in the Applications and Services Logs.  

 For more general information about ETW and event channels, see [Event Tracing for Windows](http://go.microsoft.com/fwlink/?LinkID=313939) and [Event Logs and Channels in Windows Event Log](http://go.microsoft.com/fwlink/?LinkID=517298).  

## Monitoring Microsoft Dynamics NAV Server Event Traces
Event tracing provides detailed information about what is occurring on the [!INCLUDE[nav_server](includes/nav_server_md.md)] and application when users work with [!INCLUDE[navnow](includes/navnow_md.md)]. This can help you identify and analyze problems or conditions that affect performance. Event tracing enables you to dynamically monitor [!INCLUDE[nav_server](includes/nav_server_md.md)] without having to restart the server or [!INCLUDE[navnow](includes/navnow_md.md)] clients. By using industry-standard tools for event tracing, you can start and stop event tracing sessions, and then view the trace event data from a stored log file.  
  
You can use event tracing to track the following operations on [!INCLUDE[nav_server](includes/nav_server_md.md)] instances:  
  
-   Running [!INCLUDE[navnow](includes/navnow_md.md)] reports, queries, and XMLports.  
  
-   Execution of SQL statements by [!INCLUDE[nav_server](includes/nav_server_md.md)].  
  
-   Execution of C/AL functions.  

-   Telemetry. 
  
-   Windows event log events.  
  
## Event Trace Monitoring Tools  
There are various industry-standard tools that you can use to collect event trace data. The procedures in this section use Windows Performance Monitor, PerfView, Event Viewer, and Windows PowerShell to illustrate how you can collect and view event trace data. For details about how to use these tools and others, refer to the documentation available with the tool. For an overview of some of the tools, see [Tools for Monitoring Performance Counters and Events](Tools-for-Monitoring-Performance-Counters-and-Events.md). 
  
## <a name="GetStartedEvents"></a>Get Started  
  
|Task|For more information, see|  
|----------|-------------------------------|  
|Review the list of trace events that are available for monitoring [!INCLUDE[nav_server](includes/nav_server_md.md)] instances.|[Microsoft Dynamics NAV Server Trace Events List](Microsoft-Dynamics-NAV-Server-Trace-Events.md)|  
|Collect event trace data in an event trace log \(.etl\) file. Use the event trace monitoring tool to start an event trace session.|[How to: Use Performance Monitor to Collect Event Trace Data](How-to--Use-Performance-Monitor-to-Collect-Event-Trace-Data.md)<br /><br /> [How to: Use PerfView to Collect Event Trace Data](How-to--Use-PerfView-to-Collect-Event-Trace-Data.md)<br /><br />[How to: Use Logman to Collect Event Trace Data](How-to--Use-Logman-to-Collect-Event-Trace-Data.md)|  
|View event trace data that is contained in an .etl file.|[How to: Use PerfView to View Event Trace Data](How-to--Use-PerfView-to-View-Event-Trace-Data.md)|  
|Use Event Viewer to collect and view events |[Monitoring Dynamics NAV Server Events by Using Event Viewer](Monitoring-Microsoft-Dynamics-NAV-Server-Events-in-the-Windows-Event-Log.md) |  
|Use Windows PowerShell to view event trace data|[Monitoring Dynamics NAV Server Events by Using Windows PowerShell](Monitoring-Microsoft-Dynamics-NAV-Server-Events-with-PowerShell.md)|
|Turn off or limit the amount of telemetry trace events emitted based on the severity level.|[Turn Off or Limit Telemetry Trace Events](disable-limit-telemetry-events.md)|   
  
## See Also    
[Dynamics NAV Server Trace Events](Microsoft-Dynamics-NAV-Server-Trace-Events.md)  
[Dynamics NAV Server Admin and Operational Events](Microsoft-Dynamics-NAV-Server-Events.md)  
