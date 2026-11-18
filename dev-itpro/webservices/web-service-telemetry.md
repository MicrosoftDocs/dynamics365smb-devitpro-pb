---
title: Web Service Telemetry in Business Central
description: Monitor Business Central web service requests with telemetry to analyze endpoint usage, HTTP failures, access key authentication, and publishing errors.
author: KennieNP
ms.custom: bap-template
ms.reviewer: jswymer

ms.topic: article
ms.author: kepontop
ms.date: 11/17/2026
ai-usage: ai-assisted
---

# Web service telemetry in Business Central

When telemetry is enabled, [!INCLUDE[prod_short](../developer/includes/prod_short.md)] logs web service calls to partner telemetry. Telemetry enables you to monitor which endpoints are being used and the category of the web service, like SOAP, OData, or API. You can also see possible failures, which are tracked in the HTTP status codes for the calls.

## Incoming web service telemetry

Web services telemetry gathers data about SOAP, OData, and API requests through the service. It provides information like the request's endpoint, time to complete, the SQL statements run, and more.  

[!INCLUDE[who_is_calling](../includes/include-webservices-telemetry-who-is-calling.md)]

Learn more in [Analyzing Incoming Web Services Request Telemetry](../administration/telemetry-webservices-trace.md).

## Web service access key telemetry

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] emits telemetry data about the success or failure of authenticating web service access keys on web service requests.

[!INCLUDE[webservice_key_deprecated](../includes/web-service-key-deprecated.md)]

As a partner or customer, this data lets you monitor legacy web service access key use in on-premises environments and plan migration to OAuth authentication. Web service access keys aren't supported in Business Central online.

Learn more in [Analyzing Web Service Access Key Telemetry](../administration/telemetry-webservices-access-key-trace.md).

## Web service publish failure telemetry

If a web service couldn't be published or a published web service isn't working, most often it's due to an error in creating metadata for the web service. When telemetry is enabled, metadata creation failures are available in partner telemetry, along with a stack trace of the element responsible for breaking the web service metadata.

Learn more in [Analyzing Web Service Publish Failure Telemetry](../administration/telemetry-webservices-publish-failure-trace.md).

## Related information

[Web Services Overview](web-services.md)  
[Web Services Best Practices](Web-Services-Best-Practices.md)  
[Analyzing Incoming Web Services Request Telemetry](../administration/telemetry-webservices-trace.md)  
[Analyzing Web Service Access Key Telemetry](../administration/telemetry-webservices-access-key-trace.md)  
[Configuring Business Central Server](../administration/configure-server-instance.md)  
