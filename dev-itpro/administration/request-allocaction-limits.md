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

|Limit|[!INCLUDE[bp_tabledescription](../developer/includes/bp_tabledescription_md.md)]| Value|  
|---------|--------------------------------------------------------------------------------|------|
|Data Cache Size|The contextual size of the data cache. The value must be in the range 1-20.<br /><br /> Default: 9<br />Dynamically Updatable: Yes| 9| 
|Max Concurrent Calls|The maximum number of concurrent client calls that can be active.|40|  
|Max Data Rows Allowed to Send to Excel|Specifies the maximum number of rows that can be included in an Excel document that is generated from data in a list type page <br /><br /> **Note:** This setting only pertains to list type pages in the client. For other pages types, like cards, the limit on rows is configured in the client.| |
|Maximum Stream Read Size|Specifies the maximum number of bytes that can be read from a stream (InStream object) in a single AL read operation, such a READ or InStream.READTEXT function call. This setting pertains to UTF-8 and UTF-16 text encoding; not MS-DOS encoding. |1000000|

##  <a name="Database"></a> Database limits
  
|Limit|[!INCLUDE[bp_tabledescription](../developer/includes/bp_tabledescription_md.md)]| Value|  
|---------|--------------------------------------------------------------------------------|------|
|Search timeout|Specifies the time (in seconds) that a search operation on lists in the client will continue until it's terminated. When the limit is reached, the following message displays in the client: **Searching for rows is taking too long. Try to search or filter using different criteria.**|00:00:10|
|SQL Bulk Import Batch Size|Specifies how many SQL memory chunks that a data import must be distributed across. Lowering the value increases the number of network transfers and decreases performance, but also lowers the amount of memory that the server instance consumes.| 448|   
|SQL Command Timeout|The contextual time-out for a SQL command.|0:30:00|
|SQL Connection Idle Timeout|Specifies the time that a SQL connection can remain idle before being closed.|00:05:00|
|SQL Connection Timeout|Specifies the time to wait while trying to connect to the database before terminating the attempt and generating an error. This setting also applies to begin, rollback and commit of transactions.|  00:01:30|
|SQL Query Logging Threshold|Specifies the amount of time (in milliseconds) that an SQL query can run before a warning event is recorded in the application log for the server instance. If this threshold is exceeded, the following event is logged: Action completed successfully, but it took longer than the given threshold.|1000|

##  <a name="ClientServices"></a> Client limits
  
|Limit|[!INCLUDE[bp_tabledescription](../developer/includes/bp_tabledescription_md.md)]| Limit|  
|---------|--------------------------------------------------------------------------------|------|
|Chunk Size|The default size for a chunk of data that is transferred between the service and clients| 28 KB| 
|Compression Threshold|The threshold in memory consumption at which the service starts compressing datasets| 64 KB|  
|Max Concurrent Connections|Specifies the maximum number of concurrent client connections that the service accepts. |500|
|Max Items in Object Graph|The maximum number of objects to serialize or deserialize.|  512|
|Max Number of Orphaned Connections|Specifies the maximum number of orphaned connections to be kept alive at the same time for the time that is specified by **ReconnectPeriod**.<br /><br /> A connection is orphaned when the client is involuntarily disconnected from service.<br /><br /> You can also use **MaxValue** as a value to indicate no limit.o| 20| 
|Max Upload Size|The maximum size of files that can be uploaded to or downloaded from the service. Use this setting to avoid out-of-memory errors.|150 MB|  
|Operation Timeout|The maximum time for the service e to return a call from the client.||  
|Reconnect Period|The time during which a client can reconnect to the service.|  00:10:00|

##  <a name="SOAPServices"></a> SOAP rate limits

|Limit|[!INCLUDE[bp_tabledescription](../developer/includes/bp_tabledescription_md.md)]| Limit|  
|---------|--------------------------------------------------------------------------------|------|
|Max Message Size|The maximum permitted size of a SOAP web services request|  1024 KB|

##  <a name="ODataServices"></a> OData rate limits
  
