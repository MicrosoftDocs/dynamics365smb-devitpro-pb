---
title: "Monitoring Long Running SQL Queries to the Event Log"
description: This topic provides an overview on how to monitor long running SQL queries in the event log starting with NAV 2017. 
ms.custom: na
ms.date: 10/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---
# Monitoring Long Running SQL Queries

<!-- This topic needs to be updated for the BC autumn release. -->
 
[!INCLUDE[nav2017](../developer/includes/nav2017.md)] is the first version that allows long running SQL queries to be logged to the Windows Event Log. The queries are logged when the application communicates with the database and the call to the database takes too long. Long running queries can also be emitted to Microsoft Azure Application Insights. 

## Defining Long Running SQL Queries 
The time logged in long running SQL queries is the time spent on the called database as seen from the server. There are multiple reasons that can cause this delay, such as the database waiting for a lock to be released, or the database executing an operation that performs badly due to missing indexes.

The threshold of when a query is logged is controlled by the [!INCLUDE[server](../developer/includes/server.md)] configuration setting **SqlLongRunningThreshold**. The default value is 1000 milliseconds (ms). For more information about setting the **SqlLongRunningThreshold**, see [Configuring Business Central Server](configure-server-instance.md), database settings section. 

## Changing Configuration Values
With [!INCLUDE[prodshort](../developer/includes/prodshort.md)], some of the configuration values for the server can be changed in the memory of the server, without doing a server restart. To change the threshold dynamically to 2000 ms, run the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] Administration Shell as Administrator and then type the following PowerShell cmdlet:

```
Set-NAVServerConfiguration -ServerInstance <ServerInstanceName> -KeyName SqlLongRunningThreshold -KeyValue 2000 -ApplyTo Memory
```

## <a name="ApplicationInsights"></a>Monitoring Long Running SQL Queries using the Application Insights

If you have access to an Application Insights resource in Microsoft Azure, you can configure your tenants to send long running query telemetry there for analysis and presentation.

### Enable Sending Telemetry to Application Insights

To enable this feature, you will first need the instrumentation key of the Application Insights resource, which you can get from the [Azure Portal](/azure/bot-service/bot-service-resources-app-insights-keys?view=azure-bot-service-4.0). Once you have the key, the way to enable this feature depends on whether your [!INCLUDE[server](../developer/includes/server.md)] instance is configured as a single-tenant or multitenant instance. 

