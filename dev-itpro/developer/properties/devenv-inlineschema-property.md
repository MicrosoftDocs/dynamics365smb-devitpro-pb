---
title: "InlineSchema Property"
ms.author: solsen
ms.custom: na
ms.date: 11/24/2020
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
# InlineSchema Property
> **Version**: _Available from runtime version 1.0._

Specifies whether an XML schema definition should be included inside an XML document.

## Applies to
-   Xml Port


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Property Value  

**True** if the XML schema definition should be included in the XML document; otherwise, **false**.  

## Syntax

```AL
InlineSchema = true;
```
 
## Remarks

Inline schemas are XML schema definitions that can be included inside XML instance documents instead of importing it from an external source. Like an external schema, an inline schema can be used to verify that the XML document instance matches the schema constraints.  
  
Inline schemas can be useful in many situations. You can use inline schemas in the following situations:  
  
- When the architecture uses internal DTDs, and the developers wants to preserve that design pattern.  
  
- When it is difficult to access external files or URLs. For example, when there are security or platform restrictions.  
  
- When there is so much diversity in the XML document and the schema. The document is easier to process if the schema is inside the XML document.  
  
## See Also

[Properties](devenv-properties.md)   
[XMLport Data Type](../datatypes/devenv-xmlport-data-type.md)