---
title: API Developer Overview
description: Use APIs to expose information from the database into versioned, OData v4 enabled REST web services.
ms.custom: na
ms.date: 07/13/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: overview
author: SusanneWindfeldPedersen
---

# API Development Overview
RESTful web services are typically created to interchange data between [!INCLUDE[prod_short](../developer/includes/prod_short.md)] and external systems. The acronym REST stands for REpresentational State Transfer. Any coding language capable of calling REST APIs can be used to use this feature. The [!INCLUDE[prod_short](../developer/includes/prod_short.md)] API stack have been optimized for performance and is the preferred way to integrate with [!INCLUDE[prod_short](../developer/includes/prod_short.md)].

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] comes with an extensive list of built-in APIs that requires no code and minimal setup to use. You can also develop your own custom APIs using the AL object types _API pages_ and _API queries._ This article helps you get started developing your own APIs.


## Creating APIs
When creating an API, you need to consider how the API is intended to be used: 
* If you need to read and write data, use a page of the type `API`
* If you just need to read data, possibly from multiple tables, use a query of the type `API`


The two approaches come with different characteristics as described in this table:

|Method to expose data as an API | Properties |
|---------------------------|------------|
| API Page   | Support read-write operations <br> Webhook-supported <br> Cannot be extended <br> Expose data from one table |
| API Query  | Read-only operations <br> Cannot be extended <br> Can expose data from multiple tables |


> [!TIP]  
> For inspiration and examples, see the open source [ALAppExtensions](https://github.com/microsoft/ALAppExtensions/tree/main/Apps/W1/APIV2/app/src/pages) repo. Here you'll find examples of API pages written in AL.


## Getting started

The following table includes links to help you get started with designing and working with APIs.

|To      |See      | 
|--------|---------| 
|Create APIs using an API page| [API pages](devenv-api-pagetype.md)  | 
|Create APIs using an API query| [API queries](devenv-api-querytype.md) | 
|Go through an example on how to develop a custom API page| [Walkthrough: developing a custom API](devenv-develop-custom-api.md) |
|Learn how to create performant APIs| [API performance](../webservices/web-service-performance.md)  | 
|Learn how to query APIs | [API client performance](../webservices/odata-client-performance.md) <br> [Tips for working with APIs](devenv-connect-apps-tips.md) <br> [Using filters with API calls](devenv-connect-apps-filtering.md) |
|Troubleshoot API call failures| [Troubleshooting API calls](../webservices/dynamics-error-codes.md) | 
|Monitor API calls with telemetry| [API telemetry](../webservices/web-service-telemetry.md) |
|Learn about existing (built-in) APIs | [Overview](../webservices/api-overview.md) |
|Learn about the difference between APIs and exposing UI pages as OData/SOAP webservices | [Web services overview](../webservices/web-services.md) |

## See Also
[API page type](devenv-api-pagetype.md)   
[API queries](devenv-api-querytype.md)   
[Walkthrough: developing a custom API](devenv-develop-custom-api.md)   
[Troubleshooting API calls](../webservices/dynamics-error-codes.md)   
[API performance](../webservices/web-service-performance.md)   
[API client performance](../webservices/odata-client-performance.md)   
[Tips for working with APIs](devenv-connect-apps-tips.md)   
[Using filters with API calls](devenv-connect-apps-filtering.md)  
[API telemetry](../webservices/web-service-telemetry.md)   
[Built-in API overview](../webservices/api-overview.md)   
[Web services overview (APIs, SOAP/OData)](../webservices/web-services.md)      
