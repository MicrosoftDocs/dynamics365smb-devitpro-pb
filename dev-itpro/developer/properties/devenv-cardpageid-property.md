---
title: "CardPageId property"
description: "Sets the card page that is associated with items in the current list page."
ms.author: solsen
ms.date: 06/03/2026
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

### Effect on list page actions

When you set `CardPageId` on a list page, the runtime uses the linked card page to determine which record-level actions are available on the list. Specifically, the **New**, **Delete**, and **Edit** actions on the list page are controlled by the [InsertAllowed](devenv-insertallowed-property.md), [DeleteAllowed](devenv-deleteallowed-property.md), and [ModifyAllowed](devenv-modifyallowed-property.md) properties on the *card page*, not the list page itself.

For example, if your list page is non-editable (`Editable = false`) but the card page linked through `CardPageId` has `DeleteAllowed = true`, the **Delete** action still appears on the list page. To hide the **Delete** action from the list, set `DeleteAllowed = false` on the card page.

This behavior means that when you want to control whether users can insert, delete, or modify records from a list page that uses `CardPageId`, you should set the corresponding properties on the card page rather than on the list page.

## Page extensions

[!INCLUDE [2025rw1_and_later](../includes/2025rw1_and_later.md)]

You can modify the `CardPageID` on list and listpart pages through a page extension. This means that you can override, which card page should be displayed when an end user double-clicks an item on the list page or listpart page. 

If the property is already specified on the base page, the value in the page extension overrides it. If multiple page extensions modify the property, the last extension to be applied takes effect. Because per-tenant extensions are applied after Marketplace apps, this implies that any race condition across multiple Marketplace apps setting the same `CardPageId` can be resolved in a per-tenant extension if needed, although this will seldom happen.
  
## Related information

[InsertAllowed property](devenv-insertallowed-property.md)  
[DeleteAllowed property](devenv-deleteallowed-property.md)  
[ModifyAllowed property](devenv-modifyallowed-property.md)  
[Editable property](devenv-editable-property.md)  
[PagePartID Property](./devenv-properties.md)   
[ChartPartID Property](./devenv-properties.md)   
[SystemPartID Property](./devenv-properties.md)