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
Event tracing provides detailed information about what is occurring on the [!INCLUDE[nav_server](includes/nav_server_md.md)] and application when users work with [!INCLUDE[navnow](includes/navnow_md.md)]. This can help you identify and analyze problems or conditions that affect performance. Event tracing enables you to dynamically monitor [!INCLUDE[nav_server](includes/nav_server_md.md)] without having to restart the server or [!INCLUDE[navnow](includes/navnow_md.md)] clients. By using industry-standard tools for event tracing, you can start and stop event tracing sessions, and then view the trace event data from a stored log file.  
  
You can use event tracing to track the following operations on [!INCLUDE[nav_server](includes/nav_server_md.md)] instances:  
  
-   Running [!INCLUDE[navnow](includes/navnow_md.md)] reports, queries, and XMLports.  
  
-   Execution of SQL statements by [!INCLUDE[nav_server](includes/nav_server_md.md)].  
  
-   Execution of C/AL functions.  

-   Telemetry. 
  
-   Windows event log events.  
  
## Event Trace Monitoring Tools  
There are various industry-standard tools that you can use to collect event trace data. The procedures in this section use Windows Performance Monitor, PerfView, Event Viewer, and Windows PowerShell to illustrate how you can collect and view event trace data. For details about how to use these tools and others, refer to the documentation available with the tool.  
  
## <a name="GetStartedEvents"></a>Get Started  
  
|Task|For more information, see|  
|----------|-------------------------------|  
|Review the list of trace events that are available for monitoring [!INCLUDE[nav_server](includes/nav_server_md.md)] instances.|[Microsoft Dynamics NAV Server Trace Events](Microsoft-Dynamics-NAV-Server-Trace-Events.md)|  
|Collect event trace data in an event trace log \(.etl\) file. Use the event trace monitoring tool to start an event trace session.|[How to: Use Performance Monitor to Collect Event Trace Data](How-to--Use-Performance-Monitor-to-Collect-Event-Trace-Data.md)<br /><br /> [How to: Use PerfView to Collect Event Trace Data](How-to--Use-PerfView-to-Collect-Event-Trace-Data.md)<br /><br />[How to: Use Logman to Collect Event Trace Data](How-to--Use-Logman-to-Collect-Event-Trace-Data.md)|  
|View event trace data that is contained in an .etl file.|[How to: Use PerfView to View Event Trace Data](How-to--Use-PerfView-to-View-Event-Trace-Data.md)|  
|Use Event Viewer to collect and view events |[Monitoring Dynamics NAV Server Events Using Event Viewer](Monitoring-Microsoft-Dynamics-NAV-Server-Events-in-the-Windows-Event-Log.md) |  
|Use Windows PowerShell to view event trace data|[Viewing Microsoft Dynamics NAV Server Events by Using Windows PowerShell](Monitoring-Microsoft-Dynamics-NAV-Server-Events-with-PowerShell.md)|  
  
## See Also  
[Monitoring Dynamics NAV Server Events Using Event Viewer](Monitoring-Microsoft-Dynamics-NAV-Server-Events-in-the-Windows-Event-Log.md)   
[Monitoring Microsoft Dynamics NAV Server Events](Monitoring-Microsoft-Dynamics-NAV-Server-Events.md)   
[Microsoft Dynamics NAV Server Trace Events](Microsoft-Dynamics-NAV-Server-Trace-Events.md)