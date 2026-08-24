---
title: APIPublisher Property for API Queries
description: Learn how the APIPublisher property defines the publisher segment of an API query endpoint in Dynamics 365 Business Central and review its syntax.
ms.author: solsen
ms.date: 08/21/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---

# APIPublisher property on API queries

> **Version**: _Available from runtime version 1.0._

<!-- this article is manually created, and the parent node is devenv-apipublisher-property.md -->

Specifies the publisher segment of the API endpoint that exposes the query. The publisher is the first custom API segment after `api` in the endpoint URL.

## Applies to

- Query object

## Syntax

```al
APIPublisher = 'contoso';
```

For a complete example, see [API query type](../devenv-api-querytype.md).

## Related information

[Properties](devenv-properties.md)  
[Query object](../devenv-query-object.md)  
[APIPublisher property for API pages](devenv-apipublisher-page-property.md)
