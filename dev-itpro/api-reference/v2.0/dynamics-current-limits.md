---
title: "Current API Limits in Dynamics 365 Business Central"
description: "Learn about constraints on API calls made via OData or SOAP requests."
author: jswymer
ms.custom: conceptual
ms.date: 01/22/2024
ms.topic: article
ms.author: jswymer
ms.reviewer: jswymer
---

# Current API Limits  

This article lists the different limits that are set on OData and SOAP requests. The limits are subject to change, following the [Microsoft API Terms of Use](/legal/microsoft-apis/terms-of-use).

## Request time out

HTTP response code `504 - Gateway Timeout` is returned when a request exceeds 10-minutes execution time.

## API rate limits

See operational limits for [OData](../../administration/operational-limits-online.md#ODataServices) and [SOAP](../../administration/operational-limits-online.md#SOAPServices) requests.

## Maximum connections

See operational limits for [OData](../../administration/operational-limits-online.md#ODataServices) and [SOAP](../../administration/operational-limits-online.md#SOAPServices) requests.

## Operation timeout

See operational limits for [OData](../../administration/operational-limits-online.md#ODataServices) and [SOAP](../../administration/operational-limits-online.md#SOAPServices) requests.

## Request size

See operational limits for [OData](../../administration/operational-limits-online.md#ODataServices) and [SOAP](../../administration/operational-limits-online.md#SOAPServices) requests.

## See Also

[Operational Limits for Business Central Online](/dynamics365/business-central/dev-itpro/administration/operational-limits-online)  
[Best practices on transient errors](/azure/architecture/best-practices/transient-faults)  
[Using OData Batch request](/openspecs/windows_protocols/ms-odata/dd99aa5c-d81e-4eac-9e07-039491356bf6)  
[Microsoft API Terms of Use](/legal/microsoft-apis/terms-of-use)
