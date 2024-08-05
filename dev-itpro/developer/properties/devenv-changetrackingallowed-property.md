---
title: "ChangeTrackingAllowed Property"
description: "Sets a value that indicates whether the entity exposed through the OData API supports change tracking."
ms.author: solsen
ms.date: 05/14/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# ChangeTrackingAllowed Property
> **Version**: _Available or changed with runtime version 2.0._

Sets a value that indicates whether the entity exposed through the OData API supports change tracking.

## Applies to
-   Page

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Property value
**True** if the page is exposed as a service, otherwise **false**. The default is **false**.

When the value of the property is set to **true**, an annotation is written in the OData metadata document which indicates that the exposed entity supports change tracking. The default is **false**.

## Syntax

```AL
ChangeTrackingAllowed = true;
```

> [!NOTE]
> The property **ChangeTrackingAllowed** can only be set if the [PageType Property](devenv-pagetype-property.md) is set to **API**.
> From Wave 1 2024 setting this property has no effect, as delta links are no longer supported.

 
## See Also  
[Properties](devenv-properties.md)  
