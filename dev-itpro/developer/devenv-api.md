---
title: Develop APIs with Pages and Queries
description: Learn how to develop custom Business Central APIs with API pages and API queries, and find guidance for performance and troubleshooting.
ms.date: 10/08/2026
ms.topic: overview
author: SusanneWindfeldPedersen
ms.collection: get-started
---

# Develop custom APIs with pages and queries

[!INCLUDE [getstarted-contributions](includes/getstarted-contributions.md)]

RESTful web services typically exchange data between [!INCLUDE[prod_short](../developer/includes/prod_short.md)] and external systems. REST stands for Representational State Transfer. You can use any programming language that can call REST APIs. [!INCLUDE[prod_short](../developer/includes/prod_short.md)] APIs provide versioned, OData v4-enabled REST endpoints for integrations.

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] includes built-in APIs that require no code and minimal setup. You can also develop custom APIs by using the AL object types *API pages* and *API queries*. This article helps you get started with API development.

[!INCLUDE[api-overview-note](../includes/api-overview-note.md)]

[!INCLUDE[extending_APIs_is_not_supported_note](includes/include-extending-APIs-is-not-supported-note.md)]

## Create APIs

When you create an API, consider how you intend to use it:

- If you need to read and write data, use a page of the type `API`.
- If you need a read-only joined or aggregated dataset from one or more tables, use a query of the type `API`.

The two approaches come with different characteristics as described in this table:

| Method to expose data as an API | Characteristics |
|---------------------------|------------|
| API page   | Supports read-write operations <br> Supports webhooks <br> Can't be extended <br> Uses one source table per API page; nested API page parts can expose related entities from other tables |
| API query  | Supports read-only operations <br> Can't be extended <br> Can expose data from multiple tables |

> [!TIP]
> For inspiration and examples, see the open-source [ALAppExtensions repository](https://github.com/microsoft/ALAppExtensions/tree/main/Apps/W1/APIV2/app/src/pages). The repository contains examples of API pages written in AL.

## Get started with APIs

The following table includes links to help you get started with designing and working with APIs.

|To      |See      |
|--------|---------|
|Create APIs using an API page| [API pages](devenv-api-pagetype.md)  |
|Create APIs using an API query| [API queries](devenv-api-querytype.md) |
|Go through an example of how to develop a custom API page| [Walkthrough: developing a custom API](devenv-develop-custom-api.md) |
|Learn how to create performant APIs| [API performance](../webservices/web-service-performance.md)  |
|Learn how to query APIs | [API client performance](../webservices/odata-client-performance.md) <br> [Tips for working with APIs](devenv-connect-apps-tips.md) <br> [Using filters with API calls](devenv-connect-apps-filtering.md) |
|Troubleshoot API call failures| [Troubleshooting API calls](../webservices/dynamics-error-codes.md) |
|Monitor API calls with telemetry| [API telemetry](../webservices/web-service-telemetry.md) |
|Explore built-in APIs| [REST API web services](../webservices/api-overview.md) |
|Compare APIs with UI pages exposed as OData or SOAP web services| [Compare REST APIs, OData, and SOAP web services in Business Central](../webservices/web-services.md) |

## Related information

[API page type](devenv-api-pagetype.md)  
[API queries](devenv-api-querytype.md)  
[Walkthrough: Developing a custom API](devenv-develop-custom-api.md)  
[Troubleshooting API calls](../webservices/dynamics-error-codes.md)  
[API performance](../webservices/web-service-performance.md)  
[API client performance](../webservices/odata-client-performance.md)  
[Tips for working with APIs](devenv-connect-apps-tips.md)  
[Using filters with API calls](devenv-connect-apps-filtering.md)  
[API telemetry](../webservices/web-service-telemetry.md)  
[Built-in API overview](../webservices/api-overview.md)  
[Web services overview (APIs, SOAP/OData)](../webservices/web-services.md)  