|Limit|[!INCLUDE[bp_tabledescription](../developer/includes/bp_tabledescription_md.md)]| Limit|  
|---------|--------------------------------------------------------------------------------|------|
|Max Connections|ODataMaxConnections|Specifies the maximum number of simultaneous OData requests on the server instance. When the limit is exceeded, a 429 (Too Many Requests) error occurs.| |
|Max Connections Per Tenant|Specifies the maximum number of simultaneous OData requests per tenant. When the limit is exceeded, a 429 (Too Many Requests) error occurs.||
|Max Page Size|ODataServicesMaxPageSize|Specifies the maximum number of entities returned per page of OData results.|  1000|
|Timeout|Specifies the maximum amount of time that the server instance can allocate to a single OData request. When the limit is exceeded, a 408 (Request Timeout) error occurs.|00:05:00|  

## <a name="Task"></a>Task Scheduler Settings

|Limit|[!INCLUDE[bp_tabledescription](../developer/includes/bp_tabledescription_md.md)]| Limit|  
|---------|--------------------------------------------------------------------------------|------|
|  Maximum Concurrent Running Tasks  | Specifies the maximum number of tasks that can run simultaneously on the server instance.<br /><br />If there are many jobs running at the same time, you might experience that the response time for clients gets slower. If the value is too low, it might take longer than desired for scheduled tasks to process.|10|
|  Page Background Task Default Timeout |Specifies the default amount of time that page background tasks can run before being canceled. Page background tasks can be also given a timeout value when enqueued at runtime. The **Page Background Task Default Timeout** setting is used when no timeout is provided when the page background task is enqueued.<|00:02:00|
|  Page Background Task Max Timeout | Specifies the maximum amount of time that page background tasks can run before being canceled. Page background tasks can be also given a timeout value when enqueued at runtime. If a page background task is enqueued with a timeout greater than the **Page Background Task Max Timeout** setting, the **Page Background Task Max Timeout** setting is used instead.|00:10:00|

## Reports Settings

|Limit|[!INCLUDE[bp_tabledescription](../developer/includes/bp_tabledescription_md.md)]| Limit|  
|---------|--------------------------------------------------------------------------------|------|
| Max Execution Timeout | Specifies the maximum execution time that is can take to generate a report. If exceeded, the report will be canceled.|12:00:00|
| Max Rows | Specifies the maximum number of rows that can be processed in a report. If exceeded, the report will be canceled by the server.|1,000,000|
|Mx execution Time for Word report| Specifies the maximum execution time that is can take to generate a report that uses a Word layout. If exceeded, the report will be canceled.|00:30:00|

## Query Settings

|Limit|[!INCLUDE[bp_tabledescription](../developer/includes/bp_tabledescription_md.md)]| Limit|  
|---------|--------------------------------------------------------------------------------|------|
| Max Execution Timeout | QueryTimeout | Specifies the maximum execution time that is can take to generate a query. If exceeded, the query will be canceled.|1,000,000|
| Max Rows | QueryMaxRows | Specifies the maximum number of rows that can be processed in a query. If exceeded, the query will be canceled.|00:30:00|

## API Rate limits

HTTP response code `429 - Too Many Requests` is returned if limits are exceeded.

|              |OData|SOAP|
|--------------|-----|----| 
|**Sandbox**   |300 req/min|300 req/min|
|**Production**|600 req/min|600 req/min|

## Request time out

HTTP response code `504 - Gateway Timeout` is returned when a request exceeds 10-minutes execution time.

## Maximum Connections

The maximum number of simultaneous OData or SOAP requests. 

|OData|SOAP|
|-----|----| 
|100|100|

### Message

HTTP response code `429 - Too Many Requests` is returned if limits are exceeded.

## Operation Timeout

The maximum amount of time that allocated to a single OData or SOAP request.

|OData|SOAP|
|-----|----| 
|00:08:00|00:10:00|

### Message

HTTP response code `408 - Request Timeout` is returned if limits are exceeded.

## Request Size

The maximum size of the OData or SOAP request.

|OData|SOAP|
|-----|----| 
|20,000 entities per page|65,536 kilobytes|

### Message

HTTP response code `413: Request Entity Too Large` is returned if limits are exceeded.


## See Also
[Working with API Rate Limits](dynamics-rate-limits.md)  
[Best practices on transient errors](https://docs.microsoft.com/azure/architecture/best-practices/transient-faults)  
[Using OData Batch request](https://docs.microsoft.com/openspecs/windows_protocols/ms-odata/dd99aa5c-d81e-4eac-9e07-039491356bf6)  
[Microsoft API Terms of Use](https://docs.microsoft.com/legal/microsoft-apis/terms-of-use)