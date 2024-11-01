---
title: "ValuesAllowed property"
description: "Sets the values that are allowed in the field."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# ValuesAllowed Property
> **Version**: _Available or changed with runtime version 1.0._

Sets the values that are allowed in the field.

## Applies to
-   Table field
-   Page Field

[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Syntax

```AL
ValuesAllowed = Codeunit, Page, Query;
```
  
## Remarks

Separate the values with a comma. For example, if you only want the user to enter 1, 3, or 5 in this field, enter 1,3,5 for this property.  
  
The property setting is checked during validation. Validation occurs only if the field or control value is updated through the UI, for example, if a value is updated on a page or if a field is updated in a table. If a field is updated through application code, then the **ValuesAllowed** property is not validated.  
  
## Related information  

[Properties](devenv-properties.md)