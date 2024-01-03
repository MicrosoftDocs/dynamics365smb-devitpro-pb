---
title: "Operation Limits in Dynamics 365 Business Central"
description: "Learn about constraints on what you can do in Business Central online that is different from what you can do with on-premises deployments."
author: jswymer
ms.custom: na
ms.date: 03/16/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.author: jswymer
---

# Operational Limits for Business Central Online

To ensure the availability and quality of Business Central services, there are limits on certain operations. This article describes the limits and, in some cases, the strategy behind them.

> [!TIP]
> Telemetry is gathered on some of the operations that have a limit. The telemetry provides insight into operations for which limits were exceeded. For more information, see [Monitoring and Analyzing Telemetry](telemetry-overview.md).

<!--
For [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online, you can't change these limits, but it's useful to be aware of them. For on-premises installation, you can adjust most of the limits by configuring the [!INCLUDE[server](../developer/includes/server.md)].
-->

## <a name="ClientServices"></a>Client connection limits
  
|Setting|[!INCLUDE[bp_tabledescription](../developer/includes/bp_tabledescription_md.md)]|Limit|  
|---------|--------------------------------------------------------------------------------|------|
|Reconnect period|The time during which a client can reconnect to the service after being disconnected.|  10 minutes|

<!-- These settings are per node. We should not expose these to partners 
|Max concurrent calls|The maximum number of concurrent client calls that can be active.|1000|  
|Max concurrent connections|The maximum number of concurrent client connections that the service accepts. |500|
|Max number of orphaned connections|The maximum number of orphaned connections to be kept alive at the same time for the time that is specified by **ReconnectPeriod**.<br /><br /> A connection is orphaned when the client is involuntarily disconnected from service.<br /><br /> You can also use **MaxValue** as a value to indicate no limit.o| 20|
-->

<!-- No limit
|Operation timeout|The maximum time for the service to return a call from the client.||  
-->

## <a name="DataHandling"></a>Data handling limits
  
|Setting|[!INCLUDE[bp_tabledescription](../developer/includes/bp_tabledescription_md.md)]|Limit|  
|---------|--------------------------------------------------------------------------------|------|
|Max items in object graph|The maximum number of objects to serialize or deserialize.|  10,000|
|Max file size|The maximum size of files that can be uploaded to or downloaded from the service.|350 MB|
|Maximum stream read size|The maximum number of bytes that can be read from a stream (InStream object) in a single AL read operation. Examples include READ or InStream.READTEXT method calls. This setting pertains to UTF-8 and UTF-16 text encoding; not MS-DOS encoding. |1,000,000 bytes|

<!--
|Max data rows allowed to send to Excel|The maximum number of rows that can be included in an Excel document generated from a list type page <br /><br /> **Note:** This setting only pertains to list type pages in the client. For other page types, the limit on rows is configured in the client.| |    
|Data cache size|The contextual size of the data cache.| 9| 
|Chunk size|The default size for a chunk of data that is transferred between the service and clients| 28 KB| 
|Compression threshold|The threshold in memory consumption at which the service starts compressing datasets| 64 KB|
-->

## <a name="Database"></a>Database limits
  
|Setting|[!INCLUDE[bp_tabledescription](../developer/includes/bp_tabledescription_md.md)]|Value|  
|---------|--------------------------------------------------------------------------------|------|
|Search timeout|The time (in seconds) that a search operation on lists in the client continues before it's stopped. When the limit is reached, the following message displays in the client: **Searching for rows took long and was stopped. Try to search or filter using different criteria.**|10 seconds|
|SQL command timeout|The contextual time-out for a SQL command.|30 minutes|
|SQL connection idle timeout|The time that a SQL connection can remain idle before being closed.|5 minutes|
|SQL connection timeout|The time to wait for the service to connect to the database. When the time is exceeded, the attempt is canceled and an error occurs. This setting also applies to the beginning, rollback, and commit of transactions.|1.5 minutes|
|Long-running SQL query threshold|The amount of time that an SQL query can run before a warning telemetry event occurs. If this threshold is exceeded, the following event is logged: Action completed successfully, but it took longer than the given threshold.|1000 ms|

<!--
|SQL bulk import batch size|Specifies how many SQL memory chunks a data import must be distributed across.| 448|
-->

## <a name="Task"></a>Asynchronous task limits (per environment)

|Setting|[!INCLUDE[bp_tabledescription](../developer/includes/bp_tabledescription_md.md)]|Limit|  
|-------|--------------------------------------------------------------------------------|-----|
|Background sessions default wait timeout|The maximum amount of time in hours for a background session to wait before being processed.|8|
|Background sessions max concurrency|The maximum number of background sessions that can be processed at the same time. Background sessions that come in when this limit is exceeded will wait in a queue until a time slot becomes available.|10|
|Background sessions max queued|The maximum number of background sessions that can be queued, waiting to be processed. When this limit is exceeded, an error occurs.|100|
|Child sessions max concurrency|The maximum number of child sessions per parent session that can be processed at the same time. Child sessions that come in when this limit is exceeded will wait in a queue until a time slot becomes available.|5|
|Child sessions max queue length|The maximum number of child sessions per parent session that can be queued, waiting to be processed. When this limit is exceeded, an error occurs.|100|
|Maximum concurrently running scheduled tasks|The maximum number of tasks that could simultaneously run in an environment was set to 3 in the past. To increase throughput, this per-environment limit has now been changed to a per-user limit |See the current [per-user limit](#TaskUser).|
|Maximum session recursion depth|The maximum number of nested sessions that can be created before being considered excessive recursion. When this limit is exceeded, an error occurs with the following message: **Excessive recursive session creation detected, original session ID: \[id\], current session ID: \[id\].**|14|
|Page background task default timeout|The default amount of time in minutes for a page background task to run before being canceled. A timeout value can also be provided when page background tasks are enqueued at run-time. This limit is used if no timeout value is provided.|2|
|Page background task max timeout|The maximum amount of time in minutes for a page background task to run before being canceled. A timeout value can also be provided when page background tasks are enqueued at run-time. Timeout values greater than this limit will be ignored.|10|

## <a name="TaskUser"></a>Asynchronous task limits (per user)

|Setting|[!INCLUDE[bp_tabledescription](../developer/includes/bp_tabledescription_md.md)]|Limit|  
|-------|--------------------------------------------------------------------------------|-----|
|Maximum concurrently running scheduled tasks|The maximum number of tasks that can be simultaneously run by a user. The more users you have in your environment, the more tasks you can simultaneously run in it, as long as we can continuously scale our resources. If many tasks are running at the same time and we couldn't sufficiently scale our resources, you might experience delays in running your tasks.|5, see [frequently asked questions on per-user limits](#FAQsUser).|

## <a name="Reports"></a>Report limits

|Setting|[!INCLUDE[bp_tabledescription](../developer/includes/bp_tabledescription_md.md)]|Limit|  
|---------|--------------------------------------------------------------------------------|------|
|Default max documents | The maximum number of documents that can be merged in a report using a Word layout. Users can override this setting on a report-basis from the report request page. If exceeded, the report will be canceled.<br /><br />Developers can override this setting by using [MaximumDocumentCount property](../developer/properties/devenv-maximumdocumentcount-property.md) of a report. Client users can do the same when running a report from the report request page|200|
|Max documents | The maximum number of documents that can be merged in a report using a Word layout. If exceeded, the report will be canceled.|500|
|Default max execution timeout | The maximum execution time that it can take to generate a report by default. Users can override this setting on a report-basis from the report request page. If exceeded, the report will be canceled.<br /><br />Developers can override this setting by using the [ExecutionTimeout property](../developer/properties/devenv-executiontimeout-property.md) of a report. Client users can do the same via **Report Limits and Settings** page, or when running a report from the report request page as a one-time change.|6 hours|
|Max execution timeout | The maximum execution time that it can take to generate a report. If exceeded, the report will be canceled.|12 hours|
|Default max rows|The maximum number of rows that can be processed in a report by default. Users can override this setting on a report-basis from the report request page. If exceeded, the report will be canceled.<br /><br />Developers can override this setting by using the [MaximumDataSetSize property](../developer/properties/devenv-maximumdatasetsize-property.md) of a report. Client users can do the same when running a report from the report request page.|500,000|
|Max rows | The maximum number of rows that can be processed in a report. If exceeded, the report will be canceled by the server.|1,000,000|

## Query limits

|Setting|[!INCLUDE[bp_tabledescription](../developer/includes/bp_tabledescription_md.md)]|Limit|  
|---------|--------------------------------------------------------------------------------|------|
| Max execution timeout | The maximum execution time that it can take to generate a query. If exceeded, the query will be canceled.|30 minutes|
| Max rows | The maximum number of rows that can be processed in a query. If exceeded, the query will be canceled.|1,000,000|

## Company limit (per environment)

|Setting|[!INCLUDE[bp_tabledescription](../developer/includes/bp_tabledescription_md.md)]|Limit|  
|---------|--------------------------------------------------------------------------------|------|
| Max companies | The maximum number of companies that can be contained in one environment.|300|

> [!TIP]  
> This company limit will take effect in 2023 wave 1 release. When in effect, exceeding the limit will prevent you from doing some environment operations. For information about the consequences of exceeding the limit, go to [Operational challenges with many companies per environment](environment-company-limit.md).
>
> If you already have more than 300 companies in one environment, distribute them across more environments to avoid problems later.

## <a name="ODataServices"></a>OData request limits (per environment)
  
|Setting|[!INCLUDE[bp_tabledescription](../developer/includes/bp_tabledescription_md.md)]|Limit|  
|-------|--------------------------------------------------------------------------------|-----|
|Max body size|The maximum request body size in MB.|350|
|Max concurrent requests|The maximum number of OData V4 requests that can be processed at the same time. Requests that come in when this limit is exceeded will wait in a queue until a time slot becomes available. They wait in the queue until they time out after 8 minutes, where an HTTP response code `503 - Service Temporarily Unavailable` is returned. To increase throughput, this per-environment limit will be changed to a per-user limit in the future.|5, see the future [per-user limit](#ODataServicesUser).|
|Max connections|The maximum number of simultaneous OData V4 requests, including processed and queued requests. When this limit is exceeded, an HTTP response code `429 - Too Many Requests` is returned. To increase throughput, this per-environment limit will be changed to a per-user limit in the future.|100, see the future [per-user limit](#ODataServicesUser).|
|Max page size|The maximum number of entities that can be returned for an OData V4 request.|20,000|
|Max batch size|The maximum number of operations in an OData V4 $batch request.|100|
|Max request queue size|The maximum number of queued OData V4 requests, waiting to be processed. When this limit is exceeded, an HTTP response code `429 - Too Many Requests` is returned. To increase throughput, this per-environment limit will be changed to a per-user limit in the future.|95, see the future [per-user limit](#ODataServicesUser).|
|Rate|The maximum number of OData V4 requests that can be submitted in a minute. When this limit is exceeded, an HTTP response code `429 - Too Many Requests` is returned. To increase throughput, this per-environment limit will be changed to a per-user limit in the future.|Sandbox: 300, Production: 600, see the future [per-user limit](#ODataServicesUser).| 
|Operation timeout|The maximum amount of time in minutes allocated to an OData V4 request. When this limit is exceeded, an HTTP response code `408 - Request Timeout` is returned and the relevant session is canceled.|8|
|Max number of webhook subscriptions|The maximum number of webhook subscriptions.|200|

<!--
|Request timeout|HTTP response code `504 - Gateway Timeout` is returned when a request exceeds the 10-minute execution time.|10 minutes|
-->

## <a name="ODataServicesUser"></a>OData request limits (per user, will be set in the future)
  
|Setting|[!INCLUDE[bp_tabledescription](../developer/includes/bp_tabledescription_md.md)]|Limit|  
|-------|--------------------------------------------------------------------------------|-----|
|Max concurrent requests|The maximum number of OData V4 requests that can be processed at the same time. Requests that come in when this limit is exceeded will wait in a queue until a time slot becomes available. They wait in the queue until they time out after 8 minutes, where an HTTP response code `503 - Service Temporarily Unavailable` is returned. The more users you have in your environment, the more requests you can simultaneously process in it, as long as we can continuously scale our resources. If many requests are being processed at the same time and we couldn't sufficiently scale our resources, you might experience delays/throttling in processing your requests.|5, see [frequently asked questions on per-user limits](#FAQsUser).|
|Max connections|The maximum number of simultaneous OData V4 requests, including processed and queued requests. When this limit is exceeded, an HTTP response code `429 - Too Many Requests` is returned.|100, see [frequently asked questions on per-user limits](#FAQsUser).|
|Max request queue size|The maximum number of queued OData V4 requests, waiting to be processed. When this limit is exceeded, an HTTP response code `429 - Too Many Requests` is returned.|95, see [frequently asked questions on per-user limits](#FAQsUser).|
|Rate|The maximum number of OData V4 requests that can be submitted within a 5-minute sliding window. When this limit is exceeded, an HTTP response code `429 - Too Many Requests` is returned. The more users you have in your environment, the more requests you can submit to it around the same time, as long as we can continuously scale our resources. If many requests are being submitted around the same time and we couldn't sufficiently scale our resources, you might experience throttling in submitting your requests.|6000, see [frequently asked questions on per-user limits](#FAQsUser).| 

## <a name="SOAPServices"></a>SOAP request limits (per environment)

|Setting|[!INCLUDE[bp_tabledescription](../developer/includes/bp_tabledescription_md.md)]|Limit|  
|-------|--------------------------------------------------------------------------------|-----|
|Max concurrent requests|The maximum number of SOAP requests that can be processed at the same time. Requests that come in when this limit is exceeded will wait in a queue until a time slot becomes available. They wait in the queue until they time out after 8 minutes, where an HTTP response code `503 - Service Temporarily Unavailable` is returned.|5|
|Max connections|The maximum number of simultaneous SOAP requests, including processed and queued requests. When the limit is exceeded, an HTTP response code `429 - Too Many Requests` is returned.|100|
|Max message size|The maximum size in KB of a SOAP request.|65,536|
|Max request queue size|The maximum number of queued SOAP requests, waiting to be processed. When this limit is exceeded, an HTTP response code `429 - Too Many Requests` is returned.|95|
|Rate|The maximum number of SOAP requests that can be submitted in a minute. When this limit is exceeded, an HTTP response code `429 - Too Many Requests` is returned.|Sandbox: 300, Production: 600|
|Operation timeout|The maximum amount of time in minutes allocated to a SOAP request. When this limit is exceeded, an HTTP response code `408 - Request Timeout` is returned.|8|

> [!TIP]  
> Throttling could occur when many requests are submitted and handled (processed/queued) around the same time and they're taking a long time to complete. To optimize throughput, please use API or OData instead of SOAP, as they execute faster. 

<!--
|Request timeout|HTTP response code `504 - Gateway Timeout` is returned when a request exceeds 10-minutes execution time.|10 minutes|
-->

## <a name="FAQsUser"></a>Frequently asked questions on per-user limits

This section includes frequently asked questions on per-user limits. If you have questions that are not answered, please post them in the **Feedback** section below by submitting feedback about this page.

### How do these limits apply to how many requests or other resource consumption units a user is entitled to each day?

These operational limits control "how fast" you can consume resources simultaneously or in short periods (per second/minute) and are not related to entitlement quotas that control "how much" you can consume resources in longer periods (per day/week/month). At present, we haven't set definite entitlement quotas, but will do so in the future.

### Are limits applied differently for application users?

No. These operational limits are applied to all users in the same way.

## See Also

[Working with API Rate Limits](../api-reference/v2.0/dynamics-rate-limits.md)  
[Microsoft API Terms of Use](/legal/microsoft-apis/terms-of-use)
