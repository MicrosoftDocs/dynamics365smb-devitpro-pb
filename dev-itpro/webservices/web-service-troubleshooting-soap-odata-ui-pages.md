---
title: Troubleshooting errors in OData/SOAP web services on pages, queries, and codeunits.
description: Learn about how to troubleshoot Business Central web service errors on OData/SOAP endpoints on pages, queries, and codeunits.
author: KennieNP
ms.custom: bap-template
ms.reviewer: jswymer
ms.topic: conceptual
ms.author: kepontop
ms.date: 03/11/2024
---

# Troubleshooting errors in OData/SOAP web services on pages, queries, and codeunits.

Troubleshooting web service errors can be tricky because the root cause of the error can be in multiple places:

- It can be in the client that's calling the web service.
- It can be related to the network between the client and the web service endpoint.
- It can be in the code behind the web service endpoint.

For errors occurring in the web service client or in the network, please see the general troubleshooting guide [Troubleshoot web service errors](web-service-troubleshooting.md)

In this article, you can learn more about different methods and tools that you can use for troubleshooting web service errors on OData/SOAP web services on pages, queries, and codeunits.


## Do not use Microsoft pages as SOAP/OData APIs

The [!INCLUDE[prod_short](../includes/prod_short.md)] application evolves over time and changes happen to the user interface as part of this. This means that the page structure and fields might also change when interacting with the page from a web service client and it is not something you can depend on being stable over time. 

If you require a stable API on a page in the [!INCLUDE[prod_short](../includes/prod_short.md)] application, you have two options:

1. Take a copy of the source code for the page and host it in a per-tenant extension. 
2. use the provided built-in APIs. For more information about APIs, see [API overview](api-overview.md).


<!-- ## Do not use card pages as SOAP/OData

Cards are bad: in UI one record, in WS many -> can be bad for perf

Use REST APIs instead -->




## See also

[Handling UI Interaction in web service endpoints](handling-ui-interaction-when-working-with-web-Services.md)  
[Web Services Best Practices](Web-Services-Best-Practices.md)  
[Troubleshoot web service errors](web-service-troubleshooting.md)
[Web service telemetry](web-service-telemetry.md)   
[Debugging web services](../developer/devenv-debugging.md#debugging-web-services)  
[Web Services Overview](web-services.md)  
