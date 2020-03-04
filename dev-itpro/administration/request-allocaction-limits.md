---
title: "Operation Limits in Dynamics 365 Business Central"
description: ""
author: jswymer
ms.custom: na
ms.date: 01/14/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.author: jswymer
---

# Operational Limits and Strategy

To ensure the availability and quality of Business Central services, there are limits on certain operations. This article describes these limits and, in some cases, the strategy behind them.

For [!INCLUDE[prodshort](../developer/includes/prodshort.md)] online, you can't change these limits, but it's useful to be aware of them. For on-premises installation, you can adjust most of the limits by configuring the [!INCLUDE[server](../developer/includes/server.md)].

#  <a name="General"></a> General limits

|Limit|[!INCLUDE[bp_tabledescription](../developer/includes/bp_tabledescription_md.md)]|  
|-------|-------------------------------------------------------------------|  
|Data Cache Size|The contextual size of the data cache. The value must be in the range 1-20.<br /><br /> Default: 9<br />Dynamically Updatable: Yes|  
|Max Concurrent Calls|The maximum number of concurrent client calls that can be active on this [!INCLUDE[server](../developer/includes/server.md)] instance.<br /><br />Range: 1 - 2,147,483,647<br /><br /> You can also use **MaxValue** as a value to indicate no limit.<br /><br />Default: 40<br />Dynamically Updatable: No|  
|Max Data Rows Allowed to Send to Excel|MaxRowsToExportToExcel|Specifies the maximum number of rows that can be included in an Excel document that is generated from data in a list type page in the client.<br /><br /> If you don't want to have a limit on rows, set the value to **MaxValue**.<br /><br /> **Note:** This setting only pertains to list type pages in the client. For other pages types, like cards, the limit on rows is configured in the client.<br /><br />Default: MaxValue<br />Dynamically Updatable: Yes|
|Maximum Stream Read Size|Specifies the maximum number of bytes that can be read from a stream (InStream object) in a single AL read operation, such a READ or InStream.READTEXT function call. This setting pertains to UTF-8 and UTF-16 text encoding; not MS-DOS encoding.<br /><br />Default: 1000000<br />Dynamically Updatable: Yes|

##  <a name="Database"></a> Database limits
  
The following table describes fields on the **Database** tab in the [!INCLUDE[admintool](../developer/includes/admintool.md)].  

> [!NOTE]  
>  If the [!INCLUDE[server](../developer/includes/server.md)] instance is configured as a multitenant server instance, then except for the **Database Name**, **Database Instance**, and **Database Server** settings, the settings apply to both the application database and the tenant database.  

|Setting|[!INCLUDE[bp_tabledescription](../developer/includes/bp_tabledescription_md.md)]|  
|-------|-------------------------------------------------------------------|
|Search Timeout|Specifies the time (in seconds) that a search operation on lists in the client will continue until it's terminated. When the limit is reached, the following message displays in the client: **Searching for rows is taking too long. Try to search or filter using different criteria.**<br /><br />Time format: hh:mm:ss<br />Default: 00:00:10<br />Dynamically Updatable: Yes|
|SQL Bulk Import Batch Size|Specifies how many SQL memory chunks that a data import must be distributed across. Lowering the value increases the number of network transfers and decreases performance, but also lowers the amount of memory that the server instance consumes. If the database is on SQL Server 2016 or later, a low value can lead to large data files. If you don't want to use batching, specify 0.<br /><br /> Default: 448<br />Dynamically Updatable: No|    
|SQL Command Timeout|The contextual time-out for a SQL command.<br /><br /> Default: 0:30:00<br />Dynamically Updatable: No|
|SQL Connection Idle Timeout|Specifies the time that a SQL connection can remain idle before being closed. The value has the format HH:MM:SS.<br /><br /> Default: 00:05:00<br />Dynamically Updatable: Yes|
|SQL Connection Timeout|Specifies the time to wait while trying to connect to the database before terminating the attempt and generating an error. This setting also applies to begin, rollback and commit of transactions. <br /><br />The value has the format HH:MM:SS.<br /><br /> Default: 00:01:30<br />Dynamically Updatable: Yes|  
|SQL Query Logging Threshold|Specifies the amount of time (in milliseconds) that an SQL query can run before a warning event is recorded in the application log for the server instance. If this threshold is exceeded, the following event is logged: Action completed successfully, but it took longer than the given threshold.<br /><br /> Default: 1000<br />Dynamically Updatable: Yes|

