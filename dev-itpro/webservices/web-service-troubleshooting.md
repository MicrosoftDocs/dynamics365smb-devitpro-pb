---
title: Troubleshooting web service errors (OData, API, and SOAP)
description: Learn about how to troubleshoot Business Central web service errors (OData, API, and SOAP)
author: KennieNP
ms.custom: bap-template
ms.reviewer: jswymer

ms.topic: conceptual
ms.author: kepontop
ms.date: 01/10/2024
---

# Troubleshooting web service errors

[!INCLUDE[httpStatusErrorCodes](../includes/include-http-status-error-codes.md)]

## Web service telemetry

All incoming calls to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] web services and outgoing calls to external services are logged to partner telemetry. Telemetry enables you to monitor which endpoints are being used and the category of the web service, like SOAP, OData, or API. You can also see possible failures, which are tracked in the HTTP status codes for the calls.

For more information, see [Web service telemetry](web-service-telemetry.md).

## Troubleshooting OData/API calls

For calls to OData/API endpoints, we offer more details for troubleshooting, as these calls also return OData error codes in case of failures. 

For more information, see [Troubleshooting OData/API calls](dynamics-error-codes.md).

## Debugging code called from a web service endpoint

*Debugging* is the process (and art) of finding and correcting errors. With Visual Studio Code and the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)], you get an integrated debugger to help you inspect your code and verify that it works as expected.

For information about how to debug code executed from web service endpoints, see [Debugging web services](../developer/devenv-debugging.md#debugging-web-services).

## Which IP addresses or ranges does my environment use?

When you exchange data through APIs (incoming calls) or external services (outgoing calls), you might have to safelist the IP addresses from where the [!INCLUDE[prod_short](../includes/prod_short.md)] service is running. 

For more information, see [FAQ: IP addresses or ranges for the Business Central service](../faq.yml#which-ip-addresses-or-ranges-does-my-environment-s-api-use)

## Troubleshooting outgoing calls to external services

[!INCLUDE[allowhttpclientnote](../includes/include-http-allowhttpclient-note.md)]

For more information, see [Call external services with the HttpClient data type](../developer/devenv-httpclient.md).


When copying an environment, all extensions/apps in the new environment will have the property **Allow HttpClient Requests** set to **false**. For more information, see [Environment copies](../administration/tenant-admin-center-environments-copy.md#environment-copies).

## It works in my sandbox but not in production

The environment for a web service endpoint can change how it works. If you see a difference in how it works in your sandbox compared to production, here are some things you can check:

- Does the user calling the web service endpoint exist in both environments?
- Is the user active in both environments?
- If you test with two different users, do they have the same entitlements?
- Are permissions defined the same way in both environments?
- Does the user calling the web service endpoint have the same permissions in both environments?
- For pages/codeunits exposed as OData/SOAP, are they exposed the same way in both environments?
- Are apps/extensions **Allow HttpClient Requests** properties set the same way in both environments?
- (Only for on-premises) Are API/OData/SOAP enabled the same way in both environments?


## See also

[Handling UI Interaction in web service endpoints](handling-ui-interaction-when-working-with-web-Services.md)   
[Web Services Best Practices](Web-Services-Best-Practices.md)  
[Web service telemetry](web-service-telemetry.md)   
[Troubleshooting OData/API calls](dynamics-error-codes.md)   
[Debugging web services](../developer/devenv-debugging.md#debugging-web-services)    
[Web Services Overview](web-services.md)  
