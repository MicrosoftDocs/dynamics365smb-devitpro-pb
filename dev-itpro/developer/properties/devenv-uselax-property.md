---
title: "UseLax Property"
description: "Specifies whether an XmlPort uses LAX (Lazy API for XML) to process an XML file."
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
# UseLax Property
> **Version**: _Available or changed with runtime version 1.0._

Specifies whether an XmlPort uses LAX (Lazy API for XML) to process an XML file.

## Applies to
-   Xml Port

[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Property Value

**true** if the XMLport uses LAX; otherwise **false**.  

## Syntax

```AL
UseLax = true;
```
  
## Remarks

Extra elements and attributes are often added to XML documents when they're processed in software systems. If this property is set to **Yes**, the XML document will validate as long as the document meets the minimum schema definition. When extra elements and attributes are included in a namespace, the XML document will successfully validate against the schema. A validation error will occur, if not. For more information about namespaces, see [Using Namespaces with XMLports](../devenv-using-namespaces-with-xmlports.md).
  
## See Also

[Properties](devenv-properties.md)