##  <a name="ClientServices"></a> Client limits
  
|Setting|Key Name|[!INCLUDE[bp_tabledescription](../developer/includes/bp_tabledescription_md.md)]|  
|-------|--------|-------------------------------------------------------------------|  
|Chunk Size|The default size for a chunk of data that is transferred between [!INCLUDE[server](../developer/includes/server.md)] and the [!INCLUDE[nav_windows](../developer/includes/nav_windows_md.md)] or [!INCLUDE[webserver](../developer/includes/webserver.md)], in kilobytes.<br /><br /> The range of values is from 4 to 80.<br /><br /> Default: 28<br />Dynamically Updatable: No|  
|Compression Threshold|The threshold in memory consumption at which [!INCLUDE[server](../developer/includes/server.md)] starts compressing datasets, in kilobytes.<br /><br /> Default: 64<br />Dynamically Updatable: No|  
|  Keep Alive Interval  | Specifies the time interval between keep-alive messages that are sent from the [!INCLUDE[nav_windows](../developer/includes/nav_windows_md.md)] to the server instance. This setting is used to keep inactive sessions alive until the time that is specified by the **Idle Client Timeout** setting expires. You should use a time interval that is less than the **Idle Client Timeout** setting, to hold the session constantly alive. For more information, see [Understanding Session Timeouts](understanding-session-timeouts.md).<br /><br />Time interval format: [dd.]hh:mm:ss[.ff] <br /><br />Default: 120 <br />Dynamically Updatable: No | 
|Max Concurrent Connections|Specifies the maximum number of concurrent client connections that the current [!INCLUDE[server](../developer/includes/server.md)] instance accepts. You can use **MaxValue** as a value to indicate no limit.<br /><br /> Default: 500<br />Dynamically Updatable: No|
|Max Items in Object Graph|The maximum number of objects to serialize or deserialize.<br /><br /> Default: 512<br />Dynamically Updatable: No|  
|Max Number of Orphaned Connections|Specifies the maximum number of orphaned connections to be kept alive at the same time for the time that is specified by **ReconnectPeriod**.<br /><br /> A connection is orphaned when the client is involuntarily disconnected from [!INCLUDE[server](../developer/includes/server.md)].<br /><br /> You can also use **MaxValue** as a value to indicate no limit.<br /><br /> Default: 20<br />Dynamically Updatable: No|  
|Max Upload Size|The maximum size of files that can be uploaded to or downloaded from [!INCLUDE[server](../developer/includes/server.md)], in megabytes. Use this setting to avoid out-of-memory errors.<br /><br /> Default: 150<br />Dynamically Updatable: No|  
|Operation Timeout|The maximum time that [!INCLUDE[server](../developer/includes/server.md)] can take to return a call from the client.<br /><br /> Time span format: \[dd.\]hh:mm:ss\[.ff\]<br /><br /> Where:<br />dd: days<br />hh: hours<br /> mm: minutes<br />ss: seconds<br />ff: hundredths of a second<br /><br /> You can also use **MaxValue** as a value to indicate no time-out. <br /><br /> Default: MaxValue<br />Dynamically Updatable: No|  
|Reconnect Period|The time during which a client can reconnect to a running instance of [!INCLUDE[server](../developer/includes/server.md)].<br /><br /> Time span format: \[dd.\]hh:mm:ss\[.ff\]<br /><br /> Where:<br />dd: days<br /> hh: hours<br /> mm: minutes<br /> ss: seconds<br /> ff: hundredths of a second<br /><br /> You can also use **MaxValue** as a value to indicate no time limit.<br /><br /> Default: 00:10:00<br />Dynamically Updatable: No|  

##  <a name="SOAPServices"></a> SOAP rate limits
 

|Setting|Key Name|[!INCLUDE[bp_tabledescription](../developer/includes/bp_tabledescription_md.md)]|  
|-------|--------|-------------------------------------------------------------------|  
|Max Message Size|The maximum permitted size of a SOAP web services request, in kilobytes.<br /><br /> **Important:** This setting also pertains to OData web services.<br /><br /> Default: 1024<br />Dynamically Updatable: No|  

