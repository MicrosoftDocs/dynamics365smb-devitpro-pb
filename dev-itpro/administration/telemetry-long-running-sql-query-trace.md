---
title: Telemetry | Microsoft Docs
description: Learn how the Business Central provides telemetry for each environment.  
author: jswymer
ms.service: dynamics365-business-central
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 11/15/2019
ms.author: jswymer
---

# Long Running Operation (SQL Query)


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


## Telemetry in the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)]
The [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] provides telemetry for the tenant environments to enable troubleshooting and support for the tenant. The Telemetry tab provides telemetry of top-level AL events, and any errors resulting from calls through the telemetry stack.

To filter the telemetry for an environment:

1. Select a base point-in-time for the timestamp of the telemetry messages.
2. Enter a number of minutes before or after the base point-in-time to set a range of time for the timestamp. A negative number indicates a number of minutes before the base point-in-time, and a positive number indicates a number of minutes following the base point-in-time. For example, a value of *-15* will filter the telemetry messages to a timestamp range of up to 15 minutes before the base point-in-time.
3. Choose the message type.
4. Choose the environment.
5. Select **Filter**.

## Sending telemetry to Microsoft Azure Application Insights (Preview)

You can set up your environments to send telemetry to Application Insights. Application Insights is a service hosted within Azure that gathers telemetry data for analysis and presentation. For more information, see [What is Application Insights?](/azure/azure-monitor/app/app-insights-overview).

Currently, the only telemetry that [!INCLUDE[prodshort](../developer/includes/prodshort.md)] emits to Application Insights pertains to long running SQL queries. We expect to add more telemetry in future updates.

Identifying long running SQL queries on a tenant database can be a good starting point when doing performance analysis, and Application Insights provides tools that can help you in this task.

### Enable sending telemetry to Application Insights

> [!IMPORTANT]  
> This process requires a restart to the environment, which is triggered automatically after step 5. Plan to do this during non-working hours to avoid disruptions.

1. If you don't already have one, get a subscription to [Microsoft Azure](https://azure.microsoft.com).
2. Create an Application Insights resource in Azure.

    The Application Insights resource will be assigned an instrumentation key. Copy this key because you will need it to enable Application Insights in the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)].  
    
    The Application Insights instrumentation key can be in any Azure tenant that your organization has access to. For example, a delegated administrator from the reselling partner is the one analyzing the telemetry, and they might not have access to the customer's Azure instance. This scenario enables the partner to send the telemetry to their own Application Insights instance.

    For more information, see [Create an Application Insights resource](/azure/azure-monitor/app/create-new-resource).

3. In the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)], on the **Environments** tab, select **Application Insights Key**.
4. On the **Application Insights Key** page, enter the instrumentation key in the **Instrumentation Key** field.
5. Select **Save**.

### Analyze long running SQL queries

Any SQL query that takes longer than 1000 milliseconds to execute will be sent to your Application Insights resource. To get a quick overview, you can go the [Application Insights Overview dashboard](/azure/azure-monitor/app/overview-dashboard).

For details about the long running SQL query telemetry information and dimensions sent from [!INCLUDE[prodshort](../developer/includes/prodshort.md)], see [Dimensions for long running SQL queries](monitor-long-running-sql-queries-event-log.md#LRSQLQuery).

There are multiple reasons that can affect the time it takes SQL queries to run. For example, the database could be waiting for a lock to be released or the database is executing an operation that performs badly because of missing indexes. In some cases, you can see what caused the delay by looking at the SQL statement that was generated by the code. This information can be found in the **CustomDimension** data, specifically the **AL Stack Trace** column.


## See also

[Working with Administration Tools](administration.md)  
[The Business Central Administration Center](tenant-admin-center.md)  
[Managing Environments](tenant-admin-center-environments.md)  
[Managing Tenant Notifications](tenant-admin-center-notifications.md)  
[Introduction to automation APIs](itpro-introduction-to-automation-apis.md)  
