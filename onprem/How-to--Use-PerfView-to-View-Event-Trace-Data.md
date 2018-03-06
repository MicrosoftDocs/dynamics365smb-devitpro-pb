---
title: "How to: Use PerfView to View Event Trace Data"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 5523466a-5f72-4138-ad36-3b678c36724b
caps.latest.revision: 3
---
# How to: Use PerfView to View Event Trace Data
This topic describes how to use PerfView to view [!INCLUDE[nav_server](includes/nav_server_md.md)] event trace data that is stored in an event trace log \(.etl\) file.  
  
### To install PerfView  
  
-   Go to [http://go.microsoft.com/fwlink/?LinkID=313428](http://go.microsoft.com/fwlink/?LinkID=313428), and then follow the instructions to download and install PerfView.  
  
##  <a name="ViewDataPerfView"></a> To view event trace data from an event trace log file  
  
1.  Open PerfView.exe.  
  
2.  In PerfView, use the left pane to locate the .etl file that you want to view.  
  
     The left pane displays the current directory and the files that PerfView is set up to browse. To change a directory, choose a subdirectory from the list or type the directory \(for example, c:\\PerfLogs\) in the text box at the top of the pane.  
  
3.  Double-click the .etl file that you want to view.  
  
     Several items appear in the left pane under the .etl file that you selected.  
  
4.  To view the event traces, double-click **Events**.  
  
     The **Events** window opens to display the contents of the .etl file. Trace events are listed in the left pane.  
  
5.  To view details about a trace event, double-click the trace event.  
  
## See Also  
 [How to: Use PerfView to Collect Event Trace Data](How-to--Use-PerfView-to-Collect-Event-Trace-Data.md)   
 [How to: Use Performance Monitor to Collect Event Trace Data](How-to--Use-Performance-Monitor-to-Collect-Event-Trace-Data.md)   
 [Monitoring Microsoft Dynamics NAV Server Events](Monitoring-Microsoft-Dynamics-NAV-Server-Events.md)   
 [Microsoft Dynamics NAV Server Trace Events](Microsoft-Dynamics-NAV-Server-Trace-Events.md)  
 [Instrumenting an Application for Telemetry](instrumenting-application-for-telemetry.md)]  