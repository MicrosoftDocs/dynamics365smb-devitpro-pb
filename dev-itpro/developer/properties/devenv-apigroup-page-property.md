---
title: APIGroup Property for API Pages
description: Learn how the APIGroup property defines the group segment of an API page endpoint in Dynamics 365 Business Central and review its syntax.
ms.author: solsen
ms.date: 08/21/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---

# APIGroup property on API pages

<!-- this article is manually created, and the parent node is devenv-apigroup-property.md -->

> **Version**: _Available from runtime version 1.0._

Specifies the group segment of the API endpoint that exposes the page. The following example defines the group as `app1`.

## Applies to

- Page object

## Syntax

```al
APIGroup = 'app1';
```

> [!NOTE]
> You can set the `APIGroup` property only when the [PageType property](devenv-pagetype-property.md) is set to `API`. Learn more in [API page type](../devenv-api-pagetype.md).

## Related information

[Properties](devenv-properties.md)  
[Page object](../devenv-page-object.md)  
[APIGroup property for API queries](devenv-apigroup-query-property.md)