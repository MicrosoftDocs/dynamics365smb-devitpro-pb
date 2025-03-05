---
title: "CardPageId property"
description: "Sets the card page that is associated with items in the current list page."
ms.author: solsen
ms.date: 02/18/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# CardPageId Property
> **Version**: _Available or changed with runtime version 1.0._

Sets the card page that is associated with items in the current list page.

## Applies to
-   Request Page
-   Page

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Syntax

```AL
CardPageID = "Customer Card";
```
  
## Remarks

Use this property on a list page or listpart page to specify the card page that should be displayed when an end user double-clicks an item on the list page or listpart page.

## Page extensions

With [!INCLUDE [2025rw1_and_later](../includes/2025rw1_and_later.md)], you can modify the `CardPageID` on list and listpart pages through a page extension. This means that you can override, which card page should be displayed when an end user double-clicks an item on the list page or listpart page. 

If the property is already specified on the base page, the value in the page extension overrides it. If multiple page extensions modify the property, the last extension to be applied takes effect. Because per-tenant extensions are applied after AppSource apps, this implies that any race condition across multiple AppSource apps setting the same `CardPageId` can be resolved in a per-tenant extension if needed, although this will seldom happen.
  
## Related information

[PagePartID Property](./devenv-properties.md)   
[ChartPartID Property](./devenv-properties.md)   
[SystemPartID Property](./devenv-properties.md)