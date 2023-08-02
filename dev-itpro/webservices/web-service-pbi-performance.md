---
title: Power BI Dataset Load Performance
description: Learn about how to tune the performance of Power BI dataset load time based on Business Central web services and APIs
author: KennieNP
ms.custom: bap-template
ms.reviewer: jswymer
ms.service: dynamics365-business-central
ms.topic: conceptual
ms.author: kepontop
ms.date: 07/03/2023
---

# Power BI dataset load performance

The performance of Power BI datasets based on [!INCLUDE[prod_short](../includes/prod_short.md)] APIs and web service endpoints can be drastically improved if you know how to load only the data that you need into your Power Query data models.

## Power BI performance patterns

[!INCLUDE[perf_ws_pbi_patterns](../includes/include-webservices-pbi-performance-patterns.md)]

## Web service telemetry

All incoming calls to [!INCLUDE[prod_short](../includes/prod_short.md)] web services are logged to partner telemetry. Telemetry enables you to monitor which endpoints are being used and the category of the web service, like SOAP, OData, or API. You can also see possible failures, which are tracked in the HTTP status codes for the calls.

For more information, see [Web service telemetry](web-service-telemetry.md)

## See also

[Web Services Overview](web-services.md)  
[Web Services Best Practices](Web-Services-Best-Practices.md)  
[Web service telemetry](web-service-telemetry.md)   
[Analyzing Incoming Web Services Request Telemetry](../administration/telemetry-webservices-trace.md)  
[Performance Articles For Developers](../performance/performance-developer.md)   