---
title: APIVersion Property for API Pages
description: Learn how the APIVersion property defines one or more versions for an API page endpoint in Dynamics 365 Business Central and review its syntax.
ms.author: solsen
ms.date: 08/21/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---

# APIVersion property on API pages

> **Version**: _Available from runtime version 1.0._

<!-- this article is manually created, and the parent node is devenv-apiversion-property.md -->

Specifies one or more versions of the API endpoint that exposes the page. If you don't set the `APIVersion` property, the default value is `beta`.

## Applies to

- Page object

## Syntax

```al
APIVersion = 'beta', 'v1.0';
```

> [!NOTE]
> You can set the `APIVersion` property only when the [PageType property](devenv-pagetype-property.md) is set to `API`. Learn more in [API page type](../devenv-api-pagetype.md).

## Related information

[Properties](devenv-properties.md)  
[Page object](../devenv-page-object.md)  
[APIVersion property for API queries](devenv-apiversion-query-property.md)