##  <a name="ODataServices"></a> OData rate limits
  

|Setting|[!INCLUDE[bp_tabledescription](../developer/includes/bp_tabledescription_md.md)]|  
|-------|----|-------------------------------------------------------------------|  
|Max Connections|ODataMaxConnections|Specifies the maximum number of simultaneous OData requests on the server instance (for all tenants). When the limit is exceeded, a 429 (Too Many Requests) error occurs. If you don't want a limit, set the value 0.<br /><br />OData requests consume server instance resources and can affect the performance of the clients if the number of requests gets too large. This setting enables you to control the resources allocated for OData requests. <br /><br /> Default: 0<br />Dynamically Updatable: Yes| 
|Max Connections Per Tenant|ODataMaxConnectionsPerTenant|Specifies the maximum number of simultaneous OData requests per tenant. When the limit is exceeded, a 429 (Too Many Requests) error occurs. If you don't want a limit, set the value 0.<br /><br />If the server isn't configured for multitenancy or only has a single tenant, then this setting does the same as the **Max Connections** (ODataMaxConnections) setting.<br /><br />OData requests consume server instance resources and can affect the performance of the clients if the number of requests gets too large. This setting enables you to control the resources allocated for OData requests.<br /><br /> Default: 0<br />Dynamically Updatable: Yes|   
|Max Page Size|ODataServicesMaxPageSize|Specifies the maximum number of entities returned per page of OData results. For more information, see [Server-Driven Paging in OData Web Services](../webservices/Server-Driven-Paging-in-OData-Web-Services.md).<br /><br /> Default: 1000<br />Dynamically Updatable: No|  
|Timeout|ODataServicesOperationTimeout |Specifies the maximum amount of time that the server instance can allocate to a single OData request. When the limit is exceeded, a 408 (Request Timeout) error occurs. <br /><br />If you don't want a limit, set the value to `MaxValue`.<br /><br /> Time format: hh:mm:ss<br />Default: 00:05:00<br />Dynamically Updatable: Yes|  

## <a name="Task"></a>Task Scheduler Settings

The following table describes fields on the **Task Scheduler** tab in the [!INCLUDE[admintool](../developer/includes/admintool.md)].

The task scheduler processes jobs and other processes on a scheduled basis. For more information about task scheduler, see [Task Scheduler](../developer/devenv-task-scheduler.md).

|  Setting  |Key Name|  Description  |
|-----------|--------|---------------|
|  Maximum Concurrent Running Tasks  | TaskSchedulerMaximumConcurrentRunningTasks| Specifies the maximum number of tasks that can run simultaneously on the server instance.<br /><br />The value that you specify will depend on the hardware (CPUs) of the deployment environment and what you want to prioritize: client performance or scheduled tasks (such as job queue entries). The setting is particularly relevant when the server instance is used for both scheduled tasks and client services. If there are many jobs running at the same time, you might experience that the response time for clients gets slower. In which case, you could decrease the value. However, if the value is too low, it might take longer than desired for scheduled tasks to process. When you've a dedicated server instance for scheduled tasks, this setting is less important with respect to client performance. <br /><br />Default: 10 <br />Dynamically Updatable: Yes|
|  Page Background Task Default Timeout | PageBackgroundTaskDefaultTimeout|Specifies the default amount of time that page background tasks can run before being canceled. Page background tasks can be also given a timeout value when enqueued at runtime. The **Page Background Task Default Timeout** setting is used when no timeout is provided when the page background task is enqueued.<br /><br />The value has the format hh:mm:ss. <br /><br />Default: 00:02:00 <br />Dynamically Updatable: Yes|
|  Page Background Task Max Timeout | PageBackgroundTaskMaxTimeout|Specifies the maximum amount of time that page background tasks can run before being canceled. Page background tasks can be also given a timeout value when enqueued at runtime. If a page background task is enqueued with a timeout greater than the **Page Background Task Max Timeout** setting, the **Page Background Task Max Timeout** setting is used instead.<br /><br />The value has the format hh:mm:ss. <br /><br />Default: 00:10:00 <br />Dynamically Updatable: Yes|
|  System Task Start Time  | TaskSchedulerSystemTaskStartTime| Specifies the time of day after which system tasks can start. The time is based on the time zone of the computer that is running the server instance. <br /><br />The value has the format HH:MM:SS.<br /><br />Default: 00:00:00 <br />Dynamically Updatable: Yes|
|  System Task End Time  | TaskSchedulerSystemTaskEndTime| Specifies the time of day after which system tasks can't start. The time is based on the time zone of the computer that is running the server instance. <br /><br />The value has the format HH:MM:SS.<br /><br />Default: 23:59:59 <br />Dynamically Updatable: Yes|

