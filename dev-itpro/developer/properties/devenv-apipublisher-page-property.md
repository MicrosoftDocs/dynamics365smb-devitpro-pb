---
title: APIPublisher Property for API Pages
description: Learn how the APIPublisher property defines the publisher segment of an API page endpoint in Dynamics 365 Business Central and review its syntax.
ms.author: solsen
ms.date: 08/21/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---

# APIPublisher property on API pages

> **Version**: _Available from runtime version 1.0._

<!-- this article is manually created, and the parent node is devenv-apipublisher-property.md -->

Specifies the publisher segment of the API endpoint that exposes the page. The publisher is the first custom API segment after `api` in the endpoint URL.

## Applies to

- Page object

## Syntax

```al
APIPublisher = 'contoso';
```

> [!NOTE]
> You can set the `APIPublisher` property only when the [PageType property](devenv-pagetype-property.md) is set to `API`. Learn more in [API page type](../devenv-api-pagetype.md).

## Related information

[Properties](devenv-properties.md)  
[Page object](../devenv-page-object.md)  
[APIPublisher property for API queries](devenv-apipublisher-query-property.md)