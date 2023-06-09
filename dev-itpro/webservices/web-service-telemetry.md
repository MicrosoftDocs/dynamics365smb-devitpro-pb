---
title: Web Service Telemetry
description: Learn about how Business Central emits telemetry about web service requests
author: KennieNP
ms.custom: bap-template
ms.reviewer: jswymer
ms.service: dynamics365-business-central
ms.topic: conceptual
ms.author: kepontop
ms.date: 02/07/2023
---

# Web Service Telemetry 

All calls to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] web services are logged to partner telemetry. Telemetry enables you to monitor which endpoints are being used and the category of the web service, like SOAP, OData, or API. You can also see possible failures, which are tracked in the HTTP status codes for the calls.

## Incoming web service telemetry

Web services telemetry gathers data about SOAP, OData, and API requests through the service. It provides information like the request's endpoint, time to complete, the SQL statements run, and more.  

When calling [!INCLUDE[prod_short](../developer/includes/prod_short.md)] web services, you can inject information about the caller into telemetry. 

- Setting the HTTP header _UserAgent_ will log requests with the httpHeaders dimension (for OData and API calls). 

- Setting the HTTP header _client-request-id_, will log requests with the httpHeaders dimension (for OData and API calls) and it will also set the "OperationId"/ClientActivity in Application Insights.

This capability means you can use telemetry to see who's calling [!INCLUDE[prod_short](../developer/includes/prod_short.md)] APIs. It also lets you correlate to telemetry from other web services, if you use Azure Application Insights to instrument them.

For more information, go to [Analyzing Incoming Web Services Request Telemetry](../administration/telemetry-webservices-trace.md).

## Web service access key telemetry

The [!INCLUDE[prod_short](../developer/includes/prod_short.md)] emits telemetry data about the success or failure of authenticating web service access keys on web service requests.

[!INCLUDE[webservice_key_deprecated](../includes/web-service-key-deprecated.md)]

As a partner or customer, this data lets you monitor the use of web service access keys on your environments in preparation for the deprecation of the feature.

For more information, go to [Analyzing Web Service Access Key Telemetry](../administration/telemetry-webservices-access-key-trace.md).

## Web service publish failure telemetry

If a web service could not be published or a published web service is not working, most often it is due to an error in creating metadata for the web service. All metadata creation failures along with stack trace of the element responsible for breaking web service metadata is available in partner telemetry. The telemetry ids related to metadata failures are in the range "RT0033" - "RT0039".

## See also

[Web Services Overview](web-services.md)  
[Web Services Best Practices](Web-Services-Best-Practices.md)  
[Analyzing Incoming Web Services Request Telemetry](../administration/telemetry-webservices-trace.md)  
[Analyzing Web Service Access Key Telemetry](../administration/telemetry-webservices-access-key-trace.md)  
[Configuring Business Central Server](../administration/configure-server-instance.md)  
