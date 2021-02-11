---
title: "How to: Use Logman to Collect Event Trace Data"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: jswymer
---
# How to: Use LogMan to Collect Event Trace Data
This article describes how to use logman to collect event trace data for [!INCLUDE[server](../developer/includes/server.md)]. Logman (logman.exe) comes with the Windows Operating System. You can use it to create and manage event trace session and performance logs from the command prompt.

This article provides a brief introduction to using logman to collect trace event data for [!INCLUDE[server](../developer/includes/server.md)] and telemetry events. For more detailed information about logman, see [Logman](/previous-versions/windows/it-pro/windows-server-2012-R2-and-2012/cc753820(v=ws.11)).
  
## Collect event trace data  
You can collect [!INCLUDE[server](../developer/includes/server.md)] trace event data from two different trace event providers: **Microsoft-DynamicsNAV-Server** and **Microsoft-DynamicsNAV-Common**. **Microsoft-DynamicsNAV-Server** is used for trace events like SQL traces, AL function traces, and session calls. **Microsoft-DynamicsNAV-Common** is used for telemetry events. 

Data that is collected with logman is stored in an event trace log \(.etl\) file.  

The following steps give you an example of how to use logman. 
  
1.  Open the command prompt, and change to the directory that contains the `logman.exe` file.

    This is typically `C:\Windows\System32`

2.  At the command prompt, run one of the following commands to create a trace data collector. 

    For telemetry trace events:

    ```
    logman create trace MyTelemetryTraceData -p Microsoft-DynamicsNAV-Common -o c:\perflogs\MyTelemetryTraceData.etl
    ```

    For server trace events:
    ```
    logman create trace MyServerTraceData -p Microsoft-DynamicsNAV-Server -o c:\perflogs\MyServerTraceData.etl
    ```
    These commands will create event log files named `MyTelemetryTraceData.etl` and `MyServerTraceData.etl` in the `c:\perflogs` folder of your computer. 

2.  To start the trace session, run one of the following commands.

    For telemetry trace events:
    ```
    logman start MyTelemetryTraceData 
    ```

    For server trace events:
    ```
    logman start MyServerTraceData 
    ```
3. To stop the trace session, run one of the following commands. 
   
    For telemetry trace events:
    ```
    logman stop MyTelemetryTraceData 
    ```

    For server trace events:
    ```
    logman stop MyServerTraceData 
    ```

The data is now stored in an .etl file. 

## View trace event data

There are various industry tools available for viewing data in .etl files.

For example, from the command line, you can use the
 [tracerpt command](/previous-versions/windows/it-pro/windows-server-2012-R2-and-2012/cc732700(v=ws.11)) to create dump files, summary, and report files. The following code creates files for the MyTelemetryTraceData_000001.etl file:  
  
```
tracerpt c:\perflogs\MyTelemetryTraceData_000001.etl -o c:\perflogs\MyTelemetry-dmp.xml -of XML -summary c:\perflogs\MyTelemetry-summary.txt -report c:\perflogs\MyTelemetry-rpt.xml
```

You can also use PerView. For more information, see [Use PerfView to View Event Trace Data](monitor-use-perfview-view-event-trace-data.md).
  
## See Also  
 [Monitoring Business Central Server Events](monitor-server-events.md)   
 [Business Central Server Trace Events](server-trace-events.md)  
 [Instrumenting an Application for Telemetry](../developer/devenv-instrument-application-for-telemetry.md)  
