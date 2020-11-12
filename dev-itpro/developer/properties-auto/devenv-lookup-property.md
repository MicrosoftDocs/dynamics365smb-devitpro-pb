---
title: "Lookup Property"
ms.author: solsen
ms.custom: na
ms.date: 11/12/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Lookup Property
> **Version**: _Available from runtime version 1.0._

Specifies if a page field has a lookup window.

## Applies to
-   Page Field

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
  
## Property Value

**True** if you want a lookup for the field; otherwise, **false**. The default value is **false**.  

## Syntax

```AL
Lookup = true;
```
  
## Remarks

By default, a lookup provides a list of records in the table. Using this list, users can select a record and retrieve information from it into this control.  
  
## See Also

[LookupPageID Property](devenv-lookuppageid-property.md)