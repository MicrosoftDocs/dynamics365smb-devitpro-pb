---
title: How to: Use PerfView to View Event Trace Data
decription: This topic describes how to use PerfView to view event trace data that is stored in an event trace log \(.etl\) file.  
ms.custom:
  - bap-template
  - evergreen
ms.date: 04/16/2024
ms.reviewer: jswymer
ms.service: dynamics-365-op
ms.topic: conceptual
author: SusanneWindfeldPedersen
---
# How to: Use PerfView to View Event Trace Data

This topic describes how to use PerfView to view [!INCLUDE[server](../developer/includes/server.md)] event trace data that is stored in an event trace log \(.etl\) file.  
  
### To install PerfView  
  
-   Go to [https://go.microsoft.com/fwlink/?LinkID=313428](https://go.microsoft.com/fwlink/?LinkID=313428), and then follow the instructions to download and install PerfView.  
  
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
 [Use PerfView to Collect Event Trace Data](monitor-use-perfview-collect-event-trace-data.md)   
 [Use Performance Monitor to Collect Event Trace Data](monitor-use-performance-monitor-collect-event-trace-data.md)   
 [Monitoring Business Central Server Events](monitor-server-events.md)   
 [Business Central Server Trace Events](server-trace-events.md)  
 [Instrumenting an Application for Telemetry](../developer/devenv-instrument-application-for-telemetry.md)    