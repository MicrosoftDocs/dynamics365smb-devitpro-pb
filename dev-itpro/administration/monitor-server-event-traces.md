---
title: "Monitoring Microsoft Dynamics NAV Server Event Traces"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
author: jswymer
redirect_url: Monitoring-Microsoft-Dynamics-NAV-Server-Events
---
# Monitoring Microsoft Dynamics NAV Server Event Traces
Event tracing provides detailed information about what is occurring on the [!INCLUDE[nav_server](../developer/includes/nav_server_md.md)] and application when users work with [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. This can help you identify and analyze problems or conditions that affect performance. Event tracing enables you to dynamically monitor [!INCLUDE[nav_server](../developer/includes/nav_server_md.md)] without having to restart the server or [!INCLUDE[prodshort](../developer/includes/prodshort.md)] clients. By using industry-standard tools for event tracing, you can start and stop event tracing sessions, and then view the trace event data from a stored log file.  
  
You can use event tracing to track the following operations on [!INCLUDE[nav_server](../developer/includes/nav_server_md.md)] instances:  
  
-   Running [!INCLUDE[prodshort](../developer/includes/prodshort.md)] reports, queries, and XMLports.  
  
-   Execution of SQL statements by [!INCLUDE[nav_server](../developer/includes/nav_server_md.md)].  
  
-   Execution of C/AL functions.  

-   Telemetry. 
  
-   Windows event log events.  
  
## Event Trace Monitoring Tools  
There are various industry-standard tools that you can use to collect event trace data. The procedures in this section use Windows Performance Monitor, PerfView, Event Viewer, and Windows PowerShell to illustrate how you can collect and view event trace data. For details about how to use these tools and others, refer to the documentation available with the tool.  
  
## <a name="GetStartedEvents"></a>Get Started  
  
|Task|For more information, see|  
|----------|-------------------------------|  
|Review the list of trace events that are available for monitoring [!INCLUDE[nav_server](../developer/includes/nav_server_md.md)] instances.|[Business Central Server Trace Events](server-trace-events.md)|  
|Collect event trace data in an event trace log \(.etl\) file. Use the event trace monitoring tool to start an event trace session.|[Use Performance Monitor to Collect Event Trace Data](monitor-use-performance-monitor-collect-event-trace-data.md)<br /><br /> [Use PerfView to Collect Event Trace Data](monitor-use-perfview-collect-event-trace-data.md)<br /><br />[Use Logman to Collect Event Trace Data](monitor-use-logman-collect-event-trace-data.md)|  
|View event trace data that is contained in an .etl file.|[Use PerfView to View Event Trace Data]([Use PerfView to View Event Trace Data](monitor-use-perfview-view-event-trace-data.md).md)|  
|Use Event Viewer to collect and view events |[Monitor Business Central Server Events Using Event Viewer](monitor-server-events-windows-event-log.md) |  
|Use Windows PowerShell to view event trace data|[View Business Central Server Events by Using Windows PowerShell](monitor-server-events-with-powershell.md)|  
  
## See Also  
[Monitor Business Central Server Events Using Event Viewer](monitor-server-events-windows-event-log.md)   
[Monitoring Business Central Server Events](monitor-server-events.md)   
[Business Central Server Trace Events](server-trace-events.md)