- For a single-tenant server instance, you enable this feature on the server instance itself by adding the key to the **Application Insights Instrumentation Key** setting of the server instance. For more information, see [Configuring Business Central Server](configure-server-instance.md#General).

- For a multitenant server instance, you enable this feature on a per-tenant basis when you mount tenants on the [!INCLUDE[server](../developer/includes/server.md)] instance. The [Mount-NAVTenant cmdlet](/powershell/module/microsoft.dynamics.nav.management/mount-navtenant?view=businesscentral-ps) includes the `-ApplicationInsightsKey` parameter that you set to the instrumentation key, for example:

    ```
    Mount-NAVTenant -ServerInstance BC150 -Tenant tenant1 -DatabaseName "Demo Database BC (15-0)" -DatabaseServer localhost -DatabaseInstance BCDEMO -ApplicationInsightsKey 11111111-2222-3333-4444-555555555555
    ```

### <a name="LRSQLQuery"></a>Dimensions for long running SQL queries emitted to Application Insights

The following tables explains the columns included in long running query events emitted to Application Insights. Bold text indicates that the value of the columns is a constant. Some columns are standard for Application Insights. These are indicated by *Application Insights*.

|Column|Description or value||
|---------|-----|-----------|
|timestamp|Specifies the date and time that the long running query event occurred, such as 2019-08-20T07:23:07.9996696Z||
|message|**Action took longer than expected**||
|severityLevel|**2** (This indicates a warning. Long running queries are always recorded as warnings)||
|itemType|**trace**||
|customDimensions|(see table that follows)||
|operation_Name|**Long Running Operation (SQL Query)**||
|operation_Id|Specifies the GUID assigned to the client operation. An operation is created whenever the user performs an activity in the client, such as selecting an action.||
|operation_ParentId|Currently this is the same as the operation_Id. This might change in a future release.||
|session_Id|Specifies the GUID of the client session. When a client establishes a connection to the [!INCLUDE[server](../developer/includes/server.md)] instance, a session is created and it is assigned an ID. ||
|client_Type|*Application Insights*||
|client_IP|*Application Insights*||
|client_City|*Application Insights*||
|client_StateOrProvince|*Application Insights*||
|client_CountryOrRegion|*Application Insights*||
|cloud_RoleName|Specifies the display name of [!INCLUDE[prodshort](../developer/includes/prodshort.md)] tenant. For on-premises, this is the same as the cloud_RoleInstance.  ||
|cloud_RoleInstance|Specifies the name of [!INCLUDE[prodshort](../developer/includes/prodshort.md)] tenant. ||
|appId|*Application Insights*||
|appName|*Application Insights*||
|iKey|*Application Insights*||
|sdkVersion|*Application Insights*||

#### CustomDimensions

The following shows an example of the CustomDimensions exported in CSV format.
 
```
{"Long running log threshold (ms)":"65","Telemetry schema version":"0.1","Execution time (ms)":"99","Component":"Navision_NAVPlatform - 15.0.35274.0","Environment type":"Production","SQL Statement":"SELECT \"2161\".\"timestamp\",\"2161\".\"User\",\"2161\".\"Default Execute Time\",\"2161\".\"Current Job Queue Entry\",\"2161\".\"$systemId\" FROM \"SQLDATABASE\".dbo.\"CURRENTCOMPANY$Calendar Event User Config_\" \"2161\"  WITH(UPDLOCK)  WHERE (\"2161\".\"User\"=@0) OPTION(OPTIMIZE FOR UNKNOWN)","Client Type":"Background","AL Stack Trace":"AppObjectType: CodeUnit\r\n  AppObjectId: 2160\r\n  AL CallStack: \"Calendar Event Mangement\"(CodeUnit 2160).GetCalendarEventUserConfiguration line 2\r\n\"Calendar Event Management\"(CodeUnit 2160).FindJobQueue line 1\r\n\"Calendar Event Execution\"(CodeUnit 2161).RunCalendarEvents line 20\r\n\"Calendar Event Execution\"(CodeUnit 2161).OnRun(Trigger) line 1\r\n\"Job Queue Start Codeunit\"(CodeUnit 449).OnRun(Trigger) line 6\r\n\"Job Queue Dispatcher\"(CodeUnit 448).HandleRequest line 18\r\n\"Job Queue Dispatcher\"(CodeUnit 448).OnRun(Trigger) line 12","AL Object Name":"Calendar Event Mangement","AL Object type":"CodeUnit","Company Name":"CRONUS International Ltd.","AL Object ID":"2160"}
```

This table describes the different dimensions.


|Column|Description or value||
|---------|-----|-----------|
|Long running log threshold (ms)|Specifies the amount of time (in milliseconds) that an SQL query can run before a warning event is recorded. This threshold is controlled by the [!INCLUDE[server](../developer/includes/server.md)] configuration setting called SqlLongRunningThreshold. |
|Telemetry schema version|Specifies the version of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] telemetry schema. ||
|Execution time (ms)|Specifies the time in milliseconds that it took to execute the SQL statement.||
|Component|Specifies the [!INCLUDE[server](../developer/includes/server.md)] instance name and the platform version.||
|Environment type|Specifies thee environment type of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] solution, such as Production or Sandbox.|
|SQL Statement|Specifies the SQL statement that was executed for the long running query. The value is limited to 8192 characters. If the value exceeds 8192 characters, it will be truncated in manner that still provides the most pertinent information.||
|Client Type |Specifies the type of client that executed the SQL Statement, such as Background or Web. For a list of the client types, see [ClientType Option Type](../developer/methods-auto/clienttype/clienttype-option.md).||
|AL Stack Trace |The stack trace in AL.||
|AL Object Name|The name of the aL object that executed the SQL statement||
|AL Object Type |The type of the AL object that executed the SQL statement||
|Company Name |The display name of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] company that was used at tome of execution. ||
|AL Object ID |The type of the AL object that executed the SQL statement.||

If you have access to an Application Insights resource in Microsoft Azure, you can configure your tenants to send long running query telemetry there for analysis and presentation.

> [!NOTE]
> Currently, this is only available in a multitenant deployment, where the [!INCLUDE[server](../developer/includes/server.md)] instance is configured as a multitenant instance.



## See Also

[Troubleshooting: Using the Event Log to Monitor Long Running SQL Queries](troubleshoot-long-running-queries-using-event-log.md)  
[Troubleshooting: Analyzing Long Running SQL Queries Involving FlowFields by Disabling SmartSQL](troubleshooting-queries-involving-flowfields-by-disabling-smartsql.md)  
[Set-NAVServerConfiguration](https://go.microsoft.com/fwlink/?linkid=401394)  
[Tools for Monitoring Performance Counters and Events](tools-monitor-performance-counters-and-events.md)  
[Monitoring Business Central Server Using Performance Counters](monitor-server-using-performance-counters.md)  
[Monitoring Business Central Server Events](monitor-server-events.md)  


