---
title: "Using Event Log to Monitor Long-Running SQL Queries"
description: Use Windows Event Viewer to investigate long-running SQL queries in Business Central and inspect SQL statements and AL call stacks for optimization.
ms.date: 11/17/2026
ms.topic: troubleshooting-general
author: jswymer
ms.custom: sfi-image-nochange
ai-usage: ai-assisted
---

# Troubleshooting: Using Event Viewer to monitor long-running SQL queries in Business Central

This article shows how you can monitor long-running SQL queries in Event Viewer. You use the information to determine which SQL queries are good candidates for optimization. 

## Monitor long-running queries

Identifying long-running SQL queries can be a good starting point when doing a performance analysis. Open Event Viewer and go to **Windows Logs** > **Application**. If logging to the Application log is disabled, use **Applications and Services Logs** > **Microsoft** > **DynamicsNAV** > **Common** > **Admin** instead.

> [!NOTE]  
> Successful SQL queries that meet or exceed the configured threshold are logged as warnings.

The default value of the `SqlLongRunningThreshold` setting is 750 milliseconds. For successful queries that meet or exceed the threshold, you'll see the message: "*Action completed successfully, but it took longer than the given threshold.*"

To meet performance expectations in production, you can set the threshold to a different value. You can set the threshold without restarting the server instance. Learn more in [Monitoring Long Running SQL Queries using the Event Log](monitor-long-running-sql-queries-event-log.md). 

:::image type="content" source="../developer/media/EventViewerExample1.png" alt-text="Screenshot of an Event Viewer warning for a SQL query that exceeded the configured execution time threshold.":::

### Using the AL call stack

Long-running queries that involve the explicit execution of AL code can include an AL call stack in the event log. Long-running queries that aren't the result of explicit AL code won't include an AL call stack. For example:

- GetPage calls that load data into the UI.
- Calls to triggers that don't include any code. These calls won't include an AL call stack because no AL code is run.

Looking at the AL call stack can help you identify what caused the delay. The generated SQL statement is listed in the `Statement` field, and the AL call stack is listed in the `AL CallStack` field. The following log example shows which AL method generated a slow-running query.

```text
Server instance: BC
Category: Sql
ClientSessionId: aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb
ClientActivityId: aaaa0000-bb11-2222-33cc-444444dddddd
ServerSessionUniqueId: bbbbbbbb-1111-2222-3333-cccccccccccc
ServerActivityId: bbbb1111-cc22-3333-44dd-555555eeeeee
EventTime: 06/08/2018 08:10:15
Message Action completed successfully, but it took longer than the given threshold.
  Execution time: 33 ms
  Threshold: 10 ms
  Message: Long running SQL statement 
  Task ID: 3
  Connection ID: 2
  Database Name: BCDB
  Statement: SELECT "2161"."timestamp","2161"."User","2161"."Default Execute Time","2161"."Current Job Queue Entry" FROM "SQLDATABASE".dbo."CRONUS International Ltd_$Calendar Event User Config_" "2161"  WITH(UPDLOCK)  WHERE ("2161"."User"=@0) OPTION(OPTIMIZE FOR UNKNOWN)
    AppObjectType: CodeUnit
  AppObjectId: 2160
  AL CallStack: "Calendar Event Mangement"(CodeUnit 2160).GetCalendarEventUserConfiguration line 2
"Calendar Event Mangement"(CodeUnit 2160).FindJobQueue line 1
"Calendar Event Mangement"(CodeUnit 2160).FindOrCreateJobQueue line 1
"Calendar Event Mangement"(CodeUnit 2160).CreateOrUpdateJobQueueEntry line 1
"Calendar Event"(Table 2160).Schedule line 12
"Calendar Event"(Table 2160).OnInsert(Trigger) line 1
"Calendar Event Mangement"(CodeUnit 2160).CreateCalendarEventForCodeunit line 6
"Create Telemetry Cal. Events"(CodeUnit 1352).OnRun(Trigger) line 5

ProcessId: 15280
Tag: 000007L
ThreadId: 10
CounterInformation:
```

## Related information

[Troubleshooting: Long running SQL queries involving FlowFields by disabling SmartSQL](Troubleshooting-Queries-Involving-FlowFields-By-Disabling-SmartSQL.md)  
[Monitoring Long Running SQL Queries using the Event Log](monitor-long-running-sql-queries-event-log.md)  
[Tools for Monitoring Performance Counters and Events](tools-monitor-performance-counters-and-events.md)  
[Business Central Server Administration Tool](administration-tool.md)  
[Troubleshooting: Using Query Store to Monitor Query Performance in Business Central](troubleshoot-query-performance-using-query-store.md)  
[SQL Trace](/sql/relational-databases/sql-trace/sql-trace)  

