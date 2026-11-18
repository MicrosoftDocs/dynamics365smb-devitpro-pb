---
title: "Monitoring SQL Database Deadlocks in Business Central"
description: Configure Business Central on-premises to log SQL Server deadlocks, collect diagnostic details, and analyze the affected transactions and AL code.
ms.custom: bap-template
ms.date: 11/17/2026
ms.reviewer: jswymer
ms.service: dynamics-365-op
ms.topic: how-to
author: SusanneWindfeldPedersen
ai-usage: ai-assisted
---
# Monitoring SQL database deadlocks
You can set up the system to log deadlocks that occur in the SQL database. The deadlocks are recorded in the Windows event log of the computer running [!INCLUDE[server](../developer/includes/server.md)]. The log entries provide information about the AL code that was run when the deadlock occurred, along with the deadlock report from SQL Server. This information can help you identify and resolve problem areas in the application design.

## About database deadlocks
Deadlocks can prevent users from completing tasks in the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] client. A deadlock occurs when two or more processes or transactions block each other from continuing because each has locked a database resource that the other transaction needs. SQL Server resolves a deadlock by terminating and rolling back the transaction with the lowest deadlock priority. If priorities are equal, SQL Server chooses the transaction that's least expensive to roll back.

Learn more in [SET DEADLOCK_PRIORITY](/sql/t-sql/statements/set-deadlock-priority-transact-sql).

## Setting up deadlock logging

Setting up deadlock logging requires you to configure the SQL Server instance and the [!INCLUDE[server](../developer/includes/server.md)] instance.

> [!NOTE]
> In version 29, `EnableDeadlockMonitoring` defaults to `false`. Verify this setting and the SQL Server permissions even if you used the **Install Demo** option.

### Configure the SQL Server instance
To configure the SQL Server instance to log deadlocks, you must assign specific permissions to the database login for the service account that is used on the [!INCLUDE[server](../developer/includes/server.md)] instance. You can do this using SQL Server Management Studio.

In SQL Server Management Studio, connect to the SQL server instance for [!INCLUDE[prod_short](../developer/includes/prod_short.md)], and then grant the following permissions:
-   On the database level, grant the login the **View database state** permission.
-   On the SQL server instance level, grant the login both **Alter any event session** and **View server state** permissions.

On SQL Server 2022 and later, also grant `VIEW SERVER PERFORMANCE STATE` to read Extended Events diagnostic data. Keep the existing `VIEW SERVER STATE` and `ALTER ANY EVENT SESSION` permissions because [!INCLUDE[server](../developer/includes/server.md)] checks them when initializing deadlock monitoring. Learn more in [Quickstart: Extended Events](/sql/relational-databases/extended-events/quick-start-extended-events-in-sql-server).

Learn more about assigning the database permissions in [Giving the account necessary database privileges in SQL Server](../deployment/provision-server-account.md#dbo).

After deadlock logging is enabled on the server instance and a client session accesses the database, a session for monitoring the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] database appears under **Management** > **Extended Events**.

#### Configure where to store deadlock events

By default, SQL Server uses an in-memory data structure called a *ring_buffer target* to store deadlock events. When [!INCLUDE[server](../developer/includes/server.md)] is notified about the deadlock, it reads data from the ring_buffer target. You have the option to also store the events to a file on SQL Server, called an *event_file target*, and configure [!INCLUDE[server](../developer/includes/server.md)] to read from this file instead of the ring_buffer target. Business Central creates the ring_buffer target with a memory limit of 1,024 KB. The target discards older events when it fills, and its XML output is truncated at 4 MB. The event_file target provides greater storage capacity. Using the event_file target can reduce the risk of losing deadlock reports in high-volume situations. If your setup has a high volume of database traffic, you might have to change SQL Server to write deadlock events to an event_file target as described in the steps that follow. If you want to use the default ring_buffer target, then no further action is required.

> [!NOTE]
> Reading from the event_file target is only supported in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Cumulative Update 3 and later.

