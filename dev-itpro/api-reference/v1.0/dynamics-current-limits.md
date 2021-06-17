---
title: "API Limits in Dynamics 365 Business Central (v1.0)"
description: "Describes current API limits in Business Central (v1.0)"
author: jswymer
ms.custom: na
ms.date: 01/14/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: jswymer
---

# Current API Limits (v1.0)

This article lists the different limits that are set on OData and SOAP requests. The limits are subject to change, following the [Microsoft API Terms of Use](/legal/microsoft-apis/terms-of-use).

## API Rate limits

HTTP response code `429 - Too Many Requests` is returned if limits are exceeded.

|              |OData|SOAP|
|--------------|-----|----| 
|**Sandbox**   |300 req/min|300 req/min|
|**Production**|600 req/min|600 req/min|

## Request time out

HTTP response code `504 - Gateway Timeout` is returned when a request exceeds 10-minutes execution time.

## Maximum Requests

The maximum number of simultaneous and pending OData or SOAP requests. HTTP response code `429 - Too Many Requests` is returned if limits are exceeded.

|Limit|OData|SOAP|
|-----|-----|----| 
|Max concurrent requests|5|5|
|Max queued requests |95|95|
|Max connections|100|100|

The **Max connections** is a combination of **Max concurrent requests** and **Max queued requests**.

## Operation Timeout

The maximum amount of time that allocated to a single OData or SOAP request. HTTP response code `408 - Request Timeout` is returned if limits are exceeded.

|OData|SOAP|
|-----|----| 
|00:08:00|00:10:00|

## Request Size

The maximum size of the OData or SOAP request. HTTP response code `413: Request Entity Too Large` is returned if limits are exceeded.

|OData|SOAP|
|-----|----| 
|20,000 entities per page|65,536 kilobytes|


## See Also

[Working with API Rate Limits](dynamics-rate-limits.md)  
[Best practices on transient errors](/azure/architecture/best-practices/transient-faults)  
[Using OData Batch request](/openspecs/windows_protocols/ms-odata/dd99aa5c-d81e-4eac-9e07-039491356bf6)  
[Microsoft API Terms of Use](/legal/microsoft-apis/terms-of-use)