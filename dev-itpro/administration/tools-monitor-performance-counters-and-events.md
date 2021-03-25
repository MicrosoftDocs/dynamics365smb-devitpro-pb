---
title: "Tools for Monitoring Performance Counters and Events"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.assetid: 9093c5f4-a594-4b70-90f3-2be0e1c13abd
caps.latest.revision: 14
author: SusanneWindfeldPedersen
---
# Tools for Monitoring Performance Counters and Events
This topic lists some of the tools that you can use to monitor [!INCLUDE[server](../developer/includes/server.md)].  

<!-- remove temporarily until we determine support for this ## Microsoft System Center Operations Manager  
 Microsoft System Center Operations Manager, which is a component of Microsoft System Center 2012, enables you to monitor services and operations on multiple computers from a single console. The System Center Monitoring Pack for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] extends Operations Manager for monitoring computers that are running [!INCLUDE[prod_short](../developer/includes/prod_short.md)] components and services, including [!INCLUDE[server](../developer/includes/server.md)]. For more information, see [Microsoft Dynamics NAV  Management Pack for System Center Operations Manager](https://go.microsoft.com/fwlink/?LinkID=722863).  -->

## Windows Performance Monitor  
 Performance Monitor is available on Windows operating systems. You can use Performance Monitor to collect and view performance data from performance counters and trace events in real-time or from a log file. For more information [Windows Performance Monitor](/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/cc749249(v=ws.11)).  

## Windows Event Viewer  
 Windows Event Viewer is available on Windows operating systems. You can use Event Viewer to collect and view [!INCLUDE[server](../developer/includes/server.md)] events that are logged in the [!INCLUDE[server](../developer/includes/server.md)] channel logs in the Applications and Services Logs and Windows Application event log of the [!INCLUDE[server](../developer/includes/server.md)] computer. For more information, see [Monitoring Business Central Server Events Using Event Viewer](monitor-server-events-windows-event-log.md).  

## Logman  
Logman (logman.exe) is a tool that comes with the Windows Operating System. You can use it to create and manage event trace session and performance logs from the command prompt. For more detailed information about logman, see [Logman](/previous-versions/windows/it-pro/windows-server-2012-R2-and-2012/cc753820(v=ws.11)).

## Windows PowerShell  
 You can use the Get-WinEvent cmdlet of Windows PowerShell to view [!INCLUDE[server](../developer/includes/server.md)] instance events that are recorded in the Windows Event Logs. For more information, see [Monitoring [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Server Events with PowerShell](monitor-server-events-with-powershell.md).  

## Microsoft TraceEvent Library
You can also log ETW events using the Microsoft TraceEvent Library, which includes classes for controlling providers and parsing events. For more information and downloading, see [Microsoft.Diagnostics.Tracing.TraceEvent](https://www.nuget.org/packages/Microsoft.Diagnostics.Tracing.TraceEvent)

## PerfView  
PerfView is a performance-analysis tool that focuses on Event Tracing for Windows information. PerfView can help you isolate performance issues that are related to [!INCLUDE[server](../developer/includes/server.md)]. To download and install PerfView, see [https://go.microsoft.com/fwlink/?LinkID=313428](https://go.microsoft.com/fwlink/?LinkID=313428).

## See Also
[Monitoring Business Central Server Events](monitor-server-events.md)