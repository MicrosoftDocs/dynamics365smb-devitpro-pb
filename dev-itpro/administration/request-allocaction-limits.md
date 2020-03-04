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

## Report limits

### 



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