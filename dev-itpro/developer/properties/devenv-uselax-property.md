---
title: "UseLax Property"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: d95f6afe-8b48-4934-be3b-0e5d0fda4aa0
caps.latest.revision: 5
author: SusanneWindfeldPedersen
---

 
# UseLax Property

Specifies whether an XMLport uses LAX \(Lazy API for XML\) to process an XML file.  
  
## Applies to  
 
- XMLports  
  
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