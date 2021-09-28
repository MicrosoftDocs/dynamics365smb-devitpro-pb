---
title: "Width Property (XMLport)"
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
ms.assetid: de3d7d92-255f-4d76-ade2-3eb8e23e7d61
caps.latest.revision: 8
author: SusanneWindfeldPedersen
---

# Width Property (XMLport)
> **Version**: _Available from runtime version 1.0._

Sets the width of a data item of an XMLport.  
  
## Applies to  

-   Xml Port Text Element
-   Xml Port Field Element
-   Xml Port Table Element
-   Xml Port Field Attribute
-   Xml Port Text Attribute

## Syntax

```AL
Width = 1;
```
  
## Remarks  

This property is used only if the [Format Property \(XMLports\)](devenv-format-property.md) is **Fixed Text**.  
  
The value is an integer that defines the number of characters in the field.  
 
## See Also  

[XMLport Properties](devenv-xmlport-properties.md)