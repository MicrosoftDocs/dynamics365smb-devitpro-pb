---
title: "LookupPageId property"
description: "Sets the ID of the page you want to use as a lookup."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# LookupPageId Property
> **Version**: _Available or changed with runtime version 1.0._

Sets the ID of the page you want to use as a lookup.

## Applies to
-   Table
-   Page Field

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

By default, a lookup provides a list of records in the table. Using this list, users can select a record and retrieve information from it into this control.

> [!NOTE]  
> Consider creating dedicated lookup pages instead of standard pages when adding a lookup (the one that looks like a dropdown) from a field. Default list pages run all triggers and fact boxes even if they aren't shown in the lookup. For more information see [Writing efficient pages](../../performance/performance-developer.md#writing-efficient-pages).

## Related information

[Lookup Property](devenv-lookup-property.md)  
[Performance Developer](../../performance/performance-developer.md)
