---
title: "Monitoring SQL Database Deadlocks"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
# Monitoring SQL Database Deadlocks
You can set up the system to log deadlocks that occur in the SQL database. The deadlocks are recorded in the Windows Event Log of computer running [!INCLUDE[server](../developer/includes/server.md)]. The log entries provide information about the AL code that was run when the deadlock occurred, along with the deadlock report from SQL Server. This information can help you identify and resolve problem areas in the application design.

## About Deadlocks
Deadlocks can prevent users from completing tasks in the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] client. A deadlock occurs when two or more processes or transactions block each other from continuing because each has locked a database resource that the other transaction needs. SQL Server handles deadlocks by terminating and rolling back transactions that were started after the first transaction.

For general information about deadlocks, see [Detecting and Ending Deadlocks](https://aka.ms/detectingendingdeadlocks).

## Setting Up Deadlock Logging
Setting up deadlock logging requires you to configure the SQL Server instance and the [!INCLUDE[server](../developer/includes/server.md)] instance.

**Note:**  If you installed the [!INCLUDE[server](../developer/includes/server.md)] and database components by using the **Install Demo** option in the [!INCLUDE[nav_setup](../developer/includes/nav_setup_md.md)], then deadlock logging is set up by default.   

### Configure the SQL Server instance
To configure the SQL Server instance to log deadlocks, you must assign specific permissions to the database login for the service account that is used on the [!INCLUDE[server](../developer/includes/server.md)] instance. You can do this using SQL Server Management Studio.

In SQL Server Management Studio, connect to the SQL server instance for [!INCLUDE[prod_short](../developer/includes/prod_short.md)], and then grant the following permissions:
-   On the database level, grant the login the **View database state** permission.
-   On the SQL server instance level, grant the login both **Alter any event session** and **View server state** permissions.

For detailed steps on how to do this, see [Giving the account necessary database privileges in SQL Server](../deployment/provision-server-account.md#dbo).

The next time a client session is established with the database, a session for monitoring the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] database appears under  **Management**, **Extended Events**.

#### Configure where to store deadlock events

By default, SQL Server uses an in-memory data structure called a *ring_buffer target* to store deadlock events. When the [!INCLUDE[server](../developer/includes/server.md)] is notified about the deadlock, it reads data from the target *ring_buffer* target. You have the option to also store the events to a file on the SQL Server, called an *event_file target*, and configure the [!INCLUDE[server](../developer/includes/server.md)] to read from this file instead of the ring_buffer target. An important difference between the ring_buffer target and event_file target is that the ring_buffer target has a storage size limitation of 5MB, while the event_file target provides a much greater storage capacity. Using the event_file target can eliminate potential overloads in high volume situations. So, if your setup has a high volume of database traffic, you might have to change the SQL Server to write deadlock events to an event_file target as described the steps that follow. If you want to use the default ring_buffer target, then no further action is required.

> [!NOTE]
> Reading from the event_file target is only supported in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Cumulative Update 3 and later.
1. Modify the deadlock monitoring session to use a file-based target (known as an *event_file target*).

    The event_file target writes event session output from a buffer to a disk file that you specify. There are two ways to do this:
    - From Object Explorer, open the session's **Properties**, and then on the **Data Storage** page, add an **event_file** type target.  
    - Using a query, run the [ALTER EVENT SESSION](/sql/t-sql/statements/alter-event-session-transact-sql?view=sql-server-2017) transact-sql statement. For example:
      ```
      ALTER EVENT SESSION [Demo Database BC_deadlock_monitor]
          ON SERVER
	        ADD Target package0.event_file
          (
            SET filename=N'C:\logging\mydeadlocks.xel',max_file_size=(10240)
          )
      ```
    Replace `C:\logging\mydeadlocks.xel` with the path and file name that you want to store the data.
   
    For more information see [Alter an Extended Events Session](/sql/relational-databases/extended-events/alter-an-extended-events-session?view=sql-server-2017) and [Targets for Extended Events in SQL Server](/sql/relational-databases/extended-events/targets-for-extended-events-in-sql-server?view=sql-server-2017#eventfile-target).
    
2. In the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] database, create a view that has the name `deadlock_report_event_file_view` and uses the new event_file target.  

    <!--You can create this view based on the default `dbo.deadlock_report_ring_buffer_view` view. To use the event_file target, you change `xt.target_name = N'ring_buffer'` to `xt.target_name = N'event_file'`.--> For example:

    ```
    USE [Demo Database BC]
    GO

    SET ANSI_NULLS ON
    GO

    SET QUOTED_IDENTIFIER ON
    GO

 	CREATE VIEW deadlock_report_event_file_view AS
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
> You can delete the ring_buffer target if you like. However, this is not required.

### Configure the [!INCLUDE[server](../developer/includes/server.md)] instance
To log deadlocks, you must enable deadlock logging on the [!INCLUDE[server](../developer/includes/server.md)] instance. You can enable deadlock logging by using the [!INCLUDE[admintool](../developer/includes/admintool.md)] or the Set-NAVServerConfiguration cmdlet in the [!INCLUDE[adminshell](../developer/includes/adminshell.md)].

-   To enable deadlock logging by using the [!INCLUDE[admintool](../developer/includes/admintool.md)], open the server instance for editing, and then select the **Enable Deadlock Monitoring** check box in the **Database** section.

    For more information about how to use the [!INCLUDE[admintool](../developer/includes/admintool.md)], see [Business Central Server Administration Tool](administration-tool.md).

-   To enable logging by using the Set-NAVServerConfiguration cmdlet, include the *keyname EnableDeadlockMonitoring keyvalue true* parameters in the command, such as:

    ```
    Set-NAVServerConfiguration -ServerInstance MyServerInstance -KeyName EnableDeadlockMonitoring -KeyValue true
    ```
    For more information about how to use the [!INCLUDE[adminshell](../developer/includes/adminshell.md)], see [Business Central PowerShell Cmdlets](/powershell/business-central/overview) and [Set-NAVServerConfiguration Cmdlet](https://go.microsoft.com/fwlink/?linkid=401394).

## Viewing Deadlocks in the Windows Event Log
Similar to other errors and events in [!INCLUDE[prod_short](../developer/includes/prod_short.md)], you can monitor deadlocks by using Event Viewer on the computer running [!INCLUDE[server](../developer/includes/server.md)]. Deadlocks are recorded as warnings in the [!INCLUDE[server](../developer/includes/server.md)]  **Admin** channel log in the **Applications and Services Logs**. For general information about how to view the [!INCLUDE[server](../developer/includes/server.md)] logs, see [Monitor Business Central Server Events Using Event Viewer](monitor-server-events-windows-event-log.md).

### Deadlock Event Overview
Deadlock event log entries have the event ID 705 and task category 33 (TelemetryData). The following table describes some of important information that is included in deadlock log entry:

|  Information |  Description  |
|--------------|---------------|
|serverInstanceName|Specifies the [!INCLUDE[server](../developer/includes/server.md)] instance on which the event occurred.|
|user|Specifies the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] user account that ran the transaction that caused the event.|
|AL ObjectType|Specifies the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] object in AL that ran the transaction, such as a page or report.|
|AL ObjectNumber|Specifies the ID of the object that was run.|
|AL ScopeName|Specifies the AL function that ran the transaction that caused the event.|
|SQL Server deadlock XML report|Includes the deadlock report that was recieved from SQL Server. For more information, see [Analyze Deadlocks](https://aka.ms/analyzedeadlocks).|

**Note:**  The system cannot record information about AL code that was executed on a different  [!INCLUDE[server](../developer/includes/server.md)]. Therefore, the three attributes *AL ObjectType*, *AL ObjectNumber* and *AL ScopeName* might be empty in a given event log entry.

### View a graphical representation of the deadlock event
To view a graphical representation of the deadlock, perform the following steps:
1.  Open the deadlock event in Event Viewer.
2.  On the General tab, go to the SQL Server deadlock xml report section, and then copy the text in the deadlock tag (including the start and end tag) to a text editor such as Notepad or Visual Studio Code.
3.  Save the file as a .xdl type.
4.  Open the file in SQL Server Management Studio.

### Filter on deadlock events
All deadlock events have the trace tag **00000DI**. If you only want to see deadlocks events in the log, you can use this tag in an XML path filter on the log, as shown in the following example:

```
<QueryList>
  <Query Id="0" Path="Microsoft-DynamicsNAV-Server/Admin">
    <Select Path="Microsoft-DynamicsNAV-Server/Admin">
                 *[EventData[Data[@Name='tag'] and (Data='00000DI')]]
               </Select>
  </Query>
</QueryList>
```
For more information about XML filtering, see [Advanced XML filtering in the Windows Event Viewer](https://aka.ms/advancedxmlfilteringeventviewer).
##  See Also
[Monitoring Business Central Server Events](monitor-server-events.md)  
[Monitoring SQL Database Locks](monitor-database-locks.md)  
[Monitoring Business Central Server](monitor-server.md)  
[Use SQL Server Management Studio](https://aka.ms/usesqlservermanagementstudio)