## Reports Settings

The following table describes fields on the **Reports** tab in the [!INCLUDE[admintool](../developer/includes/admintool.md)].

|  Setting  |Key Name|  Description  |
|-----------|--------|---------------|
| Max Execution Timeout | ReportTimeout | Specifies the maximum execution time that is can take to generate a report. If exceeded, the report will be canceled by the server. If you don't want a limit, set the value to **MaxValue**.<br /><br />Timeout format: [dd.]hh:mm:ss[.ff]<br /><br />Default: MaxValue<br />Dynamically Updatable: Yes|
| Max Rows | ReportMaxRows | Specifies the maximum number of rows that can be processed in a report. If exceeded, the report will be canceled by the server. You can also use MaxValue to indicate no limit. If you don't want a limit, set the value to **MaxValue**.<br /><br />Default: MaxValue<br />Dynamically Updatable: Yes|

## Query Settings

The following table describes fields on the **Query** tab in the [!INCLUDE[admintool](../developer/includes/admintool.md)].

|  Setting  |Key Name|  Description  |
|-----------|--------|---------------|
| Max Execution Timeout | QueryTimeout | Specifies the maximum execution time that is can take to generate a query. If exceeded, the query will be canceled by the server. If you don't want a limit, set the value to **MaxValue**.<br /><br />Timeout format: [dd.]hh:mm:ss[.ff]<br /><br />Default: MaxValue<br />Dynamically Updatable: Yes|
| Max Rows | QueryMaxRows | Specifies the maximum number of rows that can be processed in a query. If exceeded, the query will be canceled by the server. You can also use MaxValue to indicate no limit. If you don't want a limit, set the value to **MaxValue**.<br /><br />Default: MaxValue<br />Dynamically Updatable: Yes|

## API Rate limits

HTTP response code `429 - Too Many Requests` is returned if limits are exceeded.

|              |OData|SOAP|
|--------------|-----|----| 
|**Sandbox**   |300 req/min|300 req/min|
|**Production**|600 req/min|600 req/min|

## Request time out

HTTP response code `504 - Gateway Timeout` is returned when a request exceeds 10-minutes execution time



## Web services rate limits

HTTP response code `429 - Too Many Requests` is returned if limits are exceeded. 

|              |OData|SOAP|
|--------------|-----|----| 
|**Sandbox**   |300 req/min|300 req/min|
|**Production**|600 req/min|600 req/min|

## Request timeout

HTTP response code `504 - Gateway Timeout` is returned when a request exceeds 10-minutes execution time.


## Maximum Connections

The maximum number of simultaneous OData or SOAP requests. HTTP response code `429 - Too Many Requests` is returned if limits are exceeded.

|OData|SOAP|
|-----|----| 
|100|100|

## Operation Timeout

The maximum amount of time given to a single OData or SOAP request. HTTP response code `408 - Request Timeout` is returned if limits are exceeded.

|OData|SOAP|
|-----|----| 
|00:08:00|00:10:00|

## Request Size

The maximum size of the OData or SOAP request. HTTP response code `413: Request Entity Too Large` is returned if limits are exceeded.

|OData|SOAP|
|-----|----| 
|20000 entities per page|65,536 kilobytes|


## See Also
[Working with API Rate Limits](dynamics-rate-limits.md)  
[Best practices on transient errors](https://docs.microsoft.com/azure/architecture/best-practices/transient-faults)  
[Using OData Batch request](https://docs.microsoft.com/openspecs/windows_protocols/ms-odata/dd99aa5c-d81e-4eac-9e07-039491356bf6)  
[Microsoft API Terms of Use](https://docs.microsoft.com/legal/microsoft-apis/terms-of-use)