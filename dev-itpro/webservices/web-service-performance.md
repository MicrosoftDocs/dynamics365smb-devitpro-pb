---
title: Web Service Performance (OData, API, and SOAP)
description: Learn about how performance of Business Central web services (OData, API, and SOAP)
author: KennieNP
ms.custom: bap-template
ms.reviewer: jswymer
ms.service: dynamics365-business-central
ms.topic: conceptual
ms.author: kepontop
ms.date: 07/03/2023
---

# Web services performance

The performance of web services (OData, API, and SOAP) is both the responsibility of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] server endpoint and the consumer (the client). In this article, you can learn more about both topics.

## General anti-patterns (don't do this)

[!INCLUDE[perf_ws_antipatterns](../includes/include-webservices-performance-anti-patterns.md)]

## General performance patterns (do this)

[!INCLUDE[perf_ws_patterns](../includes/include-webservices-performance-patterns.md)]

## API/OData client performance patterns

[!INCLUDE[perf_ws_odata_patterns](../includes/include-webservices-odata-performance-patterns.md)]

## Power BI Performance patterns

[!INCLUDE[perf_ws_pbi_patterns](../includes/include-webservices-pbi-performance-patterns.md)]

## How to handle large throughput of web service calls

[!INCLUDE[perf_ws_throughput](../includes/include-webservices-throughput-performance-patterns.md)]

## Outgoing web service calls block AL execution

[!INCLUDE[httpclientPerformance](../includes/performance-outgoing-http.md)] 

## Web service telemetry

All incoming calls to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] web services and outgoing calls to external services are logged to partner telemetry. Telemetry enables you to monitor which endpoints are being used and the category of the web service, like SOAP, OData, or API. You can also see possible failures, which are tracked in the HTTP status codes for the calls.

For more information, see [Web service telemetry](web-service-telemetry.md)

## See also

[Web Services Overview](web-services.md)  
[Web Services Best Practices](Web-Services-Best-Practices.md)  
[Web service telemetry](web-service-telemetry.md)   
[Analyzing Incoming Web Services Request Telemetry](../administration/telemetry-webservices-trace.md)  
[Performance Articles For Developers](../performance/performance-developer.md)   