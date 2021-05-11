---
title: "LinkedObject Property"
ms.author: solsen
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# LinkedObject Property
> **Version**: _Available or changed with runtime version 1.0._

Specifies a link to SQL Server objects.

## Applies to
-   Table

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Property Value

**True** if a link to SQL Server objects is provided; otherwise, **false**. The default value is **false**.  

## Syntax

```AL
LinkedObject = true;
```
  
## Remarks

When you set the LinkedObject property to **true**, the [LinkedInTransaction Property](devenv-linkedintransaction-property.md) becomes available.  
  
## See Also

[Table Properties](devenv-table-properties.md)