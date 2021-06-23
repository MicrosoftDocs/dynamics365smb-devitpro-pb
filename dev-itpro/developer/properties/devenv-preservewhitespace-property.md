---
title: "PreserveWhiteSpace Property"
description: "Determines whether white space should be preserved in documents that are imported through an XmlPort.

By default, the product supports the XML standard by normalizing white space in attribute names and values that are imported through an XmlPort. It converts tabs, carriage returns, and spaces to single spaces. It also eliminates leading and trailing white space.

When this property is set to Yes, no normalizations are performed."
ms.author: solsen
ms.custom: na
ms.date: 06/23/2021
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
# PreserveWhiteSpace Property
> **Version**: _Available or changed with runtime version 1.0._

Determines whether white space should be preserved in documents that are imported through an XmlPort.

By default, the product supports the XML standard by normalizing white space in attribute names and values that are imported through an XmlPort. It converts tabs, carriage returns, and spaces to single spaces. It also eliminates leading and trailing white space.

When this property is set to Yes, no normalizations are performed.

## Applies to
-   Xml Port

[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Property Value  

**False** to normalize white space; otherwise, **true** to not normalize white space. The default is **false**.  

## Syntax

```AL
PreserveWhiteSpace = true;
```
 
## See Also  

[Properties](devenv-properties.md)