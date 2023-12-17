---
title: Troubleshooting web service errors (OData, API, and SOAP)
description: Learn about how to troubleshoot Business Central web service errors (OData, API, and SOAP)
author: KennieNP
ms.custom: bap-template
ms.reviewer: jswymer
ms.service: dynamics365-business-central
ms.topic: conceptual
ms.author: kepontop
ms.date: 08/08/2023
---

# Troubleshooting web service errors

[!INCLUDE[httpStatusErrorCodes](../includes/include-http-status-error-codes.md)]

## Web service telemetry

All incoming calls to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] web services and outgoing calls to external services are logged to partner telemetry. Telemetry enables you to monitor which endpoints are being used and the category of the web service, like SOAP, OData, or API. You can also see possible failures, which are tracked in the HTTP status codes for the calls.

For more information, see [Web service telemetry](web-service-telemetry.md).

## Troubleshooting OData/API calls

For calls to OData/API endpoints, we offer more details for troubleshooting, as these calls also return OData error codes in case of failures. 

For more information, see [Troubleshooting OData/API calls](dynamics-error-codes.md).


## See also
[Handling UI Interaction in web service endpoints](handling-ui-interaction-when-working-with-web-Services.md)   
[Web Services Best Practices](Web-Services-Best-Practices.md)  
[Web service telemetry](web-service-telemetry.md)   
[Troubleshooting OData/API calls](dynamics-error-codes.md)   
[Web Services Overview](web-services.md)  
