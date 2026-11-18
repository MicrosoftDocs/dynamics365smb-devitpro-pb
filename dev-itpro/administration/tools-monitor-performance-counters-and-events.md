---
title: Tools for Monitoring Performance Counters and Events
description: Compare tools for monitoring Business Central Server performance counters and event logs, including Performance Monitor, Event Viewer, and PowerShell.
ms.date: 11/17/2026
ms.topic: article
author: SusanneWindfeldPedersen
ai-usage: ai-assisted
---

# Monitoring tools for performance counters and events

This article lists some of the tools that you can use to monitor [!INCLUDE[server](../developer/includes/server.md)].  

## Windows Performance Monitor

Performance Monitor is available on Windows operating systems. You can use Performance Monitor to collect and view performance data from performance counters and trace events in real time or from a log file. Learn more in [Windows Performance Monitor](/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/cc749249(v=ws.11)).  

## Windows Event Viewer

Windows Event Viewer is available on Windows operating systems. You can use Event Viewer to collect and view [!INCLUDE[server](../developer/includes/server.md)] events that are logged in **Applications and Services Logs** and the Windows **Application** event log of the [!INCLUDE[server](../developer/includes/server.md)] computer. Learn more in [Monitoring Business Central Server Events Using Event Viewer](monitor-server-events-windows-event-log.md).  

## Logman event trace sessions

Logman (`logman.exe`) is a tool that comes with the Windows operating system. You can use it to create and manage event trace sessions and performance logs from the command prompt. Learn more in [Logman](/previous-versions/windows/it-pro/windows-server-2012-R2-and-2012/cc753820(v=ws.11)).

## Monitoring with Windows PowerShell

You can use the `Get-WinEvent` cmdlet of Windows PowerShell to view [!INCLUDE[server](../developer/includes/server.md)] instance events that are recorded in the Windows event logs. Learn more in [Monitoring [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Server Events with PowerShell](monitor-server-events-with-powershell.md).  

## Microsoft TraceEvent Library

You can also log ETW events using the Microsoft TraceEvent Library, which includes classes for controlling providers and parsing events. Learn more and download the library in [Microsoft.Diagnostics.Tracing.TraceEvent](https://www.nuget.org/packages/Microsoft.Diagnostics.Tracing.TraceEvent).

## PerfView performance analysis

PerfView is a performance-analysis tool that focuses on Event Tracing for Windows information. PerfView can help you isolate performance issues that are related to [!INCLUDE[server](../developer/includes/server.md)]. Learn more and download the tool in [PerfView releases](https://go.microsoft.com/fwlink/?LinkID=313428).

## Related information

[Monitoring Business Central Server Events](monitor-server-events.md)  