Before following this optional procedure, enable deadlock logging on the server instance as described in the next section, restart the instance, and connect a client to the database.

1. Modify the deadlock monitoring session to use a file-based target (known as an *event_file target*).

    The event_file target writes event session output from a buffer to a disk file that you specify. There are two ways to do this:
    - From Object Explorer, open the session's **Properties**, and then on the **Data Storage** page, add an **event_file** type target.  
    - Using a query, run the [ALTER EVENT SESSION](/sql/t-sql/statements/alter-event-session-transact-sql?view=sql-server-2017&preserve-view=true) transact-sql statement. For example:
      ```sql
      ALTER EVENT SESSION [Demo Database BC_deadlock_monitor]
          ON SERVER
	        ADD Target package0.event_file
          (
            SET filename=N'C:\logging\mydeadlocks.xel',max_file_size=(10240)
          )
      ```
    Replace `C:\logging\mydeadlocks.xel` with the path and file name that you want to store the data.
   
    Learn more in [Alter an Extended Events Session](/sql/relational-databases/extended-events/alter-an-extended-events-session) and [Targets for Extended Events in SQL Server](/sql/relational-databases/extended-events/targets-for-extended-events-in-sql-server#event_file-target).
    
1. In the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] database, create a view that has the name `dbo.deadlock_report_event_file_view` and uses the new event_file target.  

    <!--You can create this view based on the default `dbo.deadlock_report_ring_buffer_view` view. To use the event_file target, you change `xt.target_name = N'ring_buffer'` to `xt.target_name = N'event_file'`.--> For example:

    ```sql
    USE [Demo Database BC]
    GO

    SET ANSI_NULLS ON
    GO

    SET QUOTED_IDENTIFIER ON
    GO

    CREATE VIEW dbo.deadlock_report_event_file_view AS
        SELECT event_data AS event_raw_data
        FROM sys.fn_xe_file_target_read_file ('C:\logging\*.xel', null, null, null)
    GO
    ```

    <!--
    CREATE VIEW [dbo].[deadlock_report_event_file_view] AS
    SELECT target_data AS event_raw_data
    FROM sys.dm_xe_session_targets AS xt INNER JOIN sys.dm_xe_sessions AS xs
    ON xs.address = xt.event_session_address
    WHERE xs.name = N'Demo Database BC_deadlock_monitor' AND xt.target_name = N'event_file'
    -->

     Replace `C:\logging\` with the path to the event file.

1. Restart the [!INCLUDE[server](../developer/includes/server.md)] instance so that the deadlock analyzer detects the view when it initializes the database.
<!--
3. Change the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] database synonym `dbo.syn_deadlock_event_view` to point to the deadlock report event file view that you created.

    This synonym is used by the [!INCLUDE[server](../developer/includes/server.md)] to query the deadlock data. To alter a synonym, you first drop it, and then create a new synonym that has the same name. For example:
    ```
    DROP SYNONYM [dbo].[syn_deadlock_event_view]
    GO
    
    CREATE SYNONYM [dbo].[syn_deadlock_event_view] FOR [dbo].[deadlock_report_event_file_view]
    GO
    ```
-->
> [!NOTE]
> You can delete the ring_buffer target if you like. However, deletion isn't required.

### Configure the [!INCLUDE[server](../developer/includes/server.md)] instance
To log deadlocks, you must enable deadlock logging on the [!INCLUDE[server](../developer/includes/server.md)] instance. In version 21 and later, use the `Set-NAVServerConfiguration` cmdlet in the [!INCLUDE[adminshell](../developer/includes/adminshell.md)]. The [!INCLUDE[admintool](../developer/includes/admintool.md)] is available only in version 20 and earlier.

-   In version 20 and earlier, to enable deadlock logging by using the [!INCLUDE[admintool](../developer/includes/admintool.md)], open the server instance for editing, and then select the **Enable Deadlock Monitoring** check box in the **Database** section.

    Learn more in [Business Central Server Administration Tool](administration-tool.md).

-   To enable logging by using the `Set-NAVServerConfiguration` cmdlet, include the `-KeyName EnableDeadlockMonitoring -KeyValue true` parameters in the command, such as:

    ```powershell
    Set-NAVServerConfiguration -ServerInstance MyServerInstance -KeyName EnableDeadlockMonitoring -KeyValue true
    ```
    Restart the server instance for the setting to take effect.

    Learn more about the [!INCLUDE[adminshell](../developer/includes/adminshell.md)] in [Business Central PowerShell Cmdlets](/powershell/business-central/overview) and [Set-NAVServerConfiguration Cmdlet](/powershell/module/microsoft.dynamics.nav.management/set-navserverconfiguration).

## Viewing deadlocks in the Windows event log
Similar to other errors and events in [!INCLUDE[prod_short](../developer/includes/prod_short.md)], you can monitor deadlocks by using Event Viewer on the computer running [!INCLUDE[server](../developer/includes/server.md)]. Deadlocks are recorded as warnings in **Applications and Services Logs** > **Microsoft** > **DynamicsNAV** > **Common** > **Admin**. Learn more in [Monitor Business Central Server Events Using Event Viewer](monitor-server-events-windows-event-log.md).

### Deadlock event overview
Deadlock event log entries have the event ID 705 and task category 33 (TelemetryData). The following table describes some of the important information that is included in a deadlock log entry:

|  Information |  Description  |
|--------------|---------------|
|instanceName|Specifies the [!INCLUDE[server](../developer/includes/server.md)] instance on which the event occurred.|
|user|Specifies the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] user account that ran the transaction that caused the event.|
|AL ObjectType|Specifies the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] object in AL that ran the transaction, such as a page or report.|
|AL ObjectNumber|Specifies the ID of the object that was run.|
|AL ScopeName|Specifies the AL function that ran the transaction that caused the event.|
|SQL Server deadlock XML report|Includes the deadlock report that was received from SQL Server. Learn more in [Analyze Deadlocks](/sql/tools/sql-server-profiler/analyze-deadlocks-with-sql-server-profiler).|

> [!NOTE]
> The system can't record information about AL code that was executed on a different [!INCLUDE[server](../developer/includes/server.md)]. Therefore, the three attributes `AL ObjectType`, `AL ObjectNumber`, and `AL ScopeName` might be empty in a given event log entry.

### View a graphical representation of the deadlock event

To view a graphical representation of the deadlock, perform the following steps:
1.  Open the deadlock event in Event Viewer.
1.  On the **General** tab, go to the SQL Server deadlock XML report section, and then copy the text in the deadlock tag, including the start and end tags, to a text editor such as Notepad or Visual Studio Code.
1.  Save the file with the `.xdl` extension.
1.  Open the file in SQL Server Management Studio.

### Filter on deadlock events

All deadlock events have the trace tag **00000DI**. If you only want to see deadlocks events in the log, you can use this tag in an XML path filter on the log, as shown in the following example:

```xml
<QueryList>
  <Query Id="0" Path="Microsoft-DynamicsNAV-Common/Admin">
    <Select Path="Microsoft-DynamicsNAV-Common/Admin">
                 *[EventData[Data[@Name='tag']='00000DI']]
               </Select>
  </Query>
</QueryList>
```

Learn more about XML filtering in [Advanced XML filtering in the Windows Event Viewer](/archive/blogs/askds/advanced-xml-filtering-in-the-windows-event-viewer).

## Monitor using Application Insights

If your deployment is enabled for telemetry, you can also view data about deadlocks in an Application Insights resource in Azure. Learn more in the following articles:

- [Enabling Application Insights for Tenant Telemetry](telemetry-enable-application-insights.md)
- [Analyzing Database Deadlock Trace Telemetry](telemetry-database-deadlocks-trace.md)

## Related information

[Monitoring Business Central Server Events](monitor-server-events.md)  
[Monitoring SQL Database Locks](monitor-database-locks.md)  
[Monitoring Business Central Server](monitor-server.md)  
[Use SQL Server Management Studio](/sql/ssms/sql-server-management-studio-ssms)
