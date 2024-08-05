---
title: API Limits in Dynamics 365 Business Central (v1.0)
description: Describes current API limits in Business Central (v1.0).
author: jswymer
ms.custom: evergreen
ms.date: 07/02/2024
ms.topic: article
ms.author: jswymer
ms.reviewer: solsen
---

# Current API limits (v1.0)

This article lists the different limits that are set on OData and SOAP requests. The limits are subject to change, following the [Microsoft API Terms of Use](/legal/microsoft-apis/terms-of-use).

## Request time out

HTTP response code `504 - Gateway Timeout` is returned when a request exceeds 10-minutes execution time.

## API Rate limits

See operational limits for [OData](../../administration/operational-limits-online.md#ODataServices) and [SOAP](../../administration/operational-limits-online.md#SOAPServices) requests.


## Maximum connections

See operational limits for [OData](../../administration/operational-limits-online.md#ODataServices) and [SOAP](../../administration/operational-limits-online.md#SOAPServices) requests.

## Operation Timeout

See operational limits for [OData](../../administration/operational-limits-online.md#ODataServices) and [SOAP](../../administration/operational-limits-online.md#SOAPServices) requests.

## Request Size

See operational limits for [OData](../../administration/operational-limits-online.md#ODataServices) and [SOAP](../../administration/operational-limits-online.md#SOAPServices) requests.


## See also

[Working with API rate limits](dynamics-rate-limits.md)  
[Best practices on transient errors](/azure/architecture/best-practices/transient-faults)  
[Using OData batch request](/openspecs/windows_protocols/ms-odata/dd99aa5c-d81e-4eac-9e07-039491356bf6)  
[Microsoft API Terms of Use](/legal/microsoft-apis/terms-of-use)