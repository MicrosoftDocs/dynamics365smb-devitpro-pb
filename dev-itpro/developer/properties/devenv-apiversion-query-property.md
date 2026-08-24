---
title: APIVersion Property for API Queries
description: Learn how the APIVersion property defines one or more versions for an API query endpoint in Dynamics 365 Business Central and review its syntax.
ms.author: solsen
ms.date: 08/21/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---

# APIVersion property on API queries

> **Version**: _Available from runtime version 1.0._

<!-- this article is manually created, and the parent node is devenv-apiversion-property.md -->

Specifies one or more versions of the API endpoint that exposes the query. If you don't set the `APIVersion` property, the default value is `beta`.

## Applies to

- Query object

## Syntax

```al
APIVersion = 'beta', 'v1.0';
```

For a complete example, see [API query type](../devenv-api-querytype.md).

## Related information

[Properties](devenv-properties.md)  
[Query object](../devenv-query-object.md)  
[APIVersion property for API pages](devenv-apiversion-page-property.md)
